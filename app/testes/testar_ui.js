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
    // Agora: só o nível 0 sem dependências está liberado
    await pg.click('.tab[data-view="now"]');
    const lib = await pg.$$eval("#now [data-open]", bs => bs.map(b => b.dataset.open));
    ok(JSON.stringify(lib.sort()) === JSON.stringify(["C13", "F01", "G01", "M01"]), "liberados no início: " + lib);
    // assunto bloqueado: checkboxes desativadas e motivo
    await pg.evaluate(() => { location.hash = "M05"; });
    await pg.waitForSelector("#drawer:not([hidden])");
    ok(await pg.locator('#dr-body input[data-sid="M05"]:disabled').count() > 0, "M05 bloqueado: checkboxes desativadas");
    ok(/pré-requisito/.test(await pg.textContent('#dr-body [data-lock="M05"]')), "M05 mostra o motivo do bloqueio");
    await pg.click("#dr-x");
    // domina todo o nível 0 assunto por assunto (pela ordem das ondas)
    const nivel0 = ["M01", "C13", "G01", "F01", "M02", "C01", "M03", "M04"];
    for (const id of nivel0) {
      await pg.evaluate(id => { location.hash = id; }, id);
      await pg.waitForFunction(id => document.querySelector("#dr-title") && document.querySelector("#dr-title").textContent.startsWith(id), id);
      await pg.click(`#dr-body [data-all="${id}"][data-on="1"]`);
      await pg.click("#dr-x");
    }
    const st1 = await pg.evaluate(() => { const r = {}; for (const id of ["M04", "M05", "C02"]) r[id] = document.querySelector(`#svg .node[data-id="${id}"]`).getAttribute("class"); return r; });
    ok(/st-done/.test(st1.M04), "M04 dominado");
    ok(/st-locked/.test(st1.M05), "nível 1 continua fechado sem o boss do nível 0: " + st1.M05);
    // boss do nível 0 libera o nível 1
    await pg.click('.tab[data-view="levels"]');
    ok(!(await pg.isDisabled("#lb-0")), "boss do nível 0 liberado depois dos assuntos");
    ok(await pg.isDisabled("#lb-1"), "boss do nível 1 fechado");
    await pg.check("#lb-0");
    const st2 = await pg.evaluate(() => document.querySelector('#svg .node[data-id="M05"]').getAttribute("class"));
    ok(/st-open/.test(st2), "nível 1 abre com o boss do nível 0: " + st2);
    // recarrega: o progresso persiste no navegador
    await pg.reload(); await pg.waitForFunction(() => window.__mapa);
    ok(await pg.evaluate(() => document.querySelector('#svg .node[data-id="M05"]').getAttribute("class").includes("st-open")), "progresso persiste após recarregar");
    // importa o progresso exportado do mapa original
    await pg.click('.tab[data-view="progress"]');
    await pg.fill("#paste", fs.readFileSync(PROG, "utf8"));
    await pg.click("#paste-go"); await pg.click("#cf-yes");
    const resumo = await pg.evaluate(() => ({ dom: document.querySelector("#m-done").textContent, z01: document.querySelector('#svg .node[data-id="Z01"]').getAttribute("class"), c13: document.querySelector('#svg .node[data-id="C13"]').getAttribute("class") }));
    ok(resumo.dom === "180", "importação: 180 dominados " + JSON.stringify(resumo));
    ok(/st-locked/.test(resumo.z01), "assuntos novos seguem o portão (nível 0 ganhou C13, ainda não dominado)");
    ok(/st-open/.test(resumo.c13), "C13, assunto novo do nível 0, aparece liberado");
    await pg.close();
  }
  // ── 2. modo app (ponte simulada) ──
  {
    const ctx = await br.newContext({ viewport: { width: 1400, height: 900 } });
    await ctx.addInitScript(() => {
      const log = window.__log = [];
      const disco = { progresso: null, notas: { M01: "nota antiga" } };
      window.webkit = { messageHandlers: { mapa: { postMessage(m) {
        log.push(m);
        switch (m.acao) {
          case "carregar": return Promise.resolve({ json: disco.progresso, onde: "keiros" });
          case "salvarProgresso": disco.progresso = m.json; return Promise.resolve({ onde: "keiros" });
          case "lerNota": return Promise.resolve({ texto: disco.notas[m.id] || "" });
          case "salvarNota": disco.notas[m.id] = m.texto; return Promise.resolve({ onde: "espera" });
          case "lerNotas": return Promise.resolve({ notas: disco.notas });
          case "exportar": window.__export = m; return Promise.resolve({ ok: true });
          default: return Promise.resolve({ ok: true });
        }
      } } } };
      window.__disco = disco;
    });
    const pg = await ctx.newPage();
    const erros = []; pg.on("pageerror", e => erros.push(String(e)));
    await pg.goto("http://localhost:8765/");
    await pg.waitForFunction(() => window.__mapa);
    ok((await pg.evaluate(() => window.__log.map(m => m.acao)))[0] === "carregar", "app: carrega o progresso pela ponte");
    ok(/KEIROS/.test(await pg.textContent("#save")), "app: status mostra o KEIROS: " + await pg.textContent("#save"));
    await pg.evaluate(() => { location.hash = "M01"; });
    await pg.waitForSelector("#drawer:not([hidden])");
    ok(!(await pg.locator("#dr-pasta").isHidden()), "app: botão de abrir a pasta do assunto");
    await pg.waitForFunction(() => document.querySelector('#dr-body textarea[data-note="M01"]').value === "nota antiga");
    ok(true, "app: nota lida do notas.md");
    await pg.fill('#dr-body textarea[data-note="M01"]', "nota nova do M01");
    await pg.check("#dr-body #cb-dr-M01-b");
    await pg.keyboard.press("Meta+s");
    await pg.waitForFunction(() => window.__disco.notas.M01 === "nota nova do M01" && window.__disco.progresso && JSON.parse(window.__disco.progresso).s.M01.b === 1, null, { timeout: 5000 });
    ok(true, "app: ⌘S grava nota e progresso pela ponte");
    ok(/Mac/.test(await pg.textContent("#save")), "app: aviso de KEIROS desconectado quando a ponte guarda no Mac: " + await pg.textContent("#save"));
    // link de fonte abre no leitor do app
    const n0 = await pg.evaluate(() => window.__log.length);
    await pg.click("#dr-body .srcs a.ti >> nth=0");
    const ab = await pg.evaluate(n => window.__log.slice(n).find(m => m.acao === "abrir"), n0);
    ok(ab && /^https?:/.test(ab.url) && pg.url().startsWith("http://localhost:8765/"), "app: fonte abre no leitor, sem sair do mapa: " + (ab && ab.url));
    await pg.click("#dr-x");
    await pg.evaluate(() => window.__mapa.exportar());
    await pg.waitForFunction(() => window.__export);
    const ex = await pg.evaluate(() => JSON.parse(window.__export.texto));
    ok(ex.app === "o-mapa" && ex.notes.M01 === "nota nova do M01" && ex.progress.s.M01.b === 1, "app: exportar inclui progresso e notas");
    await pg.evaluate(() => window.__mapa.testarYouTube());
    const yt = await pg.evaluate(() => window.__log.filter(m => m.acao === "abrir").pop());
    ok(/youtu/.test(yt.url), "app: teste do YouTube pede para abrir " + yt.url);
    ok(erros.length === 0, "app: sem erros " + JSON.stringify(erros));
    await pg.screenshot({ path: path.join(os.tmpdir(), "o-mapa-tela.png") });
    await ctx.close();
  }
  await br.close(); srv.close();
  console.log(falhas ? `${falhas} falha(s)` : "tudo certo");
  process.exit(falhas ? 1 : 0);
})().catch(e => { console.error(e); process.exit(2); });
