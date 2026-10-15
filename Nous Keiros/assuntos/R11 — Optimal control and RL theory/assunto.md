# R11 — Optimal control and RL theory

*Controle ótimo e teoria do RL*

- **Trilha:** Reinforcement Learning
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** optimal control, LQR, Hamilton-Jacobi-Bellman, regret bounds, sample complexity

## Por que importa

O RL tem um irmão mais velho: o controle ótimo, que resolve problemas de decisão contínuos com garantias (LQR, Kalman). Ele dá a teoria do controle motor do cérebro e os limites de eficiência de amostra do RL — ferramentas para quem quer provar, não só treinar.

## Pré-requisitos

- **Depende de:** R03 (Dynamic programming), M27 (Convex and non-convex optimization), M28 (Differential equations and dynamical systems)
- **Destrava:** N15 (Motor control, the cerebellum and internal models)

## Base

1. Controle ótimo em tempo discreto e contínuo; a equação de Hamilton–Jacobi–Bellman **M28**.
2. LQR (regulador linear-quadrático) e a equação de Riccati.
3. A dualidade entre LQR e filtro de Kalman (LQG).
4. Controle preditivo por modelo (MPC) **M27**.
5. Garantias em RL: complexidade de amostra, arrependimento em MDPs, exploração otimista.

## Meio

- iLQR e DDP para sistemas não lineares.
- Controle robusto (noção).
- RL como controle adaptativo (a visão de Recht).

## Avançado

- Controle ótimo por realimentação como teoria do controle motor → N15.
- Limites teóricos de RL com aproximação de funções.
- Controle como inferência.

## Matemática necessária

**M27**: otimização; **M28**: sistemas dinâmicos; **M18**: autovalores e estabilidade.

## Métodos

- Derive o LQR por programação dinâmica, resolva Riccati numericamente e controle um pêndulo invertido.
- Leia "A Tour of RL" (Recht) e compare LQR com gradiente de política no mesmo sistema.
- Use o livro de teoria de RL (Agarwal et al.) para as provas.

## Desafios

- Linearizar fora da região em que a aproximação vale.
- Ignorar ruído e restrições.

## Fontes

- 🧭 [A Tour of Reinforcement Learning: The View from Continuous Control](https://arxiv.org/abs/1806.09460) — Benjamin Recht, 2019 · review
- 📖 [A Course in Reinforcement Learning](https://web.mit.edu/dimitrib/www/RLbook.html) — Dimitri P. Bertsekas · livro
- 📖 [Reinforcement Learning: Theory and Algorithms](https://rltheorybook.github.io/) — Alekh Agarwal, Nan Jiang, Sham M. Kakade & Wen Sun · livro
- 📄 [Is Q-learning Provably Efficient?](https://arxiv.org/abs/1807.03765) — Chi Jin, Zeyuan Allen-Zhu, Sébastien Bubeck & Michael I. Jordan, 2018 · paper
- 📄 [A New Approach to Linear Filtering and Prediction Problems](https://doi.org/10.1115/1.3662552) — R. E. Kalman, 1960 · paper. o lado dual do LQR

## Boss fight

Derive o LQR por programação dinâmica, resolva a equação de Riccati e controle em simulação um pêndulo invertido e um carro-pêndulo; implemente iLQR para o caso não linear e MPC com restrições. Compare com o seu PPO no mesmo sistema em amostras necessárias e robustez a ruído.

## Checkpoint

- [ ] Derive a solução do LQR em horizonte finito.
- [ ] Qual a dualidade entre LQR e filtro de Kalman?
- [ ] O que o MPC faz a cada passo?
- [ ] O que significa um algoritmo de RL ter complexidade de amostra polinomial?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
