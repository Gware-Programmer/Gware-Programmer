// Testes do núcleo/base. Uso: node --test app/testes/nucleo/
const test = require("node:test"), assert = require("node:assert/strict");
const B = require("../../UI/nucleo/base.js");

test("impressão FNV-1a igual à do app de Mac", () => {
  assert.equal(B.impressao(""), "cbf29ce484222325-0");
  assert.equal(B.impressao("a"), "af63dc4c8601ec8c-1");
  // o tamanho é em bytes UTF-8, não em caracteres
  assert.match(B.impressao("é"), /^[0-9a-f]{16}-2$/);
  assert.notEqual(B.impressao("ab"), B.impressao("ba"));
});

test("JSON canônico ordena chaves e mantém arrays", () => {
  assert.equal(B.canonico({ b: 1, a: [3, { d: 1, c: 2 }] }), '{"a":[3,{"c":2,"d":1}],"b":1}');
  assert.equal(B.canonico({ a: undefined, b: null }), '{"b":null}');
  assert.equal(B.canonico(NaN), "null");
  assert.equal(B.canonico({ x: 1, y: 2 }), B.canonico({ y: 2, x: 1 }));
});

test("ULID: formato, tempo e ordem", () => {
  const id = B.ulid(1700000000000);
  assert.match(id, /^[0-9A-HJKMNP-TV-Z]{26}$/);
  assert.equal(B.tempoDoUlid(id), 1700000000000);
  assert.ok(B.ulid(1700000000001) > id);
  assert.ok(Number.isNaN(B.tempoDoUlid("!!!")));
  assert.throws(() => B.ulid(-1), RangeError);
});

test("ULID monotônico no mesmo milissegundo", () => {
  const ids = Array.from({ length: 500 }, () => B.ulid(1700000000123));
  for (let i = 1; i < ids.length; i++) assert.ok(ids[i] > ids[i - 1], `ids[${i}] fora de ordem`);
  assert.equal(new Set(ids).size, ids.length);
});
