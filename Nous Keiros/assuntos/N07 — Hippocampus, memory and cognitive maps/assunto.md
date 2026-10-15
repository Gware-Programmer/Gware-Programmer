# N07 — Hippocampus, memory and cognitive maps

*Hipocampo, memória e mapas cognitivos*

- **Trilha:** Computational Neuroscience
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** hippocampus, place cells, grid cells, replay, successor representation, TEM
- **Projetos KEIROS:** Rei Ichi

## Por que importa

O hipocampo grava episódios, constrói mapas do espaço e de conceitos e "reprisa" experiências durante o descanso e o sono. Células de lugar e de grade, a representação sucessora e a Tolman-Eichenbaum Machine são a ponte mais rica entre neurociência e IA — e o fundamento do hipocampo bayesiano do Rei Ichi.

## Pré-requisitos

- **Depende de:** N05 (Neural network dynamics and attractors), R04 (Temporal-difference learning: Monte Carlo, TD, SARSA and Q-learning), G03 (Human memory)
- **Destrava:** —

## Base

1. Células de lugar (O'Keefe & Dostrovsky, 1971) e células de grade no córtex entorrinal (Hafting et al., 2005) — Nobel de 2014.
2. Mapas cognitivos (Tolman) e sua generalização para espaços abstratos.
3. Memória episódica e o hipocampo **G03**; sistemas de aprendizagem complementares: aprendizado rápido no hipocampo, lento no neocórtex.
4. Replay e ondas agudas (sharp-wave ripples): consolidação e planejamento.
5. A representação sucessora: o hipocampo como mapa preditivo **R04**.
6. A Tolman-Eichenbaum Machine (TEM): estrutura e conteúdo separados, generalização relacional.

## Meio

- Precessão de fase em theta.
- Atratores contínuos para integração de caminho **N05**.
- Representações tipo grade em agentes artificiais e a crítica de que elas dependem de escolhas de projeto ("no free lunch") contestado

## Avançado

- A TEM reformulada como transformer: hipocampo e atenção → L14.
- Memória de agentes inspirada no hipocampo → A04.
- Replay como aprendizado offline em sistemas artificiais → R09.

## Matemática necessária

**M18**: autovetores (os autovetores da representação sucessora lembram grades); **M22**: probabilidade; **M28**: dinâmica.

## Métodos

- Implemente a representação sucessora num labirinto e visualize seus autovetores.
- Simule células de lugar e de grade e decodifique a posição.
- Leia Behrens et al. (2018) como mapa conceitual do tema.

## Desafios

- Tomar padrões tipo grade em redes como explicação do cérebro sem testar alternativas.
- Esquecer que "hipocampo = memória" é simplificação.

## Fontes

- 📄 [The hippocampus as a spatial map. Preliminary evidence from unit activity in the freely-moving rat](https://doi.org/10.1016/0006-8993(71)90358-1) — John O'Keefe & Jonathan Dostrovsky, 1971 · paper
- 📄 [Microstructure of a spatial map in the entorhinal cortex](https://doi.org/10.1038/nature03721) — Torkel Hafting, Marianne Fyhn, Sturla Molden, May-Britt Moser & Edvard I. Moser, 2005 · paper
- 📄 [Why there are complementary learning systems in the hippocampus and neocortex](https://doi.org/10.1037/0033-295X.102.3.419) — James L. McClelland, Bruce L. McNaughton & Randall C. O'Reilly, 1995 · paper
- 📄 [The hippocampus as a predictive map](https://doi.org/10.1038/nn.4650) — Kimberly L. Stachenfeld, Matthew M. Botvinick & Samuel J. Gershman, 2017 · paper
- 📄 [The Tolman-Eichenbaum Machine: Unifying Space and Relational Memory through Generalization in the Hippocampal Formation](https://doi.org/10.1016/j.cell.2020.10.024) — James C. R. Whittington et al., 2020 · paper
- 🧭 [What Is a Cognitive Map? Organizing Knowledge for Flexible Behavior](https://doi.org/10.1016/j.neuron.2018.10.002) — Timothy E. J. Behrens et al., 2018 · review
- 🎓 [Neuromatch Academy: Computational Neuroscience](https://compneuro.neuromatch.io/) — Neuromatch · curso. aulas em vídeo e notebooks em Python
- 🔧 [RatInABox](https://github.com/RatInABox-Lab/RatInABox) — Tom George et al. · ferramenta. simulação de células de lugar e de grade
- 🆕 [Between planning and map building: Prioritizing replay when future goals are uncertain](https://doi.org/10.1016/j.neuron.2025.09.021) — Yotam Sagiv, Thomas Akam, Ilana B. Witten & Nathaniel D. Daw, 2025 · recente

## Boss fight

Confronte o hipocampo bayesiano do Rei Ichi com três modelos: representação sucessora, uma TEM simplificada e um sistema complementar (memória episódica rápida + consolidação lenta por replay). Implemente os três num conjunto de labirintos com a mesma topologia e conteúdos diferentes e meça a generalização para um labirinto novo, a velocidade de aprendizado e o esquecimento. Que princípio o seu hipocampo implementa — e qual ele deveria implementar?

## Checkpoint

- [ ] O que são células de lugar e células de grade?
- [ ] O que é a representação sucessora e por que ela é "preditiva"?
- [ ] Por que dois sistemas de aprendizagem, um rápido e um lento?
- [ ] O que a TEM separa e por que isso permite generalizar?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
