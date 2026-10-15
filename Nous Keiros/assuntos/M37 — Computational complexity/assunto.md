# M37 — Computational complexity

*Complexidade computacional*

- **Trilha:** Mathematics
- **Nível:** 3 — Cálculo e incerteza · onda 2
- **Termos:** computational complexity, P vs NP, reductions, circuit complexity

## Por que importa

Saber que algo é computável não basta: é preciso saber se é tratável. P vs. NP, reduções e classes de circuitos explicam por que planejamento clássico, inferência bayesiana exata e o cálculo exato de Φ são intratáveis — e por que transformers precisam de chain-of-thought para certos problemas.

## Pré-requisitos

- **Depende de:** M22 (Probability: events, conditioning and Bayes), M36 (Theory of computation: automata, grammars and computability), C15 (Algorithms and data structures)
- **Destrava:** S11 (Substrate, causation and computation)

Novo pré-requisito: **C15** — complexidade parte da análise de algoritmos.

## Base

1. Tempo e espaço; classes P e NP; certificados.
2. Reduções polinomiais; NP-completude; teorema de Cook–Levin (SAT).
3. Problemas NP-completos clássicos (3-SAT, clique, caixeiro-viajante na versão de decisão).
4. coNP, PSPACE, EXPTIME e hierarquias.
5. Algoritmos aleatorizados: BPP e RP **M22**.
6. Aproximação e inaproximabilidade (noção).

## Meio

- Complexidade de circuitos: AC⁰, TC⁰, NC¹.
- #P e contagem: a dificuldade da inferência exata em modelos gráficos.
- Complexidade parametrizada e por que solvers SAT funcionam tão bem na prática.

## Avançado

- Transformers de precisão logarítmica estão em TC⁰ uniforme (Merrill & Sabharwal); chain-of-thought aumenta o poder expressivo → L25.
- Complexidade e filosofia (Aaronson): por que custo computacional importa para debates sobre mente, aprendizado e consciência.
- O custo do Φ e das medidas inspiradas na IIT: o que é inviável computacionalmente vs. o que é conceitualmente mal definido → S04.

## Matemática necessária

**M36**: máquinas de Turing e reduções; **M22**: probabilidade.

## Métodos

- Arora & Barak (rascunho gratuito) com provas; a segunda metade do 18.404J em vídeo.
- Implemente reduções concretas (3-SAT → clique) e um solver DPLL/CDCL; meça a transição de fase do 3-SAT aleatório.

## Desafios

- "NP = não polinomial": errado — é polinomial não determinístico.
- Confundir pior caso com caso típico.
- Usar "NP-difícil" como desculpa: aproximações e heurísticas com garantias existem.

## Fontes

- 📖 [Computational Complexity: A Modern Approach](https://theory.cs.princeton.edu/complexity/) — Sanjeev Arora & Boaz Barak, 2009 · livro. rascunho gratuito dos autores
- 🎓 [Theory of Computation (18.404J)](https://ocw.mit.edu/courses/18-404j-theory-of-computation-fall-2020/) — Michael Sipser (MIT OpenCourseWare), 2020 · curso. segunda metade
- 📄 [Why Philosophers Should Care About Computational Complexity](https://arxiv.org/abs/1108.1791) — Scott Aaronson, 2011 · paper
- 📄 [The Parallelism Tradeoff: Limitations of Log-Precision Transformers](https://arxiv.org/abs/2207.00729) — William Merrill & Ashish Sabharwal, 2023 · paper
- 🆕 [The Expressive Power of Transformers with Chain of Thought](https://arxiv.org/abs/2310.07923) — William Merrill & Ashish Sabharwal, 2024 · recente

## Boss fight

Implemente um solver SAT CDCL (aprendizado de cláusulas e watched literals) e use-o para resolver instâncias reduzidas de coloração de grafos e de planejamento; meça a transição de fase do 3-SAT aleatório perto de 4,26 cláusulas por variável. Escreva a prova de NP-completude, por redução, de um problema à sua escolha.

## Checkpoint

- [ ] Defina NP por certificados e dê um exemplo de certificado.
- [ ] Por que uma redução polinomial de A para B mostra que B é pelo menos tão difícil quanto A?
- [ ] O que P = NP significaria para aprendizado e criptografia?
- [ ] Por que a inferência exata em redes bayesianas gerais é intratável?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
