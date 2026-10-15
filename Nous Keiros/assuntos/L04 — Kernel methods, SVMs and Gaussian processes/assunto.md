# L04 — Kernel methods, SVMs and Gaussian processes

*Métodos de kernel, SVM e processos gaussianos*

- **Trilha:** Machine Learning
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** kernel methods, SVM, Gaussian processes

## Por que importa

Métodos de kernel são a ponte entre modelos lineares e funções arbitrárias, com teoria elegante e garantias. Processos gaussianos dão previsões com incerteza calibrada — e o neural tangent kernel mostra que redes muito largas se comportam como kernels.

## Pré-requisitos

- **Depende de:** L02 (Linear models and maximum likelihood), M25 (Bayesian inference, MCMC and variational inference), M27 (Convex and non-convex optimization)
- **Destrava:** —

## Base

1. O truque do kernel: produtos internos em espaços de features implícitos.
2. SVM de margem máxima, forma dual via KKT **M27**, vetores de suporte, margem suave.
3. Kernels comuns (linear, polinomial, RBF) e seus hiperparâmetros.
4. Regressão ridge com kernel.
5. Processos gaussianos: prior sobre funções, posterior e previsão com incerteza **M25**.
6. Escolha de kernel pela verossimilhança marginal.

## Meio

- Custo O(n³) e aproximações (Nyström, features aleatórias, GPs esparsos).
- Otimização bayesiana com GPs para funções caras.
- Composição de kernels.

## Avançado

- O neural tangent kernel, o regime "preguiçoso" e onde ele deixa de descrever redes reais → L26.
- RKHS com rigor → M35.
- GPs em neurociência e em RL (exploração guiada por incerteza).

## Matemática necessária

**M27**: dualidade e KKT; **M25**: inferência bayesiana; **M19**: álgebra linear.

## Métodos

- Derive a forma dual da SVM a partir das condições KKT.
- Implemente um GP do zero (com Cholesky) e visualize a incerteza.
- Use otimização bayesiana para ajustar hiperparâmetros de um modelo seu.

## Desafios

- Escalas diferentes entre features quebram kernels RBF.
- Tratar a variância do GP como incerteza "verdadeira" quando o kernel está errado.

## Fontes

- 📖 [Gaussian Processes for Machine Learning](http://gaussianprocess.org/gpml/) — Carl E. Rasmussen & Christopher K. I. Williams, 2006 · livro. PDF gratuito
- 📖 [Learning with Kernels](https://doi.org/10.7551/mitpress/4175.001.0001) — Bernhard Schölkopf & Alexander J. Smola, 2002 · livro
- 📄 [Support-vector networks](https://doi.org/10.1007/BF00994018) — Corinna Cortes & Vladimir Vapnik, 1995 · paper
- 📖 [Pattern Recognition and Machine Learning](https://www.microsoft.com/en-us/research/publication/pattern-recognition-machine-learning/) — Christopher M. Bishop, 2006 · livro. caps. 6–7
- 📄 [Random Features for Large-Scale Kernel Machines](https://proceedings.neurips.cc/paper/2007/hash/013a006f03dbc5392effeb8f18fda755-Abstract.html) — Ali Rahimi & Benjamin Recht, 2007 · paper

## Boss fight

Implemente uma SVM pelo problema dual (SMO simplificado), regressão por kernel e um GP com hiperparâmetros otimizados pela verossimilhança marginal. Use o GP para fazer otimização bayesiana dos hiperparâmetros da própria SVM e compare com busca aleatória em número de avaliações até o mesmo desempenho.

## Checkpoint

- [ ] Por que só os vetores de suporte importam na SVM?
- [ ] O que o truque do kernel evita calcular?
- [ ] Escreva a média e a variância posteriores de um GP.
- [ ] Qual o gargalo computacional dos GPs e como contorná-lo?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
