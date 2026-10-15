# R04 — Temporal-difference learning: Monte Carlo, TD, SARSA and Q-learning

*Diferença temporal: Monte Carlo, TD, SARSA e Q-learning*

- **Trilha:** Reinforcement Learning
- **Nível:** 6 — Aprendizado de máquina · onda 3
- **Termos:** temporal difference learning, SARSA, Q-learning, eligibility traces

## Por que importa

Aprender com a experiência, sem conhecer o modelo: Monte Carlo espera o fim do episódio; a diferença temporal (TD) aprende a cada passo com a própria estimativa. O erro de TD é, literalmente, o que neurônios dopaminérgicos parecem sinalizar — a ponte mais famosa entre IA e cérebro.

## Pré-requisitos

- **Depende de:** R03 (Dynamic programming)
- **Destrava:** R05 (Value-based deep RL), R06 (Policy gradients: REINFORCE, TRPO and PPO), G08 (Emotion, motivation and homeostasis), N07 (Hippocampus, memory and cognitive maps), N08 (Basal ganglia, dopamine and reinforcement learning), AL01 (The alignment problem: specification and Goodhart)

## Base

1. Predição por Monte Carlo.
2. TD(0) e o erro de TD δ = r + γV(s′) − V(s).
3. SARSA (on-policy) e Q-learning (off-policy).
4. Exploração ε-greedy no controle.
5. Traços de elegibilidade e TD(λ).
6. Monte Carlo × TD: viés e variância **M23**.

## Meio

- Expected SARSA e Double Q-learning (viés de maximização).
- Retornos de n passos.
- Convergência no caso tabular (Watkins & Dayan).

## Avançado

- O erro de predição de recompensa da dopamina → N08.
- Rescorla–Wagner como caso especial e o que o TD acrescenta: o tempo → G04.
- TD-Gammon e a história do RL.

## Matemática necessária

**M12**: séries; **M23**: estimadores, viés e variância; **M22**: probabilidade.

## Métodos

- Implemente MC, TD(0), SARSA, Q-learning, Double Q e TD(λ) e reproduza as figuras do "cliff walking" e do "random walk" de Sutton & Barto.

## Desafios

- Taxa de aprendizado e exploração mal ajustadas.
- Confundir on-policy com off-policy.

## Fontes

- 📖 [Reinforcement Learning: An Introduction (2nd ed.)](http://incompleteideas.net/book/the-book-2nd.html) — Richard S. Sutton & Andrew G. Barto, 2018 · livro. caps. 5–7 e 12
- 📄 [Learning to predict by the methods of temporal differences](https://doi.org/10.1007/BF00115009) — Richard S. Sutton, 1988 · paper
- 📄 [Q-learning](https://doi.org/10.1007/BF00992698) — Christopher J. C. H. Watkins & Peter Dayan, 1992 · paper
- 📄 [Temporal difference learning and TD-Gammon](https://doi.org/10.1145/203330.203343) — Gerald Tesauro, 1995 · paper
- 🎓 [Deep Reinforcement Learning Course](https://huggingface.co/learn/deep-rl-course) — Hugging Face · curso

## Boss fight

Implemente MC, TD(0), SARSA, Expected SARSA, Q-learning, Double Q-learning e TD(λ); reproduza o cliff walking e o random walk de Sutton & Barto com curvas médias e intervalos de confiança, e demonstre o viés de maximização do Q-learning e sua correção.

## Checkpoint

- [ ] Escreva o erro de TD e explique o "bootstrapping".
- [ ] Por que SARSA e Q-learning se comportam diferente no cliff walking?
- [ ] O que são traços de elegibilidade?
- [ ] O que é o viés de maximização?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
