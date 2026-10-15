# P04 — Statistics so you don't fool yourself

*Estatística para não se enganar*

- **Trilha:** Research Craft
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** statistical significance, confidence intervals, multiple comparisons, preregistration, rliable

## Por que importa

A maioria dos erros em pesquisa não é de matemática: é de estatística mal usada — testar até dar significativo, comparações múltiplas, ausência de intervalos, uma semente só. O mínimo rigoroso — intervalos, testes adequados, pré-registro, métricas robustas — protege seus resultados e sua reputação.

## Pré-requisitos

- **Depende de:** P01 (Reading papers: the three-pass method), M25 (Bayesian inference, MCMC and variational inference)
- **Destrava:** L30 (LLM evaluation: benchmarks, contamination and harnesses), A07 (Agent evaluation), S09 (Adversarial collaborations and the empirical state of the field), P05 (Writing a paper)

## Base

1. O que um valor-p é e não é: a declaração da American Statistical Association (2016) **M24**.
2. Graus de liberdade do pesquisador e "psicologia de falso positivo" (Simmons, Nelson & Simonsohn).
3. O jardim dos caminhos que se bifurcam (Gelman & Loken): análises que dependem dos dados mesmo sem má-fé.
4. Comparações múltiplas e correções; tamanho de efeito; poder estatístico.
5. Intervalos por bootstrap e estatística para RL com poucas execuções: média interquartil e perfis de desempenho (Agarwal et al.) **M25**.
6. Barras de erro em avaliações de LLMs: perguntas agrupadas e erros-padrão por cluster (Miller, 2024).

## Meio

- Testes de significância em NLP: qual usar em cada situação (Dror et al.).
- Pré-registro: escrever a análise antes de ver os dados.
- Estatística bayesiana como alternativa: estimação e fatores de Bayes **M25**.

## Avançado

- Pré-registro em ML e na ciência da consciência → S09
- Avaliação de agentes com intervalos → A07
- Meta-ciência: por que tantos resultados falham ao ser replicados → F05

## Matemática necessária

**M24**: testes, intervalos e poder; **M25**: abordagem bayesiana; **M23**: distribuições e teorema central do limite.

## Métodos

- Para todo resultado seu: intervalo de confiança por bootstrap e tamanho de efeito.
- Use a biblioteca rliable para comparar agentes de RL com poucas execuções.
- Calcule erros-padrão agrupados numa avaliação de LLM sua.

## Desafios

- Testar até dar significativo.
- Confundir significância estatística com importância prática.

## Fontes

- 📄 [The ASA Statement on p-Values: Context, Process, and Purpose](https://doi.org/10.1080/00031305.2016.1154108) — Ronald L. Wasserstein & Nicole A. Lazar, 2016 · paper
- 📄 [False-Positive Psychology: Undisclosed Flexibility in Data Collection and Analysis Allows Presenting Anything as Significant](https://doi.org/10.1177/0956797611417632) — Joseph P. Simmons, Leif D. Nelson & Uri Simonsohn, 2011 · paper
- 📄 [The garden of forking paths: Why multiple comparisons can be a problem, even when there is no "fishing expedition" or "p-hacking" and the research hypothesis was posited ahead of time](http://www.stat.columbia.edu/~gelman/research/unpublished/p_hacking.pdf) — Andrew Gelman & Eric Loken, 2013 · paper
- 📄 [Deep Reinforcement Learning at the Edge of the Statistical Precipice](https://arxiv.org/abs/2108.13264) — Rishabh Agarwal, Max Schwarzer, Pablo Samuel Castro, Aaron Courville & Marc G. Bellemare, 2021 · paper
- 🆕 [Adding Error Bars to Evals: A Statistical Approach to Language Model Evaluations](https://arxiv.org/abs/2411.00640) — Evan Miller, 2024 · recente
- 📄 [The Hitchhiker's Guide to Testing Statistical Significance in Natural Language Processing](https://aclanthology.org/P18-1128/) — Rotem Dror, Gili Baumer, Segev Shlomov & Roi Reichart, 2018 · paper
- 🎓 [Statistical Rethinking (2024)](https://github.com/rmcelreath/stat_rethinking_2024) — Richard McElreath · curso. aulas em vídeo e código

## Boss fight

Faça uma auditoria estatística dos seus próprios experimentos anteriores, de qualquer trilha: recalcule cada afirmação com intervalos por bootstrap, tamanho de efeito e correção para comparações múltiplas — e, para RL, com média interquartil e perfis de desempenho. Depois simule o jardim dos caminhos que se bifurcam: gere dados sem efeito nenhum, aplique 20 análises "razoáveis" e conte quantas dão p < 0,05.

## Checkpoint

- [ ] O que um valor-p significa — e o que ele não significa?
- [ ] O que são graus de liberdade do pesquisador?
- [ ] Por que a média interquartil com intervalos por bootstrap é preferível à média simples em RL?
- [ ] Por que perguntas agrupadas exigem erros-padrão por cluster?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
