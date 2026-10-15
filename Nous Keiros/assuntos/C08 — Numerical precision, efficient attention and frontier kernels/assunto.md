# C08 — Numerical precision, efficient attention and frontier kernels

*Precisão numérica, atenção eficiente e kernels de fronteira*

- **Trilha:** Computing for AI
- **Nível:** 8 — Escala · onda 1
- **Termos:** mixed precision, bf16, fp8, FlashAttention, Triton

## Por que importa

A atenção é a operação central dos LLMs e o maior gargalo de memória. A FlashAttention mostrou que reorganizar a computação para respeitar a hierarquia de memória — sem mudar a matemática — acelera tudo; a precisão mista (bf16, fp8) multiplicou a capacidade efetiva das GPUs. Aqui numérica e hardware se encontram.

## Pré-requisitos

- **Depende de:** C07 (GPU and CUDA: execution model and kernels), M32 (Numerical analysis and floating-point arithmetic), L13 (Attention)
- **Destrava:** C11 (Efficient inference)

## Base

1. Revisão: atenção softmax(QKᵀ/√d)·V e seu custo de memória O(n²) **L13**.
2. Softmax online: normalização incremental e estável **M32**.
3. FlashAttention: blocos + recomputação; consciência de entrada/saída (IO-awareness).
4. Treino em precisão mista: bf16/fp16 com cópia mestre em fp32; loss scaling.
5. fp8 (E4M3, E5M2) com escalas por tensor ou por bloco.

## Meio

- FlashAttention-2 (paralelismo e particionamento) e FlashAttention-3 (Hopper, assincronia, fp8).
- Variantes: máscara causal, GQA/MQA, janela deslizante, atenção paginada para inferência.
- Kernels fundidos de LayerNorm/RMSNorm, softmax e RoPE.

## Avançado

- Formatos de microescala e treino em fp4; erro de quantização dentro da atenção.
- DSLs de kernel (ThunderKittens, CuTe, Triton): produtividade com desempenho.
- Kernels gerados por IA e a verificação de correção numérica — inclusive benchmarks de kernels que foram "vencidos" com trapaça.

## Matemática necessária

**M32**: ponto flutuante e estabilidade; **M17**: matrizes em blocos.

## Métodos

- Implemente atenção ingênua, depois com softmax online, depois FlashAttention em Triton; compare memória e tempo.
- Leia os três papers de FlashAttention em ordem e reproduza a análise de entrada/saída.
- Teste tudo contra uma referência em fp64.

## Desafios

- Comparar desempenho sem fixar sequência, cabeças e precisão.
- Achar que a FlashAttention é uma aproximação: ela é exata.
- Esquecer que fp16 tem alcance pequeno (overflow) e bf16 tem precisão pequena.

## Fontes

- 📄 [Online normalizer calculation for softmax](https://arxiv.org/abs/1805.02867) — Maxim Milakov & Natalia Gimelshein, 2018 · paper
- 📄 [FlashAttention: Fast and Memory-Efficient Exact Attention with IO-Awareness](https://arxiv.org/abs/2205.14135) — Tri Dao, Daniel Y. Fu, Stefano Ermon, Atri Rudra & Christopher Ré, 2022 · paper
- 📄 [FlashAttention-2: Faster Attention with Better Parallelism and Work Partitioning](https://arxiv.org/abs/2307.08691) — Tri Dao, 2023 · paper
- 🆕 [FlashAttention-3: Fast and Accurate Attention with Asynchrony and Low-precision](https://arxiv.org/abs/2407.08608) — Jay Shah, Ganesh Bikshandi, Ying Zhang, Vijay Thakkar, Pradeep Ramani & Tri Dao, 2024 · recente
- 📄 [FP8 Formats for Deep Learning](https://arxiv.org/abs/2209.05433) — Paulius Micikevicius et al., 2022 · paper
- 🆕 [ThunderKittens: Simple, Fast, and Adorable AI Kernels](https://arxiv.org/abs/2410.20399) — Benjamin F. Spector et al., 2024 · recente
- 🎓 [GPU MODE lectures](https://github.com/gpu-mode/lectures) — GPU MODE · curso. aulas em vídeo e código sobre kernels de GPU

## Boss fight

Implemente em Triton um kernel de FlashAttention (forward e backward) com máscara causal, em bf16 com acumulação em fp32, validado contra uma atenção de referência em fp64. Meça memória e throughput contra a atenção ingênua e contra o scaled_dot_product_attention do PyTorch na sua 3090, para sequências de 512 a 16 mil tokens.

## Checkpoint

- [ ] Por que a atenção ingênua usa memória O(n²) e a FlashAttention O(n)?
- [ ] Como a softmax online mantém a estabilidade sem ver a linha inteira?
- [ ] Por que bf16 dispensa loss scaling e fp16 não?
- [ ] A FlashAttention muda a matemática da atenção? Explique.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
