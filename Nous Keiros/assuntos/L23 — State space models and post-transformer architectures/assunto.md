# L23 — State space models and post-transformer architectures

*Modelos de espaço de estados e arquiteturas pós-transformer*

- **Trilha:** Machine Learning
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** state space models, S4, Mamba, linear attention, hybrid models

## Por que importa

O custo quadrático da atenção abriu uma corrida por arquiteturas recorrentes eficientes: modelos de espaço de estados (S4, Mamba), atenção linear e híbridos. Eles reacendem a pergunta sobre que arquitetura a IA — e o cérebro — realmente precisa para memória de longo prazo.

## Pré-requisitos

- **Depende de:** L14 (Transformers), M31 (Fourier analysis and signal processing)
- **Destrava:** —

## Base

1. SSMs lineares contínuos, discretização e a convolução longa equivalente **M28****M31**.
2. S4: inicialização HiPPO e computação eficiente.
3. Mamba: seleção dependente da entrada e scan paralelo.
4. Atenção linear e sua forma recorrente ("transformers são RNNs") **L14**.
5. RWKV, xLSTM e híbridos atenção + SSM.
6. O trade-off central: estado fixo vs. KV cache crescente; recuperação associativa.

## Meio

- Mamba-2 e a dualidade entre SSMs e atenção.
- Treino em tempo de teste (test-time training) e Titans: memória que aprende durante a inferência.
- Benchmarks de contexto longo e de recuperação (MQAR, "agulha no palheiro").

## Avançado

- Limites teóricos: o que recorrências de estado fixo não conseguem lembrar; recuperação vs. compressão.
- Paralelos com memória biológica (traços, plasticidade rápida) → N07.
- Para onde vão as arquiteturas de fronteira — transformers puros ou híbridos — é uma questão em aberto; acompanhe pelos relatórios técnicos.

## Matemática necessária

**M28**: sistemas dinâmicos; **M31**: convolução e FFT.

## Métodos

- Implemente um SSM diagonal (S4D) e um Mamba mínimo com scan sequencial e paralelo.
- Compare com um transformer de mesmo tamanho em recuperação associativa e cópia longa.
- Implemente atenção linear causal na forma recorrente.

## Desafios

- Comparar com transformers mal ajustados.
- Esquecer que eficiência assintótica não vira eficiência em GPU sem kernels dedicados.

## Fontes

- 📄 [Efficiently Modeling Long Sequences with Structured State Spaces](https://arxiv.org/abs/2111.00396) — Albert Gu, Karan Goel & Christopher Ré, 2021 · paper. o S4
- 📄 [Mamba: Linear-Time Sequence Modeling with Selective State Spaces](https://arxiv.org/abs/2312.00752) — Albert Gu & Tri Dao, 2023 · paper
- 📄 [Transformers are SSMs: Generalized Models and Efficient Algorithms Through Structured State Space Duality](https://arxiv.org/abs/2405.21060) — Tri Dao & Albert Gu, 2024 · paper
- 📄 [Transformers are RNNs: Fast Autoregressive Transformers with Linear Attention](https://arxiv.org/abs/2006.16236) — Angelos Katharopoulos, Apoorv Vyas, Nikolaos Pappas & François Fleuret, 2020 · paper
- 📄 [RWKV: Reinventing RNNs for the Transformer Era](https://arxiv.org/abs/2305.13048) — Bo Peng et al., 2023 · paper
- 🆕 [Titans: Learning to Memorize at Test Time](https://arxiv.org/abs/2501.00663) — Ali Behrouz, Peilin Zhong & Vahab Mirrokni, 2025 · recente

## Boss fight

Implemente S4D, um Mamba mínimo (scan seletivo sequencial e paralelo) e atenção linear, e compare-os com um transformer de mesmo número de parâmetros em: modelagem de linguagem em português, recuperação associativa com múltiplas consultas (MQAR) e cópia longa. Reporte onde cada um vence e explique teoricamente por quê.

## Checkpoint

- [ ] Como um SSM linear pode ser computado tanto como convolução quanto como recorrência?
- [ ] O que a seleção do Mamba acrescenta ao S4?
- [ ] Por que modelos de estado fixo têm dificuldade com recuperação exata?
- [ ] Qual o trade-off entre KV cache e estado fixo?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
