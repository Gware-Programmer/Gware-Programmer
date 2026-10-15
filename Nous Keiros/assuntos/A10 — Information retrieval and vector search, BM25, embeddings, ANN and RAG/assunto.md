# A10 — Information retrieval and vector search: BM25, embeddings, ANN and RAG

*Recuperação de informação e busca vetorial: BM25, embeddings, ANN e RAG*

- **Trilha:** Agents
- **Nível:** 8 — Escala · onda 1
- **Termos:** information retrieval, inverted index, TF-IDF, BM25, dense retrieval, approximate nearest neighbors, HNSW, FAISS, hybrid search, reranking, retrieval-augmented generation
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Um modelo não precisa guardar tudo nos pesos: pode buscar. Recuperação de informação é o que permite a um agente consultar a sua biblioteca, a memória de longo prazo e documentos novos, citando a fonte. É também a área com a matemática mais clara de "achar o relevante" — do BM25 aos índices vetoriais que respondem em milissegundos sobre milhões de itens.

## Pré-requisitos

- **Depende de:** L12 (Representations, embeddings and self-supervised learning)
- **Destrava:** A04 (Memory for agents), Z05 (Build an agent on your model: tools, memory and retrieval)

## Base

1. O problema: consulta, documentos, relevância; índices invertidos.
2. Modelos clássicos: TF-IDF e BM25.
3. Avaliação: precisão, revocação, MRR, nDCG e julgamentos de relevância.
4. Busca densa: embeddings de consultas e de documentos, dual encoders **L12**.
5. Vizinhos aproximados: LSH, IVF, HNSW e quantização de produto **M16**.
6. Busca híbrida (léxica + densa) e reordenação (cross-encoders, ColBERT).
7. RAG: recuperar e gerar, com fragmentação (chunking) e citação da fonte.

## Meio

- Treinar recuperadores: negativos difíceis e aprendizado contrastivo.
- Bibliotecas e índices: FAISS e a busca textual do SQLite (FTS5).
- Avaliar RAG: fidelidade à fonte e cobertura.
- Busca em português e multilíngue.

## Avançado

- Recuperação como memória de agentes (prévia de → A04).
- Recuperação gerativa e índices diferenciáveis.
- Limites teóricos de embeddings de dimensão fixa.

## Matemática necessária

**M16**: vetores, produto interno e normas; **M22**: probabilidade.

## Métodos

- Leia os capítulos 1–8 de Introduction to Information Retrieval (Manning, Raghavan e Schütze).
- Implemente o BM25 do zero e compare com o FTS5 do SQLite.
- Monte um índice FAISS com embeddings das fontes do mapa e compare busca densa, léxica e híbrida com nDCG em 30 consultas suas.

## Desafios

- Avaliar RAG só no olho.
- Fragmentar documentos sem pensar no que a consulta precisa.
- Achar que a busca densa sempre supera o BM25 — fora do domínio de treino, muitas vezes não supera.

## Fontes

- 📖 [Introduction to Information Retrieval](https://nlp.stanford.edu/IR-book/) — Christopher D. Manning, Prabhakar Raghavan & Hinrich Schütze, 2008 · livro. livre
- 📄 [The Probabilistic Relevance Framework: BM25 and Beyond](https://doi.org/10.1561/1500000019) — Stephen Robertson & Hugo Zaragoza, 2009 · paper
- 📄 [Dense Passage Retrieval for Open-Domain Question Answering](https://arxiv.org/abs/2004.04906) — Vladimir Karpukhin et al., 2020 · paper
- 📄 [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/abs/2005.11401) — Patrick Lewis et al., 2020 · paper
- 📄 [Efficient and robust approximate nearest neighbor search using Hierarchical Navigable Small World graphs](https://arxiv.org/abs/1603.09320) — Yu. A. Malkov & D. A. Yashunin, 2016 · paper
- 📄 [ColBERT: Efficient and Effective Passage Search via Contextualized Late Interaction over BERT](https://arxiv.org/abs/2004.12832) — Omar Khattab & Matei Zaharia, 2020 · paper
- 📄 [The Faiss library](https://arxiv.org/abs/2401.08281) — Matthijs Douze et al., 2024 · paper
- 🆕 [On the Theoretical Limitations of Embedding-Based Retrieval](https://arxiv.org/abs/2508.21038) — Orion Weller et al., 2025 · recente
- 🔧 [SQLite FTS5](https://www.sqlite.org/fts5.html) — SQLite · ferramenta
- 🎓 [CS276: Information Retrieval and Web Search](https://web.stanford.edu/class/cs276/) — Stanford · curso

## Boss fight

Dê ao Rei Ichi uma memória consultável: um sistema de recuperação sobre a sua própria biblioteca de estudo (as fontes e notas do mapa) com BM25, busca densa e busca híbrida, avaliado com 50 consultas e julgamentos de relevância feitos por você (nDCG@10 e revocação@20). Ligue o melhor recuperador a um modelo aberto num pipeline RAG que cita a fonte de cada afirmação, e meça quantas citações de fato sustentam o que foi dito.

## Checkpoint

- [ ] Por que o BM25 satura a contribuição de um termo repetido muitas vezes num documento?
- [ ] Qual a diferença entre precisão, revocação e nDCG?
- [ ] Como o HNSW encontra vizinhos aproximados sem comparar a consulta com todos os vetores?
- [ ] Quando a busca híbrida ganha da busca só densa?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
