# S06 — Recurrent processing theory

*Teoria do processamento recorrente*

- **Trilha:** Consciousness
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** recurrent processing theory, feedforward sweep, backward masking

## Por que importa

Para a teoria do processamento recorrente (recurrent processing theory, RPT), a experiência visual surge quando a varredura feedforward é seguida de processamento recorrente local nas áreas sensoriais — sem precisar do córtex pré-frontal. É a teoria mais "posterior" e mais ligada às redes de visão, com implicações diretas para redes feedforward vs. recorrentes em IA.

## Pré-requisitos

- **Depende de:** S02 (The science of consciousness: methods and measures), N06 (Sensory systems and the visual system)
- **Destrava:** S09 (Adversarial collaborations and the empirical state of the field)

## Base

1. A varredura feedforward rápida vs. o processamento recorrente (feedback e conexões horizontais) **N06**.
2. Estágios: feedforward inconsciente → recorrência local (experiência, segundo Lamme) → recorrência global (acesso e relato).
3. O mascaramento retroativo interrompe a recorrência (Fahrenfort, Scholte & Lamme, 2007).
4. Recorrência é necessária para reconhecer objetos difíceis e para reproduzir a dinâmica das representações visuais humanas.
5. Experiência sem acesso? O debate do "transbordamento" (overflow) (Block, 2007) contestado.

## Meio

- Predições contrastantes com a GNWT: a RPT não exige o córtex frontal para a experiência.
- Redes recorrentes vs. feedforward em visão computacional.
- Indicadores derivados da RPT para IA (recorrência algorítmica, representações perceptuais organizadas) → S10.

## Avançado

- Uma rede convolucional com recorrência local satisfaria a RPT? especulação → S10
- RPT e IIT ("zona quente posterior") vs. teorias frontais contestado → S09
- O argumento do desdobramento também atinge a RPT contestado → S04

## Matemática necessária

**M28**: dinâmica recorrente; **M31**: sinais no tempo; **M24**: estatística.

## Métodos

- Leia Lamme & Roelfsema (2000) e Lamme (2006).
- Treine redes de visão feedforward e recorrentes e interrompa a recorrência em momentos diferentes.
- Leia Block (2007) e algumas das respostas publicadas junto.

## Desafios

- Confundir recorrência algorítmica com consciência.
- Tratar "feedforward rápido" como valor fixo: a latência varia com tarefa e estímulo.

## Fontes

- 📄 [The distinct modes of vision offered by feedforward and recurrent processing](https://doi.org/10.1016/S0166-2236(00)01657-X) — Victor A. F. Lamme & Pieter R. Roelfsema, 2000 · paper
- 📄 [Towards a true neural stance on consciousness](https://doi.org/10.1016/j.tics.2006.09.001) — Victor A. F. Lamme, 2006 · paper
- 📄 [Masking Disrupts Reentrant Processing in Human Visual Cortex](https://doi.org/10.1162/jocn.2007.19.9.1488) — Johannes J. Fahrenfort, H. Steven Scholte & Victor A. F. Lamme, 2007 · paper
- 📄 [Consciousness, accessibility, and the mesh between psychology and neuroscience](https://doi.org/10.1017/S0140525X07002786) — Ned Block, 2007 · paper
- 📄 [Evidence that recurrent circuits are critical to the ventral stream's execution of core object recognition behavior](https://doi.org/10.1038/s41593-019-0392-5) — Kohitij Kar, Jonas Kubilius, Kailyn Schmidt, Elias B. Issa & James J. DiCarlo, 2019 · paper
- 📄 [Recurrence is required to capture the representational dynamics of the human visual system](https://doi.org/10.1073/pnas.1905544116) — Tim C. Kietzmann et al., 2019 · paper
- 🌐 [Stanford Encyclopedia of Philosophy: The Neuroscience of Consciousness](https://plato.stanford.edu/entries/consciousness-neuroscience/) — Stanford Encyclopedia of Philosophy · site
- 🆕 [Adversarial testing of global neuronal workspace and integrated information theories of consciousness](https://doi.org/10.1038/s41586-025-08888-1) — Cogitate Consortium, Oscar Ferrante et al., 2025 · recente

**Exceções na regra de materiais:**

- sem aula ou vídeo: não há curso em vídeo aberto e estável sobre este tema
- sem material prático: assunto teórico: a prática é o boss fight

## Boss fight

Treine duas redes de visão com desempenho equivalente em imagens fáceis — uma feedforward e uma com recorrência local — e avalie em imagens difíceis (oclusão, ruído). Simule mascaramento retroativo interrompendo a recorrência em tempos diferentes e compare a curva com a curva humana de mascaramento que você mediu em **S02**. Depois construa a rede feedforward "desdobrada" equivalente à recorrente e escreva o que a RPT diria dela.

## Checkpoint

- [ ] Qual a diferença entre a varredura feedforward e o processamento recorrente?
- [ ] Por que o mascaramento retroativo é usado como evidência para a RPT?
- [ ] O que é o debate do transbordamento?
- [ ] Que predição separa a RPT da GNWT?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
