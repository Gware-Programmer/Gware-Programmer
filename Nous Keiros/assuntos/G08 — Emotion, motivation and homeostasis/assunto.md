# G08 — Emotion, motivation and homeostasis

*Emoção, motivação e homeostase*

- **Trilha:** Cognitive Science
- **Nível:** 8 — Escala · onda 1
- **Termos:** emotion, motivation, drives, homeostasis, interoception, homeostatic RL
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Organismos não maximizam uma recompensa arbitrária: regulam variáveis internas para continuar vivos, e emoções e motivações fazem parte desse controle. Homeostase, interocepção e motivação intrínseca são a ponte entre biologia e RL — e o teste de realidade para os 12 drives do Rei Ichi.

## Pré-requisitos

- **Depende de:** G04 (Learning, decision-making and bounded rationality), R04 (Temporal-difference learning: Monte Carlo, TD, SARSA and Q-learning)
- **Destrava:** N14 (Neuromodulation, emotion and homeostasis in the brain)

## Base

1. Teorias da emoção: básicas (discretas), dimensionais (valência e alerta, o modelo circumplexo) e construída (Barrett).
2. Homeostase e alostase: regular variáveis internas e antecipar necessidades.
3. Interocepção: perceber o estado do próprio corpo.
4. Motivação: drives, incentivo ("querer" vs. "gostar") e motivação intrínseca (autodeterminação).
5. RL homeostático (Keramati & Gutkin): recompensa como redução da distância a um ponto de ajuste interno **R04**.
6. Motivação intrínseca computacional: curiosidade, novidade e competência (Oudeyer & Kaplan).

## Meio

- De onde vem o valor quando não há recompensa externa? (Juechems & Summerfield).
- Emoção em agentes de RL e robôs.
- Sentimentos como representações de estados homeostáticos (Damasio & Carvalho).

## Avançado

- Emoção e consciência: a teoria de ordem superior da emoção contestado → S05
- Neuromodulação, amígdala e psiquiatria computacional → N14.
- Consciência enraizada na regulação do corpo ("máquina-animal") → S08.

## Matemática necessária

**M20**: distâncias e gradientes em espaços de estados internos; **M22**: probabilidade.

## Métodos

- Implemente RL homeostático num ambiente com duas necessidades (energia e temperatura) e compare com uma recompensa fixa.
- Implemente uma recompensa de curiosidade (erro de predição ou ganho de informação) e observe a exploração.
- Leia Barrett (2017) e Damasio & Carvalho (2013): duas visões opostas de emoção.

## Desafios

- Rotular variáveis como "emoções" sem papel funcional definido.
- Somar drives com pesos fixos — o RL homeostático mostra por que isso falha.

## Fontes

- 📄 [Homeostatic reinforcement learning for integrating reward collection and physiological stability](https://doi.org/10.7554/eLife.04811) — Mehdi Keramati & Boris Gutkin, 2014 · paper
- 📄 [What is Intrinsic Motivation? A Typology of Computational Approaches](https://doi.org/10.3389/neuro.12.006.2007) — Pierre-Yves Oudeyer & Frederic Kaplan, 2007 · paper
- 📄 [The theory of constructed emotion: an active inference account of interoception and categorization](https://doi.org/10.1093/scan/nsw154) — Lisa Feldman Barrett, 2017 · paper
- 🧭 [The nature of feelings: evolutionary and neurobiological origins](https://doi.org/10.1038/nrn3403) — Antonio Damasio & Gil B. Carvalho, 2013 · review
- 🧭 [Where Does Value Come From?](https://doi.org/10.1016/j.tics.2019.07.012) — Keno Juechems & Christopher Summerfield, 2019 · review
- 🧭 [Emotion in reinforcement learning agents and robots: a survey](https://doi.org/10.1007/s10994-017-5666-0) — Thomas M. Moerland, Joost Broekens & Catholijn M. Jonker, 2018 · review

## Boss fight

Audite os 12 drives do Rei Ichi com RL homeostático: para cada drive, defina a variável interna, o ponto de ajuste e a dinâmica; implemente a recompensa como redução da distância homeostática e compare-a, num ambiente com recursos conflitantes, com a soma ponderada de drives. Mostre em que situações a soma ponderada produz comportamento patológico que a homeostase evita. Drive sem papel funcional testável sai da arquitetura.

## Checkpoint

- [ ] Diferencie homeostase e alostase.
- [ ] Como o RL homeostático define recompensa?
- [ ] O que distingue "querer" de "gostar"?
- [ ] Cite dois tipos de motivação intrínseca computacional.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
