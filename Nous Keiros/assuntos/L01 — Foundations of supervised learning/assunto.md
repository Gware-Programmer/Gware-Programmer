# L01 — Foundations of supervised learning

*Fundamentos do aprendizado supervisionado*

- **Trilha:** Machine Learning
- **Nível:** 4 — A máquina de aprender · onda 1
- **Termos:** supervised learning, k-NN, loss function, train/test split, overfitting

## Por que importa

Aprendizado supervisionado é a forma mais simples e mais usada de aprender com dados: a partir de exemplos rotulados, achar uma função que acerte em exemplos novos. Aqui nascem os conceitos que atravessam toda a IA — perda, generalização, sobreajuste, validação.

## Pré-requisitos

- **Depende de:** C02 (NumPy: vectorization, broadcasting and memory layout), M14 (Single-variable differential calculus), M16 (Vectors and geometry in ℝⁿ), M22 (Probability: events, conditioning and Bayes)
- **Destrava:** L02 (Linear models and maximum likelihood)

## Base

1. O problema: dados (x, y), hipótese f, função de perda; risco empírico vs. risco verdadeiro.
2. Regressão vs. classificação.
3. k vizinhos mais próximos (k-NN): o modelo mais simples, sem treino algum **M16**.
4. Regressão linear em 1D ajustada por gradiente descendente, com a derivada do erro quadrático **M14**.
5. Treino, validação e teste — e por que separar.
6. Sobreajuste (overfitting), subajuste e complexidade do modelo.
7. Métricas: erro quadrático, acurácia, precisão, recall, F1, matriz de confusão **M22**.

## Meio

- Validação cruzada e vazamento de dados (data leakage).
- Normalização de features.
- Classes desbalanceadas e métricas adequadas (curvas ROC e precisão-recall).
- A maldição da dimensionalidade no k-NN.

## Avançado

- Aprendizado como minimização do risco empírico (ERM) e o que a teoria garante sobre isso → L07.
- Mudança de distribuição (distribution shift): treino e uso vêm de mundos diferentes — o problema central da IA no mundo real.
- "As duas culturas" (Breiman): modelagem estatística vs. modelagem algorítmica.

## Matemática necessária

**M14**: derivadas; **M16**: vetores e distâncias; **M22**: probabilidade.

## Métodos

- Implemente k-NN e regressão linear do zero em NumPy antes de tocar no scikit-learn.
- Em todo experimento, trace curvas de aprendizado (erro × tamanho do treino) e de complexidade.
- Só depois use bibliotecas, conferindo que reproduzem os seus números.

## Desafios

- Avaliar no treino, ou escolher hiperparâmetros olhando o teste (vazamento).
- Acurácia em classes desbalanceadas.
- Achar que mais features sempre ajudam.

## Fontes

- 📖 [An Introduction to Statistical Learning (with Applications in Python)](https://www.statlearning.com/) — Gareth James, Daniela Witten, Trevor Hastie, Robert Tibshirani & Jonathan Taylor, 2023 · livro. gratuito; o melhor primeiro livro
- 🎓 [CS229: Machine Learning](https://cs229.stanford.edu/) — Stanford · curso
- 📖 [Probabilistic Machine Learning: An Introduction](https://probml.github.io/pml-book/book1.html) — Kevin P. Murphy, 2022 · livro. PDF gratuito; cap. 1 e as partes de base
- 📄 [Statistical Modeling: The Two Cultures](https://doi.org/10.1214/ss/1009213726) — Leo Breiman, 2001 · paper

## Boss fight

Implemente do zero, em NumPy, k-NN, regressão linear por gradiente descendente e validação cruzada k-fold. Aplique a um dataset real de regressão e a um de classificação, produza curvas de aprendizado e de complexidade e um relatório que distinga com números sobreajuste de subajuste. Depois cometa de propósito três tipos de vazamento de dados e meça o quanto cada um infla o resultado.

## Checkpoint

- [ ] Qual a diferença entre risco empírico e risco verdadeiro?
- [ ] Por que não se escolhem hiperparâmetros olhando o conjunto de teste?
- [ ] O que acontece com o k-NN quando k = 1 e quando k = n?
- [ ] Quando a acurácia é uma métrica enganosa?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
