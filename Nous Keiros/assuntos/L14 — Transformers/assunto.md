# L14 — Transformers

*Transformers*

- **Trilha:** Machine Learning
- **Nível:** 7 — Redes profundas · onda 3
- **Termos:** transformer, residual stream, decoder-only, KV cache

## Por que importa

O transformer é a arquitetura de quase toda a IA de fronteira: linguagem, visão, áudio, proteínas, robótica. Construí-lo do zero — e entender o fluxo residual como um barramento de comunicação entre camadas — é a base para LLMs, para a interpretabilidade e para qualquer arquitetura que você venha a inventar.

## Pré-requisitos

- **Depende de:** L13 (Attention)
- **Destrava:** C09 (Distributed training), L15 (LLM pretraining), L20 (Diffusion and flow matching), L23 (State space models and post-transformer architectures), L32 (Speech and audio models: ASR, TTS and audio tokenizers), I01 (Interpretability foundations and the mechanistic program), K05 (Neurosymbolic systems), N12 (NeuroAI: comparing brains and artificial networks), Z01 (Train a tiny GPT from scratch)

## Base

1. O bloco: atenção multi-cabeça + MLP, conexões residuais e normalização antes de cada subcamada (pre-norm) **L13**.
2. O fluxo residual (residual stream) como canal de comunicação compartilhado entre camadas.
3. Encoder, decoder e encoder-decoder; o decoder-only causal.
4. Embedding de tokens, posição e "unembedding" (projeção para o vocabulário).
5. Treino paralelo com objetivo de próximo token (entropia cruzada); geração autoregressiva com KV cache.
6. Contagem de parâmetros (≈ 12·d² por bloco) e de FLOPs por token (≈ 2 × parâmetros no forward).

## Meio

- Variantes modernas: RMSNorm, SwiGLU, GQA, RoPE, camadas sem bias.
- Vision Transformer (ViT) e transformers para áudio.
- Inicialização e estabilidade em profundidade.

## Avançado

- O transformer como circuito: composição de cabeças e o "framework matemático" de Elhage et al. → I01.
- Limites de expressividade e o papel da chain-of-thought → L25.
- Alternativas e híbridos → L23.

## Matemática necessária

**M21**: gradientes matriciais; **M19**: álgebra linear; **M26**: entropia cruzada.

## Métodos

- Assista à aula "Let's build GPT" (Karpathy), implemente sem olhar e só então compare com o nanoGPT.
- Conte parâmetros e FLOPs à mão e confira contra o código.
- Leia o Annotated Transformer como segunda implementação de referência.

## Desafios

- Confundir post-norm com pre-norm (afeta muito a estabilidade).
- Erros de máscara e de shape na atenção multi-cabeça.
- Julgar o modelo por amostras bonitas em vez da perda de validação.

## Fontes

- 🎬 [Neural Networks: Zero to Hero — "Let's build GPT"](https://karpathy.ai/zero-to-hero.html) — Andrej Karpathy · video
- 🔧 [nanoGPT](https://github.com/karpathy/nanoGPT) — Andrej Karpathy · ferramenta
- 🗺️ [The Annotated Transformer](https://nlp.seas.harvard.edu/annotated-transformer/) — Alexander Rush et al. (Harvard NLP) · guia
- 📄 [Attention Is All You Need](https://arxiv.org/abs/1706.03762) — Ashish Vaswani et al., 2017 · paper
- 📖 [Build a Large Language Model (From Scratch)](https://github.com/rasbt/LLMs-from-scratch) — Sebastian Raschka, 2024 · livro. repositório oficial do livro
- 📄 [An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale](https://arxiv.org/abs/2010.11929) — Alexey Dosovitskiy et al., 2020 · paper

## Boss fight

Implemente do zero um transformer decoder-only (o nanoGPT serve só para conferir): blocos pre-norm com RMSNorm, SwiGLU e RoPE, e KV cache na geração. Treine num corpus em português na 3090, reporte a perplexidade de validação, conte parâmetros e FLOPs à mão e confira com medições, e demonstre que a geração com KV cache é idêntica à sem cache — e mais rápida.

## Checkpoint

- [ ] Quantos parâmetros tem um bloco com d_model = 768 e MLP 4×, ignorando vieses e normalizações?
- [ ] O que é o fluxo residual e por que ele importa para a interpretabilidade?
- [ ] Por que o treino é paralelo no comprimento da sequência e a geração não?
- [ ] O que o KV cache guarda, e por quê?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
