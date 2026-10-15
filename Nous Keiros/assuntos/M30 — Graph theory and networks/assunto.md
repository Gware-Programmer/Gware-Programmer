# M30 — Graph theory and networks

*Teoria dos grafos e redes*

- **Trilha:** Mathematics
- **Nível:** 4 — A máquina de aprender · onda 2
- **Termos:** graph theory, networks, spectral graph theory, Laplacian

## Por que importa

Grafos estão em tudo: conectomas, grafos computacionais de redes neurais, grafos de conhecimento, redes de agentes e a estrutura causal que a IIT analisa (um sistema é um grafo de mecanismos). O espectro do Laplaciano revela comunidades e difusão.

## Pré-requisitos

- **Depende de:** M13 (Combinatorics and discrete mathematics), M18 (Linear algebra II: determinants, eigenvalues and the spectral theorem)
- **Destrava:** M38 (Causal inference), L06 (Probabilistic graphical models and filtering), L22 (Geometric deep learning: graphs, symmetry and equivariance), N13 (Connectomics and large-scale neuroscience), S04 (Integrated information theory (IIT): versions and computing Φ)

## Base

1. Vértices e arestas; grafos dirigidos, não dirigidos e ponderados.
2. Graus, caminhos, ciclos, conectividade e componentes.
3. Árvores; DAGs e ordenação topológica — o que o seu compilador já faz.
4. Representações: lista e matriz de adjacência.
5. BFS, DFS, Dijkstra e árvore geradora mínima.
6. Matriz de adjacência, Laplaciano e seus autovalores **M18**.

## Meio

- Grafos aleatórios (Erdős–Rényi), mundo pequeno (Watts–Strogatz), ligação preferencial (Barabási–Albert).
- Centralidades (grau, intermediação, autovetor, PageRank).
- Comunidades e corte espectral pelo vetor de Fiedler.
- Difusão e passeios aleatórios em grafos.

## Avançado

- Teoria espectral de grafos: desigualdade de Cheeger e expansores — os grafos que Aaronson usou para criticar a IIT → S04.
- Grafos como estrutura causal (redes bayesianas, SCMs) → M38 e motivos (motifs) em conectomas → N13.
- GNNs e o limite de expressividade pelo teste de Weisfeiler–Lehman → L22.

## Matemática necessária

**M13**: contagem; **M18**: autovalores e matrizes simétricas.

## Métodos

- Implemente estruturas e algoritmos clássicos (você será rápido) e estude as provas em Diestel.
- Analise um grafo real: o conectoma do C. elegans (graus, comunidades, motivos).
- Spielman para o lado espectral, com demonstrações.

## Desafios

- Usar a fórmula do Laplaciano de grafos não dirigidos num grafo dirigido.
- Achar que redes "livres de escala" são universais: análises cuidadosas mostram que são raras.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Introdução à teoria dos grafos](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=84) — IMPA/OBMEP · curso. entrada em português
- 📖 [Graph Theory (6th ed.)](https://diestel-graph-theory.com/) — Reinhard Diestel, 2025 · livro. edição eletrônica gratuita para leitura
- 📖 [Network Science](http://networksciencebook.com/) — Albert-László Barabási, 2016 · livro. online e gratuito
- 📖 [Spectral and Algebraic Graph Theory](http://cs-www.cs.yale.edu/homes/spielman/sagt/) — Daniel A. Spielman · livro. rascunho gratuito
- 📄 [Scale-free networks are rare](https://doi.org/10.1038/s41467-019-08746-5) — Anna D. Broido & Aaron Clauset, 2019 · paper. ceticismo quantitativo exemplar

## Boss fight

Escreva uma biblioteca de grafos com BFS/DFS, Dijkstra, ordenação topológica, componentes fortemente conexas, PageRank e clustering espectral pelo vetor de Fiedler. Aplique ao conectoma do C. elegans: distribuição de graus, comunidades e contagem de motivos de 3 nós, comparando com grafos aleatórios de mesma sequência de graus (modelo de configuração). Escreva o que é estrutura e o que é acaso.

## Checkpoint

- [ ] Por que todo DAG admite ordenação topológica?
- [ ] O que a multiplicidade do autovalor zero do Laplaciano diz sobre o grafo?
- [ ] Diferencie Erdős–Rényi, Watts–Strogatz e Barabási–Albert.
- [ ] Calcule à mão o PageRank de um grafo de 3 nós com fator de amortecimento 0,85.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
