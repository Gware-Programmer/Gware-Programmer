# N06 — Sensory systems and the visual system

*Sistemas sensoriais e o sistema visual*

- **Trilha:** Computational Neuroscience
- **Nível:** 8 — Escala · onda 1
- **Termos:** visual system, V1, ventral stream, object recognition

## Por que importa

O sistema visual é o mais estudado do cérebro e o berço das CNNs. Da retina ao córtex temporal inferior, entender a via ventral — e por que modelos treinados para reconhecer objetos preveem neurônios reais — é o caso de sucesso fundador da NeuroAI.

## Pré-requisitos

- **Depende de:** N04 (Neural coding), L10 (Convolutional networks and computer vision)
- **Destrava:** N12 (NeuroAI: comparing brains and artificial networks), S06 (Recurrent processing theory)

## Base

1. Retina → tálamo (LGN) → V1: campos receptivos centro-periferia; células simples e complexas (Hubel & Wiesel) **N04**.
2. A hierarquia cortical com dezenas de áreas (Felleman & Van Essen); vias ventral ("o quê") e dorsal ("onde/como").
3. Invariância: reconhecer objetos apesar de posição, escala e iluminação.
4. Modelos hierárquicos clássicos (HMAX) → redes convolucionais **L10**.
5. Modelos otimizados para a tarefa preveem respostas de V4 e IT (Yamins et al. 2014).
6. Os outros sentidos, em linhas gerais: a cóclea como banco de filtros, tato e olfato.

## Meio

- Recorrência e feedback na via ventral: o que redes puramente feedforward não capturam → S06.
- Vieses indutivos, dados e arquitetura: o que de fato torna um modelo parecido com o cérebro (Conwell et al.).
- Atenção como ganho multiplicativo em neurônios visuais.

## Avançado

- Problemas profundos dos modelos de visão profunda contestado → N12
- Exemplos adversariais e a distância entre visão humana e de máquina → AL03.
- Visão, mascaramento e consciência → S06.

## Matemática necessária

**M31**: convolução e filtragem; **M17**: álgebra linear; **M24**: regressão regularizada e validação cruzada para modelos de codificação.

## Métodos

- Leia Foundations of Vision (Wandell, online) para retina e V1.
- Implemente filtros de Gabor e compare com a primeira camada de uma CNN treinada.
- Ajuste modelos de codificação de camadas de CNN a dados neurais abertos (como os do Brain-Score).

## Desafios

- Confundir o campo receptivo clássico com o que o neurônio faz em cenas naturais.
- Comparar modelo e cérebro com uma única métrica.

## Fontes

- 📖 [Foundations of Vision](https://foundationsofvision.stanford.edu/) — Brian A. Wandell, 1995 · livro. edição online
- 📄 [Receptive fields, binocular interaction and functional architecture in the cat's visual cortex](https://doi.org/10.1113/jphysiol.1962.sp006837) — David H. Hubel & Torsten N. Wiesel, 1962 · paper
- 📄 [Distributed Hierarchical Processing in the Primate Cerebral Cortex](https://doi.org/10.1093/cercor/1.1.1) — Daniel J. Felleman & David C. Van Essen, 1991 · paper
- 🧭 [How Does the Brain Solve Visual Object Recognition?](https://doi.org/10.1016/j.neuron.2012.01.010) — James J. DiCarlo, Davide Zoccolan & Nicole C. Rust, 2012 · review
- 📄 [Performance-optimized hierarchical models predict neural responses in higher visual cortex](https://doi.org/10.1073/pnas.1403112111) — Daniel L. K. Yamins, Ha Hong, Charles F. Cadieu, Ethan A. Solomon, Darren Seibert & James J. DiCarlo, 2014 · paper
- 🆕 [A large-scale examination of inductive biases shaping high-level visual representation in brains and machines](https://doi.org/10.1038/s41467-024-53147-y) — Colin Conwell, Jacob S. Prince, Kendrick N. Kay, George A. Alvarez & Talia Konkle, 2024 · recente

## Boss fight

Reproduza em pequena escala o resultado central de Yamins et al.: extraia ativações de várias camadas de CNNs treinadas e da mesma arquitetura sem treino para os estímulos de um conjunto de dados neurais aberto, ajuste modelos de codificação com regressão regularizada e validação cruzada e mostre qual camada prevê melhor cada área. O controle sem treino é obrigatório: sem ele, o resultado não diz nada.

## Checkpoint

- [ ] Diferencie células simples e complexas de V1.
- [ ] O que são as vias ventral e dorsal?
- [ ] O que significa invariância no reconhecimento de objetos?
- [ ] Qual foi o achado central de Yamins et al. (2014)?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
