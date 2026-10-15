# M26 — Information theory

*Teoria da informação*

- **Trilha:** Mathematics
- **Nível:** 5 — A matemática do aprendizado · onda 1
- **Termos:** information theory, entropy, KL divergence, mutual information

## Por que importa

Entropia, entropia cruzada e divergência KL são as funções de perda e as métricas da IA: perplexidade, ELBO, destilação, a penalidade KL do RLHF. A informação mútua aparece no aprendizado contrastivo, na codificação neural e no núcleo matemático da IIT.

## Pré-requisitos

- **Depende de:** M23 (Continuous random variables, distributions and limit theorems)
- **Destrava:** M25 (Bayesian inference, MCMC and variational inference), M41 (Differential geometry and information geometry), L03 (Decision trees, ensembles and boosting), L12 (Representations, embeddings and self-supervised learning), L27 (Language modeling basics: n-grams, perplexity, neural LMs and decoding), R06 (Policy gradients: REINFORCE, TRPO and PPO), N04 (Neural coding), S04 (Integrated information theory (IIT): versions and computing Φ), X02 (Self-organization, emergence and criticality)

## Base

1. Surpresa (−log p) e entropia H(X); bits e nats **M09**.
2. Entropia conjunta e condicional; regra da cadeia da entropia.
3. Entropia cruzada H(p, q) e divergência KL(p‖q): não negatividade e assimetria.
4. Informação mútua I(X; Y) e o "diagrama de Venn" da informação.
5. Teorema da codificação de fonte: entropia como limite da compressão; códigos de Huffman.
6. Canais e capacidade; teorema da codificação de canal (noção).
7. Entropia diferencial e suas armadilhas.

## Meio

- Desigualdade de processamento de dados (data processing inequality).
- Perplexidade = exp(entropia cruzada); todo modelo de linguagem é um compressor (codificação aritmética).
- Estimar informação mútua: histogramas, k-NN de Kraskov, limites variacionais (InfoNCE).
- Comprimento mínimo de descrição (MDL) como navalha de Occam formal.

## Avançado

- Taxa-distorção (rate-distortion) e information bottleneck, com a controvérsia do "plano da informação" em deep learning (Saxe et al., 2018).
- Decomposição parcial da informação (PID): redundância, sinergia e informação única — e a ΦID → X02.
- A informação integrada da IIT como diferença entre repertórios de causa e efeito → S04.
- "Modelar linguagem é comprimir" (Delétang et al., 2023): o que isso diz — e não diz — sobre inteligência.

## Matemática necessária

**M23**: distribuições e esperanças; **M09**: logaritmos.

## Métodos

- Leia MacKay com papel e lápis: ele explica com intuição de engenheiro e exercícios ótimos.
- Implemente Huffman e codificação aritmética; comprima texto com um modelo de n-gramas e compare bits/caractere com a entropia estimada.
- Calcule I(X; Y) à mão em exemplos pequenos e confirme por simulação.

## Desafios

- Entropia diferencial pode ser negativa e muda com reparametrização (KL e informação mútua não mudam).
- KL não é distância: é assimétrica e não obedece à desigualdade triangular.
- Estimadores de informação mútua em alta dimensão são enviesados e frágeis.

## Fontes

- 📖 [Information Theory, Inference, and Learning Algorithms](https://www.inference.org.uk/itila/book.html) — David J. C. MacKay, 2003 · livro. PDF gratuito oficial
- 📖 [Elements of Information Theory (2ª ed.)](https://onlinelibrary.wiley.com/doi/book/10.1002/047174882X) — Thomas M. Cover & Joy A. Thomas, 2006 · livro. a referência rigorosa
- 📄 [A Mathematical Theory of Communication](https://doi.org/10.1002/j.1538-7305.1948.tb01338.x) — Claude E. Shannon, 1948 · paper. leia o original: é legível e fundador
- 📄 [Language Modeling Is Compression](https://arxiv.org/abs/2309.10668) — Delétang et al., 2023 · paper

## Boss fight

Construa um compressor de texto com codificação aritmética guiada por um modelo de contexto (n-gramas com suavização), meça bits por caractere em português e em código-fonte, e compare com gzip e com a entropia estimada. Depois implemente três estimadores de informação mútua (histograma, k-NN de Kraskov e InfoNCE com crítico fixo) e mostre, com dados sintéticos de dependência conhecida, onde cada um falha.

## Checkpoint

- [ ] Calcule a entropia, em bits, de uma moeda com p = 0,9.
- [ ] Prove KL(p‖q) ≥ 0 usando ln x ≤ x − 1.
- [ ] Por que minimizar a entropia cruzada H(p, q) em q equivale a minimizar KL(p‖q)?
- [ ] O que a desigualdade de processamento de dados diz sobre as camadas de uma rede?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
