# M20 — Multivariable calculus and gradients

*Cálculo multivariável e gradientes*

- **Trilha:** Mathematics
- **Nível:** 4 — A máquina de aprender · onda 1
- **Termos:** multivariable calculus, partial derivatives, gradient, Jacobian, Hessian

## Por que importa

Uma rede neural tem milhões de parâmetros; a perda é uma função de milhões de variáveis. Gradiente, Jacobiano e Hessiana dizem em que direção mudar cada parâmetro — o coração do treinamento.

## Pré-requisitos

- **Depende de:** M15 (Integral calculus and Taylor series), M17 (Linear algebra I: matrices, linear systems and vector spaces)
- **Destrava:** M21 (Matrix calculus), M23 (Continuous random variables, distributions and limit theorems), M28 (Differential equations and dynamical systems), C04 (PyTorch: tensors, autograd and the training loop)

## Base

1. Funções de várias variáveis; curvas de nível e superfícies.
2. Derivadas parciais; gradiente ∇f como direção de maior subida, ortogonal às curvas de nível.
3. Derivada direcional.
4. Regra da cadeia multivariável, com diagrama de dependências.
5. Jacobiano de funções vetoriais e Hessiana.
6. Pontos críticos: mínimos, máximos e selas; teste pela Hessiana.
7. Integrais múltiplas e mudança de variáveis com o determinante do Jacobiano; ∫ e^(−x²) dx = √π via coordenadas polares.

## Meio

- Multiplicadores de Lagrange (otimização com restrições).
- Taylor de 2ª ordem em várias variáveis: f(x + h) ≈ f + ∇fᵀh + ½hᵀHh.
- Gradiente descendente em 2D: trajetórias em vales estreitos e o efeito do condicionamento.
- Teorema de Fubini.

## Avançado

- Pontos de sela dominam em alta dimensão (Dauphin et al., 2014) → M27.
- Fluxos normalizantes (normalizing flows): densidades transformadas pelo determinante do Jacobiano → L19.
- Cálculo vetorial (divergente, rotacional, Stokes), útil em física, campos e dinâmica → M28.

## Matemática necessária

**M15**: integrais e Taylor; **M17**: matrizes; **M14**: derivadas.

## Métodos

- MIT 18.02SC para teoria e exercícios; visualize gradientes como campos de setas.
- Anime o gradiente descendente em funções 2D clássicas (Rosenbrock, Himmelblau).
- Derive à mão o gradiente do erro quadrático médio de uma regressão linear e confira por diferenças finitas.

## Desafios

- Confundir o gradiente (vetor no domínio) com a superfície.
- Hessiana indefinida não indica máximo: indica sela.
- Esquecer o determinante do Jacobiano ao mudar variáveis em densidades — erro clássico.

## Fontes

- 🎓 [Multivariable Calculus (18.02SC)](https://ocw.mit.edu/courses/18-02sc-multivariable-calculus-fall-2010/) — MIT OpenCourseWare · curso
- 📖 [Calculus Volume 3](https://openstax.org/details/books/calculus-volume-3) — Gilbert Strang & Edwin Herman (OpenStax), 2016 · livro. caps. 4–5
- 📖 [Mathematics for Machine Learning](https://mml-book.com/) — Deisenroth, Faisal & Ong, 2020 · livro. cap. 5 (cálculo vetorial)
- 📖 [Calculus (3rd ed.)](https://ocw.mit.edu/courses/res-18-001-calculus-fall-2023/) — Gilbert Strang (MIT OCW RES.18-001), 2017 · livro. caps. 13–15
- 📄 [Identifying and Attacking the Saddle Point Problem in High-Dimensional Non-Convex Optimization](https://arxiv.org/abs/1406.2572) — Dauphin, Pascanu, Gulcehre, Cho, Ganguli & Bengio, 2014 · paper. leitura do AVANÇADO

## Boss fight

Escreva um visualizador de otimização: para f(x, y) dada (Rosenbrock, Himmelblau, uma sela), plote curvas de nível, o campo de gradientes e as trajetórias de gradiente descendente e de Newton, com gradientes e Hessianas analíticos conferidos por diferenças finitas. Classifique todos os pontos críticos pela Hessiana e confirme no gráfico. Por fim, calcule ∫∫ e^(−(x² + y²)) dx dy por coordenadas polares e confira com Monte Carlo.

## Checkpoint

- [ ] Calcule ∇f e a Hessiana de f(x, y) = x²y + e^(xy).
- [ ] Por que o gradiente é ortogonal às curvas de nível?
- [ ] Classifique o ponto crítico de f(x, y) = x² − y².
- [ ] Por que aparece |det J| numa mudança de variáveis de integral dupla?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
