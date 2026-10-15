# L03 — Decision trees, ensembles and boosting

*Árvores de decisão, ensembles e boosting*

- **Trilha:** Machine Learning
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** decision trees, random forests, gradient boosting

## Por que importa

Em dados tabulares, árvores com boosting ainda vencem redes profundas com frequência. Ensembles mostram o princípio de combinar modelos fracos para reduzir variância, e árvores são interpretáveis por construção — um contraponto útil às redes.

## Pré-requisitos

- **Depende de:** L02 (Linear models and maximum likelihood), M26 (Information theory)
- **Destrava:** —

## Base

1. Árvores de decisão: divisão por impureza (ganho de informação pela entropia **M26**, Gini) e poda.
2. Viés e variância de árvores profundas.
3. Bagging e florestas aleatórias (random forests); erro out-of-bag.
4. Boosting: AdaBoost; gradient boosting como gradiente descendente no espaço de funções.
5. Importância de features e suas armadilhas.

## Meio

- XGBoost, LightGBM e CatBoost: regularização, histogramas, variáveis categóricas.
- Valores de Shapley (SHAP) para explicação — e seus limites.
- Ajuste de hiperparâmetros e parada antecipada.

## Avançado

- Por que árvores ainda vencem em dados tabulares, e a chegada de modelos de fundação tabulares.
- Boosting, margens e teoria do aprendizado → L07.
- Extração de regras simbólicas a partir de modelos opacos.

## Matemática necessária

**M26**: entropia; **M24**: estatística.

## Métodos

- Implemente CART e gradient boosting do zero e compare com XGBoost.
- Num dataset tabular real, compare árvore, floresta, boosting e regressão logística com o mesmo esforço de ajuste.

## Desafios

- Importância por impureza enviesada a favor de features com muitos valores.
- Vazamento ao codificar variáveis categóricas pelo alvo (target encoding).

## Fontes

- 📖 [The Elements of Statistical Learning (2ª ed.)](https://doi.org/10.1007/978-0-387-84858-7) — Trevor Hastie, Robert Tibshirani & Jerome Friedman, 2009 · livro. caps. 9, 10 e 15; os autores mantêm um PDF gratuito no site do livro
- 📖 [An Introduction to Statistical Learning (with Applications in Python)](https://www.statlearning.com/) — James, Witten, Hastie, Tibshirani & Taylor, 2023 · livro. cap. 8
- 📄 [Random Forests](https://doi.org/10.1023/A:1010933404324) — Leo Breiman, 2001 · paper
- 📄 [Greedy function approximation: A gradient boosting machine](https://doi.org/10.1214/aos/1013203451) — Jerome H. Friedman, 2001 · paper
- 📄 [XGBoost: A Scalable Tree Boosting System](https://arxiv.org/abs/1603.02754) — Tianqi Chen & Carlos Guestrin, 2016 · paper
- 🆕 [Why do tree-based models still outperform deep learning on tabular data?](https://arxiv.org/abs/2207.08815) — Léo Grinsztajn, Edouard Oyallon & Gaël Varoquaux, 2022 · recente

## Boss fight

Implemente do zero uma árvore CART, uma floresta aleatória e gradient boosting (perdas quadrática e logística). Em três datasets tabulares públicos, compare-os com XGBoost e com regressão logística sob o mesmo orçamento de ajuste e validação honesta; reporte com intervalos de confiança e explique quando cada um vence.

## Checkpoint

- [ ] Como uma árvore escolhe a melhor divisão?
- [ ] Por que bagging reduz variância e não viés?
- [ ] Em que sentido gradient boosting é gradiente descendente?
- [ ] Por que a importância por impureza pode enganar?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
