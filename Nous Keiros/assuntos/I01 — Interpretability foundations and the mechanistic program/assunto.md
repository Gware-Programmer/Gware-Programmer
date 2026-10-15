# I01 — Interpretability foundations and the mechanistic program

*Fundamentos de interpretabilidade e o programa mecanicista*

- **Trilha:** Mechanistic Interpretability
- **Nível:** 8 — Escala · onda 1
- **Termos:** interpretability, mechanistic interpretability, circuits, features

## Por que importa

Interpretabilidade é tentar ler o que um modelo computa por dentro, não só o que ele responde. O programa mecanicista quer fazer engenharia reversa de redes como quem faz engenharia reversa de um binário — terreno familiar para quem escreveu um compilador — e é hoje uma área em que um pesquisador independente com uma GPU contribui de verdade.

## Pré-requisitos

- **Depende de:** L14 (Transformers)
- **Destrava:** I02 (Attribution, probing and lenses), I04 (Superposition and the linear representation hypothesis)

## Base

1. Níveis de análise: comportamental (entrada/saída), atribuição, sondas (probing) e mecanicista (circuitos).
2. As hipóteses do programa ("Zoom In"): features, circuitos e universalidade.
3. O transformer como circuito: fluxo residual, cabeças que leem e escrevem nele, circuitos QK e OV, composição entre camadas **L14**.
4. Ferramentas: hooks, TransformerLens, nnsight, cache de ativações.
5. Induction heads: o primeiro circuito completo encontrado em transformers.
6. O que conta como explicação: fidelidade, completude, minimalidade.

## Meio

- Neurônios individuais e polissemanticidade → I04.
- Visualização de features em redes de visão → L10.
- O mapa da agenda: "Open Problems in Mechanistic Interpretability".

## Avançado

- Interpretabilidade como ciência: hipóteses falsificáveis, testes causais e o risco da "ilusão interpretativa" → I03.
- Críticas de método: achar estrutura em ruído (arXiv 2512.18792) e a falta de definições filosóficas claras do que é uma "feature" (arXiv 2506.18852).
- Os mesmos métodos da neurociência — sondas, lesões, comparação de representações → N12.

## Matemática necessária

**M19**: direções, projeções e SVD dos circuitos OV/QK; **M21**: gradientes.

## Métodos

- Faça o capítulo de interpretabilidade de transformers do ARENA do começo ao fim.
- Siga o guia de Neel Nanda e reproduza as induction heads num modelo de duas camadas.
- Leia "A Mathematical Framework" com papel e lápis, derivando os circuitos QK e OV.

## Desafios

- Confundir "achei um neurônio que ativa para X" com "o modelo usa X".
- Interpretações sem teste causal.
- Exemplos escolhidos a dedo.

## Fontes

- 📰 [Zoom In: An Introduction to Circuits](https://distill.pub/2020/circuits/zoom-in/) — Chris Olah, Nick Cammarata, Ludwig Schubert, Gabriel Goh, Michael Petrov & Shan Carter, 2020 · artigo
- 📰 [A Mathematical Framework for Transformer Circuits](https://transformer-circuits.pub/2021/framework/index.html) — Nelson Elhage et al. (Anthropic), 2021 · artigo
- 🎓 [ARENA — AI Safety Education](https://www.arena.education/) — ARENA · curso. capítulo de interpretabilidade de transformers
- 🗺️ [How To Become A Mechanistic Interpretability Researcher](https://www.neelnanda.io/mechanistic-interpretability/getting-started) — Neel Nanda · guia
- 🔧 [TransformerLens](https://github.com/TransformerLensOrg/TransformerLens) — TransformerLensOrg · ferramenta
- 🧭 [Open Problems in Mechanistic Interpretability](https://arxiv.org/abs/2501.16496) — Lee Sharkey et al., 2025 · review. o mapa da agenda de pesquisa

## Boss fight

Treine um transformer só de atenção, com duas camadas, numa tarefa de sequências repetidas e encontre — pela análise dos circuitos QK e OV e por ablação — as induction heads e a cabeça de "token anterior" que as alimenta. Reproduza a mudança de fase na curva de perda e escreva um relatório no estilo do transformer-circuits.pub em que cada afirmação venha apoiada por um teste causal.

## Checkpoint

- [ ] O que é o fluxo residual e por que ele torna transformers "legíveis"?
- [ ] O que são os circuitos QK e OV de uma cabeça?
- [ ] Como uma induction head copia padrões do contexto?
- [ ] O que distingue uma explicação mecanicista de uma correlacional?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
