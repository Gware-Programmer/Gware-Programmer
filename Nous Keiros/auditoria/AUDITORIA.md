# Auditoria do conteúdo — O MAPA (Nous Keiros)

Data: 15/10/2026. Objetivo do mapa: **estudar e praticar até criar a sua própria IA (Rei Ichi)**, do zero até os problemas abertos de hoje.

A auditoria teve dois objetivos:

1. **Alinhamento:** cada assunto precisa servir a esse objetivo.
2. **Fechamento:** completar com tudo o que faltava para não sobrar buraco, da base à fronteira.

## Resultado em números

| | Antes | Depois |
|---|---|---|
| Assuntos | 180 | 203 (15 assuntos novos + 8 projetos práticos) |
| Trilhas | 15 | 16 (nova: Build Your Own AI) |
| Níveis | 14 | 14, com nomes por etapa |
| Fontes | 893 | 1.029 |
| Dependências ajustadas | — | 20 |
| Japonês na interface, níveis, trilhas e títulos | sim | nenhum |

## 1. O objetivo, quebrado em competências

Criar a sua própria IA exige:

- matemática;
- programação e sistemas (CPU, GPU, compiladores);
- ML e deep learning;
- o pipeline completo de um modelo: dados → tokenizer → arquitetura → treino → pré-treino → avaliação → pós-treino → inferência no seu M1;
- RL, agentes, interpretabilidade, segurança e alinhamento;
- cognição, neurociência e consciência, que fazem parte do projeto Rei Ichi;
- ofício de pesquisador, para chegar à fronteira e contribuir.

## 2. Alinhamento

Cada assunto recebeu um papel e uma competência. A tabela completa está em `alinhamento.csv`.

| Papel | O que significa | Assuntos |
|---|---|---|
| componente | vira parte da IA ou da engenharia dela | 76 |
| fundamento | base necessária (matemática, ofício de pesquisador) | 50 |
| contexto | cognição, neurociência, consciência, filosofia: o lado "mente" do Rei Ichi | 52 |
| aprofundamento | componente que vai além do caminho direto (teoria, escala, arquiteturas alternativas) | 17 |
| prática | projetos da trilha Build Your Own AI | 8 |

**Caminho direto.** 153 dos 203 assuntos são pré-requisito, direto ou indireto, dos 8 projetos práticos. Os outros 50 servem para aprofundar e chegar à pesquisa de fronteira.

**Fora do objetivo.** Nenhum assunto foi considerado fora do objetivo, e nada foi apagado.

## 3. Fechamento: os três testes

### 3.1 Pré-requisitos

- **Referências explícitas.** O texto do mapa tem 751 referências marcadas como pré-requisito. Todas apontam para assuntos anteriores na árvore: nenhum buraco.
- **Conceitos usados antes de serem ensinados.** Achei dois buracos de ordem: *reward hacking* era usado no pós-treino (L17) e no RL de fronteira (R10) sem depender de AL01, e *world models* aparecia no planejamento agêntico (A05) sem depender de R09. Os dois foram corrigidos com dependências.
- **Assuntos inteiros que faltavam:**
  - **C:** a linguagem é pedida em 23 assuntos e nunca era ensinada;
  - **Git e shell:** nenhuma menção no mapa;
  - **Algoritmos e estruturas de dados:** só apareciam espalhados;
  - **Licenças e governança:** nenhuma menção;
  - **Representação do conhecimento:** nenhuma menção;
  - **Computação evolutiva:** só aparecia de passagem;
  - **Tokenização, dados para LLMs e MoE:** eram só parágrafos dentro do pré-treino.

### 3.2 Pipeline: cada etapa tem teoria e prática

| Etapa | Teoria | Prática |
|---|---|---|
| Dados | L29 | Z02 |
| Tokenizer | L28 | Z01, Z02 |
| Arquitetura | L13, L14, L23, L31 | Z01 |
| Infraestrutura de treino | C04, C16, C08, C09 | Z01, Z02 |
| Pré-treino | L15, L16 | Z02 |
| Avaliação | L30, P04 | Z02 |
| Pós-treino | L17, L18 | Z03 |
| Inferência no M1 | C11 | Z04 |
| Agentes | A03, A04, A10, A07 | Z05 |
| Interpretabilidade | I01–I05 | Z06 |
| Segurança | AL01–AL07 | Z07 |
| Integração no Rei Ichi | K06, K07, S10, S11 | Z08 |

Antes da auditoria, as etapas de dados, tokenizer, avaliação e inferência local não tinham assunto próprio, e nenhuma etapa tinha projeto prático próprio.

### 3.3 Fronteira

Cada trilha termina em problemas abertos ligados ao capítulo "A linha que ninguém cruzou". A checagem de fontes de 2025–2026 nos níveis 8–13 está na seção 6.

## 4. O que entrou

### Assuntos novos

