# C15 — Algorithms and data structures

*Algoritmos e estruturas de dados*

- **Trilha:** Computing for AI
- **Nível:** 2 — O motor · onda 2
- **Termos:** algorithms, data structures, asymptotic analysis, hash tables, heaps, sorting, graph algorithms, topological sort, Dijkstra, dynamic programming
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Todo sistema de IA é feito de estruturas de dados: o tokenizador é uma tabela hash e uma fila de prioridade, a busca de um agente é um grafo, o índice vetorial é um grafo de vizinhança, o cache de KV é um array bem desenhado. Saber o custo de cada operação separa o protótipo que roda do que escala. E este próprio mapa é um grafo: ordenação topológica é o que decide o que você estuda primeiro.

## Pré-requisitos

- **Depende de:** C01 (Scientific Python: the lab), M13 (Combinatorics and discrete mathematics), C14 (C and systems programming: memory, pointers and concurrency)
- **Destrava:** M37 (Computational complexity), A02 (Search and classical planning)

## Base

1. Análise assintótica: O, Ω e Θ; pior caso, caso médio e custo amortizado **M13**.
2. Arrays dinâmicos, listas ligadas, pilhas e filas.
3. Tabelas hash: funções de hash, colisões, fator de carga.
4. Árvores: árvore binária de busca, árvores balanceadas, heaps e filas de prioridade.
5. Ordenação: mergesort, quicksort, heapsort; o limite Ω(n log n) para ordenação por comparação.
6. Grafos: representações, BFS, DFS, ordenação topológica, Dijkstra.
7. Técnicas: dividir e conquistar, guloso, programação dinâmica (prévia de → R03).

## Meio

- Union-find, tries e árvores de segmento.
- Árvores geradoras mínimas (Kruskal, Prim) e caminhos mínimos com pesos negativos (Bellman-Ford).
- Recursão, iteração e memoização.
- Localidade de cache: por que a estrutura "pior" no papel às vezes ganha na prática.

## Avançado

- Estruturas probabilísticas: Bloom filter, count-min sketch e MinHash — a deduplicação de dados de LLM usa MinHash (→ L29).
- Busca aproximada de vizinhos: LSH e grafos HNSW (→ A10).
- Algoritmos de streaming e externos, para dados maiores que a memória.

## Matemática necessária

**M13**: combinatória e recorrências; **M06**: indução para provar correção.

## Métodos

- Faça o MIT 6.006 (aulas em vídeo e listas) e implemente cada estrutura em Python; as principais também em C (**C14**).
- Use o VisuAlgo para ver cada algoritmo rodando passo a passo.
- Meça o tempo real das suas implementações e compare com a previsão assintótica num gráfico log-log.

## Desafios

- Decorar algoritmos sem a invariante que os torna corretos.
- Ignorar constantes e cache: um O(n) com saltos aleatórios na memória pode perder para um O(n log n) sequencial.
- Uma função de hash ruim degrada a tabela inteira para O(n).

## Fontes

- 📖 [Introduction to Algorithms (4ª ed.)](https://mitpress.mit.edu/9780262046305/introduction-to-algorithms/) — Thomas H. Cormen, Charles E. Leiserson, Ronald L. Rivest & Clifford Stein, 2022 · livro
- 🎓 [6.006 Introduction to Algorithms (Spring 2020)](https://ocw.mit.edu/courses/6-006-introduction-to-algorithms-spring-2020/) — Erik Demaine, Jason Ku & Justin Solomon (MIT OpenCourseWare) · curso. aulas em vídeo e listas
- 📖 [Algorithms](https://jeffe.cs.illinois.edu/teaching/algorithms/) — Jeff Erickson, 2019 · livro. livre
- 📖 [Algorithms (4ª ed.)](https://algs4.cs.princeton.edu/) — Robert Sedgewick & Kevin Wayne · livro
- 📖 [Open Data Structures](https://opendatastructures.org/) — Pat Morin · livro. livre
- 🔧 [VisuAlgo](https://visualgo.net/) — Steven Halim · ferramenta
- 📄 [A note on two problems in connexion with graphs](https://doi.org/10.1007/BF01386390) — E. W. Dijkstra, 1959 · paper

## Boss fight

Implemente o núcleo de busca do Rei Ichi: uma tabela hash própria com redimensionamento, um heap binário e um grafo com BFS, Dijkstra e ordenação topológica — esta última aplicada ao próprio mapa, detectando ciclos e calculando uma ordem de estudo válida. Escreva testes de correção e um benchmark que confirme (ou desminta) a complexidade esperada de cada operação, com gráficos em escala log-log.

## Checkpoint

- [ ] O que é custo amortizado, e por que inserir no fim de um array dinâmico custa O(1) amortizado?
- [ ] Por que nenhuma ordenação por comparação pode ser mais rápida que O(n log n) no pior caso?
- [ ] Quando Dijkstra falha, e o que Bellman-Ford faz de diferente?
- [ ] Como a ordenação topológica detecta um ciclo num grafo dirigido?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
