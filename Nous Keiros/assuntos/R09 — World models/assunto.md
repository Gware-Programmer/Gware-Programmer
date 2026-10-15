# R09 — World models

*World models*

- **Trilha:** Reinforcement Learning
- **Nível:** 9 — Pós-treino e primeiro paper · onda 2
- **Termos:** world models, Dreamer, latent dynamics, JEPA, video world models

## Por que importa

Um world model é um simulador interno do mundo aprendido a partir de dados — o que permite planejar e treinar agentes "na imaginação". De Dreamer a Genie 3 e V-JEPA 2, é uma das apostas centrais da IA geral e um dos temas mais próximos das teorias cognitivas de predição e imaginação.

## Pré-requisitos

- **Depende de:** R08 (Model-based RL, planning and search), L19 (Latent generative models: VAEs, flows and GANs), L33 (Energy-based models)
- **Destrava:** R10 (The RL frontier), A05 (Agentic planning and reasoning with LLMs)

Novo pré-requisito: **L33** — modelos baseados em energia, a base do JEPA.

## Base

1. Modelo latente: encoder → dinâmica latente → decoder **L19**.
2. World Models (Ha & Schmidhuber, 2018): VAE + RNN + controlador.
3. Dreamer: ator-crítico treinado na imaginação latente; o DreamerV3 (Nature, 2025) usa uma única configuração em mais de 150 tarefas e coleta diamantes no Minecraft a partir de pixels.
4. Prever em espaço de representação (JEPA, V-JEPA 2) vs. prever pixels.
5. World models gerativos de vídeo interativo (Genie 3).
6. Planejar com world models **R08**.

## Meio

- Dreamer 4: treinar agentes dentro de world models escaláveis.
- Como avaliar world models: consistência, controlabilidade, utilidade para planejar.
- LLMs como world models? O debate.

## Avançado

- A aposta de LeCun em arquiteturas preditivas sem decoder vs. modelos autoregressivos contestado
- Modelos de si e do mundo em teorias de consciência → S08.
- "A era da experiência" (Silver & Sutton, 2025): agentes aprendendo de fluxos contínuos de experiência — uma posição programática especulação fundamentada

## Matemática necessária

**M25**: inferência variacional; **M26**: KL.

## Métodos

- Reproduza World Models no CarRacing.
- Treine o DreamerV3 (código oficial) num ambiente pequeno e inspecione as previsões latentes.
- Monte uma tabela comparando DreamerV3, Genie 3 e V-JEPA 2.

## Desafios

- Confundir qualidade visual com utilidade para controle.
- Ignorar o erro composto em horizontes longos.

## Fontes

- 📄 [World Models](https://arxiv.org/abs/1803.10122) — David Ha & Jürgen Schmidhuber, 2018 · paper
- 🆕 [Mastering diverse control tasks through world models](https://doi.org/10.1038/s41586-025-08744-2) — Danijar Hafner, Jurgis Pasukonis, Jimmy Ba & Timothy Lillicrap, 2025 · recente. o DreamerV3 na Nature
- 🆕 [Training Agents Inside of Scalable World Models](https://arxiv.org/abs/2509.24527) — Danijar Hafner, Wilson Yan & Timothy Lillicrap, 2025 · recente. o Dreamer 4
- 🆕 [V-JEPA 2: Self-Supervised Video Models Enable Understanding, Prediction and Planning](https://arxiv.org/abs/2506.09985) — Mido Assran et al., 2025 · recente
- 🆕 [Genie 3: A new frontier for world models](https://deepmind.google/discover/blog/genie-3-a-new-frontier-for-world-models/) — Google DeepMind, 2025 · recente
- 📰 [Welcome to the Era of Experience](https://storage.googleapis.com/deepmind-media/Era-of-Experience%20/The%20Era%20of%20Experience%20Paper.pdf) — David Silver & Richard S. Sutton, 2025 · artigo
- 🎓 [CS285: Deep Reinforcement Learning](https://rail.eecs.berkeley.edu/deeprlcourse/) — Sergey Levine (UC Berkeley) · curso. aulas em vídeo e tarefas
- 🔧 [DreamerV3](https://github.com/danijar/dreamerv3) — Danijar Hafner · ferramenta

## Boss fight

Reproduza World Models (VAE + MDN-RNN + controlador evolutivo) no CarRacing; depois treine o DreamerV3 num ambiente pequeno e meça o erro da imaginação latente em horizontes crescentes. Feche com um ensaio técnico comparando previsão em pixels (Genie), em latente com decoder (Dreamer) e em representação sem decoder (V-JEPA 2): o que cada abordagem ganha e perde para planejar.

## Checkpoint

- [ ] O que significa treinar "na imaginação"?
- [ ] Qual a diferença entre prever pixels e prever representações?
- [ ] O que o DreamerV3 demonstrou com uma configuração fixa?
- [ ] Quais os argumentos de LeCun contra modelos autoregressivos como world models?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