| ID | Assunto | Nível | Por que faltava |
|---|---|---|---|
| C13 | Unix shell, Git and research tooling | 0 | nenhuma menção no mapa |
| C14 | C and systems programming: memory, pointers and concurrency | 1 | C é pedido em 23 assuntos e nunca ensinado |
| C15 | Algorithms and data structures | 2 | só aparecia espalhado |
| K08 | Knowledge representation and reasoning | 4 | nenhuma menção |
| X04 | Evolutionary computation and neuroevolution | 6 | só de passagem |
| L27 | Language modeling basics: n-grams, perplexity, neural LMs and decoding | 6 | ponte que faltava antes dos transformers |
| L28 | Tokenization: BPE, unigram and byte-level | 7 | era um parágrafo do pré-treino |
| C16 | ML engineering: experiment tracking, configs, checkpoints and data versioning | 7 | uma única menção |
| L29 | Data for LLMs: collection, filtering, deduplication, mixtures and synthetic data | 8 | era um parágrafo do pré-treino |
| A10 | Information retrieval and vector search: BM25, embeddings, ANN and RAG | 8 | estava dentro de "memória de agentes" |
| L32 | Speech and audio models: ASR, TTS and audio tokenizers | 8 | não existia |
| AL09 | AI governance and licensing of data and models | 8 | nenhuma menção |
| L30 | LLM evaluation: benchmarks, contamination and harnesses | 8 | só existia avaliação de agentes |
| L31 | Mixture of Experts and conditional computation | 9 | quatro menções, sem assunto |
| L33 | Energy-based models | 9 | base do JEPA, não existia |

### Trilha Build Your Own AI (projetos práticos)

| ID | Projeto | Nível |
|---|---|---|
| Z01 | Train a tiny GPT from scratch | 7 |
| Z02 | Pretrain a small LLM end to end | 8 |
| Z03 | Post-train an open model: SFT, preferences and RLVR | 9 |
| Z04 | Run your model on the M1: quantization and local serving | 10 |
| Z05 | Build an agent on your model: tools, memory and retrieval | 10 |
| Z06 | Open your model: probes, SAEs and circuits | 10 |
| Z07 | Red-team and align your model | 11 |
| Z08 | Integrate into Rei Ichi: architecture, ablations and technical report | 12 |

Cada item novo tem os mesmos 11 blocos dos outros: por que importa, pré-requisitos, base, meio, avançado, matemática, métodos, desafios, fontes, boss fight e checkpoint.

## 5. Estrutura e regras

- **Portão de nível:** só se entra no nível seguinte com o nível atual completo, ou seja, todos os assuntos dominados e o boss do nível vencido. A regra está gravada em `mapa.json` (`meta.regras`).
- **Teoria antes da prática:** dentro de cada nível, os projetos Z ficam na última onda.
- **Sem exigência de conhecimento futuro:** nove boss fights citam assuntos de níveis posteriores. Todos são só prévia ("você reencontra em…"), nenhum exige o que ainda não foi estudado.
- **Dependências ajustadas:**
  - C01 ← C13
  - C03 ← C14
  - C06 ← C14
  - C14 ← M01
  - A02 ← C15
  - M37 ← C15
  - L11 ← L27
  - L15 ← L28, L29
  - A04 ← A10
  - L21 ← L32
  - K05 ← K08
  - X03 ← X04
  - A09 ← X04
  - A07 ← L30
  - L17 ← AL01
  - R10 ← AL01
  - A05 ← R09
  - C11 ← L31
  - R09 ← L33
  - AL08 ← AL09

  Cada uma aparece também no bloco de pré-requisitos do assunto.
- **Ondas que mudaram:** C01 (1→2), L15 (1→2), L16 (2→3) e R09 (1→2).
- **Nomes dos níveis:**
  - 0 Fundamentos
  - 1 Provas e código
  - 2 O motor
  - 3 Cálculo e incerteza
  - 4 A máquina de aprender
  - 5 A matemática do aprendizado
  - 6 Aprendizado de máquina
  - 7 Redes profundas
  - 8 Escala
  - 9 Pós-treino e primeiro paper
  - 10 Circuitos e agentes
  - 11 Segurança
  - 12 Pesquisa independente
  - 13 Fronteira
- **Trilhas em inglês:**
  - Mathematics
  - Computing for AI
  - Machine Learning
  - Mechanistic Interpretability
  - Reinforcement Learning
  - Agents
  - Cognitive Architectures
  - Cognitive Science
  - Computational Neuroscience
  - Consciousness
  - Mind–Machine Interfaces
  - Alignment & Safety
  - Philosophy of Mind & Science
  - Research Craft
  - Cybernetics & Complex Systems
  - Build Your Own AI
- **Títulos:** os 180 títulos originais foram passados para o inglês. O título em português continua guardado em `t_pt`.
- **IDs:** todos os IDs antigos foram mantidos, com o mesmo número de itens de checkpoint. O progresso exportado do painel antigo continua importando: o validador confere isso com `--progresso`.

## 6. Materiais

**Regra por assunto:**
- pelo menos 1 material de entrada;
- 1 texto canônico;
- 1 material prático (código ou curso);
- 1 aula ou vídeo, quando existir;
- nos níveis 8–13, fora da matemática pura, pelo menos 1 fonte de 2025–2026.

**Fontes novas:** foram conferidas uma a uma.
- Papers do arXiv: título, primeiro autor e ano pelo DataCite.
- DOIs: Crossref.
- Vídeos: oEmbed do YouTube.
- Demais links: resposta da página.
- Sites que recusam leitura automática: navegador comum, README do repositório ou ISBN no Open Library.

**Status:** em andamento — a completude por assunto e a checagem de links das 893 fontes originais entram na próxima atualização deste relatório.
