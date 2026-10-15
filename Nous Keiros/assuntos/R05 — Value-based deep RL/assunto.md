# R05 — Value-based deep RL

*Deep RL baseado em valor*

- **Trilha:** Reinforcement Learning
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** deep Q-network, experience replay, target network, distributional RL

## Por que importa

Juntar Q-learning com redes profundas permitiu jogar Atari a partir de pixels (DQN, 2015), o marco que abriu o deep RL. Entender por que isso é instável — a "tríade mortal" — e como replay e rede-alvo estabilizam é essencial para qualquer RL moderno.

## Pré-requisitos

- **Depende de:** R04 (Temporal-difference learning: Monte Carlo, TD, SARSA and Q-learning), L09 (Training deep networks)
- **Destrava:** R07 (Actor-critic and continuous control), R08 (Model-based RL, planning and search)

## Base

1. Aproximação linear de funções e semigradiente.
2. A tríade mortal: aproximação + bootstrapping + off-policy.
3. DQN: replay de experiência e rede-alvo **L09**.
4. Double DQN, arquitetura dueling, replay priorizado.
5. Rainbow.
6. RL distributivo (C51, QR-DQN).

## Meio

- Avaliação honesta em Atari (ações "pegajosas", sementes).
- Exploração em DQN (ε, redes ruidosas).
- Eficiência de amostra e razão de replay.

## Avançado

- RL distributivo e a dopamina distributiva → N08.
- Por que deep RL é frágil, e a estatística que evita conclusões falsas → P04.
- Escalar RL baseado em valor.

## Matemática necessária

**M27**: otimização; **M21**: gradientes; **M23**: estimação.

## Métodos

- Leia o DQN de arquivo único do CleanRL e reimplemente sem olhar.
- Treine DQN no CartPole e num jogo de Atari na 3090.
- Faça ablações de replay e rede-alvo.

## Desafios

- Bugs silenciosos com término vs. truncamento de episódio.
- Comparar com uma semente.

## Fontes

- 📄 [Human-level control through deep reinforcement learning](https://doi.org/10.1038/nature14236) — Volodymyr Mnih et al., 2015 · paper
- 📄 [Deep Reinforcement Learning with Double Q-learning](https://arxiv.org/abs/1509.06461) — Hado van Hasselt, Arthur Guez & David Silver, 2015 · paper
- 📄 [Rainbow: Combining Improvements in Deep Reinforcement Learning](https://arxiv.org/abs/1710.02298) — Matteo Hessel et al., 2017 · paper
- 📖 [Distributional Reinforcement Learning](https://www.distributional-rl.org/) — Marc G. Bellemare, Will Dabney & Mark Rowland, 2023 · livro
- 🔧 [CleanRL](https://github.com/vwxyzjn/cleanrl) — Shengyi Huang et al. · ferramenta. implementações de arquivo único
- 📄 [Deep Reinforcement Learning that Matters](https://arxiv.org/abs/1709.06560) — Peter Henderson et al., 2017 · paper

## Boss fight

Implemente DQN do zero (replay e rede-alvo), depois Double, Dueling e um agente distributivo (C51 ou QR-DQN). Treine no CartPole e em dois jogos de Atari na 3090 com cinco sementes, reporte com média interquartil e intervalos de confiança, e faça a ablação de replay e rede-alvo mostrando a tríade mortal em ação.

## Checkpoint

- [ ] Quais são os três elementos da tríade mortal?
- [ ] Por que o replay de experiência ajuda?
- [ ] O que a rede-alvo estabiliza?
- [ ] O que o RL distributivo aprende no lugar do valor esperado?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
