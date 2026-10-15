# L26 — Deep learning theory

*Teoria do deep learning*

- **Trilha:** Machine Learning
- **Nível:** 12 — Pesquisa independente · onda 1
- **Termos:** deep learning theory, NTK, mean-field, muP, implicit bias, singular learning theory

## Por que importa

Por que redes enormes, treinadas com SGD em problemas não convexos, generalizam? A teoria do deep learning ainda não tem a resposta completa — e é uma fronteira onde matemática séria encontra fenômenos estranhos: grokking, dupla descida, edge of stability, leis de escala.

## Pré-requisitos

- **Depende de:** L07 (Statistical learning theory), L16 (Scaling laws), M35 (Functional analysis and Hilbert spaces)
- **Destrava:** —

## Base

1. Regime de kernel: o neural tangent kernel e as redes infinitamente largas **M35**.
2. Regime de campo médio (mean-field), aprendizado de features e muP.
3. Viés implícito do gradiente descendente.
4. Paisagens de perda: conectividade entre mínimos, platôs, selas.
5. Grokking e medidas de progresso **L07**.
6. A teoria efetiva de Roberts, Yaida e Hanin: redes de largura finita por teoria de perturbação.

## Meio

- Edge of stability e a dinâmica da nitidez **M28**.
- Teoria singular do aprendizado (Watanabe): o coeficiente de aprendizado local e o desenvolvimento em estágios.
- Sobreajuste benigno.

## Avançado

- Teorias das leis de escala (quantização de habilidades, dimensão da variedade) contestado **L16**
- Superposição e geometria de features como objetos de teoria → I04.
- Teoria de transformers: aprendizado em contexto como algoritmo, expressividade com chain-of-thought.
- Geometria da informação aplicada à paisagem de perda → M41.

## Matemática necessária

**M35**: espaços de Hilbert e RKHS; **M28**: sistemas dinâmicos; **M23**: concentração.

## Métodos

- Roberts, Yaida & Hanin para a teoria efetiva; as notas de Telgarsky para provas.
- Reproduza o grokking em aritmética modular e as medidas de progresso de Nanda et al.
- Calcule o NTK empírico de uma rede e acompanhe como ele muda no treino (regime preguiçoso vs. rico).

## Desafios

- Confundir resultados assintóticos (largura infinita) com redes reais.
- Explicações a posteriori sem previsões testáveis.

## Fontes

- 📖 [The Principles of Deep Learning Theory](https://arxiv.org/abs/2106.10165) — Daniel A. Roberts, Sho Yaida & Boris Hanin, 2022 · livro
- 📄 [Neural Tangent Kernel: Convergence and Generalization in Neural Networks](https://arxiv.org/abs/1806.07572) — Arthur Jacot, Franck Gabriel & Clément Hongler, 2018 · paper
- 📄 [Grokking: Generalization Beyond Overfitting on Small Algorithmic Datasets](https://arxiv.org/abs/2201.02177) — Alethea Power, Yuri Burda, Harri Edwards, Igor Babuschkin & Vedant Misra, 2022 · paper
- 📄 [Progress measures for grokking via mechanistic interpretability](https://arxiv.org/abs/2301.05217) — Neel Nanda, Lawrence Chan, Tom Lieberum, Jess Smith & Jacob Steinhardt, 2023 · paper
- 🆕 [Loss Landscape Degeneracy and Stagewise Development in Transformers](https://arxiv.org/abs/2402.02364) — Jesse Hoogland et al., 2024 · recente. teoria singular do aprendizado na prática
- 🎓 [Deep learning theory lecture notes](https://mjt.cs.illinois.edu/dlt/) — Matus Telgarsky · curso

## Boss fight

Reproduza o grokking em aritmética modular, identifique o algoritmo aprendido (representações de Fourier do grupo cíclico) e reproduza as medidas de progresso de Nanda et al. Em paralelo, meça o NTK empírico de redes de larguras diferentes ao longo do treino e mostre a transição entre o regime preguiçoso e o de aprendizado de features. Escreva uma nota técnica relacionando os dois fenômenos.

## Checkpoint

- [ ] O que é o NTK e em que limite ele permanece constante no treino?
- [ ] Qual a diferença entre o regime de kernel e o de campo médio?
- [ ] O que é grokking e o que as medidas de progresso revelaram?
- [ ] O que a teoria singular do aprendizado tenta explicar?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
