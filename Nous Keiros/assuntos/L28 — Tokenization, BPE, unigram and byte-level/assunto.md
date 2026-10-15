# L28 — Tokenization: BPE, unigram and byte-level

*Tokenização: BPE, unigram e nível de byte*

- **Trilha:** Machine Learning
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** tokenization, byte-pair encoding, BPE, WordPiece, unigram language model, SentencePiece, byte-level tokenization, tokenizer-free models
- **Projetos KEIROS:** Rei Ichi

## Por que importa

O modelo nunca vê texto: vê tokens. O tokenizador decide quanto cabe na janela de contexto, quanto custa cada língua (o português costuma gastar mais tokens que o inglês), por que LLMs erram contas e soletração e até alguns problemas de segurança. Construir um tokenizador do zero é o primeiro passo concreto de criar o seu próprio modelo.

## Pré-requisitos

- **Depende de:** L27 (Language modeling basics: n-grams, perplexity, neural LMs and decoding)
- **Destrava:** L15 (LLM pretraining), L29 (Data for LLMs: collection, filtering, deduplication, mixtures and synthetic data), Z01 (Train a tiny GPT from scratch)

## Base

1. Do texto aos inteiros: Unicode, UTF-8 e bytes; normalização.
2. Pré-tokenização: separar espaços, pontuação e dígitos com expressões regulares.
3. BPE: aprender fusões por frequência; codificar e decodificar **L27**.
4. WordPiece e o modelo unigram de linguagem (SentencePiece).
5. Tokenização em nível de byte: nada fica fora do vocabulário.
6. Tokens especiais e templates de conversa: a fronteira entre dados e instruções.
7. Tamanho do vocabulário vs. comprimento das sequências: o custo dos dois lados.

## Meio

- Fertilidade (tokens por palavra) e a desigualdade de custo entre línguas.
- Números, código e espaços: como a tokenização afeta aritmética e programação.
- Regularização de subpalavras: BPE-dropout e amostragem no modelo unigram.
- Treinar um tokenizador em escala: contagem eficiente e filas de prioridade.

## Avançado

- Modelos sem tokenizador: ByT5, MEGABYTE e Byte Latent Transformer (patches dinâmicos).
- Tokens sub-treinados ("glitch tokens") e segurança da tokenização.
- Tokenizadores para áudio e imagem (prévia de → L32).

## Matemática necessária

**M26**: entropia e compressão (o BPE é um compressor); **L27**: modelos de linguagem.

## Métodos

- Assista a "Let's build the GPT Tokenizer" (Karpathy) e implemente o minbpe você mesmo.
- Treine BPE em português e compare a fertilidade com o tokenizador de um modelo aberto.
- Teste como tokenizadores diferentes dividem números, código e acentos.

## Desafios

- Tratar texto como caracteres e esquecer o UTF-8.
- Deixar tokens especiais serem injetados pelo texto do usuário.
- Comparar perplexidade entre tokenizadores diferentes.

## Fontes

- 📄 [Neural Machine Translation of Rare Words with Subword Units](https://arxiv.org/abs/1508.07909) — Rico Sennrich, Barry Haddow & Alexandra Birch, 2016 · paper. o BPE em NLP
- 📄 [Subword Regularization: Improving Neural Network Translation Models with Multiple Subword Candidates](https://arxiv.org/abs/1804.10959) — Taku Kudo, 2018 · paper. o modelo unigram
- 📄 [SentencePiece: A simple and language independent subword tokenizer and detokenizer for Neural Text Processing](https://arxiv.org/abs/1808.06226) — Taku Kudo & John Richardson, 2018 · paper
- 📄 [ByT5: Towards a token-free future with pre-trained byte-to-byte models](https://arxiv.org/abs/2105.13626) — Linting Xue et al., 2022 · paper
- 📄 [Language Model Tokenizers Introduce Unfairness Between Languages](https://arxiv.org/abs/2305.15425) — Aleksandar Petrov et al., 2023 · paper
- 🆕 [Byte Latent Transformer: Patches Scale Better Than Tokens](https://arxiv.org/abs/2412.09871) — Artidoro Pagnoni et al., 2024 · recente
- 🎬 [Let's build the GPT Tokenizer](https://www.youtube.com/watch?v=zduSFxRajkE) — Andrej Karpathy · video
- 🔧 [minbpe](https://github.com/karpathy/minbpe) — Andrej Karpathy · ferramenta

## Boss fight

Escreva o tokenizador do seu modelo: BPE em nível de byte, treinado num corpus em português e inglês escolhido por você, com pré-tokenização por expressão regular, tokens especiais e codificação e decodificação sem perdas (teste de ida e volta em milhões de caracteres, com acentos e emojis). Meça a fertilidade em português e inglês contra o tokenizador de um modelo aberto, escolha o tamanho do vocabulário com um gráfico de compressão e documente a decisão. É esse tokenizador que você vai usar em → Z01 e → Z02.

## Checkpoint

- [ ] Por que um BPE em nível de byte nunca encontra um caractere fora do vocabulário?
- [ ] O que é fertilidade, e por que o português costuma gastar mais tokens que o inglês?
- [ ] Que custo cresce quando o vocabulário aumenta, e que custo diminui?
- [ ] Por que tokens especiais precisam ser tratados à parte do texto do usuário?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
