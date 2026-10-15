# C09 — Distributed training

*Treinamento distribuído*

- **Trilha:** Computing for AI
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** distributed training, data/tensor/pipeline parallelism, ZeRO, FSDP, all-reduce

## Por que importa

Modelos de fronteira são treinados em milhares de GPUs. Paralelismo de dados, de tensores, de pipeline e de experts, mais a comunicação coletiva entre GPUs, definem o que é possível treinar. Mesmo sem um cluster, você precisa disso para ler relatórios técnicos de LLMs e para usar bem uma ou duas GPUs.

## Pré-requisitos

- **Depende de:** C07 (GPU and CUDA: execution model and kernels), L14 (Transformers)
- **Destrava:** —

## Base

1. Por que distribuir: memória (pesos, gradientes, estados do otimizador, ativações) e tempo.
2. Paralelismo de dados (DDP); all-reduce em anel e em árvore; custo de comunicação.
3. ZeRO/FSDP: particionar estados do otimizador, gradientes e parâmetros.
4. Paralelismo de tensores (estilo Megatron): dividir matmuls entre GPUs **L14**.
5. Paralelismo de pipeline (GPipe, 1F1B) e as "bolhas".
6. Paralelismo de sequência/contexto (Ring Attention) e de experts (MoE).

## Meio

- Contabilidade de memória: Adam em precisão mista custa cerca de 16 bytes por parâmetro.
- Combinações de paralelismo e como escolher; MFU (model FLOPs utilization).
- Comunicação: NCCL, NVLink (a 3090 aceita NVLink com uma segunda 3090), InfiniBand.
- Tolerância a falhas, checkpoints distribuídos e determinismo.

## Avançado

- Treino com pouca comunicação (DiLoCo, treino descentralizado) — relevante para quem não tem cluster.
- Relatórios técnicos de fronteira, como o do DeepSeek-V3: fp8, DualPipe, MoE com balanceamento sem perda auxiliar.
- Inferência distribuída e desagregação prefill/decode.

## Matemática necessária

**M17**: matrizes particionadas; **M03**: ordens de grandeza.

## Métodos

- Leia o Ultra-Scale Playbook inteiro, rodando os experimentos.
- Simule paralelismos com torch.distributed e backend gloo, em CPU ou numa GPU.
- Antes de rodar, calcule memória e comunicação de cada estratégia para um modelo de 7B.

## Desafios

- Esquecer as ativações na conta de memória.
- Usar paralelismo de tensores entre máquinas com rede lenta.
- Achar que mais GPUs sempre aceleram (lei de Amdahl, comunicação).

## Fontes

- 🗺️ [The Ultra-Scale Playbook: Training LLMs on GPU Clusters](https://huggingface.co/spaces/nanotron/ultrascale-playbook) — Hugging Face (equipe Nanotron), 2025 · guia
- 🗺️ [How To Scale Your Model](https://jax-ml.github.io/scaling-book/) — Austin et al. (Google DeepMind), 2025 · guia
- 📄 [ZeRO: Memory Optimizations Toward Training Trillion Parameter Models](https://arxiv.org/abs/1910.02054) — Samyam Rajbhandari, Jeff Rasley, Olatunji Ruwase & Yuxiong He, 2019 · paper
- 📄 [Megatron-LM: Training Multi-Billion Parameter Language Models Using Model Parallelism](https://arxiv.org/abs/1909.08053) — Mohammad Shoeybi et al., 2019 · paper
- 📄 [Efficient Large-Scale Language Model Training on GPU Clusters Using Megatron-LM](https://arxiv.org/abs/2104.04473) — Deepak Narayanan et al., 2021 · paper
- 🆕 [DeepSeek-V3 Technical Report](https://arxiv.org/abs/2412.19437) — DeepSeek-AI, 2024 · recente

## Boss fight

Com torch.distributed, implemente à mão DDP (all-reduce de gradientes), um ZeRO-1 (particionando os estados do Adam) e paralelismo de tensores para o MLP de um bloco de transformer, em 2 processos (2 GPUs se tiver; CPU com gloo se não). Prove que todos produzem os mesmos gradientes do treino num único dispositivo e entregue a planilha de memória e comunicação de cada estratégia para um modelo de 7B.

## Checkpoint

- [ ] Quanta memória o Adam em precisão mista ocupa por parâmetro, e de onde vem cada parte?
- [ ] Qual a diferença entre ZeRO-1, ZeRO-2 e ZeRO-3?
- [ ] O que é a bolha do pipeline e como reduzi-la?
- [ ] Por que o paralelismo de tensores exige rede rápida?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
