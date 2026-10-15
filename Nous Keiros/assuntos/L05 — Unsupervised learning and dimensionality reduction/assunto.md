# L05 — Unsupervised learning and dimensionality reduction

*Aprendizado não supervisionado e redução de dimensionalidade*

- **Trilha:** Machine Learning
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** clustering, k-means, EM, GMM, PCA, t-SNE, UMAP

## Por que importa

A maior parte dos dados não tem rótulo. Achar estrutura — grupos, eixos, variedades — é o que o cérebro faz o tempo todo e o que o pré-treino auto-supervisionado faz em escala. É também a ferramenta básica para visualizar representações internas de redes e de cérebros.

## Pré-requisitos

- **Depende de:** L02 (Linear models and maximum likelihood), M25 (Bayesian inference, MCMC and variational inference)
- **Destrava:** —

## Base

1. k-means e k-means++; escolha de k.
2. Mistura de gaussianas (GMM) e o algoritmo EM **M25**.
3. PCA como modelo (PCA probabilística) **M19**.
4. Clustering hierárquico e por densidade (DBSCAN).
5. Visualização não linear: t-SNE e UMAP — e como lê-los sem se enganar.
6. Estimação de densidade por kernel (KDE).

## Meio

- Autoencoders lineares recuperam o PCA → L19.
- Análise de componentes independentes (ICA) e separação de fontes (essencial em EEG).
- Modelos de variáveis latentes e identificabilidade.
- Métricas de clustering e seus limites.

## Avançado

- Codificação esparsa (Olshausen & Field): a ponte para V1 e para os dicionários esparsos da interpretabilidade → N04→ I05.
- Auto-supervisão como "não supervisionado com tarefa": a revolução do pré-treino → L12.
- Redução de dimensionalidade de dinâmicas neurais (jPCA, GPFA, LFADS) → N05.

## Matemática necessária

**M25**: EM e inferência; **M19**: PCA e SVD; **M23**: gaussianas.

## Métodos

- Implemente k-means, EM para GMM e PCA do zero; teste em dados sintéticos com resposta conhecida.
- Leia "How to Use t-SNE Effectively" e reproduza as armadilhas.
- Use ICA para separar fontes misturadas (áudio ou EEG sintético).

## Desafios

- Interpretar distâncias e tamanhos de clusters em t-SNE e UMAP.
- k-means em clusters não esféricos.
- EM preso em ótimos locais.

## Fontes

- 📖 [Pattern Recognition and Machine Learning](https://www.microsoft.com/en-us/research/publication/pattern-recognition-machine-learning/) — Christopher M. Bishop, 2006 · livro. caps. 9 (misturas e EM) e 12 (PCA)
- 📖 [An Introduction to Statistical Learning (with Applications in Python)](https://www.statlearning.com/) — James, Witten, Hastie, Tibshirani & Taylor, 2023 · livro. cap. 12
- 📄 [Visualizing Data using t-SNE](https://jmlr.org/papers/v9/vandermaaten08a.html) — Laurens van der Maaten & Geoffrey Hinton, 2008 · paper
- 📰 [How to Use t-SNE Effectively](https://distill.pub/2016/misread-tsne/) — Martin Wattenberg, Fernanda Viégas & Ian Johnson, 2016 · artigo
- 📄 [UMAP: Uniform Manifold Approximation and Projection for Dimension Reduction](https://arxiv.org/abs/1802.03426) — Leland McInnes, John Healy & James Melville, 2018 · paper
- 📄 [Emergence of simple-cell receptive field properties by learning a sparse code for natural images](https://doi.org/10.1038/381607a0) — Bruno A. Olshausen & David J. Field, 1996 · paper
- 🎓 [CS229: Machine Learning](https://cs229.stanford.edu/) — Andrew Ng, Tengyu Ma et al. (Stanford) · curso. aulas em vídeo e listas com código
- 🔧 [scikit-learn: User Guide](https://scikit-learn.org/stable/user_guide.html) — Projeto scikit-learn · ferramenta

## Boss fight

Implemente k-means++, EM para GMM com covariâncias completas, PCA probabilística e FastICA. (1) Recupere os parâmetros de uma mistura sintética e exiba os ótimos locais do EM; (2) separe três sinais misturados com ICA; (3) aprenda um dicionário esparso em recortes de imagens naturais e mostre que surgem filtros parecidos com os de V1 (Gabor).

## Checkpoint

- [ ] Derive os passos E e M de uma mistura de gaussianas.
- [ ] Por que o t-SNE não preserva distâncias globais?
- [ ] Qual a diferença entre PCA e ICA?
- [ ] O que o experimento de Olshausen e Field mostrou sobre V1?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
