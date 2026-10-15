# A06 — Multi-agent systems

*Sistemas multiagente*

- **Trilha:** Agents
- **Nível:** 11 — Segurança · onda 1
- **Termos:** multi-agent systems, coordination, debate, orchestration, failure taxonomy
- **Projetos KEIROS:** MUSUBI

## Por que importa

Muitos agentes cooperando ou competindo — o MUSUBI é exatamente isso. A pesquisa mostra ganhos reais em algumas tarefas, mas também que a maioria das falhas multiagente vem de especificação e coordenação, não do modelo: saber disso evita construir a arquitetura errada.

## Pré-requisitos

- **Depende de:** A03 (LLM agents: the agentic loop and tool use), M39 (Game theory)
- **Destrava:** —

## Base

1. Teoria clássica de sistemas multiagente: comunicação, coordenação, negociação **M39**.
2. Teoria dos jogos aplicada: incentivos, equilíbrios, cooperação.
3. Padrões com LLMs: orquestrador-trabalhadores, debate, papéis especializados **A03**.
4. Debate multiagente para factualidade e raciocínio.
5. A taxonomia MAST: falhas de especificação, de desalinhamento entre agentes e de verificação.
6. Quando vários agentes compensam: paralelismo, isolamento de contexto, custo de tokens.

## Meio

- Comunicação entre agentes por protocolos abertos (A2A, MCP).
- O sistema multiagente de pesquisa da Anthropic como estudo de caso (ganhos e custo em tokens).
- Simulações sociais com agentes.

## Avançado

- Comportamentos emergentes e riscos em populações de agentes (conluio, falhas em cascata).
- IA cooperativa: incentivos e confiança entre agentes **M39**.
- RL multiagente → R10.

## Matemática necessária

**M39**: teoria dos jogos; **M22**: probabilidade.

## Métodos

- Implemente orquestrador-trabalhadores e debate do zero e compare com um agente único em três tipos de tarefa.
- Aplique a taxonomia MAST aos traces do MUSUBI e compare o motor Fusion ×N (sessões paralelas + síntese por consenso) com debate multiagente.

## Desafios

- Multiplicar agentes para compensar uma especificação ruim.
- Ignorar o custo total de tokens.
- Não ter verificação final.

## Fontes

- 📖 [Multiagent Systems: Algorithmic, Game-Theoretic, and Logical Foundations](http://www.masfoundations.org/) — Yoav Shoham & Kevin Leyton-Brown, 2009 · livro
- 📄 [Why Do Multi-Agent LLM Systems Fail?](https://arxiv.org/abs/2503.13657) — Mert Cemri et al., 2025 · paper. a taxonomia MAST
- 📄 [Improving Factuality and Reasoning in Language Models through Multiagent Debate](https://arxiv.org/abs/2305.14325) — Yilun Du, Shuang Li, Antonio Torralba, Joshua B. Tenenbaum & Igor Mordatch, 2023 · paper
- 📄 [AutoGen: Enabling Next-Gen LLM Applications via Multi-Agent Conversation](https://arxiv.org/abs/2308.08155) — Qingyun Wu et al., 2023 · paper
- 📰 [How we built our multi-agent research system](https://www.anthropic.com/engineering/multi-agent-research-system) — Anthropic, 2025 · artigo
- 🎓 [Large Language Model Agents (MOOC, Fall 2024)](https://llmagents-learning.org/f24) — Dawn Song et al. (UC Berkeley) · curso. aulas em vídeo

## Boss fight

Instrumente o MUSUBI para registrar traces completos, rode cem tarefas reais e anote as falhas com a taxonomia MAST, com um segundo anotador (humano ou LLM) e medida de concordância. Implemente as duas correções de maior impacto e mostre o efeito com estatística; compare também com um agente único bem especificado.

## Checkpoint

- [ ] Quais são as três grandes categorias de falha do MAST?
- [ ] Quando um sistema multiagente supera um agente único?
- [ ] O que o debate multiagente melhora e por quê?
- [ ] Que custos um sistema multiagente adiciona?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
