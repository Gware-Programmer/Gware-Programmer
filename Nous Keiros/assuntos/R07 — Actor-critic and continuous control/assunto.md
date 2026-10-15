# R07 — Actor-critic and continuous control

*Actor-critic e controle contínuo*

- **Trilha:** Reinforcement Learning
- **Nível:** 7 — Redes profundas · onda 2
- **Termos:** actor-critic, GAE, DDPG, TD3, SAC, maximum entropy RL

## Por que importa

Actor-critic combina o melhor dos dois mundos: um ator (a política) guiado por um crítico (o valor). É a família por trás do controle de robôs (SAC, TD3) e, por analogia, uma das teorias mais influentes sobre os gânglios da base.

## Pré-requisitos

- **Depende de:** R05 (Value-based deep RL), R06 (Policy gradients: REINFORCE, TRPO and PPO)
- **Destrava:** R10 (The RL frontier), B06 (Cognitive robotics and embodied AI)

## Base

1. Arquitetura ator-crítico; vantagem estimada pelo crítico **R05****R06**.
2. A2C e A3C.
3. Ações contínuas e políticas gaussianas.
4. DDPG e TD3 (gradiente determinístico; correção da superestimação).
5. SAC: RL de entropia máxima.
6. Off-policy vs. on-policy no controle.

## Meio

- Normalização de observações e recompensas; ações limitadas por tanh.
- Eficiência de amostra e razão de replay.
- Benchmarks contínuos (MuJoCo, DeepMind Control).

## Avançado

- Ator-crítico nos gânglios da base (estriado dorsal e ventral) → N08.
- RL de entropia máxima como inferência ("control as inference") → N10.
- Robótica real e a passagem simulação → realidade → B06.

## Matemática necessária

**M27**: otimização; **M23**: estimação; **M26**: entropia.

## Métodos

- Implemente SAC e TD3 do zero e confira contra o CleanRL.
- Treine em tarefas do MuJoCo (HalfCheetah, Hopper) na 3090.

## Desafios

- Temperatura de entropia mal ajustada.
- Bugs nos limites das ações.

## Fontes

- 📄 [Asynchronous Methods for Deep Reinforcement Learning](https://arxiv.org/abs/1602.01783) — Volodymyr Mnih et al., 2016 · paper
- 📄 [Continuous control with deep reinforcement learning](https://arxiv.org/abs/1509.02971) — Timothy P. Lillicrap et al., 2015 · paper. o DDPG
- 📄 [Addressing Function Approximation Error in Actor-Critic Methods](https://arxiv.org/abs/1802.09477) — Scott Fujimoto, Herke van Hoof & David Meger, 2018 · paper. o TD3
- 📄 [Soft Actor-Critic: Off-Policy Maximum Entropy Deep Reinforcement Learning with a Stochastic Actor](https://arxiv.org/abs/1801.01290) — Tuomas Haarnoja, Aurick Zhou, Pieter Abbeel & Sergey Levine, 2018 · paper
- 📄 [High-Dimensional Continuous Control Using Generalized Advantage Estimation](https://arxiv.org/abs/1506.02438) — John Schulman et al., 2015 · paper
- 🎓 [CS 285: Deep Reinforcement Learning](https://rail.eecs.berkeley.edu/deeprlcourse/) — Sergey Levine (UC Berkeley) · curso

## Boss fight

Implemente SAC e TD3 do zero e treine em três tarefas contínuas do MuJoCo com cinco sementes; compare com o seu PPO em eficiência de amostra e desempenho final, com média interquartil e intervalos. Faça uma ablação da temperatura de entropia do SAC e explique o efeito na exploração.

## Checkpoint

- [ ] O que o crítico estima e como isso reduz a variância?
- [ ] Por que o TD3 usa dois críticos e o mínimo entre eles?
- [ ] O que é RL de entropia máxima?
- [ ] Diferencie on-policy de off-policy com exemplos.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
