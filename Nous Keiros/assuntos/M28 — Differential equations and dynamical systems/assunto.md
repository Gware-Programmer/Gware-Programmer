# M28 — Differential equations and dynamical systems

*Equações diferenciais e sistemas dinâmicos*

- **Trilha:** Mathematics
- **Nível:** 5 — A matemática do aprendizado · onda 1
- **Termos:** ODEs, dynamical systems, stability, bifurcation, chaos
- **Projetos KEIROS:** Campo Ressonante, Rei Ichi

## Por que importa

Neurônios, redes recorrentes, circuitos de controle, inferência ativa e difusão são sistemas dinâmicos: estados que evoluem por regras. Estabilidade, atratores e bifurcações explicam memória, oscilações cerebrais, caos e o comportamento de longo prazo de qualquer sistema que você construir — inclusive os estados internos do Rei Ichi.

## Pré-requisitos

- **Depende de:** M18 (Linear algebra II: determinants, eigenvalues and the spectral theorem), M20 (Multivariable calculus and gradients)
- **Destrava:** M29 (Stochastic processes and stochastic differential equations), L11 (Recurrent networks and sequence modeling), R11 (Optimal control and RL theory), N02 (Neuron models), X01 (Cybernetics and control theory)

## Base

1. EDO como lei de mudança dx/dt = f(x); campo de direções; condições iniciais.
2. EDOs de 1ª ordem: lineares e separáveis; crescimento e decaimento exponencial.
3. Sistemas lineares dx/dt = Ax resolvidos por autovalores: nós, selas, focos e centros **M18**.
4. Retrato de fase (phase portrait); pontos fixos e linearização pela Jacobiana **M20**.
5. Estabilidade: parte real dos autovalores; funções de Lyapunov (noção).
6. Osciladores harmônico e amortecido; ciclos-limite.
7. Métodos numéricos: Euler, Runge–Kutta 4; estabilidade numérica e escolha do passo.

## Meio

- Bifurcações (sela-nó, Hopf) e histerese.
- Sistemas não lineares 2D clássicos: FitzHugh–Nagumo (neurônio) e Lotka–Volterra.
- Caos: Lorenz, mapa logístico, expoentes de Lyapunov, sensibilidade às condições iniciais.
- Sistemas discretos xₜ₊₁ = f(xₜ) — o que uma RNN é.

## Avançado

- Redes como sistemas dinâmicos: neural ODEs, RNNs no limite do caos, atratores contínuos → N05.
- Teoria de Koopman e redução de dimensionalidade dinâmica de populações neurais.
- EDEs e difusão como dinâmica estocástica → M29.

## Matemática necessária

**M20**: Jacobiana e gradiente; **M18**: autovalores; **M11**: complexos (autovalores complexos ↔ oscilação).

## Métodos

- Strogatz, livro e aulas: faça os exercícios com papel e simulação lado a lado.
- Implemente Euler, RK4 e um plotador de retratos de fase; varie parâmetros e veja bifurcações acontecerem.
- Linearize à mão e confirme numericamente a natureza de cada ponto fixo.

## Desafios

- Confiar em Euler com passo grande: a instabilidade numérica parece "física".
- Achar que caos é aleatoriedade: é determinismo com sensibilidade extrema.
- Pular a linearização e tentar entender sistemas não lineares só simulando.

## Fontes

- 📖 [Nonlinear Dynamics and Chaos (3ª ed.)](https://doi.org/10.1201/9780429398490) — Steven H. Strogatz, 2024 · livro. o livro do assunto
- 🎬 [Nonlinear Dynamics and Chaos (Cornell MAE 5790)](https://www.youtube.com/playlist?list=PLbN57C5Zdl6j_qJA-pARJnKsmROzPnO9V) — Steven Strogatz · video. as aulas do próprio autor
- 🎓 [Differential Equations (18.03SC)](https://ocw.mit.edu/courses/18-03sc-differential-equations-fall-2011/) — MIT OpenCourseWare · curso
- 📄 [Neural Ordinary Differential Equations](https://arxiv.org/abs/1806.07366) — Ricky T. Q. Chen, Yulia Rubanova, Jesse Bettencourt & David Duvenaud, 2018 · paper. leitura do AVANÇADO

## Boss fight

Escreva um explorador de sistemas dinâmicos: integradores Euler e RK4 com passo adaptativo, retratos de fase 2D com campo de direções, detecção e classificação automática de pontos fixos pela Jacobiana, diagramas de bifurcação (mapa logístico; Hopf no FitzHugh–Nagumo) e estimativa do maior expoente de Lyapunov do sistema de Lorenz. Por fim, aplique-o ao vetor de estado de um subsistema do Rei Ichi (o Campo Ressonante é um bom candidato) e classifique seus pontos fixos e atratores.

## Checkpoint

- [ ] Classifique o ponto fixo de dx/dt = Ax com A = [[0, 1], [−2, −3]].
- [ ] O que é uma bifurcação de Hopf? Dê um exemplo neural.
- [ ] Por que Euler explícito pode divergir num sistema estável com passo grande?
- [ ] O que mede o expoente de Lyapunov?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
