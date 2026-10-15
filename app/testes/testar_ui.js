// Testa a interface do app no Chromium: modo navegador e modo app (ponte simulada).
// Uso: node app/testes/testar_ui.js   (precisa do Node e do pacote playwright)
const http = require("http"), fs = require("fs"), path = require("path"), os = require("os");
const { chromium } = require("playwright");
const UI = path.join(__dirname, "..", "UI"), NOUS = path.join(__dirname, "..", "..", "Nous Keiros");
const PROG = path.join(__dirname, "progresso_teste.json");
const TIPOS = { ".html": "text/html", ".css": "text/css", ".js": "text/javascript", ".json": "application/json", ".ttf": "font/ttf", ".woff2": "font/woff2" };
const srv = http.createServer((req, res) => {
  let p = decodeURIComponent(req.url.split("?")[0]);
  if (p === "/") p = "/index.html";
  const f = p.startsWith("/nous/") ? path.join(NOUS, p.slice(6)) : path.join(UI, p);
  fs.readFile(f, (e, d) => { if (e) { res.writeHead(404); res.end(); return; } res.writeHead(200, { "Content-Type": TIPOS[path.extname(f)] || "application/octet-stream" }); res.end(d); });
});
let falhas = 0;
function ok(c, msg) { console.log((c ? "ok   " : "FALHA") + " " + msg); if (!c) falhas++; }
const RAIZ = "/Volumes/KEIROS/Nous Keiros";

// Ponte simulada: imita o Despacho do app (fichas de versão, junção, falhas e atrasos).
function ponteSimulada(op) {
  const log = window.__log = [];
  const disco = window.__disco = Object.assign({
    progresso: null, versao: "v0", n: 0, notas: {}, atraso: 0, falharCarregar: false, falharProgresso: false,
    aviso: null, restaurado: false, falharNota: [], notasNoMac: false,
  }, op || {});
  const raiz = "/Volumes/KEIROS/Nous Keiros";
  const espera = ms => new Promise(r => setTimeout(r, ms));
  const juntar = (a, b) => {
    const A = JSON.parse(a), B = JSON.parse(b);
    for (const [id, eb] of Object.entries(B.s || {})) {
      const ea = A.s[id] || { b: 0, c: [] }, cb = eb.c || [];
      ea.b = Math.max(+!!ea.b, +!!eb.b);
      const c = [];
      for (let i = 0; i < Math.max(ea.c.length, cb.length); i++) c.push(Math.max(+!!ea.c[i], +!!cb[i]));
      ea.c = c; A.s[id] = ea;
    }
    for (const [k, v] of Object.entries(B.L || {})) A.L[k] = Math.max(+!!A.L[k], +!!v);
    return JSON.stringify(A);
  };
  window.webkit = { messageHandlers: { mapa: { async postMessage(m) {
    log.push(Object.assign({ t: performance.now() }, m));
    if (disco.atraso && (m.acao === "lerNota" || m.acao === "salvarProgresso")) await espera(disco.atraso);
    switch (m.acao) {
      case "carregar":
        if (disco.falharCarregar) throw new Error("não consegui ler progresso.json (o arquivo existe, mas não abriu)");
        return { json: disco.progresso, onde: "keiros", versao: disco.progresso ? disco.versao : null, raiz, restaurado: disco.restaurado };
      case "salvarProgresso": {
        if (m.raiz !== raiz) throw new Error("a pasta Nous Keiros foi trocada; recarregue a página");
        if (disco.falharProgresso) throw new Error("falha simulada de escrita");
        let json = m.json, juntou = false;
        if (disco.progresso && m.versao !== disco.versao) { json = juntar(m.json, disco.progresso); juntou = true; }
        disco.progresso = json; disco.versao = "v" + (++disco.n);
        return { onde: disco.aviso ? "espera" : "keiros", versao: disco.versao, json: juntou ? json : null, aviso: disco.aviso };
      }
      case "lerNota":
        if (disco.falharNota.includes(m.id)) throw new Error("não consegui ler notas.md (o arquivo existe, mas não abriu)");
        return { texto: disco.notas[m.id] || "", onde: "keiros", versao: "n-" + (disco.notas[m.id] || ""), restaurada: false };
      case "salvarNota":
        if (m.raiz !== raiz) throw new Error("a pasta Nous Keiros foi trocada; recarregue a página");
        disco.notas[m.id] = m.texto;
        return { onde: disco.notasNoMac || disco.aviso ? "espera" : "keiros", versao: "n-" + m.texto, conflito: false, aviso: disco.aviso };
      case "lerNotas": return { notas: Object.assign({}, disco.notas) };
      case "exportar": window.__export = m; return { ok: true };
      default: return { ok: true };
    }
  } } } };
}
async function abrirApp(br, op) {
  const ctx = await br.newContext({ viewport: { width: 1400, height: 900 } });
  await ctx.addInitScript(ponteSimulada, op || {});
  const pg = await ctx.newPage();
  pg.__erros = []; pg.on("pageerror", e => pg.__erros.push(String(e)));
  await pg.goto("http://localhost:8765/");
  await pg.waitForFunction(() => window.__mapa);
  return { ctx, pg };
}
const classe = (pg, id) => pg.evaluate(id => document.querySelector(`#svg .node[data-id="${id}"]`).getAttribute("class"), id);
async function abrirAssunto(pg, id) {
  await pg.evaluate(id => { location.hash = ""; location.hash = id; }, id);
  await pg.waitForFunction(id => document.querySelector("#dr-title") && document.querySelector("#dr-title").textContent.startsWith(id) && !document.querySelector("#drawer").hidden, id);
}

