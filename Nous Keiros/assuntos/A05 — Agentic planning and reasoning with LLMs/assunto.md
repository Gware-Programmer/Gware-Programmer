# A05 — Agentic planning and reasoning with LLMs

*Planejamento e raciocínio agêntico com LLMs*

- **Trilha:** Agents
- **Nível:** 11 — Segurança · onda 1
- **Termos:** LLM planning, LLM-Modulo, verification, search over actions
- **Projetos KEIROS:** MUSUBI

## Por que importa

LLMs geram planos plausíveis, mas não confiáveis. Combinar LLMs com verificadores, planejadores simbólicos e busca (LLM-Modulo) é o caminho mais sólido para agentes que planejam — e o tema mostra com clareza como o raciocínio de máquina falha e se corrige.

## Pré-requisitos

- **Depende de:** A03 (LLM agents: the agentic loop and tool use), L25 (Reasoning, search and compositional generalization), R09 (World models)
- **Destrava:** A08 (Long-horizon reliability), K06 (Cognitive architectures for language agents)

Novo pré-requisito: **R09** — world models para planejar.

## Base

1. PlanBench: LLMs em planejamento clássico e o fosso entre plausível e correto **A02**.
2. LLM-Modulo: gerar com o LLM, verificar com críticos externos (simbólicos, simuladores, testes).
3. Decomposição de tarefas e planos hierárquicos com LLMs.
4. Busca sobre ações e raciocínios com verificação **L25**.
5. Replanejamento a partir do feedback do ambiente.

## Meio

- Traduzir problemas para PDDL com LLMs e resolver com planejadores clássicos.
- Planejar com world models → R09.
- Custo da busca vs. ganho de correção.

## Avançado

- O que quer dizer "LLMs não planejam"? Posições e evidências contestado
- Raciocínio de longo horizonte e erros compostos → A08.
- Planejamento em arquiteturas cognitivas como inspiração → K06.

## Matemática necessária

**M22**: probabilidade; **M36**: computabilidade (o que verificadores conseguem garantir).

## Métodos

- Reproduza parte do PlanBench com um modelo aberto; implemente um LLM-Modulo com verificador de planos PDDL e meça o ganho.
- Compare: LLM sozinho, LLM + verificador com replanejamento, LLM → PDDL → planejador.

## Desafios

- Medir só planos curtos e fáceis.
- Verificadores incompletos que aprovam planos errados.

## Fontes

- 📄 [LLMs Can't Plan, But Can Help Planning in LLM-Modulo Frameworks](https://arxiv.org/abs/2402.01817) — Subbarao Kambhampati et al., 2024 · paper
- 📄 [PlanBench: An Extensible Benchmark for Evaluating Large Language Models on Planning and Reasoning about Change](https://arxiv.org/abs/2206.10498) — Karthik Valmeekam et al., 2022 · paper
- 📄 [Tree of Thoughts: Deliberate Problem Solving with Large Language Models](https://arxiv.org/abs/2305.10601) — Shunyu Yao et al., 2023 · paper
- 📖 [Acting, Planning, and Learning](https://projects.laas.fr/planning/) — Malik Ghallab, Dana Nau & Paolo Traverso · livro
- 📄 [Voyager: An Open-Ended Embodied Agent with Large Language Models](https://arxiv.org/abs/2305.16291) — Guanzhi Wang et al., 2023 · paper

## Boss fight

Monte um benchmark de planejamento com três domínios PDDL (um deles do MUSUBI) e instâncias de dificuldade crescente. Compare LLM sozinho, LLM com verificador e replanejamento (LLM-Modulo) e a tradução LLM → PDDL → planejador clássico, medindo correção verificada automaticamente, custo e a queda de desempenho com o tamanho do problema.

## Checkpoint

- [ ] Por que plausibilidade não é correção em planejamento?
- [ ] O que o LLM-Modulo propõe?
- [ ] Quando traduzir para PDDL é melhor do que planejar com o LLM?
- [ ] Como busca com verificador melhora o raciocínio?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
