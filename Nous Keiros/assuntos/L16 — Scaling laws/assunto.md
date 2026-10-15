# L16 — Scaling laws

*Leis de escala*

- **Trilha:** Machine Learning
- **Nível:** 8 — Escala · onda 3
- **Termos:** scaling laws, compute-optimal, Chinchilla, emergent abilities

## Por que importa

As leis de escala tornaram o progresso em IA previsível: a perda cai como lei de potência com parâmetros, dados e computação. Elas orientam investimentos gigantescos — e conhecer seus limites é o que separa previsão de hype.

## Pré-requisitos

- **Depende de:** L15 (LLM pretraining)
- **Destrava:** L26 (Deep learning theory), Z02 (Pretrain a small LLM end to end)

## Base

1. Leis de potência da perda (Kaplan et al.) **M09**.
2. O ótimo de computação de Chinchilla: cerca de 20 tokens por parâmetro.
3. Como ajustar e extrapolar uma lei de escala, com incerteza **M24**.
4. Escala com dados limitados (repetir épocas).
5. Capacidades "emergentes" e o debate sobre métricas.
6. Escala em tempo de inferência (test-time compute).

## Meio

- muP e transferência de hiperparâmetros entre escalas.
- Leis de escala para tarefas vs. para a perda.
- Tendências de computação, de algoritmos e de dados (Epoch AI).

## Avançado

- Por que leis de potência? Teorias (dimensão da variedade dos dados, "quanta" de habilidades) contestado
- Limites físicos e econômicos (dados, energia) e o deslocamento recente dos ganhos para o pós-treino e o RL.
- Previsões de capacidade, como horizontes de tarefas de agentes, e seus riscos de extrapolação → A07.

## Matemática necessária

**M24**: regressão e incerteza; **M09**: logaritmos e gráficos log-log.

## Métodos

- Treine de oito a dez modelos pequenos com computação controlada e ajuste a sua própria lei de escala.
- Refaça a análise de Chinchilla em escala minúscula.
- Reproduza um gráfico de tendência com os dados públicos do Epoch AI.

## Desafios

- Extrapolar várias ordens de grandeza a partir de poucos pontos.
- Comparar perdas de modelos com tokenizadores diferentes.
- Confundir "emergente" com descontinuidade real da capacidade.

## Fontes

- 📄 [Scaling Laws for Neural Language Models](https://arxiv.org/abs/2001.08361) — Jared Kaplan et al., 2020 · paper
- 📄 [Training Compute-Optimal Large Language Models](https://arxiv.org/abs/2203.15556) — Jordan Hoffmann et al., 2022 · paper. o Chinchilla
- 📄 [Scaling Data-Constrained Language Models](https://arxiv.org/abs/2305.16264) — Niklas Muennighoff et al., 2023 · paper
- 📄 [Are Emergent Abilities of Large Language Models a Mirage?](https://arxiv.org/abs/2304.15004) — Rylan Schaeffer, Brando Miranda & Sanmi Koyejo, 2023 · paper
- 📄 [Tensor Programs V: Tuning Large Neural Networks via Zero-Shot Hyperparameter Transfer](https://arxiv.org/abs/2203.03466) — Greg Yang et al., 2022 · paper. o muP
- 🗃️ [Data on AI](https://epoch.ai/data) — Epoch AI · dados. tendências públicas de computação, dados e modelos
- 🎓 [CS336: Language Modeling from Scratch](https://cs336.stanford.edu/) — Percy Liang & Tatsunori Hashimoto (Stanford) · curso. aulas e tarefas implementando tudo do zero
- 🆕 [Distillation Scaling Laws](https://arxiv.org/abs/2502.08606) — Dan Busbridge et al., 2025 · recente

## Boss fight

Com a infraestrutura do seu pré-treino, treine pelo menos dez modelos (de ~1M a ~100M de parâmetros) com orçamentos de computação controlados, ajuste L(N, D) com incerteza por bootstrap e derive a sua própria regra de ótimo de computação. Compare com Chinchilla e escreva, com números, até onde você confiaria na extrapolação.

## Checkpoint

- [ ] O que diz a regra de Chinchilla e por que ela mudou a forma de treinar LLMs?
- [ ] Como uma métrica descontínua pode fabricar uma "emergência" aparente?
- [ ] O que é muP e para que serve?
- [ ] Quais são os três insumos das leis de escala e qual está ficando escasso?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
