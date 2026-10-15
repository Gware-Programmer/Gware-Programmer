// Testes do núcleo/estado (registro de eventos → progresso). Uso: node --test app/testes/nucleo/
const test = require("node:test"), assert = require("node:assert/strict");
const E = require("../../UI/nucleo/estado.js");

let relogio = 1700000000000;
const ev = (tipo, dados, op = {}) => E.novoEvento(tipo, dados, { t: relogio++, tz: "America/Sao_Paulo", dev: "mac-a", ...op });

test("normalizar limpa valores e descarta o que não é progresso", () => {
  assert.deepEqual(E.normalizar(null), E.vazio());
  const n = E.normalizar({ s: { A: { b: true, c: [1, 0, "x", null] }, B: 5 }, L: { 0: 2 }, at: "12" });
  assert.deepEqual(n, { v: 1, s: { A: { b: 1, c: [1, 0, 1, 0] } }, L: { 0: 1 }, at: 12 });
  assert.equal(E.valido({ s: [], L: {} }), false);
});

test("marcar, marcar-tudo, nível-tudo, boss-nível e zerar", () => {
  const P = E.vazio();
  E.aplicar(P, ev("marcar", { id: "M01", k: "c", i: 2, v: 1 }));
  assert.deepEqual(P.s.M01, { b: 0, c: [0, 0, 1] });
  E.aplicar(P, ev("marcar", { id: "M01", k: "b", v: true }));
  assert.equal(P.s.M01.b, 1);
  E.aplicar(P, ev("marcar", { id: "M01", k: "c", i: 5000, v: 1 }));  // índice absurdo: ignorado
  assert.equal(P.s.M01.c.length, 3);
  E.aplicar(P, ev("marcar-tudo", { id: "M02", v: 1, n: 4 }));
  assert.deepEqual(P.s.M02, { b: 1, c: [1, 1, 1, 1] });
  E.aplicar(P, ev("marcar-tudo", { id: "M02", v: 0, n: 2 }));    // nunca encolhe a lista
  assert.deepEqual(P.s.M02, { b: 0, c: [0, 0, 0, 0] });
  E.aplicar(P, ev("nivel-tudo", { n: 0, assuntos: { C13: 3, M03: 2 } }));
  assert.deepEqual(P.s.C13, { b: 1, c: [1, 1, 1] });
  E.aplicar(P, ev("boss-nivel", { n: 0, v: 1 }));
  assert.equal(P.L["0"], 1);
  assert.ok(P.at >= 1700000000000);
  E.aplicar(P, ev("zerar", {}));
  assert.deepEqual([P.s, P.L], [{}, {}]);
});

test("eventos de outros tipos não mexem no progresso", () => {
  const P = E.vazio();
  E.aplicar(P, ev("visita", { id: "M01" }));
  E.aplicar(P, null);
  assert.deepEqual(P, E.vazio());
});

test("importar substitui; juntar une pelo maior valor", () => {
  const P = E.vazio();
  E.aplicar(P, ev("marcar", { id: "X", k: "b", v: 1 }));
  E.aplicar(P, ev("importar", { progresso: { s: { A: { b: 0, c: [1] } }, L: {} } }));
  assert.deepEqual(P.s, { A: { b: 0, c: [1] } });
  E.aplicar(P, ev("juntar", { progresso: { s: { A: { b: 1, c: [0, 1] }, B: { b: 0, c: [] } }, L: { 1: 1 } } }));
  assert.deepEqual(P.s, { A: { b: 1, c: [1, 1] }, B: { b: 0, c: [] } });
  assert.equal(P.L["1"], 1);
});

test("repassar ordena por id e ignora repetidos", () => {
  const a = ev("marcar", { id: "A", k: "b", v: 1 });
  const b = ev("marcar", { id: "A", k: "b", v: 0 });
  assert.equal(E.repassar([b, a, a]).s.A.b, 0);            // b é mais novo: vale b
  assert.equal(E.repassar([a]).s.A.b, 1);
  assert.equal(E.ordenar([b, a, b, { x: 1 }]).length, 2);
});

test("dois Macs: unir os registros dá o mesmo resultado em qualquer ordem", () => {
  const x = [ev("marcar", { id: "A", k: "c", i: 0, v: 1 }, { dev: "mac-a" }), ev("marcar", { id: "B", k: "b", v: 1 }, { dev: "mac-a" })];
  const y = [ev("marcar", { id: "C", k: "b", v: 1 }, { dev: "mac-b" })];
  assert.deepEqual(E.repassar([...x, ...y]), E.repassar([...y, ...x, ...y]));
});

test("corrente por dispositivo: confere e aponta elo quebrado", () => {
  const e1 = ev("marcar", { id: "A", k: "b", v: 1 });
  const e2 = ev("marcar", { id: "B", k: "b", v: 1 }, { ant: e1.h });
  const f1 = ev("marcar", { id: "C", k: "b", v: 1 }, { dev: "mac-b" });
  let r = E.conferir([e1, e2, f1]);
  assert.equal(r.ok, true);
  assert.equal(r.dispositivos, 2);
  assert.equal(r.ultimo["mac-a"], e2.h);
  const adulterado = { ...e2, dados: { id: "B", k: "b", v: 0 } };
  r = E.conferir([e1, adulterado]);
  assert.equal(r.ok, false);
  assert.equal(r.quebrados[0].id, e2.id);
  const semElo = ev("marcar", { id: "D", k: "b", v: 1 }, { ant: "outro" });
  r = E.conferir([e1, semElo]);
  assert.match(r.quebrados[0].motivo, /elo/);
});

test("ler linhas conta o que não é evento", () => {
  const e1 = ev("marcar", { id: "A", k: "b", v: 1 });
  const r = E.lerLinhas([JSON.stringify(e1), "", "{quebrado", '{"x":1}', "  "]);
  assert.equal(r.eventos.length, 1);
  assert.equal(r.invalidas, 2);
});

test("fotografia: carimbo detecta edição por fora", () => {
  const P = E.repassar([ev("marcar", { id: "A", k: "b", v: 1 })]);
  const f = E.fotografia(P, "01ID");
  assert.equal(f.log, "01ID");
  assert.equal(E.fotografiaDeFora(f), false);
  assert.equal(E.fotografiaDeFora({ ...f, s: { A: { b: 0, c: [] } } }), true);
  assert.equal(E.fotografiaDeFora({ v: 1, s: {}, L: {} }), true);  // versão antiga, sem carimbo
  assert.equal(E.fotografiaDeFora("lixo"), false);
});

test("contem", () => {
  const a = { s: { A: { b: 1, c: [1, 1] } }, L: { 0: 1 } };
  assert.equal(E.contem(a, { s: { A: { b: 1, c: [1] } }, L: {} }), true);
  assert.equal(E.contem(a, { s: { B: { b: 1, c: [] } }, L: {} }), false);
  assert.equal(E.contem(a, { s: {}, L: { 1: 1 } }), false);
});

test("hash do evento é estável e muda com o conteúdo", () => {
  const e = ev("marcar", { id: "A", k: "b", v: 1 });
  assert.equal(E.hashDoEvento(e), e.h);
  assert.notEqual(E.hashDoEvento({ ...e, t: e.t + 1 }), e.h);
});
