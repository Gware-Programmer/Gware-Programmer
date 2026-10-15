# Z01 — Train a tiny GPT from scratch

*Treinar um GPT pequeno do zero*

- **Trilha:** Build Your Own AI
- **Nível:** 7 — Redes profundas · onda 4
- **Termos:** build GPT from scratch, decoder-only transformer, causal attention, training loop, AdamW, learning rate warmup, MPS, MLX, Apple Silicon, text generation, KV cache
- **Projetos KEIROS:** Rei Ichi

## Por que importa

É o momento em que tudo vira uma IA de verdade: o seu tokenizador, a sua infraestrutura de treino e o transformer que você entendeu peça por peça, rodando no seu M1 e gerando texto. Pequeno, mas seu — e cada decisão de projeto daqui em diante vai ser medida contra ele.

## Pré-requisitos

- **Depende de:** L14 (Transformers), L28 (Tokenization: BPE, unigram and byte-level), C16 (ML engineering: experiment tracking, configs, checkpoints and data versioning), L09 (Training deep networks), C04 (PyTorch: tensors, autograd and the training loop)
- **Destrava:** Z02 (Pretrain a small LLM end to end)

## Base

1. Dados: um corpus pequeno e limpo (por exemplo, TinyStories ou textos em português em domínio público), dividido em treino e validação.
2. Tokenização com o seu BPE **L28**.
3. O modelo: GPT decoder-only com embeddings, atenção causal multi-cabeça, MLP, normalização e conexões residuais **L14**.
4. O laço de treino: AdamW, warmup e decaimento da taxa de aprendizado, clipping de gradiente **L09**.
5. Infraestrutura: configuração, checkpoints, rastreamento e retomada **C16**.
6. Rodar no M1: PyTorch com o backend MPS ou MLX **C04**.
7. Gerar com temperatura e top-p e avaliar pela perplexidade de validação.

## Meio

- Comparar tamanhos (por exemplo, 1M, 10M e 30M de parâmetros) e ver a perplexidade cair.
- Ablações: sem warmup, sem normalização, sem residual — e ver o que quebra.
- Reescrever o laço em MLX e comparar com o PyTorch no M1.

## Avançado

- Rodar o mesmo GPT sobre o seu próprio autograd, em C ou REIXU.
- KV cache na geração, medindo a aceleração.
- Leis de escala em miniatura: perplexidade vs. parâmetros vs. tokens (prévia de → L16).

## Matemática necessária

**L14**: transformers; **L09**: treinar redes profundas.

## Métodos

- Assista a "Let's build GPT: from scratch, in code, spelled out" e escreva o código você mesmo, sem copiar.
- Use o nanoGPT como referência só depois de ter o seu funcionando.
- Mantenha um diário de experimentos no seu rastreador.

## Desafios

- Bugs silenciosos: uma máscara causal errada deixa o modelo "colar" do futuro e a perda cai demais.
- Avaliar com amostras escolhidas a dedo em vez de perplexidade.
- Treinar tempo demais num corpus pequeno e decorar o texto.

## Fontes

- 🎬 [Let's build GPT: from scratch, in code, spelled out.](https://www.youtube.com/watch?v=kCc8FmEb1nY) — Andrej Karpathy · video
- 🎬 [Let's reproduce GPT-2 (124M)](https://www.youtube.com/watch?v=l8pRSuU81PU) — Andrej Karpathy · video
- 🔧 [nanoGPT](https://github.com/karpathy/nanoGPT) — Andrej Karpathy · ferramenta
- 📄 [Attention Is All You Need](https://arxiv.org/abs/1706.03762) — Ashish Vaswani et al., 2017 · paper
- 📄 [Language Models are Unsupervised Multitask Learners](https://cdn.openai.com/better-language-models/language_models_are_unsupervised_multitask_learners.pdf) — Alec Radford et al., 2019 · paper. o GPT-2
- 📄 [TinyStories: How Small Can Language Models Be and Still Speak Coherent English?](https://arxiv.org/abs/2305.07759) — Ronen Eldan & Yuanzhi Li, 2023 · paper
- 🗺️ [The Annotated Transformer](https://nlp.seas.harvard.edu/annotated-transformer/) — Harvard NLP · guia
- 🔧 [MLX](https://github.com/ml-explore/mlx) — Apple Machine Learning Research · ferramenta

## Boss fight

Treine do zero, no seu M1, um GPT de até 30M de parâmetros com o seu tokenizador e a sua infraestrutura, até uma perplexidade de validação que você define antes de começar. Entregue o código, as curvas, três ablações (warmup, normalização e residual), amostras com três temperaturas e uma análise do que o modelo aprendeu e do que não aprendeu. Esse modelo é a primeira versão do núcleo de linguagem do Rei Ichi.

## Checkpoint

- [ ] Para que serve a máscara causal, e o que acontece se ela estiver errada?
- [ ] Por que usar warmup da taxa de aprendizado?
- [ ] Como a perplexidade de validação mostra que o modelo está decorando o treino?
- [ ] O que o KV cache evita recalcular na geração?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
