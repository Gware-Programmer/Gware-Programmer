# L12 — Representations, embeddings and self-supervised learning

*Representações, embeddings e aprendizado auto-supervisionado*

- **Trilha:** Machine Learning
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** representation learning, embeddings, contrastive learning, self-supervised learning

## Por que importa

O grande segredo do deep learning moderno é aprender boas representações sem rótulos. Embeddings de palavras, aprendizado contrastivo (SimCLR, CLIP) e preditivo (JEPA) produzem espaços onde semelhança semântica vira geometria — o mesmo espaço que agentes usam como memória e que a interpretabilidade tenta ler.

## Pré-requisitos

- **Depende de:** L09 (Training deep networks), M26 (Information theory)
- **Destrava:** L13 (Attention), A10 (Information retrieval and vector search: BM25, embeddings, ANN and RAG)

## Base

1. Representação distribuída vs. one-hot; embeddings como tabelas aprendidas.
2. word2vec (skip-gram com negative sampling) e GloVe; analogias e seus limites.
3. Autoencoders e representação como compressão.
4. Aprendizado contrastivo: InfoNCE como limite inferior da informação mútua **M26**; SimCLR.
5. Métodos não contrastivos (BYOL, DINO): colapso de representação e como evitá-lo.
6. Avaliação: sondas lineares, k-NN, transferência.

## Meio

- CLIP: alinhamento contrastivo entre imagem e texto.
- JEPA (I-JEPA, V-JEPA): prever representações, não pixels.
- Embeddings de sentenças e busca semântica.
- Isotropia e geometria dos espaços de embeddings **M19**.

## Avançado

- Hipótese da representação linear: conceitos como direções → I04.
- Hipótese da representação platônica: modelos diferentes convergem para representações parecidas — e as críticas a ela.
- Auto-supervisão como teoria do aprendizado cortical → N09.

## Matemática necessária

**M26**: informação mútua; **M19**: geometria e SVD; **M16**: vetores.

## Métodos

- Implemente skip-gram com negative sampling e treine em português; explore vizinhos e analogias honestamente.
- Implemente um SimCLR pequeno no CIFAR-10 e avalie com sonda linear.
- Compare representações de dois modelos com CKA.

## Desafios

- Analogias escolhidas a dedo (o vizinho mais próximo costuma excluir as palavras de entrada).
- Colapso silencioso em métodos não contrastivos.
- Avaliar representações com uma única tarefa.

## Fontes

- 📄 [Efficient Estimation of Word Representations in Vector Space](https://arxiv.org/abs/1301.3781) — Tomas Mikolov, Kai Chen, Greg Corrado & Jeffrey Dean, 2013 · paper
- 🧭 [Representation Learning: A Review and New Perspectives](https://arxiv.org/abs/1206.5538) — Yoshua Bengio, Aaron Courville & Pascal Vincent, 2013 · review
- 📄 [A Simple Framework for Contrastive Learning of Visual Representations](https://arxiv.org/abs/2002.05709) — Ting Chen, Simon Kornblith, Mohammad Norouzi & Geoffrey Hinton, 2020 · paper
- 📄 [Learning Transferable Visual Models From Natural Language Supervision](https://arxiv.org/abs/2103.00020) — Alec Radford et al., 2021 · paper. o CLIP
- 📄 [Self-Supervised Learning from Images with a Joint-Embedding Predictive Architecture](https://arxiv.org/abs/2301.08243) — Mahmoud Assran et al., 2023 · paper
- 🆕 [The Platonic Representation Hypothesis](https://arxiv.org/abs/2405.07987) — Minyoung Huh, Brian Cheung, Tongzhou Wang & Phillip Isola, 2024 · recente
- 🎓 [CS224N: Natural Language Processing with Deep Learning](https://web.stanford.edu/class/cs224n/) — Christopher Manning (Stanford) · curso. aulas em vídeo e tarefas com código

## Boss fight

Treine do zero um word2vec (skip-gram com negative sampling) num corpus em português e um SimCLR pequeno no CIFAR-10. Avalie ambos (analogias honestas; sonda linear e k-NN) e compare com modelos pré-treinados. Depois meça, com CKA, a similaridade camada a camada entre duas redes treinadas com sementes diferentes.

## Checkpoint

- [ ] Por que InfoNCE é um limite inferior da informação mútua?
- [ ] O que é colapso de representação e como BYOL e DINO o evitam?
- [ ] Qual a diferença entre prever pixels e prever representações (JEPA)?
- [ ] Como avaliar a qualidade de uma representação?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
