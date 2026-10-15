# C10 — AI hardware

*Hardware de IA*

- **Trilha:** Computing for AI
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** AI accelerators, TPU, NPU, wafer-scale, neuromorphic hardware

## Por que importa

A IA que existe é a IA que o hardware permite — "a loteria do hardware". Saber o que GPUs, TPUs, NPUs, chips wafer-scale e neuromórficos fazem, e quanto custam em energia, é necessário para pensar arquiteturas alternativas (inclusive inspiradas no cérebro) e para o debate sobre substrato e consciência.

## Pré-requisitos

- **Depende de:** C07 (GPU and CUDA: execution model and kernels), N02 (Neuron models)
- **Destrava:** S11 (Substrate, causation and computation)

## Base

1. Por que as GPUs venceram: paralelismo massivo, tensor cores e o ecossistema CUDA **C07**.
2. TPUs: arrays sistólicos, interconexão e um projeto inteiro em torno do matmul.
3. NPUs e aceleradores de borda (o Neural Engine do seu M1).
4. Gerações atuais: NVIDIA Blackwell, Google TPU Ironwood, AMD Instinct; chips wafer-scale e de streaming.
5. Custo energético: picojoules por operação vs. por acesso à DRAM — mover dados domina.
6. Hardware neuromórfico: spikes, computação orientada a eventos, aprendizado no chip (Loihi, NorthPole, SpiNNaker) **N02**.

## Meio

- Computação analógica e em memória (in-memory computing), memristores; ruído e precisão.
- Co-design hardware-algoritmo: parte do sucesso dos transformers vem de casarem bem com GPUs.
- Métricas que não enganam: TOPS/W na mesma precisão, banda por FLOP, custo total.

## Avançado

- Hardware e consciência: para a IIT, é a estrutura causal do hardware — não o software — que conta; arquiteturas com recorrência física seriam, pela teoria, diferentes de GPUs → S11.
- Computação reversível e limites termodinâmicos (princípio de Landauer).
- Limites de escala por energia e por interconexão.

## Matemática necessária

**M03**: ordens de grandeza; **M17**: matrizes.

## Métodos

- Leia cada paper de arquitetura (TPU, Loihi, NorthPole) com uma pergunta: que gargalo ele ataca?
- Monte uma planilha energética (pJ por FLOP vs. pJ por byte) e estime a energia por token de um LLM em cada plataforma.
- Rode um simulador de redes de spikes e compare com uma rede densa na mesma tarefa.

## Desafios

- Comparar TOPS de marketing medidos em precisões e esparsidades diferentes.
- Achar que neuromórfico significa "mais inteligente": significa mais eficiente para certas cargas, com ecossistema imaturo.

## Fontes

- 📄 [In-Datacenter Performance Analysis of a Tensor Processing Unit](https://arxiv.org/abs/1704.04760) — Norman P. Jouppi et al., 2017 · paper
- 📄 [The Hardware Lottery](https://arxiv.org/abs/2009.06489) — Sara Hooker, 2020 · paper. leitura obrigatória para pensar fora do trilho
- 🧭 [Efficient Processing of Deep Neural Networks: A Tutorial and Survey](https://arxiv.org/abs/1703.09039) — Vivienne Sze, Yu-Hsin Chen, Tien-Ju Yang & Joel Emer, 2017 · review
- 📄 [Loihi: A Neuromorphic Manycore Processor with On-Chip Learning](https://doi.org/10.1109/MM.2018.112130359) — Mike Davies et al., 2018 · paper
- 📄 [Neural inference at the frontier of energy, space, and time](https://doi.org/10.1126/science.adh1174) — Dharmendra S. Modha et al., 2023 · paper. o chip NorthPole
- 🌐 [NVIDIA Blackwell Architecture Technical Overview](https://resources.nvidia.com/en-us-blackwell-architecture) — NVIDIA · site

## Boss fight

Escreva um relatório técnico comparativo, no formato de um paper curto, sobre cinco plataformas — sua RTX 3090, seu M1 (GPU e Neural Engine), uma TPU, um chip neuromórfico e um chip wafer-scale — com números verificados em fontes primárias: FLOPs por precisão, banda e energia por operação e por byte. Estime energia e latência por token de um LLM de 8B em cada uma e discuta onde a estimativa é frágil.

## Checkpoint

- [ ] Por que mover dados custa mais energia do que calcular?
- [ ] O que é um array sistólico e por que ele é bom para matmul?
- [ ] Em que tipo de carga o hardware neuromórfico leva vantagem?
- [ ] Qual o argumento central de "The Hardware Lottery"?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
