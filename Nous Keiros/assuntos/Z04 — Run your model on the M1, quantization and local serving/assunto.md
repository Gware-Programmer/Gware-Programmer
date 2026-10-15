# Z04 — Run your model on the M1: quantization and local serving

*Rodar o seu modelo no M1: quantização e servidor local*

- **Trilha:** Build Your Own AI
- **Nível:** 10 — Circuitos e agentes · onda 3
- **Termos:** local inference, Apple Silicon, unified memory, quantization, GPTQ, AWQ, GGUF, llama.cpp, MLX, Core ML, speculative decoding, KV cache, PagedAttention, tokens per second
- **Projetos KEIROS:** Rei Ichi, REIXU

## Por que importa

Uma IA sua precisa rodar onde você está, sem depender do servidor de ninguém. Quantizar, escolher o formato e o motor de inferência certos e medir latência e memória é o que transforma pesos num programa utilizável no seu Mac — e é também onde a sua experiência com compiladores rende mais.

## Pré-requisitos

- **Depende de:** Z03 (Post-train an open model: SFT, preferences and RLVR), C11 (Efficient inference)
- **Destrava:** Z08 (Integrate into Rei Ichi: architecture, ablations and technical report)

## Base

1. O custo da inferência: memória dos pesos, KV cache, banda de memória vs. computação **C11**.
2. Quantização: 8, 4 bits e menos; GPTQ, AWQ e quantização por grupos.
3. Formatos e motores: GGUF e llama.cpp; MLX; Core ML.
4. A memória unificada do M1: o que cabe e por quê.
5. Medir: tokens por segundo, tempo até o primeiro token, memória e qualidade depois de quantizar.
6. Servir localmente: uma API simples na sua máquina **Z03**.

## Meio

- Decodificação especulativa com um modelo pequeno de rascunho.
- Comparar llama.cpp, MLX e PyTorch (MPS) no mesmo modelo.
- Perda de qualidade por quantização medida na sua bancada.

## Avançado

- Kernels próprios para o M1 (Metal) e o que o REIXU poderia gerar.
- Rodar modelos maiores que a memória (LLM in a flash).
- Batching e paginação do KV cache (PagedAttention) para muitos pedidos.

## Matemática necessária

**C11**: inferência eficiente; **M32**: ponto flutuante.

## Métodos

- Converta o seu modelo para GGUF e para MLX e rode nos dois.
- Quantize em 8 e 4 bits e meça qualidade, velocidade e memória.
- Leia a especificação do formato GGUF.

## Desafios

- Medir velocidade sem medir a qualidade depois da quantização.
- Esquecer o KV cache na conta de memória.
- Comparar motores com configurações diferentes.

## Fontes

- 🔧 [llama.cpp](https://github.com/ggml-org/llama.cpp) — Georgi Gerganov et al. · ferramenta
- 🔧 [MLX](https://github.com/ml-explore/mlx) — Apple Machine Learning Research · ferramenta
- 🔧 [Core ML Tools](https://apple.github.io/coremltools/) — Apple · ferramenta
- 🗺️ [GGUF](https://github.com/ggml-org/ggml/blob/master/docs/gguf.md) — ggml · guia
- 📄 [GPTQ: Accurate Post-Training Quantization for Generative Pre-trained Transformers](https://arxiv.org/abs/2210.17323) — Elias Frantar et al., 2022 · paper
- 📄 [AWQ: Activation-aware Weight Quantization for LLM Compression and Acceleration](https://arxiv.org/abs/2306.00978) — Ji Lin et al., 2023 · paper
- 📄 [Fast Inference from Transformers via Speculative Decoding](https://arxiv.org/abs/2211.17192) — Yaniv Leviathan, Matan Kalman & Yossi Matias, 2022 · paper
- 📄 [Efficient Memory Management for Large Language Model Serving with PagedAttention](https://arxiv.org/abs/2309.06180) — Woosuk Kwon et al., 2023 · paper
- 📄 [LLM in a flash: Efficient Large Language Model Inference with Limited Memory](https://arxiv.org/abs/2312.11514) — Keivan Alizadeh et al., 2023 · paper

## Boss fight

Faça a sua IA rodar só no seu Mac: converta o modelo pós-treinado de Z03 para GGUF (llama.cpp) e para MLX, quantize em 8 e 4 bits, sirva por uma API local e meça tokens por segundo, tempo até o primeiro token, memória e perda de qualidade na sua bancada para cada combinação. Acrescente decodificação especulativa e mostre o ganho. Escolha, com números, a configuração padrão do Rei Ichi.

## Checkpoint

- [ ] Por que a geração de tokens costuma ser limitada pela banda de memória, e não pela computação?
- [ ] Quanto ocupa o KV cache de um modelo com n camadas, contexto L e dimensão d?
- [ ] O que a quantização por grupos faz para reduzir o erro?
- [ ] Como a decodificação especulativa acelera sem mudar a distribuição de saída?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
