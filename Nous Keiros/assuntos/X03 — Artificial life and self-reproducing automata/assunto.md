# X03 — Artificial life and self-reproducing automata

*Vida artificial e autômatos auto-reprodutores*

- **Trilha:** Cybernetics & Complex Systems
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** artificial life, cellular automata, self-reproducing automata, Lenia, neural cellular automata
- **Projetos KEIROS:** Campo Ressonante

## Por que importa

Von Neumann perguntou como uma máquina pode construir uma cópia de si mesma — e a resposta antecipou a lógica do DNA. Autômatos celulares, Lenia, autômatos celulares neurais e a vida computacional que emerge de programas que se replicam formam o laboratório da "vida como computação" — e das perguntas sobre o que o Rei Ichi precisaria para estar vivo.

## Pré-requisitos

- **Depende de:** X02 (Self-organization, emergence and criticality), M36 (Theory of computation: automata, grammars and computability), L09 (Training deep networks), X04 (Evolutionary computation and neuroevolution)
- **Destrava:** —

Novo pré-requisito: **X04** — computação evolutiva.

## Base

1. A teoria dos autômatos auto-reprodutores: construtor universal + descrição copiada e interpretada — o mesmo esquema do DNA **M36**.
2. Autômatos celulares: o Jogo da Vida, as classes de comportamento de Wolfram e a universalidade.
3. Vida artificial (Langton, 1986) e a "borda do caos".
4. Lenia: autômatos celulares contínuos com "criaturas" estáveis (Chan, 2019) **M28**.
5. Autômatos celulares neurais: aprender regras locais que crescem e regeneram formas (Mordvintsev et al., 2020) **L09**.
6. Vida computacional: programas que se auto-replicam emergindo de interações simples, sem projetista (Agüera y Arcas et al., 2024).

## Meio

- "O computador e o cérebro" (von Neumann, 1958): a linguagem do cérebro como estatística, não como a da matemática → N01.
- Busca automática de vida artificial com modelos de fundação.
- Abertura (open-endedness) e evolução artificial → A09.

## Avançado

- O que seria preciso para um software estar "vivo" — e o naturalismo biológico → S11
- Morfogênese e computação coletiva como inspiração para arquiteturas.
- O Campo Ressonante e o trabalho inacabado de von Neumann: exatamente o quê ficou inacabado?

## Matemática necessária

**M36**: computabilidade e universalidade; **M28**: dinâmica contínua; **M26**: informação.

## Métodos

- Implemente em C o Jogo da Vida e um autômato elementar com exemplos das quatro classes de Wolfram.
- Rode Lenia e encontre uma criatura estável que não esteja no catálogo.
- Reproduza o autômato celular neural do artigo da Distill na RTX 3090.

## Desafios

- Confundir complexidade visual com complexidade computacional.
- Chamar de "vida" sem critério.

## Fontes

- 📖 [Theory of Self-Reproducing Automata](https://archive.org/details/theoryofselfrepr00vonn_0) — John von Neumann (ed. Arthur W. Burks), 1966 · livro
- 📖 [The Computer and the Brain](https://yalebooks.yale.edu/book/9780300181111/the-computer-and-the-brain/) — John von Neumann, 1958 · livro
- 📄 [Studying artificial life with cellular automata](https://doi.org/10.1016/0167-2789(86)90237-X) — Christopher G. Langton, 1986 · paper
- 📄 [Lenia: Biology of Artificial Life](https://doi.org/10.25088/ComplexSystems.28.3.251) — Bert Wang-Chak Chan, 2019 · paper
- 📄 [Growing Neural Cellular Automata](https://distill.pub/2020/growing-ca/) — Alexander Mordvintsev, Ettore Randazzo, Eyvind Niklasson & Michael Levin, 2020 · paper
- 🆕 [Computational Life: How Well-formed, Self-replicating Programs Emerge from Simple Interaction](https://arxiv.org/abs/2406.19108) — Blaise Agüera y Arcas et al., 2024 · recente

## Boss fight

Monte em C, para o M1, um laboratório de vida artificial: autômatos elementares com as quatro classes de Wolfram, Lenia com busca de criaturas estáveis e o experimento de vida computacional de Agüera y Arcas et al. (uma sopa de programas em que replicadores surgem espontaneamente). Depois releia "O computador e o cérebro" e escreva, com precisão, que parte do trabalho inacabado de von Neumann o Campo Ressonante formaliza — com uma predição que o seu formalismo faz e que o texto original não fazia.

## Checkpoint

- [ ] Qual é a arquitetura do autômato auto-reprodutor de von Neumann e por que ela antecipa o DNA?
- [ ] O que são as quatro classes de comportamento de Wolfram?
- [ ] O que um autômato celular neural aprende?
- [ ] Cite duas definições de vida em disputa e diga qual o Rei Ichi poderia satisfazer.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
