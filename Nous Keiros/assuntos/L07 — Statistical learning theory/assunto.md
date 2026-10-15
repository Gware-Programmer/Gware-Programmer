# L07 — Statistical learning theory

*Teoria do aprendizado estatístico*

- **Trilha:** Machine Learning
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** PAC learning, VC dimension, bias-variance, double descent

## Por que importa

Por que um modelo treinado em dados finitos funciona em dados novos? A teoria do aprendizado (PAC, VC, Rademacher) dá a resposta clássica — e o deep learning a desafiou: redes enormes generalizam onde a teoria previa sobreajuste. Entender esse conflito é entender uma das grandes perguntas abertas da IA.

## Pré-requisitos

- **Depende de:** L02 (Linear models and maximum likelihood)
- **Destrava:** L26 (Deep learning theory)

## Base

1. O modelo PAC (Valiant, 1984): erro, confiança, complexidade de amostra.
2. Classes finitas: limite por Hoeffding + união **M23**.
3. Dimensão VC, lema de Sauer–Shelah **M13** e o teorema fundamental do aprendizado PAC.
4. Complexidade de Rademacher.
5. Decomposição viés–variância; regularização como controle de capacidade.
6. Não existe almoço grátis (no free lunch).
7. Estabilidade algorítmica e generalização.

## Meio

- Limites de margem e PAC-Bayes.
- Seleção de modelo: minimização do risco estrutural e validação.
- O "paradoxo" do deep learning: redes memorizam rótulos aleatórios e mesmo assim generalizam com rótulos reais (Zhang et al.).
- Dupla descida (double descent).

## Avançado

- Sobreajuste benigno e interpolação.
- Limites PAC-Bayes não vazios para redes (Dziugaite & Roy).
- Grokking e generalização tardia → L26.
- O que a teoria ainda não explica: o viés indutivo conjunto de arquitetura, otimizador e dados → L26.

## Matemática necessária

**M23**: concentração; **M13**: combinatória; **M24**: estatística; **M06**: provas.

## Métodos

- Shalev-Shwartz & Ben-David com as provas; resolva os exercícios dos caps. 2–6.
- Reproduza a dupla descida em escala pequena (regressão com features aleatórias basta).
- Calcule limites VC concretos e compare com o erro real — e veja quão vazios eles são.

## Desafios

- Concluir que a teoria clássica "está errada": ela está correta, mas os limites são frouxos e a classe de hipóteses efetiva não é a arquitetura inteira.
- Confundir dupla descida em parâmetros, em épocas e em amostras.

## Fontes

- 📖 [Understanding Machine Learning: From Theory to Algorithms](https://www.cs.huji.ac.il/~shais/UnderstandingMachineLearning/) — Shai Shalev-Shwartz & Shai Ben-David, 2014 · livro. PDF gratuito
- 📖 [Learning Theory from First Principles](https://www.di.ens.fr/~fbach/ltfp_book.pdf) — Francis Bach, 2024 · livro. moderno e rigoroso; PDF do autor
- 📄 [A Theory of the Learnable](https://doi.org/10.1145/1968.1972) — Leslie G. Valiant, 1984 · paper
- 📄 [Understanding deep learning requires rethinking generalization](https://arxiv.org/abs/1611.03530) — Chiyuan Zhang, Samy Bengio, Moritz Hardt, Benjamin Recht & Oriol Vinyals, 2017 · paper
- 📄 [Reconciling modern machine-learning practice and the classical bias–variance trade-off](https://doi.org/10.1073/pnas.1903070116) — Mikhail Belkin, Daniel Hsu, Siyuan Ma & Soumik Mandal, 2019 · paper
- 🆕 [Deep Double Descent: Where Bigger Models and More Data Hurt](https://arxiv.org/abs/1912.02292) — Preetum Nakkiran et al., 2019 · recente

## Boss fight

Prove por escrito o teorema PAC para classes finitas e o limite pela dimensão VC (com Sauer–Shelah). Depois reproduza, com regressão por features aleatórias (sem redes), a curva de dupla descida em função do número de features, e calcule o limite de generalização clássico em cada ponto — mostrando onde a teoria é vazia e onde acerta.

## Checkpoint

- [ ] Qual a dimensão VC dos semiplanos em ℝ²? Prove.
- [ ] Escreva a decomposição viés–variância do erro quadrático.
- [ ] O que Zhang et al. mostraram e por que isso desafiou a teoria clássica?
- [ ] Explique a dupla descida e o papel do limiar de interpolação.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
