# A03 — LLM agents: the agentic loop and tool use

*Agentes com LLMs: o loop agêntico e uso de ferramentas*

- **Trilha:** Agents
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** LLM agents, ReAct, tool use, function calling, Model Context Protocol
- **Projetos KEIROS:** REIXU

## Por que importa

Agentes de linguagem — LLMs que raciocinam, chamam ferramentas e agem em ambientes — são o paradigma dominante da IA aplicada hoje. Entender o laço agêntico, o uso de ferramentas e os protocolos abertos (MCP, A2A) é o que separa construir agentes robustos de encadear prompts.

## Pré-requisitos

- **Depende de:** A02 (Search and classical planning), L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models)
- **Destrava:** A04 (Memory for agents), A05 (Agentic planning and reasoning with LLMs), A06 (Multi-agent systems), A07 (Agent evaluation), Z05 (Build an agent on your model: tools, memory and retrieval)

## Base

1. O laço agêntico: observar → raciocinar → agir → observar (ReAct) **L17**.
2. Uso de ferramentas e chamadas de função; esquemas e validação.
3. Instruções de sistema, papéis e prompting estruturado.
4. Reflexão e autoavaliação (Reflexion) — e seus limites.
5. Model Context Protocol (MCP) e Agent2Agent (A2A) como padrões abertos, hoje abrigados na Linux Foundation (o MCP por meio da Agentic AI Foundation).
6. Padrões de projeto: workflows fixos vs. agentes autônomos.

## Meio

- Ambientes, sandboxes e segurança de ferramentas (injeção de prompt) → AL03.
- Custo, latência e cache.
- Agentes de código como estudo de caso.

## Avançado

- Agentes que aprendem ferramentas e habilidades novas (Toolformer, Voyager).
- Avaliação → A07 e confiabilidade → A08.
- Arquiteturas cognitivas para agentes de linguagem → K06.

## Matemática necessária

**M22**: probabilidade (amostragem e incerteza das saídas).

## Métodos

- Escreva um agente ReAct do zero, sem frameworks, com três ferramentas e um servidor MCP seu.
- Implemente cada padrão de "Building Effective Agents" (encadeamento, roteamento, orquestrador-trabalhadores, avaliador-otimizador).
- Instrumente tudo: logs de cada passo, custo e tipo de erro.

## Desafios

- Frameworks que escondem o laço e tornam a depuração impossível.
- Ferramentas mal descritas, que o modelo chama errado.
- Confiar na autoavaliação do próprio modelo.

## Fontes

- 📄 [ReAct: Synergizing Reasoning and Acting in Language Models](https://arxiv.org/abs/2210.03629) — Shunyu Yao et al., 2022 · paper
- 📄 [Toolformer: Language Models Can Teach Themselves to Use Tools](https://arxiv.org/abs/2302.04761) — Timo Schick et al., 2023 · paper
- 📄 [Reflexion: Language Agents with Verbal Reinforcement Learning](https://arxiv.org/abs/2303.11366) — Noah Shinn et al., 2023 · paper
- 🗺️ [Building Effective AI Agents](https://www.anthropic.com/engineering/building-effective-agents) — Anthropic, 2024 · guia
- 🌐 [Model Context Protocol — specification and documentation](https://modelcontextprotocol.io/) — Model Context Protocol · site
- 📰 [Donating the Model Context Protocol and establishing the Agentic AI Foundation](https://www.anthropic.com/news/donating-the-model-context-protocol-and-establishing-of-the-agentic-ai-foundation) — Anthropic · artigo
- 🎓 [Large Language Model Agents (MOOC, Fall 2024)](https://llmagents-learning.org/f24) — Dawn Song et al. (UC Berkeley) · curso. aulas em vídeo
- 🆕 [Measuring AI Ability to Complete Long Software Tasks](https://arxiv.org/abs/2503.14499) — Thomas Kwa et al., 2025 · recente

## Boss fight

Construa do zero, sem framework, um agente ReAct em Python ou REIXU com chamadas de ferramentas validadas por esquema, um servidor MCP próprio (por exemplo, expondo o sistema de arquivos de um projeto e um executor de testes), memória de trabalho e logs completos. Avalie em 30 tarefas reais suas, reportando taxa de sucesso, custo e um catálogo dos tipos de falha.

## Checkpoint

- [ ] Descreva o laço ReAct e por que intercalar raciocínio e ação ajuda.
- [ ] O que o MCP padroniza e que problema resolve?
- [ ] Quando usar um workflow fixo em vez de um agente?
- [ ] Por que a autoavaliação do modelo é pouco confiável?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
