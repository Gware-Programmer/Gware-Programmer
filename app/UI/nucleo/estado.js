/* O MAPA · núcleo/estado — o progresso como consequência de um registro de eventos.

   Cada ação vira um evento (uma linha de progresso/eventos.kei). O progresso é o resultado
   de repassar todos os eventos, em ordem de ULID (tempo), com o redutor abaixo. Assim:
   - nada se perde: o registro só cresce;
   - dois Macs se juntam sem conflito: basta unir os eventos pelo id;
   - dá para responder "o que mudou e quando" (linha do tempo, alavancas, Sábio, missões).

   Formato de um evento:
     { id: ULID, t: ms, tz: "America/Sao_Paulo", dev: "dispositivo", tipo, dados, ant, h }
   - `ant` é a impressão (h) do evento anterior do MESMO dispositivo ("" no primeiro);
   - `h` = impressão(ant + JSON canônico de {id, t, tz, dev, tipo, dados}).
   Cada dispositivo forma uma corrente; `conferir` aponta elos quebrados sem descartar nada.

   Eventos que mudam o progresso (os demais são só registro):
     importar   { progresso }            substitui tudo pelo progresso dado
     juntar     { progresso }            une (maior valor) com o progresso dado
     marcar     { id, k:"b"|"c", i, v }  boss (k="b") ou item i do checkpoint (k="c")
     marcar-tudo{ id, v, n }             boss + n itens do checkpoint = v
     nivel-tudo { n, assuntos:{id:nItens} }  todos os assuntos do nível dominados
     boss-nivel { n, v }                 boss do nível n
     zerar      {}                       apaga todas as marcações */
