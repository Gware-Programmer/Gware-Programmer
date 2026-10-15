# L22 — Geometric deep learning: graphs, symmetry and equivariance

*Deep learning geométrico: grafos, simetria e equivariância*

- **Trilha:** Machine Learning
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** geometric deep learning, graph neural networks, equivariance

## Por que importa

Moléculas, conectomas, malhas, grafos de conhecimento e sistemas físicos não são imagens nem sequências. O deep learning geométrico usa simetria como princípio de projeto — GNNs para grafos, redes equivariantes para rotações — e está na base de avanços como a previsão de estruturas de proteínas.

## Pré-requisitos

- **Depende de:** L09 (Training deep networks), M30 (Graph theory and networks), M40 (Abstract algebra: groups, symmetry and representations)
- **Destrava:** —

## Base

1. Grafos como dados; tarefas de nó, aresta e grafo **M30**.
2. Passagem de mensagens (message passing); GCN e GAT.
3. Invariância a permutações e agregadores (soma, média, máximo).
4. Expressividade: o teste de Weisfeiler–Lehman e a GIN.
5. Equivariância a grupos **M40**: E(3) e SE(3) para dados 3D.
6. O "blueprint" do deep learning geométrico: domínio, simetria, escalas.

## Meio

- Over-smoothing e over-squashing.
- Transformers como GNNs sobre grafos completos.
- Aplicações em química, física e conectomas.

## Avançado

- A previsão de estruturas de proteínas e a geometria em biologia (Nobel de Química de 2024).
- GNNs sobre conectomas para modelar circuitos → N13.
- Hierarquias de expressividade além do Weisfeiler–Lehman.

## Matemática necessária

**M30**: grafos; **M40**: grupos e representações; **M18**: espectro do Laplaciano.

## Métodos

- Implemente GCN, GAT e GIN sem bibliotecas e só depois compare com o PyTorch Geometric.
- Teste a expressividade com pares de grafos que o Weisfeiler–Lehman não distingue.
- Use o livro de Hamilton e os materiais do curso de deep learning geométrico.

## Desafios

- Vazamento entre nós de treino e teste em grafos transdutivos.
- Achar que mais camadas sempre ajudam (over-smoothing).

## Fontes

- 📄 [Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges](https://arxiv.org/abs/2104.13478) — Michael M. Bronstein, Joan Bruna, Taco Cohen & Petar Veličković, 2021 · paper
- 📖 [Graph Representation Learning](https://www.cs.mcgill.ca/~wlh/grl_book/) — William L. Hamilton, 2020 · livro
- 📄 [Semi-Supervised Classification with Graph Convolutional Networks](https://arxiv.org/abs/1609.02907) — Thomas N. Kipf & Max Welling, 2016 · paper
- 📄 [How Powerful are Graph Neural Networks?](https://arxiv.org/abs/1810.00826) — Keyulu Xu, Weihua Hu, Jure Leskovec & Stefanie Jegelka, 2018 · paper
- 📄 [Neural Message Passing for Quantum Chemistry](https://arxiv.org/abs/1704.01212) — Justin Gilmer et al., 2017 · paper
- 🌐 [Geometric Deep Learning — curso e materiais](https://geometricdeeplearning.com/) — Bronstein, Bruna, Cohen & Veličković · site

## Boss fight

Implemente do zero GCN, GAT e GIN; reproduza resultados de classificação de grafos em benchmarks públicos (MUTAG, PROTEINS) e demonstre o limite do Weisfeiler–Lehman com pares de grafos indistinguíveis. Depois treine uma GNN no conectoma do C. elegans para prever o tipo de neurônio a partir da conectividade e discuta o que a conectividade, sozinha, consegue explicar.

## Checkpoint

- [ ] Por que GNNs precisam ser invariantes a permutações?
- [ ] O que o teste de Weisfeiler–Lehman limita?
- [ ] O que é over-smoothing?
- [ ] Diferencie invariância e equivariância a rotações em dados 3D.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
