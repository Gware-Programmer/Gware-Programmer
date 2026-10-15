# Z05 — Build an agent on your model: tools, memory and retrieval

*Construir um agente sobre o seu modelo: ferramentas, memória e recuperação*

- **Trilha:** Build Your Own AI
- **Nível:** 10 — Circuitos e agentes · onda 3
- **Termos:** LLM agent, agentic loop, tool use, function calling, code execution sandbox, agent memory, retrieval, ReAct, agent evaluation, pass^k, prompt injection, trajectories
- **Projetos KEIROS:** MUSUBI, Rei Ichi

## Por que importa

Um modelo responde; um agente age: usa ferramentas, lembra, busca, planeja e confere o próprio trabalho. Construir o agente sobre o seu próprio modelo, rodando no seu Mac e avaliado com rigor, é o passo em que a sua IA começa a fazer coisas — e em que os limites de confiabilidade ficam claros.

## Pré-requisitos

- **Depende de:** Z03 (Post-train an open model: SFT, preferences and RLVR), A03 (LLM agents: the agentic loop and tool use), A04 (Memory for agents), A10 (Information retrieval and vector search: BM25, embeddings, ANN and RAG), A07 (Agent evaluation)
- **Destrava:** Z08 (Integrate into Rei Ichi: architecture, ablations and technical report)

## Base

1. O laço agêntico: observar, pensar, agir e verificar **A03**.
2. Ferramentas: chamadas de função, execução de código em sandbox e busca.
3. Memória de curto e de longo prazo **A04**.
4. Recuperação sobre a sua biblioteca **A10**.
5. Avaliação: taxa de sucesso, pass^k e custo por tarefa **A07**.
6. Segurança básica: sandbox, permissões e injeção de prompt.

## Meio

- Planejamento e autocorreção.
- O mesmo agente sobre o seu modelo e sobre um modelo aberto maior.
- Registro completo das trajetórias para analisar as falhas.

## Avançado

- Vários agentes cooperando (prévia de → A06).
- Horizontes longos e acúmulo de erros (prévia de → A08).
- Ajustar o modelo com as trajetórias do próprio agente.

## Matemática necessária

**A07**: avaliação de agentes; **P04**: estatística.

## Métodos

- Leia o ReAct e o SWE-agent; faça o curso de agentes da Hugging Face.
- Comece com uma ferramenta e 20 tarefas; só depois cresça.
- Classifique cada falha: planejamento, ferramenta, memória ou modelo.

## Desafios

- Avaliar o agente com poucas tarefas e sem repetir execuções.
- Dar ferramentas perigosas sem sandbox.
- Confundir uma demonstração bonita com confiabilidade.

## Fontes

- 📄 [ReAct: Synergizing Reasoning and Acting in Language Models](https://arxiv.org/abs/2210.03629) — Shunyu Yao et al., 2022 · paper
- 📄 [Toolformer: Language Models Can Teach Themselves to Use Tools](https://arxiv.org/abs/2302.04761) — Timo Schick et al., 2023 · paper
- 📄 [SWE-agent: Agent-Computer Interfaces Enable Automated Software Engineering](https://arxiv.org/abs/2405.15793) — John Yang et al., 2024 · paper
- 📄 [Generative Agents: Interactive Simulacra of Human Behavior](https://arxiv.org/abs/2304.03442) — Joon Sung Park et al., 2023 · paper
- 📄 [MemGPT: Towards LLMs as Operating Systems](https://arxiv.org/abs/2310.08560) — Charles Packer et al., 2023 · paper
- 🆕 [τ-bench: A Benchmark for Tool-Agent-User Interaction in Real-World Domains](https://arxiv.org/abs/2406.12045) — Shunyu Yao et al., 2024 · recente
- 🎓 [AI Agents Course](https://huggingface.co/learn/agents-course) — Hugging Face · curso
- 🔧 [smolagents](https://github.com/huggingface/smolagents) — Hugging Face · ferramenta

## Boss fight

Construa no MUSUBI um agente sobre a sua própria IA, rodando localmente: ferramentas de arquivo, busca na sua biblioteca e execução de código em sandbox, com memória de longo prazo. Avalie em 50 tarefas suas com 5 repetições cada (pass^k), classifique as falhas e compare com o mesmo agente usando um modelo aberto maior. Escreva onde o seu modelo é o gargalo e onde o problema é o desenho do agente.

## Checkpoint

- [ ] Quais são as etapas do laço agêntico, e onde cada tipo de falha aparece?
- [ ] O que pass^k mede que a taxa de sucesso média não mede?
- [ ] Por que um agente precisa de sandbox para executar código?
- [ ] O que é injeção de prompt num agente que lê documentos?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
