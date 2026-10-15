# M01 — Arithmetic: natural numbers and integers

*Aritmética: números naturais e inteiros*

- **Trilha:** Mathematics
- **Nível:** 0 — Fundamentos · onda 1
- **Termos:** arithmetic, integers, divisibility, primes
- **Projetos KEIROS:** REIXU

## Por que importa

Tudo o que uma IA faz é aritmética em escala: cada token de um LLM sai de bilhões de multiplicações e somas. Inteiros, divisibilidade e aritmética modular são o chão de tudo — inclusive de hashing, criptografia e da representação binária que o seu compilador ARM64 já manipula.

## Pré-requisitos

- **Depende de:** —
- **Destrava:** M02 (Fractions, decimals, ratio, proportion and percentage), M05 (Logic, sets and the language of mathematics), C14 (C and systems programming: memory, pointers and concurrency)

## Base

1. Sistema posicional (place value): o valor de um dígito depende da posição; bases 10, 2 e 16 — n = d₂·10·10 + d₁·10 + d₀.
2. As quatro operações com naturais e os algoritmos escolares (soma com "vai um", divisão longa — long division) — e por que cada passo funciona.
3. Propriedades: comutativa, associativa, distributiva, elementos neutros; ordem de precedência das operações.
4. Inteiros negativos: reta numérica, valor absoluto, regras de sinal.
5. Divisibilidade: múltiplos, divisores, critérios de divisibilidade, números primos, crivo de Eratóstenes (sieve of Eratosthenes).
6. Teorema fundamental da aritmética (fatoração única em primos); MDC (gcd) e MMC (lcm); algoritmo de Euclides.
7. Divisão euclidiana a = b·q + r com 0 ≤ r < b; resto e congruência módulo n (modular arithmetic).

## Meio

- Aritmética modular: soma e produto mod n, inverso modular, identidade de Bézout (o MDC como combinação linear) e algoritmo de Euclides estendido.
- Inteiros na máquina: sem sinal, complemento de dois (two's complement), overflow como aritmética mod 2^w — o que ADD, SUB, SDIV, UDIV e MSUB do ARM64 realmente calculam.
- Por que existem infinitos primos (prova de Euclides, por enquanto como leitura).

## Avançado

- Estrutura algébrica: ℤ como anel (ring), ℤ/nℤ, e o corpo finito 𝔽_p quando p é primo — base de RSA, códigos corretores de erro e funções de hash → M40.
- Custo do algoritmo de Euclides: o número de passos cresce como o logaritmo dos números, com pior caso em números de Fibonacci consecutivos (teorema de Lamé).
- Axiomas de Peano: definir os naturais e a soma por recursão — a ponte para indução → M06 e para provas verificadas por máquina → P09.

## Matemática necessária

Nenhuma matemática anterior: este é o chão.

## Métodos

- Refaça cada algoritmo à mão e depois implemente em C ou REIXU sem bibliotecas, testando contra o `int` de precisão arbitrária do Python.
- Para cada propriedade, procure um caso em que ela falha (subtração não é comutativa; divisão inteira não é associativa).
- Faça os exercícios do Portal da OBMEP até acertar sem olhar a resolução; volume de exercício é o que fecha lacunas antigas.

## Desafios

- Quem volta à matemática adulto trava por vergonha das lacunas, não por incapacidade: a cura é refazer do início sem pular etapas.
- Confundir "a divide b" (a | b, uma afirmação) com "a dividido por b" (a/b, um número).
- Regras de sinal decoradas sem entender a distributiva — quebram na primeira expressão longa.
- Resto de negativos: em matemática o resto é sempre ≥ 0; em C `%` trunca para zero (−7 % 3 = −1) e em Python segue o sinal do divisor (−7 % 3 = 2). Bug clássico em hashing e indexação circular.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Números naturais: representação e operações básicas](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=196) — IMPA/OBMEP · curso. comece aqui: videoaulas curtas, apostila e exercícios com gabarito
- 🎓 [Portal da Matemática OBMEP — Divisibilidade](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=23) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Algoritmo de Euclides estendido, relação de Bézout e equações diofantinas](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=55) — IMPA/OBMEP · curso. para o MEIO
- 📖 [Basic Mathematics](https://doi.org/10.1007/978-1-4612-1027-6) — Serge Lang, 1988 · livro. escrito para quem precisa refazer a base com rigor; caps. 1–2
- 📖 [Prealgebra 2e](https://openstax.org/details/books/prealgebra-2e) — Marecek, Anthony-Smith & Mathis (OpenStax), 2020 · livro. gratuito; enorme volume de exercícios com respostas

## Boss fight

Implemente em C ou REIXU uma biblioteca de inteiros de precisão arbitrária (bigint): soma, subtração, multiplicação, divisão com resto, MDC por Euclides e inverso modular por Euclides estendido. Valide com 100 mil casos aleatórios contra o `int` do Python. Feche com uma página explicando por que o algoritmo de Euclides termina e por que o resto de −7 por 3 é 2 na matemática e −1 em C.

## Checkpoint

- [ ] Calcule MDC(1071, 462) à mão e escreva-o como combinação 1071x + 462y.
- [ ] Por que a fatoração em primos é única, e por que 1 não é primo?
- [ ] Explique por que (−a)·(−b) = a·b usando apenas a propriedade distributiva.
- [ ] Em 8 bits com complemento de dois, quanto é 127 + 1? Que estrutura matemática explica o resultado?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
