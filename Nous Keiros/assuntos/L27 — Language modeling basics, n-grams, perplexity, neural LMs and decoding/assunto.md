# L27 — Language modeling basics: n-grams, perplexity, neural LMs and decoding

*Fundamentos de modelagem de linguagem: n-grams, perplexidade, modelos neurais e decodificação*

- **Trilha:** Machine Learning
- **Nível:** 6 — Aprendizado de máquina · onda 2
- **Termos:** language modeling, n-gram models, smoothing, Kneser-Ney, perplexity, neural probabilistic language model, sampling, temperature, top-k, top-p, beam search
- **Projetos KEIROS:** REIXU

## Por que importa

Um LLM é, por definição, um modelo de linguagem: uma distribuição de probabilidade sobre o próximo token. Essa ideia tem mais de 70 anos — de Shannon adivinhando letras ao modelo neural de Bengio. Subir a escada inteira (contagens, suavização, rede neural, amostragem) faz o transformer deixar de ser mágica e virar o degrau seguinte.

## Pré-requisitos

- **Depende de:** L08 (Neural networks and backpropagation), M26 (Information theory)
- **Destrava:** L11 (Recurrent networks and sequence modeling), L28 (Tokenization: BPE, unigram and byte-level)

## Base

1. A tarefa: P(próximo token | contexto) e a regra da cadeia para a probabilidade de uma sequência **M22**.
2. Modelos n-gram: contagens, máxima verossimilhança e o problema dos zeros.
3. Suavização: Laplace, interpolação, back-off e Kneser-Ney.
4. Avaliação: entropia cruzada e perplexidade **M26**; conjunto de teste separado.
5. O modelo neural de Bengio: embeddings + MLP + softmax **L08**.
6. Treinar por máxima verossimilhança é minimizar a entropia cruzada.
7. Geração: greedy, amostragem com temperatura, top-k e top-p (nucleus).

## Meio

- Caractere, palavra ou subpalavra: o problema do vocabulário aberto (prévia de → L28).
- Embeddings aprendidos e o que eles capturam.
- Repetição e degeneração na geração; beam search e por que ele piora texto aberto.
- Calibração: o modelo sabe o quanto não sabe?

## Avançado

- Modelos recorrentes de linguagem e o limite do contexto fixo (prévia de → L11).
- Prever é comprimir: um bom modelo de linguagem é um bom compressor (codificação aritmética).
- As leis de escala começam aqui: perplexidade em função de dados e parâmetros (prévia de → L16).

## Matemática necessária

**M26**: entropia, entropia cruzada e KL; **M22**: probabilidade condicional.

## Métodos

- Faça a série makemore de Karpathy: bigramas por contagem, depois MLP, até o modelo de Bengio.
- Treine um n-gram com Kneser-Ney e um MLP no mesmo corpus em português e compare as perplexidades.
- Implemente temperatura, top-k e top-p e gere amostras com cada configuração.

## Desafios

- Comparar perplexidades de modelos com tokenizações diferentes: não são comparáveis.
- Avaliar no próprio conjunto de treino.
- Achar que temperatura 0 dá "a resposta certa": dá só a mais provável.

## Fontes

- 📖 [Speech and Language Processing (3rd ed. draft)](https://web.stanford.edu/~jurafsky/slp3/) — Daniel Jurafsky & James H. Martin · livro. livre; capítulos de n-grams e de modelos neurais de linguagem
- 🎓 [Neural Networks: Zero to Hero](https://karpathy.ai/zero-to-hero.html) — Andrej Karpathy · curso. a série makemore, em vídeo
- 🎬 [The spelled-out intro to language modeling: building makemore](https://www.youtube.com/watch?v=PaCmpygFfXo) — Andrej Karpathy · video
- 📄 [A Neural Probabilistic Language Model](https://www.jmlr.org/papers/v3/bengio03a.html) — Yoshua Bengio, Réjean Ducharme, Pascal Vincent & Christian Jauvin, 2003 · paper
- 📄 [Prediction and Entropy of Printed English](https://doi.org/10.1002/j.1538-7305.1951.tb01366.x) — C. E. Shannon, 1951 · paper
- 📄 [An empirical study of smoothing techniques for language modeling](https://doi.org/10.1006/csla.1999.0128) — Stanley F. Chen & Joshua Goodman, 1999 · paper
- 📄 [The Curious Case of Neural Text Degeneration](https://arxiv.org/abs/1904.09751) — Ari Holtzman et al., 2020 · paper

## Boss fight

Construa a escada completa num corpus em português escolhido por você (por exemplo, textos em domínio público): um bigrama por contagem, um trigrama com Kneser-Ney, um MLP de Bengio e, se quiser, o mesmo MLP em C ou REIXU. Meça a perplexidade de teste de cada um, gere textos com greedy, temperatura e top-p, e escreva uma análise do que cada degrau ganhou e do que ainda falta — que é exatamente o que a atenção vai resolver.

## Checkpoint

- [ ] Como a regra da cadeia transforma a probabilidade de uma frase num produto de probabilidades do próximo token?
- [ ] O que é perplexidade, e por que ela é a exponencial da entropia cruzada?
- [ ] Por que um n-gram sem suavização dá probabilidade zero a frases novas, e como Kneser-Ney ajuda?
- [ ] Qual a diferença entre amostragem top-k e top-p?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
