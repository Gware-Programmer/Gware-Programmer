# M24 — Statistics and frequentist inference

*Estatística e inferência frequentista*

- **Trilha:** Mathematics
- **Nível:** 5 — A matemática do aprendizado · onda 1
- **Termos:** statistics, estimation, maximum likelihood, confidence intervals, hypothesis testing, bootstrap

## Por que importa

Toda afirmação empírica em IA — "o modelo A é melhor que o B", "o efeito existe" — é uma inferência estatística. A máxima verossimilhança está por trás da maioria das funções de perda; intervalos e testes são o que impede você de se enganar com ruído.

## Pré-requisitos

- **Depende de:** M19 (Linear algebra III: SVD, PCA, projections and least squares), M23 (Continuous random variables, distributions and limit theorems)
- **Destrava:** M25 (Bayesian inference, MCMC and variational inference), M38 (Causal inference), L02 (Linear models and maximum likelihood), L29 (Data for LLMs: collection, filtering, deduplication, mixtures and synthetic data)

## Base

1. Amostra, estatística e estimador; viés, variância e erro quadrático médio.
2. Máxima verossimilhança (MLE) para Bernoulli e normal; log-verossimilhança.
3. Propriedades assintóticas do MLE: consistência, normalidade assintótica, informação de Fisher.
4. Intervalos de confiança e sua interpretação correta.
5. Testes de hipótese: hipótese nula, p-valor, erros tipo I e II, poder.
6. Bootstrap para quantificar incerteza.
7. Regressão linear como modelo estatístico: erros gaussianos ⇒ mínimos quadrados = MLE **M19**.

## Meio

- Testes t, qui-quadrado, de permutação e não paramétricos.
- Comparações múltiplas (Bonferroni, Benjamini–Hochberg).
- Tamanho de efeito, poder e planejamento de amostra.
- Validação cruzada como estimativa de erro de generalização.

## Avançado

- Crise de replicação e o "jardim dos caminhos que se bifurcam" (Gelman & Loken) — a base do ofício em → P04.
- Avaliações de LLMs como experimentos estatísticos: erros-padrão, perguntas agrupadas, comparação pareada → A07.
- Bootstrap vs. teoria assintótica; inferência depois de selecionar o modelo.

## Matemática necessária

**M23**: distribuições, LGN e TCL; **M19**: mínimos quadrados.

## Métodos

- Derive MLEs à mão e confirme otimizando numericamente.
- Simule a cobertura de intervalos de confiança: um IC de 95% deve cobrir o valor verdadeiro em ~95% das repetições.
- Pegue uma tabela de benchmark de um paper e recalcule a incerteza das diferenças.

## Desafios

- "P-valor é a probabilidade de a hipótese nula ser verdadeira": errado.
- IC de 95% não é "95% de probabilidade de o parâmetro estar no intervalo" (na leitura frequentista).
- Testar muitas hipóteses e reportar só a significativa.
- Confundir significância estatística com relevância prática.

## Fontes

- 📖 [All of Statistics](https://link.springer.com/book/10.1007/978-0-387-21736-9) — Larry Wasserman, 2004 · livro. conciso, escrito para quem vem da computação
- 🎓 [Statistics for Applications (18.650)](https://ocw.mit.edu/courses/18-650-statistics-for-applications-fall-2016/) — Philippe Rigollet (MIT OpenCourseWare) · curso
- 📖 [Introductory Statistics 2e](https://openstax.org/details/books/introductory-statistics-2e) — Barbara Illowsky & Susan Dean (OpenStax), 2023 · livro. para reforçar a base, se precisar
- 📄 [Adding Error Bars to Evals: A Statistical Approach to Language Model Evaluations](https://arxiv.org/abs/2411.00640) — Evan Miller, 2024 · paper. estatística aplicada a benchmarks de LLM
- 📰 [The garden of forking paths](http://www.stat.columbia.edu/~gelman/research/unpublished/p_hacking.pdf) — Andrew Gelman & Eric Loken, 2013 · artigo. por que a análise flexível gera falsos achados

## Boss fight

Escolha um paper de ML que afirme superioridade em benchmark com poucas sementes. Com os números reportados, refaça a comparação com bootstrap, teste de permutação e correção para comparações múltiplas, e calcule o poder do experimento. Entregue um parecer de uma página: a conclusão se sustenta? Anexe uma simulação de cobertura de ICs que demonstre a interpretação correta de "95%".

## Checkpoint

- [ ] Derive o MLE de μ e σ² para dados normais. O estimador de σ² é viesado?
- [ ] O que exatamente significa um p-valor de 0,03?
- [ ] Por que testar 20 hipóteses independentes a 5% produz, em média, um falso positivo?
- [ ] Para que serve o bootstrap e qual a sua hipótese central?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
