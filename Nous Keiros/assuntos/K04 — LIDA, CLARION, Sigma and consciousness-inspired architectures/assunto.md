# K04 — LIDA, CLARION, Sigma and consciousness-inspired architectures

*LIDA, CLARION, Sigma e arquiteturas inspiradas em consciência*

- **Trilha:** Cognitive Architectures
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** LIDA, CLARION, Sigma, global workspace architectures, Spaun
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Algumas arquiteturas tentam ir além da cognição de alto nível: LIDA implementa o espaço de trabalho global, CLARION separa o implícito do explícito e tem drives motivacionais, Sigma unifica tudo em grafos de fatores e Spaun roda tarefas cognitivas em 2,5 milhões de neurônios simulados. São os parentes mais próximos do Rei Ichi.

## Pré-requisitos

- **Depende de:** K02 (Soar), K03 (ACT-R), S03 (Global workspace theories (GWT and GNWT))
- **Destrava:** K07 (Forty years of cognitive architectures: what was solved and what wasn't)

## Base

1. LIDA: ciclo cognitivo percepção → espaço de trabalho → competição de coalizões → difusão global (broadcast) → seleção de ação; implementação explícita da teoria do espaço de trabalho global **S03**.
2. CLARION: dois níveis (explícito-simbólico e implícito-subsimbólico) em cada subsistema — ação, conhecimento geral, motivação e metacognição.
3. O subsistema motivacional do CLARION: drives primários (fisiológicos e sociais) que geram objetivos.
4. Sigma: a hipótese de que grafos de fatores com passagem de mensagens bastam como substrato para toda a arquitetura.
5. Spaun e a Semantic Pointer Architecture: 2,5 milhões de neurônios com disparos, oito tarefas (de reconhecer dígitos a raciocínio fluido no estilo das matrizes de Raven), compilados pelo Neural Engineering Framework **N05**.

## Meio

- A Máquina de Turing Consciente (Blum & Blum): o espaço de trabalho global formalizado em ciência da computação teórica.
- Espaço de trabalho global com redes profundas (VanRullen & Kanai).
- O que cada arquitetura prevê de diferente — e o que nenhuma testou.

## Avançado

- Espaço de trabalho global em agentes de linguagem e o argumento de que eles já seriam conscientes contestado → S10
- Indicadores de consciência derivados da GWT aplicados a arquiteturas reais → S10.
- Arquiteturas inspiradas em consciência ainda não mostraram vantagem funcional clara sobre alternativas mais simples aberto → K07

## Matemática necessária

**M28**: sistemas dinâmicos (competição e ignição); **M22**: probabilidade (grafos de fatores do Sigma); **M17**: vetores de alta dimensão (ponteiros semânticos).

## Métodos

- Leia Franklin et al. (LIDA) e Mashour et al. (GNWT) lado a lado e marque o que é teoria e o que é engenharia.
- Rode exemplos do Nengo para entender ponteiros semânticos e o NEF.
- Escreva para cada arquitetura: que dado empírico ela explica que as outras não explicam?

## Desafios

- Chamar de "consciente" um módulo só porque tem difusão global.
- Arquiteturas grandes demais para qualquer avaliação controlada.

## Fontes

- 📄 [LIDA: A Systems-level Architecture for Cognition, Emotion, and Learning](https://doi.org/10.1109/TAMD.2013.2277589) — Stan Franklin, Tamas Madl, Sidney D'Mello & Javier Snaider, 2014 · paper
- 📖 [Anatomy of the Mind: Exploring Psychological Mechanisms and Processes with the Clarion Cognitive Architecture](https://doi.org/10.1093/acprof:oso/9780199794553.001.0001) — Ron Sun, 2016 · livro
- 📄 [The Sigma Cognitive Architecture and System: Towards Functionally Elegant Grand Unification](https://doi.org/10.1515/jagi-2016-0001) — Paul S. Rosenbloom, Abram Demski & Volkan Ustun, 2016 · paper
- 📄 [A Large-Scale Model of the Functioning Brain](https://doi.org/10.1126/science.1225266) — Chris Eliasmith, Terrence C. Stewart, Xuan Choo, Trevor Bekolay, Travis DeWolf, Yichuan Tang & Daniel Rasmussen, 2012 · paper. o Spaun
- 📄 [A theory of consciousness from a theoretical computer science perspective: Insights from the Conscious Turing Machine](https://doi.org/10.1073/pnas.2115934119) — Lenore Blum & Manuel Blum, 2022 · paper
- 📄 [Deep learning and the Global Workspace Theory](https://doi.org/10.1016/j.tins.2021.04.005) — Rufin VanRullen & Ryota Kanai, 2021 · paper

## Boss fight

Implemente no Rei Ichi um espaço de trabalho global mínimo: processadores especializados em paralelo, competição por acesso com capacidade limitada, ignição não linear e difusão para todos os módulos. Teste os quatro indicadores derivados da GWT (módulos paralelos, gargalo com atenção seletiva, difusão global, atenção dependente de estado) e faça uma ablação: o espaço de trabalho melhora tarefas que exigem coordenar módulos, comparado com o mesmo sistema sem ele? Reporte com estatística, inclusive se a resposta for "não".

## Checkpoint

- [ ] Descreva o ciclo cognitivo do LIDA.
- [ ] O que distingue o nível implícito do explícito no CLARION?
- [ ] Qual é a aposta unificadora do Sigma?
- [ ] O que o Spaun demonstrou e o que ele não demonstrou?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
