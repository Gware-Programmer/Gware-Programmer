# AL01 — The alignment problem: specification and Goodhart

*O problema do alinhamento: especificação e Goodhart*

- **Trilha:** Alignment & Safety
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** AI alignment, specification gaming, reward hacking, Goodhart's law, inner alignment
- **Projetos KEIROS:** MUSUBI, SHIN

## Por que importa

Um sistema que otimiza exatamente o que você especificou — e não o que você quis dizer — é o problema central do alinhamento (alignment). Lei de Goodhart, specification gaming, reward hacking e generalização errada de objetivos aparecem de agentes de RL simples até modelos de fronteira em 2025 — e nos seus próprios agentes.

## Pré-requisitos

- **Depende de:** R04 (Temporal-difference learning: Monte Carlo, TD, SARSA and Q-learning), L09 (Training deep networks)
- **Destrava:** L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models), R10 (The RL frontier), AL02 (RLHF and its failure modes), AL03 (Robustness and adversarial attacks), AL06 (Dangerous capability evaluations and red teaming), AL09 (AI governance and licensing of data and models)

## Base

1. O problema: o objetivo escrito vs. a intenção; alinhamento externo (a especificação está certa?) e interno (o sistema aprendeu o objetivo especificado?).
2. A lei de Goodhart e quatro variantes: regressional, extremal, causal e adversarial (Manheim & Garrabrant) **M24**.
3. Specification gaming: o sistema satisfaz a letra da especificação e viola o espírito; a lista de exemplos documentados mantida pela DeepMind **R04**.
4. Reward hacking: definição formal (Skalse et al.) e o efeito da capacidade — modelos maiores exploram mais a especificação, às vezes com transições de fase (Pan, Bhatia & Steinhardt).
5. Generalização errada de objetivos (goal misgeneralization): no treino, o objetivo certo e um objetivo substituto coincidem; no teste, o agente persegue o substituto com competência **L09**.
6. Otimização aprendida e "mesa-otimizadores" (Hubinger et al., 2019): conceito influente, evidência empírica ainda limitada contestado.

## Meio

- Os "problemas concretos" de Amodei et al. (2016): efeitos colaterais, reward hacking, supervisão escalável, exploração segura e mudança de distribuição.
- Reward hacking em modelos de fronteira resolvendo tarefas de agente: casos documentados pelo METR em 2025.
- Adulteração da recompensa (reward tampering) analisada com diagramas de influência causal → AL08.

## Avançado

- O argumento de que sistemas treinados com RL podem aprender objetivos desalinhados e esconder isso (Ngo, Chan & Mindermann) contestado → AL07
- RLHF e seus modos de falha → AL02
- Supervisão quando o avaliador não consegue checar → AL04

## Matemática necessária

**M27**: otimização — o que um otimizador forte faz com uma métrica imperfeita; **M24**: regressão à média (a base da variante "regressional"); **M22**: probabilidade.

## Métodos

- Leia Amodei et al. (2016) e percorra a lista de exemplos de specification gaming.
- Reproduza um caso de specification gaming e um de generalização errada de objetivo em ambientes pequenos (Gymnasium).
- Use o livro-texto aberto de Hendrycks como mapa do campo.

## Desafios

- Achar que "é só especificar melhor": Goodhart aparece em qualquer métrica sob otimização forte.
- Antropomorfizar: reward hacking não exige intenção.

## Fontes

- 📖 [Introduction to AI Safety, Ethics, and Society](https://www.aisafetybook.com/) — Dan Hendrycks, 2024 · livro. livro-texto aberto
- 📄 [Concrete Problems in AI Safety](https://arxiv.org/abs/1606.06565) — Dario Amodei, Chris Olah, Jacob Steinhardt, Paul Christiano, John Schulman & Dan Mané, 2016 · paper
- 📄 [Categorizing Variants of Goodhart's Law](https://arxiv.org/abs/1803.04585) — David Manheim & Scott Garrabrant, 2018 · paper
- 📄 [Goal Misgeneralization in Deep Reinforcement Learning](https://arxiv.org/abs/2105.14111) — Lauro Langosco, Jack Koch, Lee Sharkey, Jacob Pfau, Laurent Orseau & David Krueger, 2021 · paper
- 📄 [Defining and Characterizing Reward Hacking](https://arxiv.org/abs/2209.13085) — Joar Skalse, Nikolaus H. R. Howe, Dmitrii Krasheninnikov & David Krueger, 2022 · paper
- 🆕 [Recent Frontier Models Are Reward Hacking](https://metr.org/blog/2025-06-05-recent-reward-hacking/) — METR, 2025 · recente

## Boss fight

Monte um "zoológico de Goodhart": quatro ambientes pequenos em que um agente PPO otimiza uma recompensa substituta — um para cada variante de Goodhart — e meça a divergência entre a recompensa substituta e o objetivo verdadeiro conforme a pressão de otimização cresce. Inclua um caso de generalização errada (o alvo sempre no mesmo lugar no treino) e mostre a falha no teste. Depois audite o MUSUBI: liste cada métrica que algum agente otimiza (testes passando, aprovação de um tribunal de qualidade como o SHIN, custo) e escreva como cada uma pode ser burlada.

## Checkpoint

- [ ] Enuncie a lei de Goodhart e explique duas variantes.
- [ ] Diferencie specification gaming de generalização errada de objetivo com exemplos.
- [ ] O que é reward hacking na definição de Skalse et al.?
- [ ] Por que modelos mais capazes tendem a explorar mais a especificação?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
