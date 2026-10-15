# R08 — Model-based RL, planning and search

*RL baseado em modelo, planejamento e busca*

- **Trilha:** Reinforcement Learning
- **Nível:** 7 — Redes profundas · onda 2
- **Termos:** model-based RL, Dyna, MCTS, AlphaZero, MuZero

## Por que importa

Agentes inteligentes imaginam antes de agir. RL baseado em modelo aprende como o mundo responde e planeja com isso — de Dyna a AlphaZero e MuZero, que venceram Go, xadrez e shogi combinando busca em árvore com redes. É a ponte entre aprendizado e planejamento clássico.

## Pré-requisitos

- **Depende de:** R05 (Value-based deep RL), R06 (Policy gradients: REINFORCE, TRPO and PPO)
- **Destrava:** L25 (Reasoning, search and compositional generalization), R09 (World models)

## Base

1. Modelo do ambiente: transição e recompensa aprendidas.
2. Dyna: aprender, planejar e agir de forma integrada.
3. Monte Carlo Tree Search (UCT) **R01**.
4. AlphaGo e AlphaZero: rede de política e valor + MCTS + autojogo.
5. MuZero: planejar num modelo latente sem conhecer as regras.
6. Planejamento por otimização (MPC, método da entropia cruzada).

## Meio

- MBPO; erro composto de modelos; horizonte de imaginação.
- TD-MPC2.
- Exploração guiada por incerteza epistêmica (ensembles de modelos).

## Avançado

- Busca em tempo de teste sobre raciocínios de LLMs → L25.
- Planejamento no cérebro: replay e "preplay" do hipocampo → N07.
- World models gerativos → R09.

## Matemática necessária

**M23**: estimação; **M27**: otimização.

## Métodos

- Implemente MCTS para o jogo da velha e para Connect-4; depois um AlphaZero minúsculo com autojogo.
- Implemente Dyna-Q e compare a eficiência de amostra com Q-learning.

## Desafios

- Políticas que exploram os erros do próprio modelo.
- Conclusões apressadas com poucas simulações de MCTS.

## Fontes

- 📄 [Dyna, an integrated architecture for learning, planning, and reacting](https://doi.org/10.1145/122344.122377) — Richard S. Sutton, 1991 · paper
- 🧭 [A Survey of Monte Carlo Tree Search Methods](https://doi.org/10.1109/TCIAIG.2012.2186810) — Cameron B. Browne et al., 2012 · review
- 📄 [Mastering the game of Go with deep neural networks and tree search](https://doi.org/10.1038/nature16961) — David Silver et al., 2016 · paper
- 📄 [A general reinforcement learning algorithm that masters chess, shogi, and Go through self-play](https://doi.org/10.1126/science.aar6404) — David Silver et al., 2018 · paper
- 📄 [Mastering Atari, Go, chess and shogi by planning with a learned model](https://doi.org/10.1038/s41586-020-03051-4) — Julian Schrittwieser et al., 2020 · paper. o MuZero
- 📄 [When to Trust Your Model: Model-Based Policy Optimization](https://arxiv.org/abs/1906.08253) — Michael Janner, Justin Fu, Marvin Zhang & Sergey Levine, 2019 · paper

## Boss fight

Implemente MCTS (UCT) e um AlphaZero minúsculo (rede de política e valor + MCTS + autojogo) para Connect-4 na 3090 e mostre a força crescente contra um MCTS puro. Implemente Dyna-Q e compare a eficiência de amostra com Q-learning em labirintos que mudam no meio do treino.

## Checkpoint

- [ ] O que o Dyna acrescenta ao Q-learning?
- [ ] Como o UCT equilibra exploração e aproveitamento?
- [ ] Qual a diferença essencial entre AlphaZero e MuZero?
- [ ] O que é erro composto num modelo aprendido?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
