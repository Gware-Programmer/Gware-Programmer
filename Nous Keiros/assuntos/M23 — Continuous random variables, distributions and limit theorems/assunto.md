# M23 — Continuous random variables, distributions and limit theorems

*Variáveis contínuas, distribuições e teoremas-limite*

- **Trilha:** Mathematics
- **Nível:** 4 — A máquina de aprender · onda 2
- **Termos:** continuous random variables, Gaussian, law of large numbers, central limit theorem, concentration

## Por que importa

Ruído, inicialização de pesos, ativações e dados reais são contínuos. A gaussiana, a lei dos grandes números e o teorema central do limite explicam por que médias funcionam, por que o SGD funciona e por que alta dimensão é estranha. A concentração de medida é a base da teoria do aprendizado.

## Pré-requisitos

- **Depende de:** M18 (Linear algebra II: determinants, eigenvalues and the spectral theorem), M20 (Multivariable calculus and gradients), M22 (Probability: events, conditioning and Bayes)
- **Destrava:** M24 (Statistics and frequentist inference), M26 (Information theory), M29 (Stochastic processes and stochastic differential equations), M34 (Measure theory and rigorous probability), R01 (Bandits and the exploration–exploitation dilemma), G02 (Perception, attention and signal detection), X04 (Evolutionary computation and neuroevolution)

## Base

1. Variáveis contínuas: densidade (pdf), função acumulada (cdf); P(a ≤ X ≤ b) = ∫ f.
2. Esperança e variância de contínuas; mudança de variável em densidades **M20**.
3. Uniforme, exponencial, normal, beta e gama.
4. Vetores aleatórios: densidade conjunta, marginais e condicionais; covariância, correlação e matriz de covariância **M18**.
5. Gaussiana multivariada: densidade, marginais e condicionais.
6. Lei dos grandes números e teorema central do limite.
7. Desigualdades de concentração: Markov, Chebyshev e Hoeffding.

## Meio

- Funções geradoras de momentos e somas de variáveis independentes.
- Amostragem: inversa da cdf, Box–Muller, aceitação-rejeição.
- A gaussiana em alta dimensão vive numa casca de raio ≈ √d.
- Processos de Markov com estado contínuo (noção).

## Avançado

- Concentração de medida (Bernstein, McDiarmid): o motor dos limites de generalização → L07.
- Matrizes aleatórias e a inicialização de redes (Glorot, He) → L09.
- Por que "densidade" só fica rigorosa com teoria da medida → M34.

## Matemática necessária

**M22**: probabilidade discreta; **M20**: integrais múltiplas e mudança de variáveis; **M18**: matrizes semidefinidas positivas.

## Métodos

- Simule tudo: confirme LGN, TCL e Hoeffding com histogramas.
- Derive a densidade da soma de duas uniformes à mão e por simulação.
- Desenhe gaussianas 2D com covariâncias diferentes: as elipses são os autovetores.

## Desafios

- Densidade não é probabilidade (pode ser maior que 1).
- O TCL exige variância finita; caudas pesadas (Cauchy) destroem a intuição.
- Correlação zero não implica independência, exceto para gaussianas conjuntas.

## Fontes

- 📖 [Introduction to Probability (2ª ed.)](http://probabilitybook.net/) — Joseph K. Blitzstein & Jessica Hwang, 2019 · livro. caps. 5–10
- 🎬 [Statistics 110: Probability (Harvard)](https://www.youtube.com/playlist?list=PL2SOU6wwxB0uwwH80KTQ6ht66KWxbzTIo) — Joe Blitzstein · video
- 🎓 [Probabilistic Systems Analysis and Applied Probability (6.041SC)](https://ocw.mit.edu/courses/6-041sc-probabilistic-systems-analysis-and-applied-probability-fall-2013/) — John Tsitsiklis (MIT OpenCourseWare) · curso
- 📖 [Mathematics for Machine Learning](https://mml-book.com/) — Deisenroth, Faisal & Ong, 2020 · livro. cap. 6

## Boss fight

Escreva um laboratório de distribuições: amostradores do zero (inversa da cdf, Box–Muller, rejeição) para uniforme, exponencial, normal, beta e gaussiana multivariada via Cholesky, validados contra médias, variâncias, covariâncias e histogramas teóricos. Demonstre empiricamente a LGN, o TCL e a falha do TCL com a Cauchy, e o limite de Hoeffding; mostre que a norma de uma gaussiana em 1000 dimensões se concentra perto de √1000.

## Checkpoint

- [ ] Se X ~ N(μ, σ²), qual a distribuição de aX + b?
- [ ] Dê um exemplo de variáveis não correlacionadas e dependentes.
- [ ] Enuncie o TCL e diga quando ele falha.
- [ ] Pela desigualdade de Hoeffding, quantos lançamentos de moeda bastam para estimar p com erro menor que 0,05 e confiança de 95%?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
