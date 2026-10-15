# C11 — Efficient inference

*Inferência eficiente*

- **Trilha:** Computing for AI
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** KV cache, quantization, speculative decoding, continuous batching

## Por que importa

Treinar é caro uma vez; servir é caro para sempre. KV cache, batching, quantização e decodificação especulativa definem quanto custa cada token — e o que roda localmente no seu M1 e na sua 3090, que é o seu regime de pesquisa soberana.

## Pré-requisitos

- **Depende de:** C08 (Numerical precision, efficient attention and frontier kernels), L15 (LLM pretraining), L31 (Mixture of Experts and conditional computation)
- **Destrava:** Z04 (Run your model on the M1: quantization and local serving)

Novo pré-requisito: **L31** — servir mixtures of experts.

## Base

1. Prefill vs. decode; por que o decode é limitado por memória **C06**.
2. KV cache: tamanho, crescimento com o contexto, e GQA/MQA para reduzi-lo.
3. Batching contínuo e PagedAttention (vLLM).
4. Quantização pós-treino: int8, int4 (GPTQ, AWQ), formato GGUF; erro e outliers **M32**.
5. Decodificação especulativa: modelo rascunho + verificação.
6. Amostragem: temperatura, top-k, top-p, e o custo de cada uma **L15**.

## Meio

- llama.cpp e MLX: inferência em CPU e Apple Silicon; formatos e quantizações.
- Destilação para modelos menores → L18.
- Métricas: tempo até o primeiro token, tokens/s, custo por token; latência × throughput.

## Avançado

- Contexto longo: compressão e descarte de KV cache, atenção esparsa.
- Desagregação prefill/decode em servidores de fronteira.
- Medir a degradação real da quantização em tarefas, não só em perplexidade.

## Matemática necessária

**M32**: quantização e ponto flutuante; **M03**: estimativas.

## Métodos

- Rode o mesmo modelo aberto em llama.cpp e MLX no M1 e em vLLM na 3090; meça tudo.
- Calcule a memória do KV cache para os seus contextos antes de rodar.
- Implemente decodificação especulativa e meça a taxa de aceitação.

## Desafios

- Comparar tokens/s sem fixar batch, contexto e quantização.
- Confiar só em perplexidade para julgar uma quantização.

## Fontes

- 📄 [Efficiently Scaling Transformer Inference](https://arxiv.org/abs/2211.05102) — Reiner Pope et al., 2022 · paper
- 📄 [Efficient Memory Management for Large Language Model Serving with PagedAttention](https://arxiv.org/abs/2309.06180) — Woosuk Kwon et al., 2023 · paper
- 📄 [Fast Inference from Transformers via Speculative Decoding](https://arxiv.org/abs/2211.17192) — Yaniv Leviathan, Matan Kalman & Yossi Matias, 2023 · paper
- 📄 [GPTQ: Accurate Post-Training Quantization for Generative Pre-trained Transformers](https://arxiv.org/abs/2210.17323) — Elias Frantar, Saleh Ashkboos, Torsten Hoefler & Dan Alistarh, 2022 · paper
- 🔧 [llama.cpp](https://github.com/ggml-org/llama.cpp) — ggml-org · ferramenta
- 🔧 [MLX](https://github.com/ml-explore/mlx) — Apple Machine Learning Research · ferramenta
- 🎓 [MIT 6.5940: TinyML and Efficient Deep Learning Computing](https://hanlab.mit.edu/courses/2024-fall-65940) — Song Han (MIT) · curso. aulas em vídeo e laboratórios
- 🆕 [FlashInfer: Efficient and Customizable Attention Engine for LLM Inference Serving](https://arxiv.org/abs/2501.01005) — Zihao Ye et al., 2025 · recente

## Boss fight

Monte o seu servidor de inferência soberano: escolha um LLM aberto de cerca de 8B, rode-o em llama.cpp e MLX no M1 e em vLLM na 3090, em bf16, int8 e int4. Meça tempo até o primeiro token, tokens/s e qualidade num conjunto de tarefas seu (não só perplexidade). Implemente decodificação especulativa com um modelo rascunho pequeno e reporte o ganho real.

## Checkpoint

- [ ] Calcule a memória do KV cache de um modelo com 32 camadas, 8 cabeças KV de dimensão 128 e 32 mil tokens em bf16.
- [ ] Por que o decode é limitado por memória e o prefill por computação?
- [ ] Como a decodificação especulativa preserva exatamente a distribuição do modelo grande?
- [ ] Por que perplexidade não basta para avaliar quantização?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
