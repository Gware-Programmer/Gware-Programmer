# A04 — Memory for agents

*Memória para agentes*

- **Trilha:** Agents
- **Nível:** 10 — Circuitos e agentes · onda 2
- **Termos:** agent memory, RAG, episodic memory, context engineering
- **Projetos KEIROS:** .kei, MUSUBI

## Por que importa

Sem memória, todo agente recomeça do zero a cada sessão. Memória de trabalho (o contexto), episódica e semântica (recuperação) e consolidação são o que permite agentes de longo prazo — e é onde as arquiteturas cognitivas e a neurociência do hipocampo têm mais a ensinar.

## Pré-requisitos

- **Depende de:** A03 (LLM agents: the agentic loop and tool use), A10 (Information retrieval and vector search: BM25, embeddings, ANN and RAG)
- **Destrava:** A08 (Long-horizon reliability), K06 (Cognitive architectures for language agents), Z05 (Build an agent on your model: tools, memory and retrieval)

Novo pré-requisito: **A10** — recuperação de informação e busca vetorial.

## Base

1. O contexto como memória de trabalho: limites e degradação com contextos longos.
2. RAG: embeddings **L12**, índices vetoriais, recuperação e reordenação (reranking).
3. Memória episódica (eventos), semântica (fatos) e procedural (habilidades).
4. MemGPT: memória hierárquica gerenciada pelo próprio agente.
5. Engenharia de contexto: o que incluir, comprimir e resumir.
6. O fluxo de memória dos agentes generativos: recuperação por relevância, recência e importância; reflexão.

## Meio

- Escrita e esquecimento: quando consolidar; conflitos e atualização.
- Memória estruturada (grafos de conhecimento).
- Como avaliar memória de longo prazo.

## Avançado

- Sistemas de memória complementares (hipocampo rápido, córtex lento) como modelo para agentes → N07.
- Memória paramétrica vs. não paramétrica; aprender durante a inferência → L23.
- Identidade e continuidade de um agente ao longo do tempo → F07.

## Matemática necessária

**M16**: vetores e similaridade; **M26**: informação (o que vale guardar).

## Métodos

- Implemente RAG do zero (divisão em trechos, embeddings, índice de vizinhos aproximados, reordenação) e meça o recall.
- Implemente o fluxo de memória com reflexão de Park et al.
- Compare contexto longo, RAG e memória gerenciada em tarefas de várias sessões.

## Desafios

- Recuperar por similaridade sem filtrar relevância.
- Memória que cresce sem consolidação vira ruído.
- Avaliar memória com perguntas que o modelo responde sem ela.

## Fontes

- 📄 [Retrieval-Augmented Generation for Knowledge-Intensive NLP Tasks](https://arxiv.org/abs/2005.11401) — Patrick Lewis et al., 2020 · paper
- 📄 [MemGPT: Towards LLMs as Operating Systems](https://arxiv.org/abs/2310.08560) — Charles Packer et al., 2023 · paper
- 📄 [Generative Agents: Interactive Simulacra of Human Behavior](https://arxiv.org/abs/2304.03442) — Joon Sung Park et al., 2023 · paper
- 🗺️ [Effective context engineering for AI agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) — Anthropic, 2025 · guia
- 📄 [Cognitive Architectures for Language Agents](https://arxiv.org/abs/2309.02427) — Theodore R. Sumers, Shunyu Yao, Karthik Narasimhan & Thomas L. Griffiths, 2023 · paper. o CoALA

## Boss fight

Projete e implemente o sistema de memória do MUSUBI, com o `.kei` como formato de persistência: memória de trabalho com compressão, memória episódica com recuperação por relevância, recência e importância, memória semântica com consolidação periódica e esquecimento explícito. Avalie num conjunto de tarefas de várias sessões criado por você contra três linhas de base: sem memória, contexto longo bruto e RAG simples.

## Checkpoint

- [ ] Diferencie memória de trabalho, episódica, semântica e procedural num agente.
- [ ] Por que contexto longo não substitui recuperação?
- [ ] Como o fluxo de memória de Park et al. decide o que recuperar?
- [ ] Como mitigar a degradação de desempenho em contextos muito longos?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
