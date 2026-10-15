# M25 — Bayesian inference, MCMC and variational inference

*Inferência bayesiana, MCMC e inferência variacional*

- **Trilha:** Mathematics
- **Nível:** 5 — A matemática do aprendizado · onda 2
- **Termos:** Bayesian inference, MCMC, variational inference, ELBO

## Por que importa

Bayes é a matemática de raciocinar com incerteza: o "cérebro bayesiano", a codificação preditiva, a inferência ativa, os VAEs e a difusão usam inferência aproximada. MCMC e inferência variacional são as duas grandes máquinas para quando a posterior não tem fórmula fechada.

## Pré-requisitos

- **Depende de:** M24 (Statistics and frequentist inference), M26 (Information theory)
- **Destrava:** L04 (Kernel methods, SVMs and Gaussian processes), L05 (Unsupervised learning and dimensionality reduction), L06 (Probabilistic graphical models and filtering), L19 (Latent generative models: VAEs, flows and GANs), L24 (Continual learning, meta-learning and in-context learning), L33 (Energy-based models), G06 (Reasoning, concepts and Bayesian cognition), N09 (Predictive coding), P04 (Statistics so you don't fool yourself)

## Base

1. Prior, verossimilhança, posterior e evidência; posterior ∝ verossimilhança × prior.
2. Conjugação: beta-binomial, normal-normal, Dirichlet-multinomial.
3. MAP vs. média posterior; distribuição preditiva posterior.
4. Modelos hierárquicos e pooling parcial.
5. Comparação de modelos: evidência (verossimilhança marginal), fator de Bayes, a navalha de Occam bayesiana.
6. MCMC: Metropolis–Hastings e Gibbs; diagnósticos de convergência.
7. Inferência variacional (VI): família aproximadora, ELBO e KL(q‖p) **M26**.

## Meio

- Hamiltonian Monte Carlo (HMC) e NUTS (Stan, PyMC).
- Aproximação de Laplace.
- VI de campo médio e VI estocástica com o truque de reparametrização (reparameterization trick).
- Checagens preditivas posteriores e o fluxo de trabalho bayesiano (Gelman).

## Avançado

- Inferência amortizada (VAEs) → L19 e difusão como VI hierárquica → L20.
- O cérebro como máquina de inferência: codificação preditiva e energia livre como VI → N09→ N10.
- Limites do "bayesiano": priors mal especificados, posteriores multimodais, custo computacional — e a crítica de que o rótulo "bayesiano" vira descrição vazia em ciência cognitiva (Bowers & Davis, 2012).

## Matemática necessária

**M24**: verossimilhança e MLE; **M26**: entropia e KL; **M23**: distribuições contínuas.

## Métodos

- Faça Statistical Rethinking (McElreath) inteiro: aulas, código e exercícios.
- Implemente Metropolis–Hastings e HMC do zero e compare com PyMC/Stan nos mesmos modelos.
- Derive a ELBO duas vezes: por Jensen e pela decomposição da KL.

## Desafios

- Prior "não informativo" depende da parametrização: não existe neutralidade gratuita.
- Cadeias que parecem convergir e não convergiram (multimodalidade).
- KL(q‖p) vs. KL(p‖q): a VI usual subestima a variância (mode-seeking).

## Fontes

- 📖 [Statistical Rethinking (2ª ed.)](https://xcelab.net/rm/) — Richard McElreath, 2020 · livro. a melhor formação prática em modelagem bayesiana
- 🎓 [Statistical Rethinking 2026 — aulas e materiais](https://github.com/rmcelreath/stat_rethinking_2026) — Richard McElreath · curso
- 📖 [Bayesian Data Analysis (3ª ed.)](https://sites.stat.columbia.edu/gelman/book/) — Gelman, Carlin, Stern, Dunson, Vehtari & Rubin, 2013 · livro. PDF gratuito oficial; a referência
- 📄 [Variational Inference: A Review for Statisticians](https://arxiv.org/abs/1601.00670) — David M. Blei, Alp Kucukelbir & Jon D. McAuliffe, 2017 · paper
- 📄 [A Conceptual Introduction to Hamiltonian Monte Carlo](https://arxiv.org/abs/1701.02434) — Michael Betancourt, 2017 · paper

## Boss fight

Implemente do zero Metropolis–Hastings, HMC e inferência variacional de campo médio com reparametrização para um modelo hierárquico (por exemplo, taxas de sucesso de vários agentes com poucos dados cada). Compare as posteriores com PyMC ou Stan, reporte diagnósticos (R̂, tamanho efetivo de amostra) e documente um caso concreto em que a VI subestima a incerteza.

## Checkpoint

- [ ] Derive a posterior de uma moeda com prior Beta(2, 2) após 7 caras em 10 lançamentos.
- [ ] Derive a ELBO e explique por que maximizá-la minimiza KL(q‖p).
- [ ] Por que o HMC explora melhor que Metropolis em alta dimensão?
- [ ] O que é pooling parcial e por que ajuda quando cada grupo tem poucos dados?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
