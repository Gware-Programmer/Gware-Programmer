# K07 — Forty years of cognitive architectures: what was solved and what wasn't

*Balanço de 40+ anos: o que foi resolvido e o que não*

- **Trilha:** Cognitive Architectures
- **Nível:** 12 — Pesquisa independente · onda 1
- **Termos:** cognitive architecture evaluation, integration problem, standard model of the mind
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Depois de 40+ anos, arquiteturas cognitivas explicam muitos dados de laboratório, mas nenhuma chegou perto de inteligência geral — enquanto modelos sem arquitetura explícita avançaram rápido. Entender por quê é o balanço que você precisa antes de apostar anos no Rei Ichi.

## Pré-requisitos

- **Depende de:** K04 (LIDA, CLARION, Sigma and consciousness-inspired architectures), K05 (Neurosymbolic systems), K06 (Cognitive architectures for language agents)
- **Destrava:** Z08 (Integrate into Rei Ichi: architecture, ablations and technical report)

## Base

1. O que funcionou: previsões quantitativas de tempos e erros, tutores cognitivos em uso real, agentes simulados de longa duração (Soar em simulações militares) **K02**, **K03**.
2. O que não escalou: aquisição de conhecimento à mão, percepção a partir de dados brutos, aprendizado em escala, senso comum.
3. O problema da integração: juntar módulos validados isoladamente não produz automaticamente um sistema geral.
4. Avaliação: falta de benchmarks comuns e de comparações controladas entre arquiteturas.
5. O Modelo Comum como consenso mínimo e sua checagem com dados de conectoma **K01**.

## Meio

- O que os LLMs resolveram (conhecimento amplo, linguagem) e o que deixaram em aberto (memória persistente, controle, aprendizado contínuo, confiabilidade) **K06**.
- "Construir máquinas que aprendem e pensam como pessoas": o programa de Lake, Ullman, Tenenbaum & Gershman.
- Arquiteturas inspiradas em consciência: promessa teórica, evidência funcional fraca **K04**.

## Avançado

- Pergunta em aberto: estrutura explícita é necessária para inteligência geral, ou emerge da escala? contestado
- Como avaliar uma arquitetura inteira: suítes de tarefas, ablações, predições neurais.
- O lugar do Rei Ichi nesse mapa: o que ele testaria que ninguém testou → S10.

## Matemática necessária

**M24**: estatística para comparar sistemas; **M22**: probabilidade.

## Métodos

- Releia Kotseruba & Tsotsos e Lake et al. com uma pergunta: o que impediu cada arquitetura de escalar?
- Leia a análise de conectoma de Stocco et al. como exemplo de teste empírico de uma arquitetura.
- Escreva uma matriz arquiteturas × capacidades × evidências, separando demonstração de teste.

## Desafios

- Nostalgia simbólica ou desprezo por 40 anos de resultados: os dois erram.
- Avaliar arquitetura com um único ambiente feito sob medida.

## Fontes

- 🧭 [40 years of cognitive architectures: core cognitive abilities and practical applications](https://doi.org/10.1007/s10462-018-9646-y) — Iuliia Kotseruba & John K. Tsotsos, 2020 · review
- 📄 [Building machines that learn and think like people](https://doi.org/10.1017/S0140525X16001837) — Brenden M. Lake, Tomer D. Ullman, Joshua B. Tenenbaum & Samuel J. Gershman, 2017 · paper
- 📄 [Analysis of the human connectome data supports the notion of a "Common Model of Cognition" for human and human-like intelligence across domains](https://doi.org/10.1016/j.neuroimage.2021.118035) — Andrea Stocco, Catherine Sibert, Zoe Steine-Hanson, Natalie Koh, John E. Laird, Christian J. Lebiere & Paul Rosenbloom, 2021 · paper
- 📄 [A Standard Model of the Mind: Toward a Common Computational Framework across Artificial Intelligence, Cognitive Science, Neuroscience, and Robotics](https://doi.org/10.1609/aimag.v38i4.2744) — John E. Laird, Christian Lebiere & Paul S. Rosenbloom, 2017 · paper
- 📄 [Cognitive Architectures for Language Agents](https://arxiv.org/abs/2309.02427) — Theodore R. Sumers, Shunyu Yao, Karthik Narasimhan & Thomas L. Griffiths, 2023 · paper
- 🌐 [Stanford Encyclopedia of Philosophy: Cognitive Science](https://plato.stanford.edu/entries/cognitive-science/) — Stanford Encyclopedia of Philosophy · site
- 🔧 [Soar](https://soar.eecs.umich.edu/) — Universidade de Michigan · ferramenta. download e tutoriais
- 🆕 [A Proposal to Extend the Common Model of Cognition with Metacognition](https://arxiv.org/abs/2506.07807) — John Laird, Christian Lebiere, Paul Rosenbloom & Andrea Stocco, 2025 · recente

**Exceções na regra de materiais:**

- sem aula ou vídeo: não há curso em vídeo aberto e estável sobre este tema

## Boss fight

Escreva um paper de posição sobre o Rei Ichi: compare-o com Soar, ACT-R, LIDA, CLARION, Sigma e agentes no estilo CoALA pelos critérios de Langley, Laird & Rogers; defina uma suíte de avaliação com ablações de cada subsistema; e responda com dados à pergunta central — a integração acrescenta capacidade além da soma das partes? Inclua uma seção do que o Rei Ichi ainda não consegue fazer.

## Checkpoint

- [ ] Cite duas coisas que arquiteturas cognitivas fizeram bem e duas que não escalaram.
- [ ] O que é o problema da integração?
- [ ] O que os LLMs mudaram nesse balanço?
- [ ] Como você avaliaria uma arquitetura inteira, e não só uma tarefa?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
