# L02 — Linear models and maximum likelihood

*Modelos lineares e máxima verossimilhança*

- **Trilha:** Machine Learning
- **Nível:** 5 — A matemática do aprendizado · onda 2
- **Termos:** linear regression, logistic regression, softmax, regularization, MLE

## Por que importa

Modelos lineares são o átomo do deep learning: uma rede é uma pilha de transformações lineares com não linearidades. Regressão logística e softmax com entropia cruzada são exatamente a última camada de qualquer classificador — inclusive de um LLM escolhendo o próximo token.

## Pré-requisitos

- **Depende de:** L01 (Foundations of supervised learning), M24 (Statistics and frequentist inference)
- **Destrava:** L03 (Decision trees, ensembles and boosting), L04 (Kernel methods, SVMs and Gaussian processes), L05 (Unsupervised learning and dimensionality reduction), L06 (Probabilistic graphical models and filtering), L07 (Statistical learning theory), L08 (Neural networks and backpropagation)

## Base

1. Regressão linear multivariada: mínimos quadrados **M19** e gradiente **M20**.
2. Interpretação probabilística: ruído gaussiano ⇒ mínimos quadrados = máxima verossimilhança **M24**.
3. Regressão logística: sigmoide, verossimilhança de Bernoulli, entropia cruzada binária.
4. Regressão softmax (multinomial) e entropia cruzada categórica.
5. Regularização L2 (ridge) e L1 (lasso); leitura bayesiana como prior (estimativa MAP).
6. Features não lineares (polinomiais, RBF) com modelo linear nos parâmetros.
7. Modelos lineares generalizados (GLMs) como família.

## Meio

- Convexidade da perda logística; Newton/IRLS.
- Calibração de probabilidades.
- Dados linearmente separáveis e a divergência dos pesos sem regularização.
- Seleção de modelo por validação vs. critérios de informação (AIC, BIC).

## Avançado

- O LLM como regressão softmax gigante sobre representações aprendidas (a camada de "unembedding") → L15.
- Sondas lineares (linear probes) da interpretabilidade são regressões logísticas → I02.
- Viés implícito: em dados separáveis, o gradiente descendente na regressão logística converge para a direção de margem máxima (Soudry et al.) → L26.

## Matemática necessária

**M24**: máxima verossimilhança; **M19**: mínimos quadrados; **M20**: gradientes.

## Métodos

- Derive à mão o gradiente da entropia cruzada com softmax: dá ŷ − y, o resultado mais útil (e bonito) do assunto.
- Implemente logística e softmax do zero e confira contra o scikit-learn.
- Desenhe fronteiras de decisão 2D com e sem features não lineares.

## Desafios

- Usar regressão linear para classificar.
- Esquecer o intercepto — ou regularizá-lo.
- Confundir logit, probabilidade e log-odds.

## Fontes

- 📖 [An Introduction to Statistical Learning (with Applications in Python)](https://www.statlearning.com/) — James, Witten, Hastie, Tibshirani & Taylor, 2023 · livro. caps. 3, 4 e 6
- 📖 [Pattern Recognition and Machine Learning](https://www.microsoft.com/en-us/research/publication/pattern-recognition-machine-learning/) — Christopher M. Bishop, 2006 · livro. caps. 3–4; PDF gratuito
- 📖 [Probabilistic Machine Learning: An Introduction](https://probml.github.io/pml-book/book1.html) — Kevin P. Murphy, 2022 · livro. caps. de regressão linear e logística
- 🎓 [CS229: Machine Learning](https://cs229.stanford.edu/) — Stanford · curso
- 🆕 [The Implicit Bias of Gradient Descent on Separable Data](https://arxiv.org/abs/1710.10345) — Daniel Soudry, Elad Hoffer, Mor Shpigel Nacson, Suriya Gunasekar & Nathan Srebro, 2018 · recente

## Boss fight

Implemente do zero regressão linear (forma fechada e gradiente), logística e softmax com regularização L1/L2, com gradientes derivados à mão e verificados. Treine a softmax no MNIST — sem rede nenhuma — até perto de 92% de acurácia, visualize os pesos de cada classe como imagens, calibre as probabilidades e demonstre empiricamente o resultado de Soudry: em dados separáveis, a direção dos pesos tende à de margem máxima.

## Checkpoint

- [ ] Derive ∂L/∂z da entropia cruzada com softmax.
- [ ] Por que ruído gaussiano leva a mínimos quadrados, e ruído laplaciano ao erro absoluto?
- [ ] Qual a leitura bayesiana da regularização L2?
- [ ] O que acontece com os pesos da regressão logística em dados separáveis sem regularização?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
