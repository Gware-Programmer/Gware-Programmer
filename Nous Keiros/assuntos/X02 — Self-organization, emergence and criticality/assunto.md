# X02 — Self-organization, emergence and criticality

*Auto-organização, emergência e criticalidade*

- **Trilha:** Cybernetics & Complex Systems
- **Nível:** 8 — Escala · onda 1
- **Termos:** self-organization, emergence, criticality, causal emergence, partial information decomposition
- **Projetos KEIROS:** Campo Ressonante, Rei Ichi

## Por que importa

Ordem que surge sem projetista — de bandos de pássaros a cérebros e redes neurais — é o tema da auto-organização. Emergência causal e decomposição de informação transformaram perguntas vagas em quantidades mensuráveis, e a criticalidade é candidata a princípio de organização do cérebro. É também a base teórica para entender o Campo Ressonante do Rei Ichi.

## Pré-requisitos

- **Depende de:** X01 (Cybernetics and control theory), M26 (Information theory), M29 (Stochastic processes and stochastic differential equations)
- **Destrava:** X03 (Artificial life and self-reproducing automata)

## Base

1. "Mais é diferente" (Anderson, 1972): níveis de organização com leis próprias.
2. Criticalidade auto-organizada: o modelo da pilha de areia e as avalanches em lei de potência (Bak, Tang & Wiesenfeld) **M29**.
3. Emergência causal: o nível macro pode ter mais poder causal que o micro (Hoel, Albantakis & Tononi) **M26**.
4. Decomposição de informação parcial: redundância, informação única e sinergia (Williams & Beer).
5. Emergência medida por informação em dados multivariados (Rosas et al., 2020) e a revisão de 2022.
6. "Habilidades emergentes" em LLMs e a crítica de que elas dependem da métrica escolhida contestado.

## Meio

- Complexidade, entropia e medidas de integração **M26**.
- Criticalidade no cérebro → N11.
- Sistemas complexos como disciplina: os cursos do Complexity Explorer (Santa Fe Institute).

## Avançado

- Emergência causal, integração e a IIT → S04
- Sinergia como assinatura de integração em redes neurais e no cérebro aberto
- O Campo Ressonante como sistema auto-organizado: que medida o descreve?

## Matemática necessária

**M26**: entropia, informação mútua e sinergia; **M29**: processos estocásticos; **M28**: dinâmica.

## Métodos

- Faça a introdução a sistemas complexos do Complexity Explorer.
- Implemente a pilha de areia e teste a lei de potência das avalanches com métodos estatísticos adequados.
- Calcule a decomposição de informação parcial para portas XOR e AND e observe a sinergia.

## Desafios

- Chamar qualquer padrão de "emergente" sem uma medida.
- Ajustar lei de potência "a olho" em escala log-log.

## Fontes

- 📄 [More Is Different](https://doi.org/10.1126/science.177.4047.393) — P. W. Anderson, 1972 · paper
- 📄 [Self-organized criticality: An explanation of the 1/f noise](https://doi.org/10.1103/PhysRevLett.59.381) — Per Bak, Chao Tang & Kurt Wiesenfeld, 1987 · paper
- 📄 [Quantifying causal emergence shows that macro can beat micro](https://doi.org/10.1073/pnas.1314922110) — Erik P. Hoel, Larissa Albantakis & Giulio Tononi, 2013 · paper
- 📄 [Nonnegative Decomposition of Multivariate Information](https://arxiv.org/abs/1004.2515) — Paul L. Williams & Randall D. Beer, 2010 · paper
- 📄 [Reconciling emergences: An information-theoretic approach to identify causal emergence in multivariate data](https://doi.org/10.1371/journal.pcbi.1008289) — Fernando E. Rosas et al., 2020 · paper
- 📄 [Are Emergent Abilities of Large Language Models a Mirage?](https://arxiv.org/abs/2304.15004) — Rylan Schaeffer, Brando Miranda & Sanmi Koyejo, 2023 · paper
- 🎓 [Complexity Explorer](https://www.complexityexplorer.org/courses) — Santa Fe Institute · curso. cursos de complexidade, caos e sistemas adaptativos
- 🔧 [NetLogo](https://ccl.northwestern.edu/netlogo/) — Uri Wilensky (Northwestern) · ferramenta. modelos de agentes e sistemas complexos
- 🆕 [Causal Emergence 2.0: Quantifying emergent complexity](https://arxiv.org/abs/2503.13395) — Erik Hoel, 2025 · recente

## Boss fight

Meça emergência no Rei Ichi: registre séries temporais do Campo Ressonante e de outros subsistemas, calcule informação mútua, decomposição de informação parcial (sinergia e redundância) e o critério de emergência causal de Rosas et al. entre o nível micro (as variáveis) e um macro definido por você. Compare com controles — dados embaralhados no tempo e redes aleatórias — e escreva o que o Campo Ressonante é, em termos de informação, com números.

## Checkpoint

- [ ] O que Anderson quis dizer com "mais é diferente"?
- [ ] O que é criticalidade auto-organizada e qual é a sua assinatura?
- [ ] O que é sinergia na decomposição de informação parcial?
- [ ] Por que as "habilidades emergentes" de LLMs são contestadas?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
