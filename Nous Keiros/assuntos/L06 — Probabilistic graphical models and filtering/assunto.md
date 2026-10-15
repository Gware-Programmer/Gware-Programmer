# L06 — Probabilistic graphical models and filtering

*Modelos gráficos probabilísticos e filtragem*

- **Trilha:** Machine Learning
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** probabilistic graphical models, Bayesian networks, HMM, Kalman filter, belief propagation

## Por que importa

Modelos gráficos são a linguagem para estruturar incerteza: redes bayesianas, HMMs, filtros de Kalman. O filtro de Kalman decodifica intenção de movimento em BCIs, HMMs modelam estados ocultos do cérebro e a passagem de mensagens é a base matemática da inferência ativa.

## Pré-requisitos

- **Depende de:** L02 (Linear models and maximum likelihood), M25 (Bayesian inference, MCMC and variational inference), M30 (Graph theory and networks)
- **Destrava:** B02 (Neural decoding and motor BCIs)

## Base

1. Redes bayesianas: fatoração por DAG **M30**, independência condicional, d-separação.
2. Modelos não dirigidos (campos de Markov) e grafos de fatores.
3. Inferência exata: eliminação de variáveis e propagação de crenças (belief propagation) em árvores.
4. HMMs: forward-backward, Viterbi, Baum-Welch (EM) **M25**.
5. Modelos de espaço de estados linear-gaussianos: filtro de Kalman e suavizador RTS.
6. Aprendizado de parâmetros com dados completos e incompletos.

## Meio

- Filtros de partículas (sequential Monte Carlo) para modelos não lineares.
- Inferência aproximada: loopy BP e inferência variacional em grafos.
- Kalman estendido e unscented.

## Avançado

- Passagem de mensagens em grafos de fatores como implementação neural da inferência ativa → N10.
- Decodificadores de Kalman em BCIs → B02.
- Modelos gráficos profundos e inferência amortizada.

## Matemática necessária

**M25**: inferência; **M30**: grafos; **M23**: gaussianas.

## Métodos

- Implemente forward-backward, Viterbi e Kalman do zero e teste em dados simulados com verdade conhecida.
- Desenhe o grafo antes de escrever qualquer equação.
- Särkkä para filtragem; Murphy (vol. 2) e Bishop para a teoria geral.

## Desafios

- Confundir filtragem (usa o passado) com suavização (usa passado e futuro).
- Instabilidade numérica do Kalman (use a forma de Joseph ou Cholesky).
- Achar que uma rede bayesiana é causal por definição.

## Fontes

- 📖 [Bayesian Filtering and Smoothing (2ª ed.)](https://users.aalto.fi/~ssarkka/pub/bfs_book_2023_online.pdf) — Simo Särkkä & Lennart Svensson, 2023 · livro. versão online gratuita dos autores
- 📖 [Probabilistic Machine Learning: Advanced Topics](https://probml.github.io/pml-book/book2.html) — Kevin P. Murphy, 2023 · livro. PDF gratuito; modelos gráficos e espaço de estados
- 📖 [Pattern Recognition and Machine Learning](https://www.microsoft.com/en-us/research/publication/pattern-recognition-machine-learning/) — Christopher M. Bishop, 2006 · livro. caps. 8 e 13
- 📄 [A New Approach to Linear Filtering and Prediction Problems](https://doi.org/10.1115/1.3662552) — R. E. Kalman, 1960 · paper
- 📄 [A tutorial on hidden Markov models and selected applications in speech recognition](https://doi.org/10.1109/5.18626) — Lawrence R. Rabiner, 1989 · paper

## Boss fight

Implemente HMM (forward-backward, Viterbi, Baum-Welch), filtro e suavizador de Kalman e um filtro de partículas. Simule um cursor controlado pelo cérebro: intenção 2D latente, 50 neurônios com sintonia cossenoidal gerando contagens ruidosas, e decodifique a trajetória com Kalman e com partículas, comparando o erro — exatamente o problema de uma BCI motora.

## Checkpoint

- [ ] Escreva a fatoração conjunta de uma rede bayesiana com quatro nós.
- [ ] Qual a diferença entre forward-backward e Viterbi?
- [ ] Escreva as equações de predição e atualização do Kalman.
- [ ] Por que a propagação de crenças é exata em árvores e não em grafos com ciclos?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
