# L25 — Reasoning, search and compositional generalization

*Raciocínio, busca e generalização composicional*

- **Trilha:** Machine Learning
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** reasoning, test-time compute, search, compositional generalization, ARC

## Por que importa

O que separa memorização de raciocínio? Modelos recentes resolvem problemas de olimpíada mas falham em variações triviais; benchmarks como o ARC-AGI medem a capacidade de generalizar a partir de poucos exemplos. Aqui ficam os limites e as técnicas — chain-of-thought, busca, verificação, prova formal — do raciocínio em máquinas.

## Pré-requisitos

- **Depende de:** L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models), R08 (Model-based RL, planning and search), M36 (Theory of computation: automata, grammars and computability)
- **Destrava:** A05 (Agentic planning and reasoning with LLMs)

## Base

1. Chain-of-thought e o "rascunho" como computação extra **L17**.
2. Autoconsistência, árvores de pensamento e busca sobre raciocínios (MCTS) **R08**.
3. Verificadores: supervisão de processo (PRMs) e de resultado; verificação formal.
4. Generalização composicional e sistematicidade (de Fodor & Pylyshyn a Lake & Baroni).
5. Raciocínio formal: LLMs + Lean, AlphaGeometry, AlphaProof.
6. ARC e ARC-AGI-2: inteligência como eficiência de aquisição de habilidades (Chollet).

## Meio

- Fragilidade sob perturbação (GSM-Symbolic e trabalhos afins).
- O debate "The Illusion of Thinking" (2025) e as réplicas contestado
- Expressividade com chain-of-thought → M37.

## Avançado

- O que conta como "raciocínio de verdade"? Critérios mecanicistas (circuitos) vs. comportamentais → I06.
- Síntese de programas e sistemas neurossimbólicos → K05.
- Raciocínio de longo horizonte em agentes → A05.

## Matemática necessária

**M36**: computabilidade; **M22**: probabilidade.

## Métodos

- Construa avaliações com perturbações controladas (números trocados, cláusulas irrelevantes) e meça a queda.
- Implemente busca com verificador (best-of-n, feixe com PRM) em problemas de resposta checável.
- Ataque tarefas do ARC-AGI-2 com um modelo aberto mais busca e analise as falhas.

## Desafios

- Contaminação: problemas famosos estão nos dados de treino.
- Ler o texto da chain-of-thought como "o pensamento real" do modelo: a fidelidade não é garantida.

## Fontes

- 📄 [Chain-of-Thought Prompting Elicits Reasoning in Large Language Models](https://arxiv.org/abs/2201.11903) — Jason Wei et al., 2022 · paper
- 📄 [Let's Verify Step by Step](https://arxiv.org/abs/2305.20050) — Hunter Lightman et al., 2023 · paper
- 📄 [On the Measure of Intelligence](https://arxiv.org/abs/1911.01547) — François Chollet, 2019 · paper
- 🆕 [ARC-AGI-2: A New Challenge for Frontier AI Reasoning Systems](https://arxiv.org/abs/2505.11831) — François Chollet et al., 2025 · recente
- 📄 [Human-like systematic generalization through a meta-learning neural network](https://doi.org/10.1038/s41586-023-06668-3) — Brenden M. Lake & Marco Baroni, 2023 · paper
- 📄 [GSM-Symbolic: Understanding the Limitations of Mathematical Reasoning in Large Language Models](https://arxiv.org/abs/2410.05229) — Iman Mirzadeh et al., 2024 · paper

## Boss fight

Crie um benchmark de raciocínio com perturbações controladas (versões isomórficas de problemas com números, nomes e distratores alterados) e avalie três modelos abertos com e sem chain-of-thought e com e sem busca + verificador. Meça a robustez com intervalos de confiança e escreva onde o desempenho parece raciocínio e onde parece recuperação de padrões. Bônus: resolva 20 tarefas do ARC-AGI-2 com um pipeline seu e documente as falhas.

## Checkpoint

- [ ] Por que a chain-of-thought aumenta a capacidade computacional de um transformer?
- [ ] Qual a diferença entre supervisão de processo e de resultado?
- [ ] O que é generalização composicional e por que redes falham nela?
- [ ] O que o ARC-AGI tenta medir que benchmarks tradicionais não medem?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
