(function () {
"use strict";
/* ═════════ ponte com o app ═════════
   Dentro do app de Mac, window.webkit.messageHandlers.mapa leva os pedidos para o Swift
   (gravar o progresso e as notas no Nous Keiros, exportar, abrir links no leitor).
   Fora do app (num navegador comum), a página funciona igual e guarda no navegador. */
const PONTE = (window.webkit && window.webkit.messageHandlers && window.webkit.messageHandlers.mapa) || null;
function pedir(acao, dados) { return PONTE.postMessage(Object.assign({ acao }, dados || {})); }
async function carregarMapa() {
  const r = await fetch("nous/mapa/mapa.json", { cache: "no-store" });
  if (!r.ok) throw new Error("mapa.json não encontrado (HTTP " + r.status + ")");
  return r.json();
}
function semMapa(e) {
  const msg = String(e && e.message ? e.message : e).replace(/[&<>"]/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]));
  document.querySelector("main").innerHTML = `<section class="view"><div class="eyebrow">O MAPA</div><h2 class="v">Não encontrei o mapa</h2>
    <p class="lead">O app lê o conteúdo de <code>Nous Keiros/mapa/mapa.json</code>. Confira se o disco KEIROS está conectado ou escolha a pasta no menu Arquivo → Escolher a pasta Nous Keiros…</p>
    <p class="lead">Detalhe: ${msg}</p></section>`;
  const sv = document.getElementById("save"); if (sv) { sv.dataset.mode = "erro"; sv.textContent = "sem mapa"; }
}
carregarMapa().then(iniciar, semMapa);

function iniciar(D) {
const S = D.subjects, ORDER = D.order, LV = D.levels;
const TR = Object.fromEntries(D.tracks.map(t => [t.id, t]));
const IDX = Object.fromEntries(ORDER.map((id, i) => [id, i]));
const $ = (s, el = document) => el.querySelector(s);
const $$ = (s, el = document) => Array.from(el.querySelectorAll(s));
const esc = s => String(s).replace(/[&<>"]/g, c => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;" }[c]));
const clone = o => JSON.parse(JSON.stringify(o));
const plural = (n, a, b) => n === 1 ? a : b;
const LS = {
  get(k) { try { return localStorage.getItem(k); } catch (e) { return null; } },
  set(k, v) { try { localStorage.setItem(k, v); return true; } catch (e) { return false; } },
  keys() { const out = []; try { for (let i = 0; i < localStorage.length; i++) out.push(localStorage.key(i)); } catch (e) {} return out; },
};

/* ═════════ estado ═════════ */
const KEY = "o-mapa-progress-v1";
let P = blank();
function blank() { return { v: 1, s: {}, L: {}, at: 0 }; }
function valid(o) { return !!o && typeof o === "object" && !!o.s && typeof o.s === "object" && !!o.L && typeof o.L === "object"; }
function sp(id) {
  const n = S[id].check.length;
  let x = P.s[id];
  if (!x || typeof x !== "object") x = P.s[id] = { b: 0, c: [] };
  if (!Array.isArray(x.c)) x.c = [];
  while (x.c.length < n) x.c.push(0);
  if (x.c.length > n) x.c.length = n;
  return x;
}
function itemsOf(id) {
  const x = P.s[id]; if (!x) return 0;
  const c = Array.isArray(x.c) ? x.c.slice(0, S[id].check.length).filter(Boolean).length : 0;
  return (x.b ? 1 : 0) + c;
}
function totalOf(id) { return 1 + S[id].check.length; }
function mastered(id) { return itemsOf(id) === totalOf(id); }
function started(id) { return itemsOf(id) > 0; }
/* portão de nível: um nível só abre quando todos os anteriores estão completos
   (todos os assuntos dominados + boss do nível vencido) */
const PORTAO = !!(D.meta.regras && D.meta.regras.portao_de_nivel);
let gateCache = null;
function levelDone(n) { return !!P.L[n] && (BY_LEVEL[n] || []).every(mastered); }
function maxOpenLevel() {
  if (gateCache == null) { let n = 0; while (n < LV.length - 1 && levelDone(n)) n++; gateCache = n; }
  return gateCache;
}
function gateOpen(lv) { return !PORTAO || lv <= maxOpenLevel(); }
function available(id) { return gateOpen(S[id].lv) && S[id].deps.every(mastered); }
function canMark(id) { return available(id) || started(id); }
function bossOpen(n) { return gateOpen(n) && (BY_LEVEL[n] || []).every(mastered); }
function gateWhy(lv) {
  const k = maxOpenLevel(), miss = (BY_LEVEL[k] || []).filter(i => !mastered(i)).length, falta = [];
  if (miss) falta.push(`${miss} ${plural(miss, "assunto", "assuntos")} por dominar`);
  if (!P.L[k]) falta.push("o boss do nível");
  return `o nível ${k} (${esc(LV[k].name)}) ainda não está completo: falta ${falta.join(" e ")}`;
}
function lockWhy(id) {
  const s = S[id], out = [];
  if (!gateOpen(s.lv)) out.push(gateWhy(s.lv));
  const dm = s.deps.filter(d => !mastered(d));
  if (dm.length) out.push(`${plural(dm.length, "falta dominar o pré-requisito", "faltam dominar os pré-requisitos")} ${idChips(dm)}`);
  return out;
}
function bossWhy(n) {
  if (!gateOpen(n)) return `Abre quando ${gateWhy(n)}.`;
  const miss = (BY_LEVEL[n] || []).filter(i => !mastered(i)).length;
  return miss ? `Abre quando os ${miss} ${plural(miss, "assunto restante", "assuntos restantes")} deste nível estiverem dominados.` : "";
}
function stateOf(id) { return mastered(id) ? "done" : started(id) ? "started" : available(id) ? "open" : "locked"; }
const STATE_TXT = { done: "dominado", started: "em andamento", open: "liberado", locked: "bloqueado" };
const ANC = {}, DESC = {};
function ancestors(id) {
  if (ANC[id]) return ANC[id];
  const s = new Set();
  for (const d of S[id].deps) { s.add(d); for (const a of ancestors(d)) s.add(a); }
  return (ANC[id] = s);
}
function descendants(id) {
  if (DESC[id]) return DESC[id];
  const s = new Set();
  for (const u of S[id].unl) { s.add(u); for (const a of descendants(u)) s.add(a); }
  return (DESC[id] = s);
}
const BY_LEVEL = {};
ORDER.forEach(id => (BY_LEVEL[S[id].lv] = BY_LEVEL[S[id].lv] || []).push(id));
function levelItems(n) {
  let got = P.L[n] ? 1 : 0, tot = 1;
  for (const id of BY_LEVEL[n] || []) { got += itemsOf(id); tot += totalOf(id); }
  return [got, tot];
}
function allItems() {
  let got = 0, tot = 0;
  for (const id of ORDER) { got += itemsOf(id); tot += totalOf(id); }
  for (const l of LV) { tot += 1; got += P.L[l.n] ? 1 : 0; }
  return [got, tot];
}

/* ═════════ persistência: KEIROS (pelo app) → Mac → navegador → exportar ═════════
   No app, o progresso vai para Nous Keiros/progresso/progresso.json e as notas de cada
   assunto para notas.md, na pasta do assunto. Se o KEIROS estiver desconectado, o app
   guarda no Mac e copia tudo para o disco quando ele volta. Fora do app, fica no navegador. */
const store = { timer: null, writing: false, dirty: false, tries: 0, loaded: false, notes: {}, nst: {}, onde: PONTE ? "keiros" : "local" };
const pausa = ms => new Promise(r => setTimeout(r, ms));
function saveLocal() { return LS.set(KEY, JSON.stringify(P)); }
function loadLocal() { const t = LS.get(KEY); if (!t) return; try { const o = JSON.parse(t); if (valid(o)) P = o; } catch (e) {} }
function hora() { return new Date().toLocaleTimeString("pt-BR", { hour: "2-digit", minute: "2-digit" }); }
function erroTxt(e) { return String(e && e.message ? e.message : e); }
function setStatus(mode, msg) {
  const el = $("#save");
  el.dataset.mode = mode;
  el.textContent = msg || (mode === "keiros" ? `salvo no KEIROS · ${hora()}` : mode === "espera" ? "KEIROS desconectado · guardado no Mac" : mode === "local" ? "salvo só neste navegador" : mode === "erro" ? "não consegui salvar — exporte" : "sem onde salvar — exporte");
  const st = $("#store-text");
  if (st) st.textContent = mode === "keiros" || mode === "espera" || (PONTE && mode === "erro")
    ? "Seu progresso fica em Nous Keiros/progresso/progresso.json, no disco KEIROS, com uma cópia por dia em progresso/backups. As notas de cada assunto ficam em notas.md, na pasta do assunto, e cada versão substituída vai para .versoes. Se o KEIROS estiver desconectado, o app guarda tudo no Mac e copia para o disco quando ele volta. Exportar gera mais uma cópia, num arquivo que você escolhe."
    : mode === "local"
      ? "Fora do app, o progresso fica salvo só neste navegador. Exporte de vez em quando para não depender dele."
      : "Não há onde salvar agora. Use Exportar para guardar o progresso num arquivo.";
}
function anyDirty() { return store.dirty || store.writing || Object.values(store.nst).some(n => n.dirty || n.writing); }
function touch() {
  P.at = Date.now();
  gateCache = null;
  if (!PONTE) { setStatus(saveLocal() ? "local" : "none"); return; }
  store.dirty = true;
  setStatus(store.onde, "salvando…");
  clearTimeout(store.timer);
  store.timer = setTimeout(flush, 400);
}
async function flush() {
  clearTimeout(store.timer);
  if (!PONTE || !store.loaded || store.writing || !store.dirty) return;
  store.dirty = false; store.writing = true;
  try {
    const r = await pedir("salvarProgresso", { json: JSON.stringify(P, null, 1) });
    store.onde = (r && r.onde) || "keiros"; store.tries = 0;
    if (!anyDirty() || !store.dirty) setStatus(store.onde);
  } catch (e) {
    store.dirty = true; store.tries++;
    setStatus("erro", "não consegui salvar — " + erroTxt(e));
  } finally {
    store.writing = false;
    if (store.dirty) store.timer = setTimeout(flush, Math.min(30000, 1500 * 2 ** Math.min(store.tries, 5)));
  }
}
async function carregarProgresso() {
  if (!PONTE) { loadLocal(); store.loaded = true; setStatus(LS.set(KEY, JSON.stringify(P)) ? "local" : "none"); return; }
  try {
    const r = await pedir("carregar");
    if (r && r.json) {
      let o = null;
      try { o = JSON.parse(r.json); } catch (e) { o = null; }
      if (valid(o)) P = o;
      else toast("O arquivo de progresso não pôde ser lido. Ele foi preservado; o app vai guardá-lo à parte na próxima gravação.");
    }
    store.onde = (r && r.onde) || "keiros";
    store.loaded = true;
    setStatus(store.onde, store.onde === "espera" ? undefined : `KEIROS conectado · ${hora()}`);
  } catch (e) {
    store.loaded = false;
    setStatus("erro", "não consegui ler o progresso — " + erroTxt(e) + ". Nada será gravado até reabrir o app.");
  }
}
function notaKey(id) { return "o-mapa-note-" + id; }
async function loadNote(id, ta) {
  if (!PONTE) { const v = LS.get(notaKey(id)); if (v != null) ta.value = v; return; }
  const ns = store.nst[id];
  if (ns && (ns.dirty || ns.writing) && store.notes[id] != null) { ta.value = store.notes[id]; return; }
  ta.readOnly = true;
  try {
    const r = await pedir("lerNota", { id, titulo: S[id].t });
    store.notes[id] = r && typeof r.texto === "string" ? r.texto : "";
    ta.value = store.notes[id];
  } catch (e) { toast(`Não consegui ler as notas de ${id}: ${erroTxt(e)}`); return; }
  finally { ta.readOnly = false; }
}
function saveNote(id, text) {
  store.notes[id] = text;
  if (!PONTE) { LS.set(notaKey(id), text); return; }
  const ns = store.nst[id] || (store.nst[id] = { timer: null, writing: false, dirty: false, tries: 0 });
  ns.dirty = true;
  setStatus(store.onde, "salvando…");
  clearTimeout(ns.timer);
  ns.timer = setTimeout(() => flushNote(id), 700);
}
async function flushNote(id) {
  const ns = store.nst[id];
  if (!ns) return;
  clearTimeout(ns.timer);
  if (ns.writing || !ns.dirty) return;
  ns.dirty = false; ns.writing = true;
  try {
    const r = await pedir("salvarNota", { id, titulo: S[id].t, texto: store.notes[id] || "" });
    store.onde = (r && r.onde) || store.onde; ns.tries = 0;
    if (!ns.dirty) setStatus(store.onde);
  } catch (e) {
    ns.dirty = true; ns.tries++;
    setStatus("erro", `não consegui salvar a nota de ${id} — ${erroTxt(e)}`);
  } finally {
    ns.writing = false;
    if (ns.dirty) ns.timer = setTimeout(() => flushNote(id), Math.min(30000, 1500 * 2 ** Math.min(ns.tries, 5)));
  }
}
async function salvarAgora() {
  if (!PONTE) { const ok = saveLocal(); setStatus(ok ? "local" : "none"); toast(ok ? "Salvo neste navegador." : "Não consegui salvar — exporte."); return ok; }
  if (!store.loaded) { toast("O progresso não foi carregado; nada foi gravado."); return false; }
  for (let k = 0; k < 100 && anyDirty() && (store.writing || Object.values(store.nst).some(n => n.writing)); k++) await pausa(50);
  store.dirty = true;
  await flush();
  for (const id of Object.keys(store.nst)) if (store.nst[id].dirty) await flushNote(id);
  const ok = !anyDirty() && $("#save").dataset.mode !== "erro";
  toast(!ok ? "Ainda não consegui salvar tudo — veja o aviso no topo." : store.onde === "espera" ? "Salvo no Mac (KEIROS desconectado)." : "Salvo no KEIROS.");
  return ok;
}
function abrirFora(url, titulo) {
  if (!PONTE) return false;
  pedir("abrir", { url, titulo: titulo || "" }).catch(e => toast("Não consegui abrir esse link: " + erroTxt(e)));
  return true;
}
function testarYouTube() {
  const s = D.sources.find(x => /youtube\.com\/watch|youtu\.be\//.test(x.u));
  if (!s) { toast("Nenhum vídeo do YouTube nas fontes."); return; }
  if (!abrirFora(s.u, s.ti)) window.open(s.u, "_blank", "noopener");
}

/* ═════════ ações ═════════ */
function bloqueado(id) { toast(`${id} ainda está bloqueado. Abra o assunto para ver o que falta.`); refresh(); }
function toggle(id, kind, idx, on) { if (!canMark(id)) { bloqueado(id); return; } const x = sp(id); if (kind === "b") x.b = on ? 1 : 0; else x.c[idx] = on ? 1 : 0; touch(); refresh(); }
function setAll(id, on) { if (!canMark(id)) { bloqueado(id); return false; } const x = sp(id); x.b = on ? 1 : 0; x.c = x.c.map(() => (on ? 1 : 0)); touch(); refresh(); return true; }
function setLevelAll(n) { if (!gateOpen(n)) { toast(`O nível ${n} ainda está fechado.`); return false; } for (const id of BY_LEVEL[n] || []) { const x = sp(id); x.b = 1; x.c = x.c.map(() => 1); } touch(); refresh(); return true; }
function toggleLevel(n, on) { if (on && !bossOpen(n)) { toast(bossWhy(n) || `O boss do nível ${n} ainda está fechado.`); refresh(); return; } P.L[n] = on ? 1 : 0; touch(); refresh(); }

/* ═════════ conteúdo de um assunto ═════════ */
function stateChip(id) { const st = stateOf(id); return `<span class="state ${st === "done" ? "done" : ""}">${STATE_TXT[st]} · ${itemsOf(id)}/${totalOf(id)}</span>`; }
function idChips(ids) { return ids.map(i => `<a class="sid st-${stateOf(i)}" data-id="${i}" href="#${i}" title="${esc(S[i].t)}">${i}</a>`).join(" "); }
function pathLine(id) {
  const anc = ancestors(id), des = descendants(id);
  if (!anc.size) return `ponto de partida · leva a ${des.size} ${plural(des.size, "assunto", "assuntos")}`;
  const miss = [...anc].filter(a => !mastered(a)).length;
  return `depende de ${anc.size} ${plural(anc.size, "assunto", "assuntos")} (diretos e indiretos) · ${miss ? `${miss} ainda não ${plural(miss, "dominado", "dominados")}` : "todos já dominados"} · leva a ${des.size}`;
}
function subjectHTML(id, ctx) {
  const s = S[id], x = P.s[id] || { b: 0, c: [] }, t = TR[s.tr];
  const pre = s.deps.length ? idChips(s.deps) : "<span>nenhum — ponto de partida</span>";
  const unl = s.unl.length ? idChips(s.unl) : "<span>nada adiante — fim de linha</span>";
  const srcs = s.src.map(r => `<div class="src"><span aria-hidden="true">${r.ic}</span><div><a class="ti" href="${esc(r.u)}" target="_blank" rel="noopener">${esc(r.ti)}</a><div class="au">${esc(r.au)} · ${esc(r.ty)}</div>${r.n ? `<div class="nt">${r.n}</div>` : ""}${r.ok ? "" : `<div class="warn">⚠ não verificado — ${esc(r.why)}</div>`}</div></div>`).join("");
  const lock = !canMark(id);
  const checks = s.check.map((c, i) => {
    const on = x.c && x.c[i] ? 1 : 0, cid = `cb-${ctx}-${id}-${i}`;
    return `<div class="task ${on ? "on" : ""}"><input type="checkbox" id="${cid}" data-sid="${id}" data-k="c" data-i="${i}" ${on ? "checked" : ""} ${lock ? "disabled" : ""}><label for="${cid}">${c}</label></div>`;
  }).join("");
  const bid = `cb-${ctx}-${id}-b`, bon = x.b ? 1 : 0;
  return `<div class="sx">
    <div class="sx-meta"><span>${esc(t.id)} · ${esc(t.name)}</span><span>nível ${s.lv} · ${esc(LV[s.lv].name)} · onda ${s.w}</span><span class="en">${esc(s.en)}</span></div>
    <div class="blk lock" data-lock="${id}" ${lock ? "" : "hidden"}><h5>🔒 Ainda bloqueado</h5><ul>${lock ? lockWhy(id).map(r => `<li>${r}</li>`).join("") : ""}</ul></div>
    <div class="blk why"><h5>🎯 Por que importa</h5><p>${s.why}</p></div>
    <div class="blk"><h5>🔒 Pré-requisitos</h5><div class="links">${pre}</div>${s.pre ? `<div style="margin-top:8px">${s.pre}</div>` : ""}<div class="links" style="margin-top:8px">destrava → ${unl}</div><div class="links" style="margin-top:6px" data-path="${id}">${pathLine(id)}</div></div>
    <div class="blk"><h5>🧱 Base</h5>${s.base}</div>
    <div class="blk"><h5>⚙️ Meio</h5>${s.mid}</div>
    <div class="blk"><h5>🔥 Avançado</h5>${s.adv}</div>
    <div class="blk"><h5>📐 Matemática necessária</h5><p>${s.math}</p></div>
    <div class="blk"><h5>🛠️ Métodos</h5>${s.how}</div>
    <div class="blk"><h5>⚠️ Desafios</h5>${s.hard}</div>
    <div class="blk"><h5>📚 Fontes</h5><div class="srcs">${srcs}</div></div>
    <div class="blk"><h5>⚔️ Boss fight</h5>${s.kei.length ? `<div class="kei" style="margin-bottom:6px">◆ campanha KEIROS · ${s.kei.map(esc).join(", ")}</div>` : ""}<div class="task boss ${bon ? "on" : ""}"><input type="checkbox" id="${bid}" data-sid="${id}" data-k="b" ${bon ? "checked" : ""} ${lock ? "disabled" : ""}><label for="${bid}">${s.boss}</label></div></div>
    <div class="blk"><h5>✅ Checkpoint</h5><div class="checks">${checks}</div></div>
    <div class="actions"><button class="btn gold" data-all="${id}" data-on="1" ${lock ? "disabled" : ""}>Já domino este assunto</button><button class="btn ghost" data-all="${id}" data-on="0" ${lock ? "disabled" : ""}>Desmarcar tudo</button>${PONTE ? `<button class="btn ghost" data-pasta="${id}">📁 Abrir a pasta do assunto</button>` : ""}</div>
    <div class="blk notes"><h5>📝 Suas notas</h5><label for="nt-${ctx}-${id}" class="sr">Notas sobre ${id}</label><textarea id="nt-${ctx}-${id}" data-note="${id}" placeholder="O que você entendeu, onde travou, o que vai testar no Rei Ichi…"></textarea><small>${PONTE ? "Ficam em notas.md, na pasta do assunto no Nous Keiros. Salvas enquanto você escreve; ⌘S salva na hora." : "Ficam guardadas neste navegador."}</small></div>
  </div>`;
}

/* ═════════ painel lateral ═════════ */
let openId = null, lastFocus = null;
function eyeText(id) { const s = S[id]; return `${TR[s.tr].name} · nível ${s.lv} · ${LV[s.lv].name} · ${STATE_TXT[stateOf(id)]}`; }
function openSubject(id) {
  if (!S[id]) return;
  if (!openId) lastFocus = document.activeElement;
  openId = id;
  const s = S[id];
  $("#dr-eye").textContent = eyeText(id);
  $("#dr-title").innerHTML = `<span class="id">${id}</span>${esc(s.t)}`;
  const i = IDX[id], pv = ORDER[i - 1], nx_ = ORDER[i + 1];
  const bp = $("#dr-prev"), bn = $("#dr-next");
  bp.textContent = pv ? `← ${pv}` : "← início"; bp.disabled = !pv; bp.dataset.to = pv || "";
  bn.textContent = nx_ ? `${nx_} →` : "fim →"; bn.disabled = !nx_; bn.dataset.to = nx_ || "";
  const body = $("#dr-body");
  body.innerHTML = subjectHTML(id, "dr");
  body.scrollTop = 0;
  const ta = body.querySelector("textarea[data-note]");
  if (ta) loadNote(id, ta);
  $("#drawer").hidden = false; $("#scrim").hidden = false;
  document.body.style.overflow = "hidden";
  $("#dr-x").focus({ preventScroll: true });
  try { history.replaceState(null, "", "#" + id); } catch (e) {}
  paintTree();
}
function closeDrawer() {
  if ($("#drawer").hidden) return;
  $("#drawer").hidden = true; $("#scrim").hidden = true; openId = null;
  document.body.style.overflow = "";
  try { history.replaceState(null, "", location.pathname + location.search); } catch (e) {}
  paintTree();
  if (lastFocus && lastFocus.focus && document.contains(lastFocus)) lastFocus.focus({ preventScroll: true });
}

/* ═════════ árvore: SVG com pan/zoom, rótulos fixos e minimapa ═════════ */
const CW = 182, RH = 46, NW = 164, NH = 38, X0 = 70, Y0 = 60, CUT = 8, LEFT = 58, TOP = 44;
const NS = "http://www.w3.org/2000/svg";
let vb = null, full = null, SW = 800, SH = 500, trackFilter = null, treeInit = false, pinned = null;
const ST = { g: null, left: null, top: null, lanes: [], levels: [] };
const MINI = { rects: [], vp: null };
let NODES = [], EDGES = [];
function el(tag, attrs, parent) { const e = document.createElementNS(NS, tag); for (const k in attrs) e.setAttribute(k, attrs[k]); if (parent) parent.appendChild(e); return e; }
function nx(id) { return X0 + S[id].x * CW; }
function ny(id) { return Y0 + S[id].y * RH; }
function wrapTitle(id, t) {
  const L1 = 21 - id.length, L2 = 23;
  const fit = txt => {
    const w = txt.split(/\s+/).filter(Boolean); let a = "", b = "", i = 0;
    while (i < w.length && (a ? a.length + 1 : 0) + w[i].length <= L1) { a += (a ? " " : "") + w[i]; i++; }
    while (i < w.length && (b ? b.length + 1 : 0) + w[i].length <= L2) { b += (b ? " " : "") + w[i]; i++; }
    return { a, b, rest: i < w.length };
  };
  let r = fit(t);
  if (r.rest) { const base = t.split(":")[0].trim(); if (base !== t) r = fit(base); }
  if (r.rest) {
    let b = r.b;
    while (b.length + 1 > L2 && b.includes(" ")) b = b.slice(0, b.lastIndexOf(" "));
    b = b.replace(/[\s,;:–-]+$/, "") + "…";
    return [r.a, b];
  }
  return [r.a, r.b];
}
function measure() { const r = $("#stage").getBoundingClientRect(); if (r.width > 0 && r.height > 0) { SW = r.width; SH = r.height; } }
function buildTree() {
  const svg = $("#svg");
  full = { w: X0 + D.meta.cols * CW + 24, h: Y0 + D.meta.rows * RH + 12 };
  const gB = el("g", {}, svg), gE = el("g", {}, svg), gN = el("g", {}, svg);
  const byL = {};
  D.cols.forEach((c, i) => (byL[c[0]] = byL[c[0]] || []).push(i));
  const bands = [];
  Object.keys(byL).map(Number).sort((a, b) => a - b).forEach((L, k) => {
    const cs = byL[L], x = X0 + cs[0] * CW - 9, w = cs.length * CW;
    el("rect", { x, y: 0, width: w, height: full.h, class: "lvband" + (k % 2 ? " alt" : "") }, gB);
    for (let j = 1; j < cs.length; j++) el("line", { x1: x + j * CW, x2: x + j * CW, y1: 0, y2: full.h, class: "wsep" }, gB);
    bands.push({ L, x, w });
  });
  D.tracks.forEach(t => { const y = Y0 + t.y * RH - 4; el("line", { x1: 0, x2: full.w, y1: y, y2: y, class: "lane" }, gB); });
  for (const id of ORDER) for (const d of S[id].deps) {
    const x1 = nx(d) + NW, y1 = ny(d) + NH / 2, x2 = nx(id), y2 = ny(id) + NH / 2, mx = (x1 + x2) / 2;
    EDGES.push(el("path", { d: `M${x1},${y1} C${mx},${y1} ${mx},${y2} ${x2},${y2}`, class: "edge", "data-a": d, "data-b": id }, gE));
  }
  for (const id of ORDER) {
    const x = nx(id), y = ny(id);
    const g = el("g", { class: "node", "data-id": id, tabindex: "0", role: "button", "aria-label": `${id} ${S[id].t}` }, gN);
    el("polygon", { points: `${x},${y} ${x + NW - CUT},${y} ${x + NW},${y + CUT} ${x + NW},${y + NH} ${x},${y + NH}` }, g);
    const [l1, l2] = wrapTitle(id, S[id].t);
    const tx = el("text", { x: x + 9, y: y + 15 }, g);
    el("tspan", { class: "nid" }, tx).textContent = id;
    el("tspan", { class: "ntt", dx: 6 }, tx).textContent = l1;
    if (l2) el("tspan", { class: "ntt", x: x + 9, dy: 14 }, tx).textContent = l2;
    NODES.push(g);
  }
  // camada fixa: tamanho constante na tela, independente do zoom
  const gS = el("g", {}, svg);
  ST.g = gS;
  ST.left = el("rect", { x: 0, y: 0, width: LEFT, height: 100, class: "stick" }, gS);
  el("line", { x1: LEFT, x2: LEFT, y1: 0, y2: 4000, class: "stickline" }, gS);
  D.tracks.forEach(t => {
    const k = el("text", { x: 8, y: 0, class: "lanek" }, gS); k.textContent = t.id;
    const i = el("text", { x: 30, y: 0, class: "lanei" }, gS); i.textContent = "";
    ST.lanes.push({ k, i, y0: Y0 + t.y * RH - 4, hh: t.h * RH });
  });
  ST.top = el("rect", { x: 0, y: 0, width: 100, height: TOP, class: "stick" }, gS);
  ST.topline = el("line", { x1: 0, x2: 4000, y1: TOP, y2: TOP, class: "stickline" }, gS);
  bands.forEach(b => {
    const k = el("text", { x: 0, y: 22, class: "lvhead" }, gS); k.textContent = String(b.L);
    const n = el("text", { x: 0, y: 37, class: "lvnum" }, gS);
    ST.levels.push({ ...b, k, n, long: LV[b.L].name.toUpperCase() });
  });
  el("rect", { x: 0, y: 0, width: LEFT, height: TOP, class: "stick corner" }, gS);
  const ct = el("text", { x: 8, y: 27, class: "lvnum" }, gS); ct.textContent = "MAPA";
  buildMini();
  wireTree();
}
function buildMini() {
  const m = $("#mini");
  m.setAttribute("viewBox", `0 0 ${full.w} ${full.h}`);
  m.style.aspectRatio = `${full.w} / ${full.h}`;
  for (const id of ORDER) MINI.rects.push(el("rect", { x: nx(id), y: ny(id), width: NW, height: NH, class: "m", "data-id": id }, m));
  MINI.vp = el("rect", { class: "vp", x: 0, y: 0, width: 10, height: 10 }, m);
  let down = false;
  const go = e => {
    const r = m.getBoundingClientRect();
    vb.x = (e.clientX - r.left) / r.width * full.w - vb.w / 2;
    vb.y = (e.clientY - r.top) / r.height * full.h - vb.h / 2;
    clampVB(); applyVB();
  };
  m.addEventListener("pointerdown", e => { e.stopPropagation(); down = true; try { m.setPointerCapture(e.pointerId); } catch (_) {} go(e); });
  m.addEventListener("pointermove", e => { if (down) { e.stopPropagation(); go(e); } });
  m.addEventListener("pointerup", e => { e.stopPropagation(); down = false; });
  m.addEventListener("pointercancel", () => { down = false; });
}
function clampVB() {
  const minX = Math.min(-vb.w * 0.4, (full.w - vb.w) / 2), maxX = Math.max(full.w - vb.w * 0.6, (full.w - vb.w) / 2);
  const minY = Math.min(-vb.h * 0.4, (full.h - vb.h) / 2), maxY = Math.max(full.h - vb.h * 0.6, (full.h - vb.h) / 2);
  vb.x = Math.min(maxX, Math.max(minX, vb.x));
  vb.y = Math.min(maxY, Math.max(minY, vb.y));
}
function applyVB() {
  vb.h = vb.w * SH / SW;
  $("#svg").setAttribute("viewBox", `${vb.x} ${vb.y} ${vb.w} ${vb.h}`);
  const s = SW / vb.w;
  ST.g.setAttribute("transform", `translate(${vb.x} ${vb.y}) scale(${1 / s})`);
  ST.left.setAttribute("height", SH);
  ST.top.setAttribute("width", SW);
  for (const o of ST.lanes) {
    const top = (o.y0 - vb.y) * s, hh = o.hh * s, y = Math.max(top + 20, TOP + 18);
    const vis = hh >= 17 && y <= top + hh - 3 && y < SH;
    o.k.setAttribute("y", y); o.i.setAttribute("y", y - 2);
    o.k.style.display = o.i.style.display = vis ? "" : "none";
  }
  for (const o of ST.levels) {
    const left = (o.x - vb.x) * s, bw = o.w * s, x = Math.max(left + 8, LEFT + 8);
    const vis = bw >= 34 && x + 26 <= left + bw && x < SW;
    o.k.setAttribute("x", x); o.n.setAttribute("x", x);
    const lab = (left + bw - x - 26) >= o.long.length * 7.7 + 6 ? o.long : "";
    if (o.n.textContent !== lab) o.n.textContent = lab;
    o.k.style.display = o.n.style.display = vis ? "" : "none";
  }
  if (MINI.vp) { MINI.vp.setAttribute("x", vb.x); MINI.vp.setAttribute("y", vb.y); MINI.vp.setAttribute("width", vb.w); MINI.vp.setAttribute("height", vb.h); }
}
function scaleBounds() { return [Math.min(SW / full.w, SH / full.h) * 0.9, 2.6]; }
function setScale(s, cx, cy) {
  const [lo, hi] = scaleBounds(); s = Math.max(lo, Math.min(hi, s));
  const nw = SW / s, k = nw / vb.w;
  vb.x = cx - (cx - vb.x) * k; vb.y = cy - (cy - vb.y) * (nw * SH / SW) / vb.h; vb.w = nw; vb.h = nw * SH / SW;
  clampVB(); applyVB();
}
function zoomBy(f, cx, cy) { setScale((SW / vb.w) * f, cx, cy); }
function fit() {
  measure();
  const s = Math.min(SW / full.w, SH / full.h);
  vb = { w: SW / s, h: SH / s, x: 0, y: 0 };
  vb.x = (full.w - vb.w) / 2; vb.y = (full.h - vb.h) / 2;
  applyVB();
}
function focusFrontier() {
  measure();
  const s = SW < 720 ? 0.84 : 1;
  vb = { w: SW / s, h: SH / s, x: 0, y: 0 };
  const ids = ORDER.filter(id => { const st = stateOf(id); return st === "started" || st === "open"; });
  if (ids.length) {
    vb.x = Math.min(...ids.map(nx)) - LEFT / s - 14;
    vb.y = Math.min(...ids.map(ny)) - TOP / s - 12;
  } else { vb.x = full.w - vb.w; vb.y = 0; }
  clampVB(); applyVB();
}
function centerOn(id) {
  measure();
  const s = Math.max(SW / vb.w, SW < 720 ? 0.84 : 1);
  vb.w = SW / s; vb.h = SH / s;
  vb.x = nx(id) + NW / 2 - vb.w / 2; vb.y = ny(id) + NH / 2 - vb.h / 2;
  clampVB(); applyVB();
}
function clientToSvg(px, py) {
  const r = $("#stage").getBoundingClientRect();
  return { x: vb.x + (px - r.left) / r.width * vb.w, y: vb.y + (py - r.top) / r.height * vb.h };
}
function wireTree() {
  const st = $("#stage"), svg = $("#svg");
  const ptrs = new Map(); let drag = null, pinch = null, moved = false, downNode = null;
  st.addEventListener("wheel", e => {
    e.preventDefault();
    const k = e.deltaMode === 1 ? 16 : e.deltaMode === 2 ? SH : 1, dx = e.deltaX * k, dy = e.deltaY * k;
    const p = clientToSvg(e.clientX, e.clientY);
    if (e.ctrlKey) { zoomBy(Math.exp(-dy * 0.01), p.x, p.y); return; }
    if (e.shiftKey || Math.abs(dx) > Math.abs(dy)) { vb.x += (e.shiftKey && !dx ? dy : dx) / SW * vb.w; clampVB(); applyVB(); return; }
    zoomBy(Math.exp(-Math.max(-60, Math.min(60, dy)) * 0.0035), p.x, p.y);
  }, { passive: false });
  st.addEventListener("pointerdown", e => {
    if (e.button !== undefined && e.button > 0) return;
    ptrs.set(e.pointerId, { x: e.clientX, y: e.clientY }); moved = false;
    downNode = e.target.closest ? e.target.closest(".node") : null;
    if (ptrs.size === 1) drag = { x: e.clientX, y: e.clientY, vx: vb.x, vy: vb.y };
    if (ptrs.size === 2) { const [a, b] = [...ptrs.values()]; pinch = { d: Math.hypot(a.x - b.x, a.y - b.y) || 1, s: SW / vb.w }; drag = null; moved = true; }
  });
  st.addEventListener("pointermove", e => {
    if (!ptrs.has(e.pointerId)) return;
    ptrs.set(e.pointerId, { x: e.clientX, y: e.clientY });
    if (pinch && ptrs.size === 2) {
      const [a, b] = [...ptrs.values()], d = Math.hypot(a.x - b.x, a.y - b.y) || 1;
      const c = clientToSvg((a.x + b.x) / 2, (a.y + b.y) / 2);
      setScale(pinch.s * d / pinch.d, c.x, c.y); return;
    }
    if (drag) {
      const dx = e.clientX - drag.x, dy = e.clientY - drag.y;
      if (!moved && Math.abs(dx) + Math.abs(dy) > 5) { moved = true; st.classList.add("dragging"); hideTip(); try { st.setPointerCapture(e.pointerId); } catch (_) {} }
      if (moved) { vb.x = drag.vx - dx / SW * vb.w; vb.y = drag.vy - dy / SH * vb.h; clampVB(); applyVB(); }
    }
  });
  const end = e => {
    ptrs.delete(e.pointerId);
    if (ptrs.size < 2) pinch = null;
    if (ptrs.size === 1) { const [a] = [...ptrs.values()]; drag = { x: a.x, y: a.y, vx: vb.x, vy: vb.y }; }
    if (ptrs.size === 0) { drag = null; st.classList.remove("dragging"); }
  };
  st.addEventListener("pointerup", e => {
    const wasMoved = moved, n = downNode; end(e);
    if (wasMoved || ptrs.size) return;
    if (n) { pinned = n.dataset.id; openSubject(n.dataset.id); }
    else if (pinned) { pinned = null; paintTree(); }
  });
  st.addEventListener("pointercancel", end);
  svg.addEventListener("keydown", e => {
    const n = e.target.closest && e.target.closest(".node");
    if (n && (e.key === "Enter" || e.key === " ")) { e.preventDefault(); pinned = n.dataset.id; openSubject(n.dataset.id); }
  });
  st.addEventListener("keydown", e => {
    if (e.target.closest && e.target.closest("input,textarea")) return;
    const step = 0.18, c = { x: vb.x + vb.w / 2, y: vb.y + vb.h / 2 };
    const k = e.key;
    if (k === "ArrowLeft") vb.x -= vb.w * step; else if (k === "ArrowRight") vb.x += vb.w * step;
    else if (k === "ArrowUp") vb.y -= vb.h * step; else if (k === "ArrowDown") vb.y += vb.h * step;
    else if (k === "+" || k === "=") { zoomBy(1.25, c.x, c.y); e.preventDefault(); return; }
    else if (k === "-" || k === "_") { zoomBy(0.8, c.x, c.y); e.preventDefault(); return; }
    else if (k === "0") { fit(); e.preventDefault(); return; }
    else return;
    e.preventDefault(); clampVB(); applyVB();
  });
  svg.addEventListener("pointerover", e => { const n = e.target.closest && e.target.closest(".node"); if (n && e.pointerType === "mouse" && !st.classList.contains("dragging")) hover(n.dataset.id, e); });
  svg.addEventListener("pointerout", e => { const n = e.target.closest && e.target.closest(".node"); if (n) hover(null); });
  svg.addEventListener("focusin", e => { const n = e.target.closest && e.target.closest(".node"); if (n) highlight(n.dataset.id); });
  svg.addEventListener("focusout", () => highlight(pinned));
  ["#ctrl", "#pinchip"].forEach(s => ["pointerdown", "pointerup"].forEach(ev => $(s).addEventListener(ev, e => e.stopPropagation())));
  $("#pinchip").addEventListener("click", () => { pinned = null; paintTree(); });
  const mid = () => ({ x: vb.x + vb.w / 2, y: vb.y + vb.h / 2 });
  $("#z-in").onclick = () => { const c = mid(); zoomBy(1.3, c.x, c.y); };
  $("#z-out").onclick = () => { const c = mid(); zoomBy(1 / 1.3, c.x, c.y); };
  $("#z-fit").onclick = fit;
  $("#z-here").onclick = focusFrontier;
  let rt = null;
  window.addEventListener("resize", () => {
    clearTimeout(rt);
    rt = setTimeout(() => {
      if ($("#v-tree").hidden || !vb) return;
      const s = SW / vb.w, cx = vb.x + vb.w / 2, cy = vb.y + vb.h / 2;
      measure(); vb.w = SW / s; vb.h = SH / s; vb.x = cx - vb.w / 2; vb.y = cy - vb.h / 2; clampVB(); applyVB();
    }, 80);
  });
}
function highlight(id) {
  if (!id) {
    EDGES.forEach(p => p.classList.remove("hi-in", "hi-out", "dim"));
    NODES.forEach(n => { const m = !!trackFilter && inFilter(n.dataset.id); n.classList.toggle("dim", !!trackFilter && !m); n.classList.toggle("match", m); });
    MINI.rects.forEach(r => r.classList.toggle("dim", !!trackFilter && !inFilter(r.dataset.id)));
    return;
  }
  const anc = ancestors(id), des = descendants(id);
  EDGES.forEach(p => {
    const a = p.dataset.a, b = p.dataset.b;
    const inn = b === id || anc.has(b), out = a === id || des.has(a);
    p.classList.toggle("hi-in", inn); p.classList.toggle("hi-out", out && !inn); p.classList.toggle("dim", !inn && !out);
  });
  NODES.forEach(n => { const k = n.dataset.id; n.classList.toggle("dim", !(k === id || anc.has(k) || des.has(k))); n.classList.remove("match"); });
}
function inFilter(id) { return trackFilter === "__kei" ? S[id].kei.length > 0 : S[id].tr === trackFilter; }
function hideTip() { $("#tip").hidden = true; }
function hover(id, e) {
  if (!id) { highlight(pinned); hideTip(); return; }
  highlight(id);
  const s = S[id], anc = ancestors(id), des = descendants(id), tip = $("#tip");
  tip.innerHTML = `<b>${id}</b> ${esc(s.t)}<br><span>${STATE_TXT[stateOf(id)]} · ${itemsOf(id)}/${totalOf(id)} · depende de ${anc.size} · leva a ${des.size}</span>${s.kei.length ? `<br><span class="kei">◆ ${s.kei.map(esc).join(", ")}</span>` : ""}`;
  const r = $("#stage").getBoundingClientRect();
  tip.hidden = false;
  const tw = tip.offsetWidth, th = tip.offsetHeight;
  let x = e.clientX - r.left + 14, y = e.clientY - r.top + 16;
  if (x + tw > r.width - 6) x = e.clientX - r.left - tw - 14;
  if (y + th > r.height - 6) y = e.clientY - r.top - th - 12;
  tip.style.left = Math.max(6, x) + "px"; tip.style.top = Math.max(6, y) + "px";
}
function paintTree() {
  NODES.forEach(n => { const id = n.dataset.id; n.setAttribute("class", "node st-" + stateOf(id) + (openId === id || pinned === id ? " sel" : "")); });
  MINI.rects.forEach(r => r.setAttribute("class", "m st-" + stateOf(r.dataset.id)));
  highlight(pinned);
  const pc = $("#pinchip");
  if (pinned) { pc.innerHTML = `caminho de <b>${pinned}</b> aceso · limpar ×`; pc.hidden = false; } else pc.hidden = true;
}
function buildTrackChips() {
  const wrap = $("#tr-chips");
  wrap.innerHTML = `<button class="chip" data-tr="" aria-pressed="true">todas</button><button class="chip kei-chip" data-tr="__kei" aria-pressed="false" title="Assuntos cujo boss fight usa o seu ecossistema (Rei Ichi, MUSUBI, REIXU, .kei…)"><span class="k">◆</span>campanhas KEIROS</button>` +
    D.tracks.map(t => `<button class="chip" data-tr="${t.id}" aria-pressed="false" title="${esc(t.sense || t.name)}"><span class="k">${esc(t.id)}</span>${esc(t.name)}</button>`).join("");
  wrap.addEventListener("click", e => {
    const b = e.target.closest(".chip"); if (!b) return;
    trackFilter = b.dataset.tr || null;
    pinned = null;
    $$(".chip", wrap).forEach(c => c.setAttribute("aria-pressed", String(c === b)));
    paintTree();
  });
}

/* ═════════ níveis ═════════ */
function buildLevels() {
  const root = $("#levels");
  root.innerHTML = LV.map(l => {
    const ids = BY_LEVEL[l.n] || [];
    const waves = l.waves.map((w, i) => `<div class="wave"><span>onda ${i + 1}${w.length > 1 ? " ∥" : ""}</span>${w.map(id => `<a class="sid" data-id="${id}" data-paint="${id}" href="#${id}" title="${esc(S[id].t)}">${id}</a>`).join("")}</div>`).join("");
    const subs = ids.map(id => `<div class="subj" data-subj="${id}">
        <button class="subj-head" aria-expanded="false" data-toggle="${id}"><span class="sid" data-paint="${id}">${id}</span><span class="t"><b>${esc(S[id].t)}</b><small>${esc(TR[S[id].tr].name)} · onda ${S[id].w}${S[id].kei.length ? ` · <span class="kei">◆ ${S[id].kei.map(esc).join(", ")}</span>` : ""}</small></span><span data-state="${id}"></span></button>
        <div class="subj-body" hidden></div></div>`).join("");
    const isFinal = l.n === 13;
    return `<section class="level" id="lv-${l.n}">
      <button class="level-head" aria-expanded="${l.n === 0 ? "true" : "false"}" data-lv="${l.n}">
        <span class="belt" data-belt="${l.n}">${l.n}</span>
        <span class="lh-txt"><span class="eyebrow"><span class="chev">▸</span> nível ${l.n}<span data-lvlock="${l.n}"></span>${ids.length ? ` · ${ids.length} ${plural(ids.length, "assunto", "assuntos")}` : ""}</span><h3>${esc(l.name)}</h3></span>
        <span class="lh-meta"><span data-lvn="${l.n}"></span><span class="bar" data-lvbar="${l.n}"><i></i></span></span>
      </button>
      <div class="level-body" ${l.n === 0 ? "" : "hidden"}>
        <div class="mission"><b>Missão</b>${l.mission}</div>
        ${isFinal
          ? `<p style="margin:0"><a href="#" data-go="line">Abrir o capítulo “A linha que ninguém cruzou” →</a></p>`
          : `<div class="waves">${waves}</div>${l.note ? `<p style="margin:0;color:var(--ink-2);font-size:var(--fs-1)">${l.note}</p>` : ""}<div class="list">${subs}</div>
             <div class="lvtools"><button class="btn ghost" data-lvall="${l.n}">Já domino esta faixa inteira</button></div>`}
        <div class="lboss" data-lboss="${l.n}"><h4>⚔️ Boss do nível ${l.n}</h4><div class="task"><input type="checkbox" id="lb-${l.n}" data-level="${l.n}"><label for="lb-${l.n}">${l.boss}</label></div><div class="lockline" data-lbwhy="${l.n}"></div></div>
        <div><div class="now-h">O que você consegue fazer agora</div><p style="margin:6px 0 0;max-width:80ch">${l.now}</p></div>
      </div>
    </section>`;
  }).join("");
  root.addEventListener("click", e => {
    if (e.target.closest("a")) return;
    const h = e.target.closest(".level-head");
    if (h) { const body = h.nextElementSibling, open = h.getAttribute("aria-expanded") === "true"; h.setAttribute("aria-expanded", String(!open)); body.hidden = open; return; }
    const sh = e.target.closest(".subj-head");
    if (sh) {
      const id = sh.dataset.toggle, body = sh.nextElementSibling, open = sh.getAttribute("aria-expanded") === "true";
      sh.setAttribute("aria-expanded", String(!open));
      if (!open) { body.innerHTML = subjectHTML(id, "lv"); const ta = body.querySelector("textarea[data-note]"); if (ta) loadNote(id, ta); }
      else body.innerHTML = "";
      body.hidden = open;
      return;
    }
    const la = e.target.closest("[data-lvall]");
    if (la) {
      const n = +la.dataset.lvall, ids = BY_LEVEL[n] || [];
      if (!gateOpen(n)) { toast(`O nível ${n} ainda está fechado: ${gateWhy(n).replace(/<[^>]+>/g, "")}.`); return; }
      askConfirm(`Marcar os ${ids.length} assuntos do nível ${n} (${LV[n].name}) como dominados? O boss do nível continua para você marcar.`, () => { if (setLevelAll(n)) toast(`Nível ${n} marcado.`); });
    }
  });
}
function openLevel(n) {
  const sec = $("#lv-" + n); if (!sec) return;
  const h = sec.querySelector(".level-head");
  if (h.getAttribute("aria-expanded") === "false") { h.setAttribute("aria-expanded", "true"); h.nextElementSibling.hidden = false; }
  sec.scrollIntoView({ block: "start" });
}
function paintLevels() {
  $$("[data-paint]").forEach(e => { e.className = e.className.replace(/\bst-\w+/g, "").replace(/\s+/g, " ").trim() + " st-" + stateOf(e.dataset.paint); });
  $$("[data-state]").forEach(e => { e.innerHTML = stateChip(e.dataset.state); });
  LV.forEach(l => {
    const [g, t] = levelItems(l.n);
    const n = $(`[data-lvn="${l.n}"]`); if (n) n.textContent = `${g}/${t} itens`;
    const b = $(`[data-lvbar="${l.n}"]`); if (b) { b.firstElementChild.style.width = (100 * g / t) + "%"; b.classList.toggle("full", g === t); }
    const belt = $(`[data-belt="${l.n}"]`); if (belt) belt.classList.toggle("done", g === t);
    const lb = $(`[data-lboss="${l.n}"]`); if (lb) lb.classList.toggle("won", !!P.L[l.n]);
    const cb = $(`#lb-${l.n}`); if (cb) { cb.checked = !!P.L[l.n]; cb.closest(".task").classList.toggle("on", !!P.L[l.n]); cb.disabled = !P.L[l.n] && !bossOpen(l.n); if (lb) lb.classList.toggle("locked", cb.disabled); }
    const why = $(`[data-lbwhy="${l.n}"]`); if (why) why.innerHTML = cb && cb.disabled ? bossWhy(l.n) : "";
    const lk = $(`[data-lvlock="${l.n}"]`); if (lk) lk.textContent = gateOpen(l.n) ? "" : " · 🔒 fechado";
    const la = $(`[data-lvall="${l.n}"]`); if (la) la.disabled = !gateOpen(l.n);
  });
}

/* ═════════ agora ═════════ */
function paintNow() {
  const startedIds = ORDER.filter(id => started(id) && !mastered(id));
  const openIds = ORDER.filter(id => !started(id) && available(id));
  const bossReady = LV.filter(l => l.n < 13 && !P.L[l.n] && bossOpen(l.n));
  const row = id => `<button class="row" data-open="${id}"><span class="sid st-${stateOf(id)}">${id}</span><span>${esc(S[id].t)}<small>${esc(TR[S[id].tr].name)} · nível ${S[id].lv} · ${esc(LV[S[id].lv].name)} · onda ${S[id].w}${S[id].kei.length ? ` · <span class="kei">◆ ${S[id].kei.map(esc).join(", ")}</span>` : ""}</small></span><span class="state">${itemsOf(id)}/${totalOf(id)}</span></button>`;
  const by = {}; openIds.forEach(id => (by[S[id].lv] = by[S[id].lv] || []).push(id));
  const lvls = Object.keys(by).map(Number).sort((a, b) => a - b);
  const pStarted = `<div class="panel"><h4>Em andamento (${startedIds.length})</h4><div class="list">${startedIds.map(row).join("")}</div></div>`;
  const pOpen = `<div class="panel"><h4>Liberados (${openIds.length})</h4>${startedIds.length ? "" : `<p style="margin:0;color:var(--ink-2);font-size:var(--fs-1)">Nada começado ainda. Abra um destes e marque o primeiro item do checkpoint.</p>`}${lvls.length ? lvls.map(L => `<div class="eyebrow" style="margin-top:4px">nível ${L} · ${esc(LV[L].name)}</div><div class="list">${by[L].map(row).join("")}</div>`).join("") : `<p class="empty">Tudo o que está liberado já foi começado.</p>`}</div>`;
  $("#now").innerHTML = `${startedIds.length ? pStarted : ""}${pOpen}
    ${bossReady.length ? `<div class="panel"><h4>Bosses de nível prontos</h4><div class="list">${bossReady.map(l => `<button class="row" data-golevel="${l.n}"><span class="jp">${l.n}</span><span>Boss do nível ${l.n}<small>todos os assuntos da faixa estão dominados</small></span><span class="state">⚔️</span></button>`).join("")}</div></div>` : ""}`;
}

/* ═════════ fontes ═════════ */
let srcType = "";
function buildSources() {
  const types = [...new Set(D.sources.map(s => s.ty))].sort();
  $("#src-eyebrow").textContent = `${D.meta.nsrc} fontes distintas · ${D.meta.nsrc - D.meta.nunv} conferidas · ${D.meta.nunv} com observação`;
  $("#src-chips").innerHTML = `<button class="chip" data-ty="" aria-pressed="true">todas</button>` + types.map(t => `<button class="chip" data-ty="${esc(t)}" aria-pressed="false">${esc(t)}</button>`).join("") + `<button class="chip" data-ty="__unv" aria-pressed="false">⚠ com observação</button>`;
  $("#src-chips").addEventListener("click", e => { const b = e.target.closest(".chip"); if (!b) return; srcType = b.dataset.ty; $$("#src-chips .chip").forEach(c => c.setAttribute("aria-pressed", String(c === b))); paintSources(); });
  let t = null;
  $("#sq").addEventListener("input", () => { clearTimeout(t); t = setTimeout(paintSources, 120); });
  paintSources();
}
function norm(s) { return String(s).normalize("NFD").replace(/[̀-ͯ]/g, "").toLowerCase(); }
const SRC_IDX = D.sources.map(s => norm(s.ti + " " + s.au + " " + s.in.join(" ") + " " + s.ty));
function paintSources() {
  const q = norm($("#sq").value.trim()), parts = q ? q.split(/\s+/) : [];
  const list = D.sources.filter((s, i) => (!srcType || (srcType === "__unv" ? !s.ok : s.ty === srcType)) && parts.every(p => SRC_IDX[i].includes(p)));
  const shown = list.slice(0, 300);
  $("#srclist").innerHTML = shown.map(s => `<div class="srow"><span aria-hidden="true">${s.ic}</span><div><a href="${esc(s.u)}" target="_blank" rel="noopener">${esc(s.ti)}</a><div class="au">${esc(s.au)} · ${esc(s.ty)}</div>${s.ok ? "" : `<div class="warn">⚠ não verificado — ${esc(s.why)}</div>`}<div class="in">${idChips(s.in)}</div></div></div>`).join("") +
    (list.length > shown.length ? `<p class="empty" style="margin-top:12px">Mostrando ${shown.length} de ${list.length}. Refine o filtro para ver o resto.</p>` : list.length ? "" : `<p class="empty">Nenhuma fonte com esse filtro.</p>`);
}

/* ═════════ progresso ═════════ */
function paintProgress() {
  const done = ORDER.filter(mastered).length, [g, t] = allItems(), lb = LV.filter(l => P.L[l.n]).length;
  const startedN = ORDER.filter(id => started(id) && !mastered(id)).length, openN = ORDER.filter(id => !started(id) && available(id)).length;
  $("#stats").innerHTML = `
    <div class="stat ${done ? "gold" : ""}"><b>${done}</b><span>dominados / ${ORDER.length}</span></div>
    <div class="stat"><b>${startedN}</b><span>em andamento</span></div>
    <div class="stat"><b>${openN}</b><span>liberados agora</span></div>
    <div class="stat ${lb ? "gold" : ""}"><b>${lb}</b><span>bosses de nível / ${LV.length}</span></div>
    <div class="stat ${g === t ? "gold" : ""}"><b>${(Math.round(1000 * g / t) / 10).toString().replace(".", ",")}%</b><span>${g}/${t} itens</span></div>`;
  $("#pb-levels").innerHTML = LV.map(l => { const [a, b] = levelItems(l.n); return `<div class="pbar"><span class="lbl"><span class="jp">${l.n}</span>${esc(l.name)}</span><span class="bar ${a === b ? "full" : ""}"><i style="width:${100 * a / b}%"></i></span><span class="n">${a}/${b}</span></div>`; }).join("");
  $("#pb-tracks").innerHTML = D.tracks.map(tr => { const ids = ORDER.filter(id => S[id].tr === tr.id); const a = ids.reduce((s, id) => s + itemsOf(id), 0), b = ids.reduce((s, id) => s + totalOf(id), 0); return `<div class="pbar"><span class="lbl"><span class="jp">${esc(tr.id)}</span>${esc(tr.name)}</span><span class="bar ${a === b ? "full" : ""}"><i style="width:${100 * a / b}%"></i></span><span class="n">${a}/${b}</span></div>`; }).join("");
}
function paintTop() {
  const done = ORDER.filter(mastered).length, [g, t] = allItems();
  $("#m-done").textContent = done; $("#m-items").textContent = `${g}/${t}`;
  $("#m-pct").textContent = (Math.round(1000 * g / t) / 10).toString().replace(".", ",") + "%";
  const bar = $("#m-bar"); bar.firstElementChild.style.width = (100 * g / t) + "%"; bar.classList.toggle("full", g === t);
}
function refresh() {
  gateCache = null;
  paintTop(); paintTree(); paintLevels();
  if (!$("#v-now").hidden) paintNow();
  if (!$("#v-progress").hidden) paintProgress();
  $$("input[data-sid]").forEach(cb => {
    const id = cb.dataset.sid, x = P.s[id] || { b: 0, c: [] };
    const on = cb.dataset.k === "b" ? !!x.b : !!(x.c && x.c[+cb.dataset.i]);
    cb.checked = on; cb.closest(".task").classList.toggle("on", on);
    cb.disabled = !canMark(id);
  });
  $$("[data-all]").forEach(b => { b.disabled = !canMark(b.dataset.all); });
  $$("[data-lock]").forEach(e => {
    const id = e.dataset.lock, lock = !canMark(id);
    e.hidden = !lock;
    if (lock) e.querySelector("ul").innerHTML = lockWhy(id).map(r => `<li>${r}</li>`).join("");
  });
  $$(".links a.sid, .in a.sid").forEach(e => { e.className = "sid st-" + stateOf(e.dataset.id); });
  $$("[data-path]").forEach(e => { e.textContent = pathLine(e.dataset.path); });
  if (openId) $("#dr-eye").textContent = eyeText(openId);
}

/* ═════════ exportar / importar ═════════ */
async function collectNotes() {
  const notes = {};
  if (PONTE) { try { const r = await pedir("lerNotas"); if (r && r.notas) Object.assign(notes, r.notas); } catch (e) {} }
  else LS.keys().forEach(k => { if (k && k.startsWith("o-mapa-note-")) { const v = LS.get(k); if (v) notes[k.slice(12)] = v; } });
  Object.entries(store.notes).forEach(([k, v]) => { if (v) notes[k] = v; });
  return notes;
}
async function doExport() {
  const data = JSON.stringify({ app: "o-mapa", v: 1, exportedAt: new Date().toISOString(), progress: P, notes: await collectNotes() }, null, 1);
  const nome = `o-mapa-progresso-${new Date().toISOString().slice(0, 10)}.json`;
  if (PONTE) {
    try { const r = await pedir("exportar", { texto: data, nome }); if (r && r.ok) toast("Progresso exportado."); return; }
    catch (e) { toast("Não consegui exportar pelo app: " + erroTxt(e)); }
  } else {
    try {
      const a = document.createElement("a");
      a.href = URL.createObjectURL(new Blob([data], { type: "application/json" })); a.download = nome;
      document.body.appendChild(a); a.click(); a.remove(); setTimeout(() => URL.revokeObjectURL(a.href), 4000);
      toast("Arquivo de progresso baixado."); return;
    } catch (e) {}
  }
  $("#dump").value = data; $("#dump-wrap").hidden = false; toast("Copie o texto abaixo para guardar.");
}
function importText(txt) {
  let o = null;
  try { o = JSON.parse(txt); } catch (e) { o = null; }
  if (!o || o.app !== "o-mapa" || !valid(o.progress)) { toast("Isso não é um progresso exportado por O MAPA."); return; }
  const n = Object.keys(o.progress.s).filter(k => S[k]).length;
  askConfirm(`Substituir o progresso atual pelo importado (${n} ${plural(n, "assunto registrado", "assuntos registrados")})?`, () => {
    const p = clone(o.progress);
    Object.keys(p.s).forEach(k => { if (!S[k]) delete p.s[k]; });
    P = { v: 1, s: p.s, L: p.L, at: 0 };
    touch(); refresh(); paintProgress();
    if (o.notes && typeof o.notes === "object") for (const [k, v] of Object.entries(o.notes)) if (S[k] && typeof v === "string") saveNote(k, v);
    toast("Progresso importado.");
  });
}
let pending = null;
function askConfirm(msg, fn) { pending = fn; $("#cf-msg").textContent = msg; $("#cf").hidden = false; $("#cf-yes").focus(); }
function wireProgress() {
  $("#exp").onclick = doExport;
  $("#imp").onchange = e => {
    const f = e.target.files && e.target.files[0]; if (!f) return;
    const rd = new FileReader();
    rd.onload = () => { importText(String(rd.result)); e.target.value = ""; };
    rd.onerror = () => toast("Não consegui ler esse arquivo. Tente colar o conteúdo ao lado.");
    rd.readAsText(f);
  };
  $("#paste-go").onclick = () => importText($("#paste").value);
  $("#rst").onclick = () => askConfirm("Zerar todo o progresso? As notas ficam.", () => { P = blank(); touch(); refresh(); paintProgress(); toast("Progresso zerado."); });
  $("#cf-yes").onclick = () => { const fn = pending; pending = null; $("#cf").hidden = true; if (fn) fn(); };
  $("#cf-no").onclick = () => { pending = null; $("#cf").hidden = true; };
  $("#dump-copy").onclick = async () => { const ta = $("#dump"); try { await navigator.clipboard.writeText(ta.value); toast("Copiado."); } catch (e) { ta.focus(); ta.select(); toast("Selecionado — copie com o atalho do sistema."); } };
}
let toastT = null;
function toast(m) { const t = $("#toast"); t.textContent = m; t.hidden = false; clearTimeout(toastT); toastT = setTimeout(() => (t.hidden = true), 2800); }

/* ═════════ busca ═════════ */
function wireSearch() {
  const q = $("#q"), res = $("#q-res");
  const idx = ORDER.map(id => ({ id, h: norm(id + " " + S[id].t + " " + S[id].en + " " + TR[S[id].tr].name) }));
  let sel = 0, hits = [];
  function show() {
    const v = norm(q.value.trim());
    if (!v) { res.hidden = true; return; }
    const parts = v.split(/\s+/);
    const exact = idx.filter(x => x.id.toLowerCase() === v).map(x => x.id);
    hits = exact.concat(idx.filter(x => !exact.includes(x.id) && parts.every(p => x.h.includes(p))).map(x => x.id)).slice(0, 14);
    sel = 0;
    res.innerHTML = hits.length
      ? hits.map((id, i) => `<button class="${i === 0 ? "on" : ""}" data-open="${id}"><span class="rid">${id}</span><span class="rt">${esc(S[id].t)}<small>${esc(TR[S[id].tr].name)} · nível ${S[id].lv} · ${STATE_TXT[stateOf(id)]}</small></span></button>`).join("")
      : `<p class="empty" style="margin:6px">Nada encontrado.</p>`;
    res.hidden = false;
  }
  q.addEventListener("input", show);
  q.addEventListener("focus", () => { if (q.value.trim()) show(); });
  q.addEventListener("keydown", e => {
    if (res.hidden) return;
    const bs = $$("button", res);
    if (e.key === "ArrowDown") { e.preventDefault(); sel = Math.min(bs.length - 1, sel + 1); }
    else if (e.key === "ArrowUp") { e.preventDefault(); sel = Math.max(0, sel - 1); }
    else if (e.key === "Enter") { e.preventDefault(); if (hits[sel]) { const id = hits[sel]; res.hidden = true; q.value = ""; q.blur(); openSubject(id); } return; }
    else if (e.key === "Escape") { res.hidden = true; return; }
    else return;
    bs.forEach((b, i) => b.classList.toggle("on", i === sel));
    if (bs[sel]) bs[sel].scrollIntoView({ block: "nearest" });
  });
  document.addEventListener("click", e => { if (!e.target.closest(".search")) res.hidden = true; });
  document.addEventListener("keydown", e => {
    if (e.key === "/" && !e.target.closest("input,textarea") && $("#drawer").hidden) { e.preventDefault(); q.focus(); q.select(); }
  });
}

/* ═════════ navegação ═════════ */
const VIEWS = ["tree", "levels", "now", "line", "sources", "progress"];
function showView(v) {
  if (!VIEWS.includes(v)) v = "tree";
  $$(".tab").forEach(t => t.setAttribute("aria-selected", String(t.dataset.view === v)));
  const at = $(`.tab[data-view="${v}"]`), tabs = $(".tabs");
  if (at && tabs) { const l = at.offsetLeft - tabs.offsetLeft, r = l + at.offsetWidth; if (l < tabs.scrollLeft || r > tabs.scrollLeft + tabs.clientWidth) tabs.scrollLeft = Math.max(0, l - 12); }
  $$(".view").forEach(s => (s.hidden = s.id !== "v-" + v));
  if (v === "now") paintNow();
  if (v === "progress") paintProgress();
  if (v === "tree") {
    requestAnimationFrame(() => {
      if (!treeInit) { treeInit = true; focusFrontier(); }
      else { const s = SW / vb.w, cx = vb.x + vb.w / 2, cy = vb.y + vb.h / 2; measure(); vb.w = SW / s; vb.h = SH / s; vb.x = cx - vb.w / 2; vb.y = cy - vb.h / 2; clampVB(); applyVB(); }
    });
  }
  LS.set("o-mapa-view", v);
}
function wireGlobal() {
  $$(".tab").forEach(t => (t.onclick = () => { showView(t.dataset.view); window.scrollTo({ top: 0 }); }));
  document.addEventListener("click", e => {
    const a = e.target.closest("a.ref, a.sid, [data-open]");
    if (a) {
      const id = a.dataset.id || a.dataset.open;
      if (S[id]) { e.preventDefault(); if (a.closest("#q-res")) { $("#q-res").hidden = true; $("#q").value = ""; } openSubject(id); return; }
    }
    const ext = e.target.closest('a[href^="http://"], a[href^="https://"]');
    if (ext && abrirFora(ext.href, ext.textContent.trim())) { e.preventDefault(); return; }
    const pasta = e.target.closest("[data-pasta]");
    if (pasta && PONTE) { const id = pasta.dataset.pasta; pedir("abrirPasta", { id, titulo: S[id].t }).catch(err => toast("Não consegui abrir a pasta: " + erroTxt(err))); return; }
    const all = e.target.closest("[data-all]");
    if (all) { const on = all.dataset.on === "1"; if (setAll(all.dataset.all, on)) toast(on ? `${all.dataset.all} marcado como dominado.` : `${all.dataset.all} desmarcado.`); return; }
    const go = e.target.closest("[data-go]");
    if (go) { e.preventDefault(); closeDrawer(); showView(go.dataset.go); window.scrollTo({ top: 0 }); return; }
    const gl = e.target.closest("[data-golevel]");
    if (gl) { showView("levels"); openLevel(+gl.dataset.golevel); }
  });
  document.addEventListener("change", e => {
    const cb = e.target;
    if (cb.matches("input[data-sid]")) toggle(cb.dataset.sid, cb.dataset.k, +cb.dataset.i, cb.checked);
    else if (cb.matches("input[data-level]")) toggleLevel(+cb.dataset.level, cb.checked);
  });
  document.addEventListener("input", e => { const ta = e.target; if (ta.matches && ta.matches("textarea[data-note]")) saveNote(ta.dataset.note, ta.value); });
  $("#dr-x").onclick = closeDrawer; $("#scrim").onclick = closeDrawer;
  $("#dr-prev").onclick = e => { const to = e.currentTarget.dataset.to; if (to) openSubject(to); };
  $("#dr-next").onclick = e => { const to = e.currentTarget.dataset.to; if (to) openSubject(to); };
  $("#dr-tree").onclick = () => { const id = openId; closeDrawer(); pinned = id; showView("tree"); requestAnimationFrame(() => { centerOn(id); paintTree(); $("#stage").scrollIntoView({ block: "center" }); }); };
  $("#salvar").onclick = () => { salvarAgora(); };
  if (PONTE) { const dp = $("#dr-pasta"); dp.hidden = false; dp.onclick = () => { if (openId) pedir("abrirPasta", { id: openId, titulo: S[openId].t }).catch(err => toast("Não consegui abrir a pasta: " + erroTxt(err))); }; }
  document.addEventListener("keydown", e => {
    if ((e.metaKey || e.ctrlKey) && !e.altKey && !e.shiftKey && (e.key === "s" || e.key === "S")) { e.preventDefault(); salvarAgora(); return; }
    if (e.key !== "Escape") return;
    if (!$("#cf").hidden) { pending = null; $("#cf").hidden = true; return; }
    if (!$("#drawer").hidden) { closeDrawer(); return; }
    if (pinned) { pinned = null; paintTree(); }
  });
  window.addEventListener("hashchange", () => { const h = decodeURIComponent((location.hash || "").slice(1)); if (S[h] && h !== openId) openSubject(h); });
}

/* ═════════ início ═════════ */
async function start() {
  await carregarProgresso();
  $("#m-total").textContent = ORDER.length;
  $("#brand-sub").textContent = `da aritmética à fronteira · ${ORDER.length} assuntos · ${D.meta.nsrc} fontes conferidas`;
  $("#final").innerHTML = D.final;
  buildTrackChips(); buildTree(); buildLevels(); buildSources(); wireProgress(); wireSearch(); wireGlobal();
  $("#tree-eyebrow").textContent = `${ORDER.length} assuntos · ${D.tracks.length} trilhas · ${LV.length} níveis · ${EDGES.length} dependências`;
  refresh();
  const v = LS.get("o-mapa-view") || "tree";
  showView(v);
  const h = decodeURIComponent((location.hash || "").slice(1));
  if (S[h]) openSubject(h);
  window.__mapa = { salvar: salvarAgora, exportar: doExport, testarYouTube, pendente: anyDirty };
}
start();
}
})();
