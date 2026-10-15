# M11 — Complex numbers and Euler's formula

*Números complexos e a fórmula de Euler*

- **Trilha:** Mathematics
- **Nível:** 2 — O motor · onda 2
- **Termos:** complex numbers, Euler's formula, phasors
- **Projetos KEIROS:** REIXU

## Por que importa

Os complexos transformam rotações e oscilações em álgebra simples: e^{iθ} = cos θ + i·sen θ. São indispensáveis para Fourier, para autovalores de sistemas dinâmicos (oscilação ↔ autovalor complexo), para sinais neurais e para entender a RoPE.

## Pré-requisitos

- **Depende de:** M09 (Exponentials and logarithms), M10 (Trigonometry)
- **Destrava:** M15 (Integral calculus and Taylor series), M18 (Linear algebra II: determinants, eigenvalues and the spectral theorem)

## Base

1. A unidade imaginária i (i² = −1); forma algébrica a + bi e operações.
2. Conjugado, módulo e divisão de complexos.
3. Plano complexo (plano de Argand-Gauss) e forma polar r(cos θ + i·sen θ).
4. Multiplicar = multiplicar módulos e somar ângulos (escala + rotação).
5. Fórmula de De Moivre; raízes n-ésimas da unidade.
6. Fórmula de Euler e^{iθ} = cos θ + i·sen θ, como definição motivada (a prova por séries vem em → M15).

## Meio

- Polinômios com coeficientes complexos; teorema fundamental da álgebra (enunciado) **M07**.
- Fasores (phasors): senoides como complexos girando; somar oscilações somando fasores.
- Raízes da unidade como base da transformada discreta de Fourier → M31.

## Avançado

- Autovalores complexos de matrizes reais ↔ rotações e oscilações em sistemas dinâmicos → M18→ M28.
- RoPE: posições como rotações e^{imθ} em pares de dimensões, de modo que o produto escalar dependa só da posição relativa → L13.
- Análise complexa (funções holomorfas), leitura opcional para quem for fundo em sinais e física.

## Matemática necessária

**M09**: exponencial; **M10**: trigonometria e radianos; **M07**: polinômios.

## Métodos

- Desenhe cada operação no plano: multiplicar por i é girar 90°.
- Implemente um tipo complexo e use-o para gerar e desenhar as raízes da unidade.
- Use e^{iθ} para derivar as fórmulas de adição de **M10** em duas linhas.

## Desafios

- "Imaginário" sugere "não existe": complexos são pares de reais com uma multiplicação específica, tão legítimos quanto os negativos.
- Argumento multivalorado (θ vs. θ + 2πk) e as várias raízes n-ésimas.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Números complexos: forma algébrica](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=83) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Números complexos: forma geométrica](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=86) — IMPA/OBMEP · curso
- 📖 [Visual Complex Analysis](https://doi.org/10.1093/oso/9780198534471.001.0001) — Tristan Needham, 1997 (edição comemorativa, 2023) · livro. caps. 1–2: a melhor intuição geométrica que existe
- 📖 [Precalculus 2e](https://openstax.org/details/books/precalculus-2e) — Jay Abramson et al. (OpenStax), 2021 · livro. seção sobre forma polar dos complexos

## Boss fight

Implemente números complexos em C ou REIXU e use-os para: (1) gerar e desenhar as raízes n-ésimas da unidade; (2) verificar numericamente e depois provar algebricamente as fórmulas de adição via e^{iθ}; (3) somar três senoides de mesma frequência e fases diferentes como fasores e conferir contra a soma ponto a ponto no tempo.

## Checkpoint

- [ ] Calcule (1 + i)⁸ pela forma polar.
- [ ] Ache as três raízes cúbicas de 8 e desenhe-as.
- [ ] Por que multiplicar por e^{iθ} gira um ponto pelo ângulo θ?
- [ ] Deduza sen(a + b) a partir de e^{i(a+b)} = e^{ia}·e^{ib}.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