(function (raiz) {
  "use strict";
  const base = typeof module === "object" && module.exports ? require("./base.js") : raiz.Nucleo.base;

  const TIPOS_DE_PROGRESSO = new Set(["importar", "juntar", "marcar", "marcar-tudo", "nivel-tudo", "boss-nivel", "zerar"]);

  function vazio() { return { v: 1, s: {}, L: {}, at: 0 }; }
  function valido(o) { return !!o && typeof o === "object" && !!o.s && typeof o.s === "object" && !Array.isArray(o.s) && !!o.L && typeof o.L === "object" && !Array.isArray(o.L); }
  const bit = x => (x ? 1 : 0);

  /** Cópia limpa de um progresso: cada assunto {b:0|1, c:[0|1…]}, cada boss de nível 0|1. */
  function normalizar(p) {
    const r = vazio();
    if (!valido(p)) return r;
    for (const [id, e] of Object.entries(p.s)) {
      if (!e || typeof e !== "object") continue;
      r.s[id] = { b: bit(e.b), c: Array.isArray(e.c) ? e.c.map(bit) : [] };
    }
    for (const [n, v] of Object.entries(p.L)) r.L[n] = bit(v);
    r.at = Number.isFinite(+p.at) ? +p.at : 0;
    return r;
  }

  function entrada(P, id) {
    let e = P.s[id];
    if (!e || typeof e !== "object") e = P.s[id] = { b: 0, c: [] };
    if (!Array.isArray(e.c)) e.c = [];
    return e;
  }

  /** Une b em a (maior valor em cada marcação). Devolve se b acrescentou algo. */
  function juntarEm(a, b) {
    let mudou = false;
    const nb = normalizar(b);
    for (const [id, eb] of Object.entries(nb.s)) {
      const ea = entrada(a, id);
      if (eb.b > bit(ea.b)) mudou = true;
      ea.b = Math.max(bit(ea.b), eb.b);
      const n = Math.max(ea.c.length, eb.c.length);
      for (let i = 0; i < n; i++) {
        const x = bit(ea.c[i]), y = eb.c[i] || 0;
        if (y > x) mudou = true;
        ea.c[i] = Math.max(x, y);
      }
    }
    for (const [k, v] of Object.entries(nb.L)) {
      if (v > bit(a.L[k])) mudou = true;
      a.L[k] = Math.max(bit(a.L[k]), v);
    }
    a.at = Math.max(+a.at || 0, nb.at);
    return mudou;
  }

  /** Aplica um evento ao progresso P (mutando P). Eventos de outros tipos são ignorados. */
  function aplicar(P, ev) {
    if (!ev || typeof ev !== "object") return P;
    const d = ev.dados && typeof ev.dados === "object" ? ev.dados : {};
    switch (ev.tipo) {
      case "importar": {
        const n = normalizar(d.progresso);
        P.s = n.s; P.L = n.L;
        break;
      }
      case "juntar": juntarEm(P, d.progresso); break;
      case "marcar": {
        if (typeof d.id !== "string") break;
        const e = entrada(P, d.id);
        if (d.k === "b") e.b = bit(d.v);
        else if (d.k === "c" && Number.isInteger(d.i) && d.i >= 0 && d.i < 1000) {
          while (e.c.length <= d.i) e.c.push(0);
          e.c[d.i] = bit(d.v);
        }
        break;
      }
      case "marcar-tudo": {
        if (typeof d.id !== "string") break;
        const e = entrada(P, d.id), n = Math.max(Number.isInteger(d.n) && d.n >= 0 && d.n < 1000 ? d.n : 0, e.c.length);
        e.b = bit(d.v);
        e.c = Array.from({ length: n }, () => bit(d.v));
        break;
      }
      case "nivel-tudo": {
        const a = d.assuntos && typeof d.assuntos === "object" ? d.assuntos : {};
        for (const [id, n] of Object.entries(a)) {
          const e = entrada(P, id), m = Math.max(Number.isInteger(n) && n >= 0 && n < 1000 ? n : 0, e.c.length);
          e.b = 1;
          e.c = Array.from({ length: m }, () => 1);
        }
        break;
      }
      case "boss-nivel":
        if (d.n !== undefined && d.n !== null) P.L[String(d.n)] = bit(d.v);
        break;
      case "zerar": P.s = {}; P.L = {}; break;
      default: return P;
    }
    if (Number.isFinite(ev.t)) P.at = Math.max(+P.at || 0, ev.t);
    return P;
  }

  /** Ordena por id (ULID: tempo, depois aleatoriedade) e remove repetidos. */
  function ordenar(eventos) {
    const vistos = new Map();
    for (const ev of eventos) if (ev && typeof ev.id === "string" && !vistos.has(ev.id)) vistos.set(ev.id, ev);
    return [...vistos.values()].sort((a, b) => (a.id < b.id ? -1 : a.id > b.id ? 1 : 0));
  }

  /** O progresso resultante de todos os eventos. */
  function repassar(eventos) {
    const P = vazio();
    for (const ev of ordenar(eventos)) aplicar(P, ev);
    return P;
  }

  function corpoDoEvento(ev) { return base.canonico({ id: ev.id, t: ev.t, tz: ev.tz, dev: ev.dev, tipo: ev.tipo, dados: ev.dados }); }
  function hashDoEvento(ev) { return base.impressao((ev.ant || "") + corpoDoEvento(ev)); }

  /** Cria um evento encadeado ao anterior do mesmo dispositivo. */
  function novoEvento(tipo, dados, op) {
    op = op || {};
    const t = Number.isFinite(op.t) ? Math.floor(op.t) : Date.now();
    let tz = op.tz;
    if (!tz) { try { tz = Intl.DateTimeFormat().resolvedOptions().timeZone; } catch (e) { tz = "UTC"; } }
    const ev = { id: op.id || base.ulid(t), t, tz, dev: op.dev || "?", tipo: String(tipo), dados: dados === undefined ? {} : JSON.parse(JSON.stringify(dados)), ant: op.ant || "" };
    ev.h = hashDoEvento(ev);
    return ev;
  }

  /** Confere as correntes por dispositivo. Nada é descartado: só aponta o que está quebrado. */
  function conferir(eventos) {
    const porDev = {};
    for (const ev of ordenar(eventos)) (porDev[ev.dev] = porDev[ev.dev] || []).push(ev);
    const quebrados = [];
    for (const lista of Object.values(porDev)) {
      let ant = "";
      for (const ev of lista) {
        const certo = ev.h === hashDoEvento(ev);
        const elo = (ev.ant || "") === ant;
        if (!certo || !elo) quebrados.push({ id: ev.id, dev: ev.dev, motivo: !certo ? "conteúdo não confere com a impressão" : "elo com o evento anterior não confere" });
        ant = ev.h;
      }
    }
    const ultimo = {};
    for (const [dev, lista] of Object.entries(porDev)) ultimo[dev] = lista[lista.length - 1].h;
    return { ok: quebrados.length === 0, quebrados, dispositivos: Object.keys(porDev).length, ultimo };
  }

  /** Lê linhas de eventos (texto JSON Lines). Linhas que não são eventos são contadas, não aplicadas. */
  function lerLinhas(linhas) {
    const eventos = [];
    let invalidas = 0;
    for (const linha of linhas) {
      const l = String(linha).trim();
      if (!l) continue;
      try {
        const ev = JSON.parse(l);
        if (ev && typeof ev.id === "string" && typeof ev.tipo === "string") eventos.push(ev); else invalidas++;
      } catch (e) { invalidas++; }
    }
    return { eventos, invalidas };
  }

  /** Impressão do estado (só assuntos e bosses), para saber se uma fotografia foi editada por fora. */
  function carimbo(P) { const n = normalizar(P); return base.impressao(base.canonico({ s: n.s, L: n.L })); }

  /** Verdadeiro se todas as marcações de `b` já estão em `a`. */
  function contem(a, b) { const x = normalizar(a); return !juntarEm(x, b); }

  /** Fotografia para progresso.json: o progresso + o último evento aplicado + o carimbo do estado. */
  function fotografia(P, ultimoId) {
    const n = normalizar(P);
    return { v: 1, s: n.s, L: n.L, at: n.at, log: ultimoId || null, est: carimbo(n) };
  }

  /** A fotografia foi editada por fora do app (ou veio de uma versão sem registro)? */
  function fotografiaDeFora(f) {
    if (!valido(f)) return false;
    return typeof f.est !== "string" || f.est !== carimbo(f);
  }

  const M = { vazio, valido, normalizar, juntarEm, aplicar, ordenar, repassar, novoEvento, conferir, lerLinhas, carimbo, contem, fotografia, fotografiaDeFora, hashDoEvento, TIPOS_DE_PROGRESSO };
  if (typeof module === "object" && module.exports) module.exports = M;
  else (raiz.Nucleo = raiz.Nucleo || {}).estado = M;
})(typeof window !== "undefined" ? window : globalThis);
