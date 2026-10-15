# N14 — Neuromodulation, emotion and homeostasis in the brain

*Neuromodulação, emoção e homeostase no cérebro*

- **Trilha:** Computational Neuroscience
- **Nível:** 11 — Segurança · onda 1
- **Termos:** neuromodulation, amygdala, interoception, allostasis, computational psychiatry
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Dopamina, serotonina, noradrenalina e acetilcolina não transmitem mensagens ponto a ponto: mudam o modo de operação de circuitos inteiros. Teorias computacionais da neuromodulação, da interocepção e da alostase dão papéis precisos a esses sistemas — exatamente o que os 15 neuromoduladores do Rei Ichi precisam ter.

## Pré-requisitos

- **Depende de:** N08 (Basal ganglia, dopamine and reinforcement learning), G08 (Emotion, motivation and homeostasis)
- **Destrava:** —

## Base

1. Os sistemas neuromoduladores: núcleos de origem, projeções difusas, receptores **N08**.
2. A hipótese de Doya (2002): dopamina ↔ erro TD, serotonina ↔ fator de desconto, noradrenalina ↔ temperatura de exploração, acetilcolina ↔ taxa de aprendizado.
3. Acetilcolina e noradrenalina como incerteza esperada e inesperada (Yu & Dayan, 2005).
4. Locus coeruleus e ganho adaptativo: o equilíbrio exploração–explotação (Aston-Jones & Cohen).
5. Amígdala e emoção revisitadas **G08**.
6. Interocepção e alostase: o cérebro regulando o corpo por predição (Seth, 2013).

## Meio

- Psiquiatria computacional: transtornos como falhas de computação.
- Princípios de neuromodulação como inspiração para redes profundas.
- Neuromodulação e plasticidade: o terceiro fator **N03**.

## Avançado

- Serotonina: a teoria computacional menos resolvida contestado
- Emoção, interocepção e consciência → S08.
- Meta-aprendizado como neuromodulação em agentes artificiais.

## Matemática necessária

**M22**: incerteza e probabilidade condicional; **M23**: distribuições; **M28**: ganho em sistemas dinâmicos.

## Métodos

- Implemente o modelo de Yu & Dayan numa tarefa de pistas com mudanças de contexto.
- Controle a temperatura de exploração com um sinal tipo locus coeruleus num bandit não estacionário.
- Leia Doya (2002) e escreva onde o mapeamento resistiu e onde falhou com dados posteriores.

## Desafios

- "Um neuromodulador = uma emoção": errado.
- Multiplicar variáveis neuromoduladoras sem papéis computacionais distintos.

## Fontes

- 📄 [Metalearning and neuromodulation](https://doi.org/10.1016/S0893-6080(02)00044-8) — Kenji Doya, 2002 · paper
- 📄 [Uncertainty, Neuromodulation, and Attention](https://doi.org/10.1016/j.neuron.2005.04.026) — Angela J. Yu & Peter Dayan, 2005 · paper
- 🧭 [An integrative theory of locus coeruleus-norepinephrine function: adaptive gain and optimal performance](https://doi.org/10.1146/annurev.neuro.28.061604.135709) — Gary Aston-Jones & Jonathan D. Cohen, 2005 · review
- 🧭 [Neuromodulation of Neuronal Circuits: Back to the Future](https://doi.org/10.1016/j.neuron.2012.09.010) — Eve Marder, 2012 · review
- 📄 [Interoceptive inference, emotion, and the embodied self](https://doi.org/10.1016/j.tics.2013.09.007) — Anil K. Seth, 2013 · paper
- 🧭 [Computational psychiatry as a bridge from neuroscience to clinical applications](https://doi.org/10.1038/nn.4238) — Quentin J. M. Huys, Tiago V. Maia & Michael J. Frank, 2016 · review
- 🎓 [9.00SC Introduction to Psychology](https://ocw.mit.edu/courses/9-00sc-introduction-to-psychology-fall-2011/) — John Gabrieli (MIT OpenCourseWare) · curso. aulas em vídeo
- 🆕 [Linking Homeostasis to Reinforcement Learning: Internal State Control of Motivated Behavior](https://arxiv.org/abs/2507.04998) — Naoto Yoshida, Henning Sprekeler & Boris Gutkin, 2025 · recente

## Boss fight

Audite os 15 neuromoduladores do Rei Ichi. Para cada um, escreva o sistema biológico de referência, o papel computacional proposto na literatura (com fonte), a variável que ele modula no seu sistema e uma predição que mudaria se ele fosse removido. Faça ablações uma a uma num conjunto fixo de tarefas e funda ou elimine os que não mudarem nada mensurável. Comece pelo quarteto de Doya e pelo par de incertezas de Yu & Dayan.

## Checkpoint

- [ ] Qual é o mapeamento proposto por Doya entre neuromoduladores e parâmetros de RL?
- [ ] Diferencie incerteza esperada e inesperada no modelo de Yu & Dayan.
- [ ] O que é ganho adaptativo no locus coeruleus?
- [ ] O que é alostase e como ela difere de homeostase?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
