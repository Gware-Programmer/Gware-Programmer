# N08 — Basal ganglia, dopamine and reinforcement learning

*Gânglios da base, dopamina e aprendizado por reforço*

- **Trilha:** Computational Neuroscience
- **Nível:** 8 — Escala · onda 1
- **Termos:** basal ganglia, dopamine, reward prediction error, distributional RL, actor-critic
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Os neurônios de dopamina disparam como o erro de diferença temporal do RL — talvez a ponte mais forte já feita entre um algoritmo de IA e o cérebro. A versão distribucional desse achado, os debates sobre o que a dopamina realmente codifica e os circuitos dos gânglios da base são o fundamento do módulo de Q-learning do Rei Ichi.

## Pré-requisitos

- **Depende de:** N03 (Synapses and plasticity), R04 (Temporal-difference learning: Monte Carlo, TD, SARSA and Q-learning), G04 (Learning, decision-making and bounded rationality)
- **Destrava:** N14 (Neuromodulation, emotion and homeostasis in the brain)

## Base

1. Gânglios da base: estriado, vias direta e indireta e seleção de ação **N01**.
2. Dopamina como erro de predição de recompensa (Schultz, Dayan & Montague, 1997) **R04**.
3. Ator-crítico no estriado: crítico ventral, ator dorsal.
4. Controle com e sem modelo e sua arbitragem por incerteza (Daw, Niv & Dayan); a tarefa de dois passos.
5. RL distribucional na dopamina (Dabney et al., 2020): neurônios com "otimismos" diferentes codificam a distribuição do retorno.

## Meio

- O córtex pré-frontal como sistema de meta-RL (Wang et al.).
- Desconto em várias escalas de tempo na dopamina (Masset et al., 2025) e mapas multidimensionais de recompensa futura (Sousa et al., 2025).
- Hipótese alternativa: dopamina como sinal de associação causal retrospectiva (Jeong et al., 2022) contestado

## Avançado

- O que a dopamina codifica: o modelo de erro de predição continua o mais forte desde 1997, mas não explica todos os dados contestado
- Hábitos, compulsões e psiquiatria computacional → N14.
- RL distribucional na IA e no cérebro → R10.

## Matemática necessária

**M22**: probabilidade e valor esperado; **M23**: distribuições, quantis e expectis; **M28**: dinâmica.

## Métodos

- Reproduza a figura clássica de Schultz com TD(0) e um estímulo condicionado.
- Implemente RL distribucional por quantis e mostre a diversidade de "otimismo".
- Leia o capítulo de neurociência de Sutton & Barto.

## Desafios

- Dopamina = prazer: errado.
- Assumir que o modelo TD explica todo dado de dopamina.

## Fontes

- 📖 [Reinforcement Learning: An Introduction (2nd ed.), cap. 15](http://incompleteideas.net/book/the-book-2nd.html) — Richard S. Sutton & Andrew G. Barto, 2018 · livro
- 📄 [A Neural Substrate of Prediction and Reward](https://doi.org/10.1126/science.275.5306.1593) — Wolfram Schultz, Peter Dayan & P. Read Montague, 1997 · paper
- 📄 [Uncertainty-based competition between prefrontal and dorsolateral striatal systems for behavioral control](https://doi.org/10.1038/nn1560) — Nathaniel D. Daw, Yael Niv & Peter Dayan, 2005 · paper
- 📄 [A distributional code for value in dopamine-based reinforcement learning](https://doi.org/10.1038/s41586-019-1924-6) — Will Dabney et al., 2020 · paper
- 📄 [Mesolimbic dopamine release conveys causal associations](https://doi.org/10.1126/science.abq6740) — Huijeong Jeong et al., 2022 · paper. a hipótese alternativa
- 🆕 [Multi-timescale reinforcement learning in the brain](https://doi.org/10.1038/s41586-025-08929-9) — Paul Masset et al., 2025 · recente
- 🎓 [Neuromatch Academy: Computational Neuroscience](https://compneuro.neuromatch.io/) — Neuromatch · curso. aulas em vídeo e notebooks em Python

## Boss fight

Substitua o Q-learning do Rei Ichi por um modelo de gânglios da base: ator-crítico com vias direta e indireta, erro TD como sinal de "dopamina", RL distribucional por quantis e arbitragem por incerteza entre controle com e sem modelo. Rode a tarefa de dois passos no seu sistema, mostre a assinatura comportamental dos dois tipos de controle e compare os "sinais de dopamina" do agente com a figura de Schultz.

## Checkpoint

- [ ] Por que o disparo da dopamina se parece com o erro TD?
- [ ] O que o RL distribucional na dopamina mostrou?
- [ ] Como a tarefa de dois passos separa controle com e sem modelo?
- [ ] Qual é a hipótese alternativa de Jeong et al. (2022)?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
