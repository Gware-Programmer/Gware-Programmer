/* O MAPA · núcleo/base — utilidades puras usadas por todos os módulos do núcleo.
   - impressão FNV-1a de 64 bits (mesmo formato do app: 16 dígitos hex + "-" + tamanho em bytes);
   - JSON canônico (chaves em ordem), para que a mesma informação tenha sempre a mesma impressão;
   - ULID (identificador ordenável por tempo) monotônico.
   Funciona no navegador (window.Nucleo.base) e no Node (require). */
(function (raiz) {
  "use strict";

  const FNV_INICIO = 0xcbf29ce484222325n, FNV_PRIMO = 0x100000001b3n, MASCARA = 0xffffffffffffffffn;
  const codificador = typeof TextEncoder !== "undefined" ? new TextEncoder() : null;

  function bytes(texto) {
    if (codificador) return codificador.encode(String(texto));
    return Uint8Array.from(Buffer.from(String(texto), "utf8"));
  }

  /** Impressão FNV-1a 64 bits de um texto: "cbf29ce484222325-0" para o vazio. */
  function impressao(texto) {
    const b = bytes(texto);
    let h = FNV_INICIO;
    for (let i = 0; i < b.length; i++) {
      h ^= BigInt(b[i]);
      h = (h * FNV_PRIMO) & MASCARA;
    }
    return h.toString(16).padStart(16, "0") + "-" + b.length;
  }

  /** JSON com as chaves dos objetos em ordem alfabética (arrays mantêm a ordem). */
  function canonico(valor) {
    if (valor === null || typeof valor !== "object") {
      if (typeof valor === "number" && !Number.isFinite(valor)) return "null";
      return JSON.stringify(valor === undefined ? null : valor);
    }
    if (Array.isArray(valor)) return "[" + valor.map(canonico).join(",") + "]";
    const chaves = Object.keys(valor).filter(k => valor[k] !== undefined).sort();
    return "{" + chaves.map(k => JSON.stringify(k) + ":" + canonico(valor[k])).join(",") + "}";
  }

  const B32 = "0123456789ABCDEFGHJKMNPQRSTVWXYZ";
  let ultimoT = -1, ultimoAleatorio = null;

  function aleatorios(n) {
    const a = new Uint8Array(n);
    const c = typeof crypto !== "undefined" && crypto.getRandomValues ? crypto : (typeof require === "function" ? require("crypto").webcrypto : null);
    if (c) c.getRandomValues(a); else for (let i = 0; i < n; i++) a[i] = Math.floor(Math.random() * 256);
    return a;
  }

  /** ULID: 10 caracteres de tempo (ms) + 16 de aleatoriedade, em base32 de Crockford.
      No mesmo milissegundo, a parte aleatória é incrementada (monotônico). */
  function ulid(t) {
    t = Math.floor(t === undefined ? Date.now() : t);
    if (!(t >= 0) || t > 281474976710655) throw new RangeError("tempo fora do intervalo do ULID");
    let r;
    if (t === ultimoT && ultimoAleatorio) {
      r = ultimoAleatorio.slice();
      for (let i = r.length - 1; i >= 0; i--) { if (r[i] < 255) { r[i]++; break; } r[i] = 0; }
    } else {
      r = aleatorios(10);
    }
    ultimoT = t; ultimoAleatorio = r;
    let tempo = "", x = t;
    for (let i = 0; i < 10; i++) { tempo = B32[x % 32] + tempo; x = Math.floor(x / 32); }
    let bits = 0n;
    for (const b of r) bits = (bits << 8n) | BigInt(b);
    let resto = "";
    for (let i = 0; i < 16; i++) { resto = B32[Number(bits & 31n)] + resto; bits >>= 5n; }
    return tempo + resto;
  }

  /** O instante (ms) gravado num ULID. */
  function tempoDoUlid(id) {
    let t = 0;
    for (let i = 0; i < 10; i++) {
      const v = B32.indexOf(String(id)[i]);
      if (v < 0) return NaN;
      t = t * 32 + v;
    }
    return t;
  }

  const M = { impressao, canonico, ulid, tempoDoUlid };
  if (typeof module === "object" && module.exports) module.exports = M;
  else (raiz.Nucleo = raiz.Nucleo || {}).base = M;
})(typeof window !== "undefined" ? window : globalThis);
