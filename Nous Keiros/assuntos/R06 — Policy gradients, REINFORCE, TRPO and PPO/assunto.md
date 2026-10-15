# R06 — Policy gradients: REINFORCE, TRPO and PPO

*Policy gradient: REINFORCE, TRPO e PPO*

- **Trilha:** Reinforcement Learning
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** policy gradient, REINFORCE, baseline, TRPO, PPO

## Por que importa

Em vez de aprender valores, aprender a política diretamente, subindo o gradiente do retorno esperado. Policy gradient é a base do PPO — usado no RLHF que alinhou os LLMs — e do GRPO dos modelos de raciocínio.

## Pré-requisitos

- **Depende de:** R04 (Temporal-difference learning: Monte Carlo, TD, SARSA and Q-learning), L08 (Neural networks and backpropagation), M26 (Information theory)
- **Destrava:** L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models), R07 (Actor-critic and continuous control), R08 (Model-based RL, planning and search)

## Base

1. Política parametrizada π_θ(a | s) e o objetivo J(θ).
2. O truque da razão de verossimilhança e o teorema do gradiente de política **M21**.
3. REINFORCE e sua variância alta.
4. Linhas de base (baselines) e vantagem.
5. Gradiente natural e regiões de confiança (TRPO) **M26**.
6. PPO: razão com clipping; detalhes de implementação.

## Meio

- Estimativa de vantagem generalizada (GAE).
- Entropia como regularização.
- Os "37 detalhes de implementação" do PPO.

## Avançado

- PPO e GRPO em LLMs (RLHF e RLVR) → L17.
- Gradiente de política com recompensas esparsas e verificáveis.
- Teoria da convergência de métodos de gradiente de política.

## Matemática necessária

**M26**: KL; **M21**: gradientes; **M23**: variância de estimadores.

## Métodos

- Derive o teorema do gradiente de política à mão.
- Implemente REINFORCE (com e sem baseline), A2C e PPO e compare a variância.
- Teste quais dos "37 detalhes" mudam o resultado.

## Desafios

- Esquecer de normalizar vantagens; erros de sinal no gradiente.
- Avaliar PPO sem os detalhes de implementação corretos.

## Fontes

- 📄 [Simple statistical gradient-following algorithms for connectionist reinforcement learning](https://doi.org/10.1007/BF00992696) — Ronald J. Williams, 1992 · paper. o REINFORCE
- 📄 [Policy Gradient Methods for Reinforcement Learning with Function Approximation](https://papers.nips.cc/paper/1713-policy-gradient-methods-for-reinforcement-learning-with-function-approximation) — Richard S. Sutton, David McAllester, Satinder Singh & Yishay Mansour, 2000 · paper
- 📄 [Trust Region Policy Optimization](https://arxiv.org/abs/1502.05477) — John Schulman, Sergey Levine, Philipp Moritz, Michael I. Jordan & Pieter Abbeel, 2015 · paper
- 📄 [Proximal Policy Optimization Algorithms](https://arxiv.org/abs/1707.06347) — John Schulman, Filip Wolski, Prafulla Dhariwal, Alec Radford & Oleg Klimov, 2017 · paper
- 🗺️ [The 37 Implementation Details of Proximal Policy Optimization](https://iclr-blog-track.github.io/2022/03/25/ppo-implementation-details/) — Shengyi Huang et al., 2022 · guia
- 🗺️ [Spinning Up in Deep RL](https://spinningup.openai.com/) — Joshua Achiam (OpenAI), 2018 · guia
- 🎓 [CS285: Deep Reinforcement Learning](https://rail.eecs.berkeley.edu/deeprlcourse/) — Sergey Levine (UC Berkeley) · curso. aulas em vídeo e tarefas

## Boss fight

Derive por escrito o teorema do gradiente de política. Implemente REINFORCE (com e sem baseline), A2C com GAE e PPO do zero; treine no CartPole, no LunarLander e num ambiente contínuo do Gymnasium com cinco sementes. Meça a variância do gradiente com e sem baseline e faça a ablação de cinco dos "37 detalhes".

## Checkpoint

- [ ] Derive ∇J(θ) = E[∇log π(a | s) · G].
- [ ] Por que subtrair uma baseline não introduz viés?
- [ ] O que o clipping do PPO faz?
- [ ] Qual o papel da KL no TRPO?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