(async () => {
  await new Promise(r => srv.listen(8765, r));
  const br = await chromium.launch();
  // ── 1. modo navegador ──
  {
    const pg = await br.newPage({ viewport: { width: 1400, height: 900 } });
    const erros = []; pg.on("pageerror", e => erros.push(String(e))); pg.on("console", m => { if (m.type() === "error") erros.push(m.text()); });
    await pg.goto("http://localhost:8765/");
    await pg.waitForFunction(() => window.__mapa);
    ok(erros.length === 0, "carrega sem erros " + JSON.stringify(erros));
    ok(await pg.locator("#svg .node").count() === 203, "árvore com 203 nós");
    ok(await pg.textContent("#m-total") === "203", "medidor mostra /203");
    const fontes = await pg.evaluate(async () => { await document.fonts.ready; return ["Chakra Petch", "IBM Plex Mono"].map(f => document.fonts.check(`16px "${f}"`)); });
    ok(fontes.every(Boolean), "fontes embutidas carregadas " + fontes);
    const jp = await pg.evaluate(() => /[぀-ヿ一-鿿]/.test(document.body.innerText + document.querySelector("#svg").textContent));
    ok(!jp, "nenhum japonês na tela");
    await pg.click('.tab[data-view="now"]');
    const lib = await pg.$$eval("#now [data-open]", bs => bs.map(b => b.dataset.open));
    ok(JSON.stringify(lib.sort()) === JSON.stringify(["C13", "F01", "G01", "M01"]), "liberados no início: " + lib);
    await abrirAssunto(pg, "M05");
    ok(await pg.locator('#dr-body input[data-sid="M05"]:disabled').count() > 0, "M05 bloqueado: checkboxes desativadas");
    ok(/pré-requisito/.test(await pg.textContent('#dr-body [data-lock="M05"]')), "M05 mostra o motivo do bloqueio");
    await pg.click("#dr-x");
    for (const id of ["M01", "C13", "G01", "F01", "M02", "C01", "M03", "M04"]) {
      await abrirAssunto(pg, id);
      await pg.click(`#dr-body [data-all="${id}"][data-on="1"]`);
      await pg.click("#dr-x");
    }
    ok(/st-done/.test(await classe(pg, "M04")), "M04 dominado");
    ok(/st-locked/.test(await classe(pg, "M05")), "nível 1 continua fechado sem o boss do nível 0");
    await pg.click('.tab[data-view="levels"]');
    ok(!(await pg.isDisabled("#lb-0")), "boss do nível 0 liberado depois dos assuntos");
    ok(await pg.isDisabled("#lb-1"), "boss do nível 1 fechado");
    await pg.check("#lb-0");
    ok(/st-open/.test(await classe(pg, "M05")), "nível 1 abre com o boss do nível 0");
    await pg.reload(); await pg.waitForFunction(() => window.__mapa);
    ok(/st-open/.test(await classe(pg, "M05")), "progresso persiste após recarregar");
    await pg.click('.tab[data-view="progress"]');
    await pg.fill("#paste", fs.readFileSync(PROG, "utf8"));
    await pg.click("#paste-go"); await pg.click("#cf-yes");
    const resumo = await pg.evaluate(() => ({ dom: document.querySelector("#m-done").textContent, z01: document.querySelector('#svg .node[data-id="Z01"]').getAttribute("class"), c13: document.querySelector('#svg .node[data-id="C13"]').getAttribute("class") }));
    ok(resumo.dom === "180", "importação: 180 dominados " + JSON.stringify(resumo));
    ok(/st-locked/.test(resumo.z01), "assuntos novos seguem o portão (nível 0 ganhou C13, ainda não dominado)");
    ok(/st-open/.test(resumo.c13), "C13, assunto novo do nível 0, aparece liberado");
    // B8: desmarcar o que trancaria
    await abrirAssunto(pg, "M05");
    await pg.click('#dr-body [data-all="M05"][data-on="0"]');
    ok(!(await pg.isHidden("#cf")) && /trancado/.test(await pg.textContent("#cf-msg")), "desmarcar tudo num assunto bloqueado pede confirmação");
    await pg.click("#cf-no");
    ok(/st-done/.test(await classe(pg, "M05")), "cancelar mantém M05 dominado");
    await pg.click('#dr-body [data-all="M05"][data-on="0"]'); await pg.click("#cf-yes");
    ok(/st-locked/.test(await classe(pg, "M05")), "confirmar desmarca e M05 fica trancado");
    await pg.click("#dr-x");
    await abrirAssunto(pg, "M01");
    await pg.uncheck("#cb-dr-M01-0");
    ok(await pg.isHidden("#cf"), "desmarcar um item de assunto liberado não pede confirmação");
    await pg.check("#cb-dr-M01-0");
    await pg.click("#dr-x");
    await pg.click('.tab[data-view="levels"]');
    await pg.click('.level-head[data-lv="1"]');
    await pg.uncheck("#lb-1").catch(() => {});
    ok(!(await pg.isHidden("#cf")) && /boss do nível 1/.test(await pg.textContent("#cf-msg")), "desmarcar o boss de um nível fechado pede confirmação");
    await pg.click("#cf-no");
    ok(await pg.isChecked("#lb-1"), "cancelar mantém o boss marcado");
    // B6 no navegador: importar não apaga notas
    await abrirAssunto(pg, "M01");
    await pg.fill('#dr-body textarea[data-note="M01"]', "minha nota");
    await pg.click("#dr-x");
    const comNotas = JSON.parse(fs.readFileSync(PROG, "utf8")); comNotas.notes = { M01: "importada", M02: "nova" };
    await pg.click('.tab[data-view="progress"]');
    await pg.fill("#paste", JSON.stringify(comNotas)); await pg.click("#paste-go");
    ok(/notas/.test(await pg.textContent("#cf-msg")), "a confirmação da importação fala das notas");
    await pg.click("#cf-yes");
    await pg.waitForFunction(() => localStorage.getItem("o-mapa-note-M02") === "nova");
    const m01 = await pg.evaluate(() => localStorage.getItem("o-mapa-note-M01"));
    ok(/^minha nota\n\n--- importado em .+ ---\n\nimportada$/.test(m01), "nota diferente recebe o importado no fim: " + JSON.stringify(m01));
    await pg.fill("#paste", JSON.stringify(comNotas)); await pg.click("#paste-go"); await pg.click("#cf-yes");
    await pg.waitForTimeout(200);
    ok(await pg.evaluate(() => localStorage.getItem("o-mapa-note-M01")) === m01, "importar de novo não duplica a nota");
    ok(erros.length === 0, "navegador: sem erros " + JSON.stringify(erros));
    await pg.close();
  }
  // ── 2. modo app (ponte simulada) ──
  {
    const { ctx, pg } = await abrirApp(br, { notas: { M01: "nota antiga" }, notasNoMac: true });
    ok((await pg.evaluate(() => window.__log.map(m => m.acao)))[0] === "carregar", "app: carrega o progresso pela ponte");
    ok(/KEIROS/.test(await pg.textContent("#save")), "app: status mostra o KEIROS: " + await pg.textContent("#save"));
    await abrirAssunto(pg, "M01");
    ok(!(await pg.locator("#dr-pasta").isHidden()), "app: botão de abrir a pasta do assunto");
    await pg.waitForFunction(() => document.querySelector('#dr-body textarea[data-note="M01"]').value === "nota antiga");
    ok(true, "app: nota lida do notas.md");
    await pg.fill('#dr-body textarea[data-note="M01"]', "nota nova do M01");
    await pg.check("#dr-body #cb-dr-M01-b");
    await pg.keyboard.press("Meta+s");
    await pg.waitForFunction(() => window.__disco.notas.M01 === "nota nova do M01" && window.__disco.progresso && JSON.parse(window.__disco.progresso).s.M01.b === 1, null, { timeout: 5000 });
    ok(true, "app: ⌘S grava nota e progresso pela ponte");
    ok(/Mac/.test(await pg.textContent("#save")), "app: aviso de KEIROS desconectado quando a ponte guarda no Mac: " + await pg.textContent("#save"));
    const grav = await pg.evaluate(() => window.__log.filter(m => m.acao === "salvarProgresso" || m.acao === "salvarNota"));
    ok(grav.length > 0 && grav.every(m => m.raiz === "/Volumes/KEIROS/Nous Keiros" && "versao" in m), "app: toda gravação leva a ficha da pasta e a de versão");
    const n0 = await pg.evaluate(() => window.__log.length);
    const ok0 = await pg.evaluate(() => window.__mapa.salvar(true));
    ok(ok0 === true && await pg.evaluate(n => !window.__log.slice(n).some(m => m.acao === "salvarProgresso"), n0), "app: ⌘S sem nada pendente não grava de novo");
    const n1 = await pg.evaluate(() => window.__log.length);
    await pg.click("#dr-body .srcs a.ti >> nth=0");
    const ab = await pg.evaluate(n => window.__log.slice(n).find(m => m.acao === "abrir"), n1);
    ok(ab && /^https?:/.test(ab.url) && pg.url().startsWith("http://localhost:8765/"), "app: fonte abre no leitor, sem sair do mapa: " + (ab && ab.url));
    await pg.click("#dr-x");
    // B5: duas caixas da mesma nota
    await pg.click('.tab[data-view="levels"]');
    await pg.click('[data-toggle="M01"]');
    await pg.waitForFunction(() => document.querySelector("#nt-lv-M01") && document.querySelector("#nt-lv-M01").value === "nota nova do M01");
    await abrirAssunto(pg, "M01");
    await pg.waitForFunction(() => !document.querySelector("#nt-dr-M01").readOnly);
    await pg.fill("#nt-dr-M01", "digitado no painel");
    ok(await pg.inputValue("#nt-lv-M01") === "digitado no painel", "app: as duas caixas da mesma nota ficam iguais");
    await pg.click("#dr-x");
    await pg.evaluate(() => window.__mapa.salvar(true));
    await pg.evaluate(() => { window.__disco.atraso = 400; });
    await abrirAssunto(pg, "M01");
    await pg.evaluate(() => { const ta = document.querySelector("#nt-lv-M01"); ta.value = "digitado durante a leitura"; ta.dispatchEvent(new Event("input", { bubbles: true })); });
    await pg.waitForFunction(() => !document.querySelector("#nt-dr-M01").readOnly, null, { timeout: 5000 });
    await pg.evaluate(() => window.__mapa.salvar(true));
    ok(await pg.inputValue("#nt-dr-M01") === "digitado durante a leitura" && await pg.evaluate(() => window.__disco.notas.M01) === "digitado durante a leitura", "app: o que foi digitado enquanto a nota carregava não se perde");
    await pg.evaluate(() => { window.__disco.atraso = 0; });
    await pg.click("#dr-x");
    await pg.evaluate(() => window.__mapa.exportar());
    await pg.waitForFunction(() => window.__export);
    const ex = await pg.evaluate(() => JSON.parse(window.__export.texto));
    ok(ex.app === "o-mapa" && ex.notes.M01 === "digitado durante a leitura" && ex.progress.s.M01.b === 1, "app: exportar inclui progresso e notas");
    await pg.evaluate(() => window.__mapa.testarYouTube());
    const yt = await pg.evaluate(() => window.__log.filter(m => m.acao === "abrir").pop());
    ok(/youtu/.test(yt.url), "app: teste do YouTube pede para abrir " + yt.url);
    ok(pg.__erros.length === 0, "app: sem erros " + JSON.stringify(pg.__erros));
    await pg.screenshot({ path: path.join(os.tmpdir(), "o-mapa-tela.png") });
    await ctx.close();
  }
  // ── 3. dados seguros ──
  {
    const { ctx, pg } = await abrirApp(br, {});
    // outro Mac gravou: a página junta
    await pg.evaluate(() => { window.__disco.progresso = JSON.stringify({ v: 1, s: { C13: { b: 1, c: [] } }, L: {}, at: 1 }); window.__disco.versao = "vB"; });
    await abrirAssunto(pg, "M01");
    await pg.check("#cb-dr-M01-b");
    await pg.waitForFunction(() => /st-started|st-done/.test(document.querySelector('#svg .node[data-id="C13"]').getAttribute("class")), null, { timeout: 5000 });
    ok(/st-started|st-done/.test(await classe(pg, "C13")) && /st-started/.test(await classe(pg, "M01")), "app: marcação do outro Mac aparece junto com a sua");
    ok(/outro/.test(await pg.textContent("#toast")), "app: avisa que juntou");
    // duas marcações rápidas durante uma gravação lenta
    await pg.evaluate(() => { window.__disco.atraso = 300; });
    await pg.check("#cb-dr-M01-0");
    await pg.waitForTimeout(100);
    await pg.check("#cb-dr-M01-1");
    await pg.evaluate(() => window.__mapa.salvar(true));
    const fim = await pg.evaluate(() => JSON.parse(window.__disco.progresso));
    ok(fim.s.M01.c[0] === 1 && fim.s.M01.c[1] === 1 && fim.s.C13.b === 1, "app: nada se perde com gravações sobrepostas");
    await pg.evaluate(() => { window.__disco.atraso = 0; });
    // recarregar: o app pede quando o disco mudou
    await pg.waitForFunction(() => !document.querySelector("#nt-dr-M01").readOnly);
    await pg.evaluate(() => { const p = JSON.parse(window.__disco.progresso); p.s.F01 = { b: 1, c: [] }; window.__disco.progresso = JSON.stringify(p); window.__disco.versao = "vX"; window.__disco.notas.M01 = "mudou no disco"; });
    await pg.evaluate(() => window.__mapa.recarregar());
    await pg.waitForFunction(() => document.querySelector("#nt-dr-M01").value === "mudou no disco");
    ok(/st-started|st-done/.test(await classe(pg, "F01")), "app: recarregar traz o progresso novo do disco e a nota");
    await pg.fill("#nt-dr-M01", "digitando agora");
    await pg.evaluate(() => { window.__disco.atraso = 500; });
    const rec = pg.evaluate(() => window.__mapa.recarregar());
    await pg.evaluate(() => { window.__disco.notas.M01 = "outra mudança"; });
    await rec;
    ok(await pg.inputValue("#nt-dr-M01") === "digitando agora", "app: recarregar não passa por cima do que está sendo digitado");
    await pg.evaluate(() => { window.__disco.atraso = 0; });
    // erro de gravação não some com outra gravação que deu certo
    await pg.evaluate(() => { window.__disco.falharProgresso = true; });
    await pg.uncheck("#cb-dr-M01-1");
    const okFalha = await pg.evaluate(() => window.__mapa.salvar(true));
    ok(okFalha === false && await pg.getAttribute("#save", "data-mode") === "erro", "app: falha de gravação aparece e salvar responde falso");
    await pg.fill("#nt-dr-M01", "nota salva enquanto o progresso falha");
    await pg.evaluate(() => window.__mapa.salvar(true));
    ok(await pg.getAttribute("#save", "data-mode") === "erro", "app: uma nota salva não esconde o erro do progresso");
    await pg.evaluate(() => { window.__disco.falharProgresso = false; window.__disco.aviso = "disco cheio"; });
    const okAviso = await pg.evaluate(() => window.__mapa.salvar(true));
    ok(okAviso === true && /disco cheio/.test(await pg.textContent("#save")), "app: disco recusando escrita vai para o Mac e o aviso diz o motivo");
    await pg.evaluate(() => { window.__disco.aviso = null; });
    // janela escondida grava na hora
    await pg.evaluate(() => { Object.defineProperty(document, "hidden", { configurable: true, get: () => true }); });
    const t0 = await pg.evaluate(() => performance.now());
    await pg.check("#cb-dr-M01-1");
    await pg.evaluate(() => document.dispatchEvent(new Event("visibilitychange")));
    await pg.waitForFunction(t0 => window.__log.some(m => m.acao === "salvarProgresso" && m.t > t0), t0, { timeout: 3000 });
    const tGrav = await pg.evaluate(t0 => window.__log.find(m => m.acao === "salvarProgresso" && m.t > t0).t, t0);
    ok(tGrav - t0 < 300, `app: janela escondida grava na hora (${Math.round(tGrav - t0)} ms)`);
    ok(pg.__erros.length === 0, "dados seguros: sem erros " + JSON.stringify(pg.__erros));
    await ctx.close();
  }
  // ── 4. leitura falhou ──
  {
    const { ctx, pg } = await abrirApp(br, { falharCarregar: true, falharNota: ["M02"] });
    ok(/não consegui ler/.test(await pg.textContent("#save")), "app: progresso ilegível aparece no topo");
    await abrirAssunto(pg, "M01");
    await pg.check("#cb-dr-M01-b").catch(() => {});
    await pg.waitForTimeout(600);
    ok(await pg.evaluate(() => !window.__log.some(m => m.acao === "salvarProgresso")), "app: com o progresso ilegível nada é gravado");
    await pg.click("#dr-x");
    await pg.evaluate(() => { window.__disco.falharCarregar = false; });
    await pg.evaluate(() => window.__mapa.recarregar());
    await abrirAssunto(pg, "M01");
    await pg.check("#cb-dr-M01-b");
    await pg.evaluate(() => window.__mapa.salvar(true));
    ok(await pg.evaluate(() => window.__log.some(m => m.acao === "salvarProgresso")), "app: depois que o disco responde, grava normalmente");
    await abrirAssunto(pg, "M02");
    await pg.waitForTimeout(300);
    ok(await pg.evaluate(() => document.querySelector("#nt-dr-M02").readOnly), "app: nota ilegível fica só para leitura");
    await ctx.close();
  }
  // ── 5. restauração e importação no app ──
  {
    const { ctx, pg } = await abrirApp(br, { restaurado: true, progresso: JSON.stringify({ v: 1, s: {}, L: {}, at: 1 }), notas: { M01: "nota antiga" } });
    ok(/restaur/.test(await pg.textContent("#toast")), "app: avisa quando restaurou o progresso");
    const imp = JSON.parse(fs.readFileSync(PROG, "utf8")); imp.notes = { M01: "importada", M02: "nova", M03: "" };
    await pg.click('.tab[data-view="progress"]');
    await pg.fill("#paste", JSON.stringify(imp)); await pg.click("#paste-go"); await pg.click("#cf-yes");
    await pg.waitForFunction(() => window.__disco.notas.M02 === "nova", null, { timeout: 5000 });
    await pg.evaluate(() => window.__mapa.salvar(true));
    const d = await pg.evaluate(() => ({ m01: window.__disco.notas.M01, m03: window.__log.some(m => m.acao === "salvarNota" && m.id === "M03"), versionar: window.__log.some(m => m.acao === "salvarProgresso" && m.versionar === true) }));
    ok(/^nota antiga\n\n--- importado em .+ ---\n\nimportada$/.test(d.m01) && !d.m03, "app: importar acrescenta à nota e ignora nota vazia");
    ok(d.versionar, "app: importar pede para guardar a versão anterior do progresso");
    await ctx.close();
  }
  await br.close(); srv.close();
  console.log(falhas ? `${falhas} falha(s)` : "tudo certo");
  process.exit(falhas ? 1 : 0);
})().catch(e => { console.error(e); process.exit(2); });
