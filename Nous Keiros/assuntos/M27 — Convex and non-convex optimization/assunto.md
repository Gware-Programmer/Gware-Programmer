# M27 — Convex and non-convex optimization

*Otimização convexa e não convexa*

- **Trilha:** Mathematics
- **Nível:** 5 — A matemática do aprendizado · onda 1
- **Termos:** convex optimization, gradient descent, duality, KKT, nonconvex

## Por que importa

Treinar é otimizar. A teoria convexa dá garantias e linguagem (dualidade, condições KKT); a prática do deep learning é não convexa, estocástica e cheia de surpresas. Entender as duas é saber por que o SGD funciona onde, em tese, não deveria.

## Pré-requisitos

- **Depende de:** M21 (Matrix calculus)
- **Destrava:** M39 (Game theory), L04 (Kernel methods, SVMs and Gaussian processes), L09 (Training deep networks), R11 (Optimal control and RL theory), X04 (Evolutionary computation and neuroevolution)

## Base

1. Conjuntos e funções convexas; desigualdade de Jensen; condições de 1ª e 2ª ordem.
2. Gradiente descendente: convergência para funções suaves e convexas; papel do passo e do condicionamento **M18**.
3. Newton e quasi-Newton (BFGS, L-BFGS).
4. Otimização com restrições: Lagrange, condições KKT, dualidade lagrangiana.
5. Programação linear e quadrática (noção).
6. Gradiente estocástico (SGD): ruído, mini-batches, convergência em esperança.
7. Momentum, Nesterov, AdaGrad, RMSProp, Adam.

## Meio

- Subgradientes e métodos proximais (L1, lasso).
- Taxas de convergência (sublinear, linear, quadrática) e o número de condição.
- Não convexidade: mínimos locais, selas, platôs; ruído para escapar de selas.
- Agendas de taxa de aprendizado (warmup, cosseno).

## Avançado

- Otimização em deep learning: superparametrização, viés implícito do gradiente, "edge of stability" (Cohen et al., 2021) → L26.
- Otimizadores modernos: Shampoo, Muon (ortogonaliza a atualização), sharpness-aware minimization.
- Problemas min-max e de dois níveis (GANs, treino adversarial) e sua ligação com teoria dos jogos → M39.

## Matemática necessária

**M21**: gradientes em forma matricial; **M18**: autovalores e matrizes semidefinidas positivas.

## Métodos

- Boyd & Vandenberghe com o EE364a para a teoria; implemente cada algoritmo e plote a convergência em escala log.
- Compare otimizadores em problemas-teste (Rosenbrock, quadráticas mal condicionadas, regressão logística).
- Prove a taxa de convergência do gradiente descendente em quadráticas usando autovalores.

## Desafios

- Achar que Adam é "sempre melhor": depende do problema, e a generalização difere.
- Confundir convergência da perda de treino com um bom modelo.
- Escolher a taxa de aprendizado sem varredura em escala logarítmica.

## Fontes

- 📖 [Convex Optimization](https://web.stanford.edu/~boyd/cvxbook/) — Stephen Boyd & Lieven Vandenberghe, 2004 · livro. PDF gratuito oficial
- 🎓 [EE364a: Convex Optimization I](https://web.stanford.edu/class/ee364a/) — Stephen Boyd (Stanford) · curso
- 📖 [Numerical Optimization (2nd ed.)](https://link.springer.com/book/10.1007/978-0-387-40065-5) — Jorge Nocedal & Stephen J. Wright, 2006 · livro
- 📄 [Convex Optimization: Algorithms and Complexity](https://arxiv.org/abs/1405.4980) — Sébastien Bubeck, 2015 · paper
- 📄 [Adam: A Method for Stochastic Optimization](https://arxiv.org/abs/1412.6980) — Diederik P. Kingma & Jimmy Ba, 2014 · paper
- 🆕 [Gradient Descent on Neural Networks Typically Occurs at the Edge of Stability](https://arxiv.org/abs/2103.00065) — Jeremy Cohen, Simran Kaur, Yuanzhi Li, J. Zico Kolter & Ameet Talwalkar, 2021 · recente

## Boss fight

Implemente gradiente descendente, Newton, L-BFGS, SGD com momentum, Nesterov e Adam, mais um solucionador de programação quadrática por ADMM. Compare-os numa quadrática mal condicionada (confirmando a taxa teórica em função do número de condição), numa regressão logística regularizada (verificando numericamente as condições KKT na solução) e na função de Rosenbrock. Documente em que problema cada otimizador vence e por quê.

## Checkpoint

- [ ] Prove que todo mínimo local de uma função convexa é global.
- [ ] Para f(x) = ½xᵀAx com A simétrica positiva definida, qual o maior passo estável do gradiente descendente?
- [ ] Escreva as condições KKT para minimizar f(x) sujeito a g(x) ≤ 0.
- [ ] Por que o ruído do SGD pode ajudar a escapar de pontos de sela?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
