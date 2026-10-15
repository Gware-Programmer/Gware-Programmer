# R10 — The RL frontier

*Fronteira do RL*

- **Trilha:** Reinforcement Learning
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** offline RL, intrinsic motivation, hierarchical RL, multi-agent RL, RL for LLMs

## Por que importa

O RL voltou ao centro com os modelos de raciocínio e os agentes. As fronteiras — aprender offline com dados fixos, explorar por curiosidade, organizar ações em hierarquias, interagir com outros agentes e treinar LLMs em ambientes longos — definem o que agentes autônomos vão conseguir fazer.

## Pré-requisitos

- **Depende de:** R07 (Actor-critic and continuous control), R09 (World models), L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models), AL01 (The alignment problem: specification and Goodhart)
- **Destrava:** A09 (Autonomy, self-improvement and open-ended systems)

Novo pré-requisito: **AL01** — reward hacking.

## Base

1. RL offline: aprender sem interagir; mudança de distribuição; métodos conservadores (CQL, IQL).
2. Exploração intrínseca: curiosidade, RND, contagens.
3. RL hierárquico: o framework de options.
4. RL multiagente: não estacionariedade e equilíbrios → M39.
5. RL para LLMs em ambientes agênticos de várias etapas **L17**.
6. Desenho de recompensas e reward hacking em escala.

## Meio

- Meta-RL e adaptação rápida.
- Imitação, aprendizado a partir de demonstrações e RL inverso.
- Quanto de computação vai para RL vs. pré-treino.

## Avançado

- "Reward is enough" e "a era da experiência": posições programáticas especulação
- RL e automelhoria de agentes → A09.
- Otimização forte de recompensas e a lei de Goodhart → AL01.

## Matemática necessária

**M23**: estimação; **M26**: KL e informação.

## Métodos

- Implemente IQL num dataset offline e compare com behavior cloning.
- Implemente RND num ambiente de recompensa esparsa.
- Treine um LLM pequeno com RLVR num ambiente de texto de várias etapas na 3090.

## Desafios

- "RL offline" avaliado com interação (vazamento).
- Recompensa intrínseca que domina a extrínseca (o problema da "TV barulhenta").

## Fontes

- 🧭 [Offline Reinforcement Learning: Tutorial, Review, and Perspectives on Open Problems](https://arxiv.org/abs/2005.01643) — Sergey Levine, Aviral Kumar, George Tucker & Justin Fu, 2020 · review
- 📄 [Exploration by Random Network Distillation](https://arxiv.org/abs/1810.12894) — Yuri Burda, Harrison Edwards, Amos Storkey & Oleg Klimov, 2018 · paper
- 📄 [Between MDPs and semi-MDPs: A framework for temporal abstraction in reinforcement learning](https://doi.org/10.1016/S0004-3702(99)00052-1) — Richard S. Sutton, Doina Precup & Satinder Singh, 1999 · paper. as options
- 📖 [Multi-Agent Reinforcement Learning: Foundations and Modern Approaches](https://www.marl-book.com/) — Stefano V. Albrecht, Filippos Christianos & Lukas Schäfer, 2024 · livro
- 🧭 [Reinforcement Learning: An Overview](https://arxiv.org/abs/2412.05265) — Kevin P. Murphy, 2024 · review. atualizado com RL para LLMs
- 📄 [Reward is enough](https://doi.org/10.1016/j.artint.2021.103535) — David Silver, Satinder Singh, Doina Precup & Richard S. Sutton, 2021 · paper
- 🎓 [CS285: Deep Reinforcement Learning](https://rail.eecs.berkeley.edu/deeprlcourse/) — Sergey Levine (UC Berkeley) · curso. aulas em vídeo e tarefas
- 🆕 [Does Reinforcement Learning Really Incentivize Reasoning Capacity in LLMs Beyond the Base Model?](https://arxiv.org/abs/2504.13837) — Yang Yue et al., 2025 · recente

## Boss fight

Escolha duas frentes e vá até o fim: (a) RL offline — IQL vs. behavior cloning em datasets de qualidade variada; (b) exploração — RND num ambiente de recompensa esparsa; (c) RL para LLM — RLVR num ambiente de texto de várias etapas, com análise do reward hacking que aparecer. Entregue um relatório com estatística honesta e uma seção de limitações.

## Checkpoint

- [ ] Por que o RL offline sofre com mudança de distribuição?
- [ ] O que é o problema da "TV barulhenta" na curiosidade?
- [ ] O que é uma option no RL hierárquico?
- [ ] Por que o RL multiagente é não estacionário?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
