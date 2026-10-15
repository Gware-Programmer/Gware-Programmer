# K06 — Cognitive architectures for language agents

*Arquiteturas cognitivas para agentes de linguagem*

- **Trilha:** Cognitive Architectures
- **Nível:** 11 — Segurança · onda 2
- **Termos:** CoALA, cognitive architectures for language agents, LLM + cognitive architecture
- **Projetos KEIROS:** MUSUBI, Rei Ichi

## Por que importa

Os agentes de linguagem de hoje reinventaram, quase sem citar, ideias de 40 anos de arquiteturas cognitivas: memórias separadas, ciclo de decisão, aprendizado procedural. Juntar as duas tradições é uma das apostas mais concretas para agentes robustos — e é o encontro exato entre o MUSUBI e o Rei Ichi.

## Pré-requisitos

- **Depende de:** K02 (Soar), K03 (ACT-R), A04 (Memory for agents), A05 (Agentic planning and reasoning with LLMs)
- **Destrava:** K07 (Forty years of cognitive architectures: what was solved and what wasn't)

## Base

1. CoALA: memória de trabalho, episódica, semântica e procedural; ações internas (recuperar, raciocinar, aprender) e externas; ciclo de decisão planejar → executar **A04**.
2. O ciclo de decisão do Soar reaparecendo como propor → avaliar → selecionar no planejamento com LLMs **K02**, **A05**.
3. Ativação de memória do ACT-R aplicada à recuperação em agentes **K03**.
4. O LLM como componente: gerador de propostas, avaliador, modelo de mundo — não a arquitetura inteira.
5. Integração em mão dupla: arquiteturas cognitivas usando LLMs e LLMs ganhando estrutura de arquiteturas.

## Meio

- Aprendizado procedural: habilidades como código reutilizável (Voyager) e o paralelo com o chunking.
- Controle explícito vs. controle implícito no prompt.
- Avaliação: que tarefas exigem de fato memória e controle explícitos → A07.

## Avançado

- Raciocínio de longo horizonte e erros compostos como argumento para controle explícito → A08.
- Arquiteturas de agentes e indicadores de consciência → S10.
- Até onde estrutura explícita ajuda e quando a escala a torna desnecessária contestado → K07

## Matemática necessária

**M22**: probabilidade; **M13**: estruturas discretas (grafos de memória e de planos).

## Métodos

- Leia CoALA e classifique ReAct, Reflexion, Voyager e os agentes generativos no esquema.
- Implemente um ciclo de decisão explícito (propor, avaliar, selecionar, aplicar) com um LLM como gerador de propostas.
- Compare controle explícito com ReAct puro em tarefas longas, medindo pass^k **A03**.

## Desafios

- Chamar qualquer lista de prompts de arquitetura.
- Medir só tarefas curtas, onde estrutura explícita não faz diferença.

## Fontes

- 📄 [Cognitive Architectures for Language Agents](https://arxiv.org/abs/2309.02427) — Theodore R. Sumers, Shunyu Yao, Karthik Narasimhan & Thomas L. Griffiths, 2023 · paper. o CoALA
- 📄 [Synergistic Integration of Large Language Models and Cognitive Architectures for Robust AI: An Exploratory Analysis](https://arxiv.org/abs/2308.09830) — Oscar J. Romero, John Zimmerman, Aaron Steinfeld & Anthony Tomasic, 2023 · paper
- 📄 [Can A Cognitive Architecture Fundamentally Enhance LLMs? Or Vice Versa?](https://arxiv.org/abs/2401.10444) — Ron Sun, 2024 · paper
- 📄 [An Analysis and Comparison of ACT-R and Soar](https://arxiv.org/abs/2201.09305) — John E. Laird, 2022 · paper
- 📄 [Voyager: An Open-Ended Embodied Agent with Large Language Models](https://arxiv.org/abs/2305.16291) — Guanzhi Wang et al., 2023 · paper. habilidades como código
- 🎓 [Large Language Model Agents (MOOC, Fall 2024)](https://llmagents-learning.org/f24) — Dawn Song et al. (UC Berkeley) · curso. aulas em vídeo
- 🆕 [NL2GenSym: Natural Language to Generative Symbolic Rules for SOAR Cognitive Architecture via Large Language Models](https://arxiv.org/abs/2510.09355) — Fang Yuan et al., 2025 · recente

## Boss fight

Redesenhe a integração MUSUBI ↔ Rei Ichi no vocabulário do CoALA: que memórias existem, quais ações são internas e externas e qual é o ciclo de decisão. Implemente um ciclo explícito ao estilo Soar com LLM propondo operadores, ativação ACT-R para recuperação e habilidades aprendidas como código, e compare com um agente ReAct em 30 tarefas longas suas, com pass^k e custo.

## Checkpoint

- [ ] Quais são os componentes do CoALA?
- [ ] Onde o ciclo de decisão do Soar aparece em agentes com LLMs?
- [ ] Que papel o LLM deveria ter numa arquitetura cognitiva?
- [ ] Que tipo de tarefa revela a vantagem de controle explícito?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
