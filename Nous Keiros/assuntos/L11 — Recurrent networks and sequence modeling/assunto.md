# L11 — Recurrent networks and sequence modeling

*Redes recorrentes e modelagem de sequências*

- **Trilha:** Machine Learning
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** RNN, BPTT, vanishing gradients, LSTM, GRU, seq2seq

## Por que importa

Redes recorrentes são sistemas dinâmicos treináveis: guardam estado ao longo do tempo. Entender por que são difíceis de treinar (gradientes que explodem ou somem) explica o LSTM, a atenção e os modelos de espaço de estados — e liga o deep learning à neurociência de dinâmicas.

## Pré-requisitos

- **Depende de:** L09 (Training deep networks), M28 (Differential equations and dynamical systems), L27 (Language modeling basics: n-grams, perplexity, neural LMs and decoding)
- **Destrava:** L13 (Attention)

Novo pré-requisito: **L27** — o modelo de linguagem clássico vem antes do recorrente.

## Base

1. RNN simples: hₜ = f(W·hₜ₋₁ + U·xₜ).
2. Backpropagation through time (BPTT) e truncamento.
3. Gradientes que somem ou explodem: produtos de Jacobianas e raio espectral **M18****M28**.
4. LSTM e GRU: portas e o "carrossel de erro constante".
5. Modelos de linguagem de caracteres com RNN.
6. Seq2seq (encoder-decoder) e o gargalo do vetor fixo.

## Meio

- Clipping, inicialização ortogonal, RNNs bidirecionais.
- Teacher forcing e viés de exposição.
- Reservoir computing e echo state networks.

## Avançado

- RNNs como modelos de circuitos neurais: pontos fixos e linearização (Sussillo & Barak) → N05.
- O retorno das recorrências: SSMs, RWKV, xLSTM e RNNs lineares eficientes → L23.
- A Turing-completude teórica das RNNs e o que ela significa na prática → M36.

## Matemática necessária

**M28**: sistemas dinâmicos; **M18**: autovalores; **M21**: gradientes.

## Métodos

- Implemente RNN e LSTM do zero com BPTT e treine um modelo de caracteres.
- Meça a norma dos gradientes ao longo do tempo e relacione-a ao raio espectral de W.
- Analise uma RNN treinada como sistema dinâmico: ache seus pontos fixos.

## Desafios

- Não cortar o grafo entre segmentos truncados.
- Diagnosticar mal explosão vs. desaparecimento.

## Fontes

- 📄 [Long Short-Term Memory](https://doi.org/10.1162/neco.1997.9.8.1735) — Sepp Hochreiter & Jürgen Schmidhuber, 1997 · paper
- 📄 [Learning long-term dependencies with gradient descent is difficult](https://doi.org/10.1109/72.279181) — Yoshua Bengio, Patrice Simard & Paolo Frasconi, 1994 · paper
- 📄 [On the difficulty of training recurrent neural networks](https://arxiv.org/abs/1211.5063) — Razvan Pascanu, Tomas Mikolov & Yoshua Bengio, 2013 · paper
- 📄 [Sequence to Sequence Learning with Neural Networks](https://arxiv.org/abs/1409.3215) — Ilya Sutskever, Oriol Vinyals & Quoc V. Le, 2014 · paper
- 📄 [Opening the Black Box: Low-Dimensional Dynamics in High-Dimensional Recurrent Neural Networks](https://doi.org/10.1162/NECO_a_00409) — David Sussillo & Omri Barak, 2013 · paper
- 📰 [The Unreasonable Effectiveness of Recurrent Neural Networks](https://karpathy.github.io/2015/05/21/rnn-effectiveness/) — Andrej Karpathy, 2015 · artigo
- 🎓 [CS224N: Natural Language Processing with Deep Learning](https://web.stanford.edu/class/cs224n/) — Christopher Manning (Stanford) · curso. aulas em vídeo e tarefas com código

## Boss fight

Implemente RNN e LSTM do zero (forward e BPTT truncado) e treine modelos de caracteres num corpus em português de domínio público (por exemplo, Machado de Assis). Meça perplexidade, a norma dos gradientes por passo de tempo e a memória de longo alcance numa tarefa de cópia com atraso. Por fim, ache os pontos fixos de uma RNN treinada numa tarefa de memória (flip-flop de 3 bits) e mostre a dinâmica de atratores, como em Sussillo & Barak.

## Checkpoint

- [ ] Por que gradientes em RNNs explodem ou somem? Relacione ao raio espectral.
- [ ] Como a célula do LSTM mitiga o desaparecimento do gradiente?
- [ ] Qual o gargalo do seq2seq que motivou a atenção?
- [ ] O que é teacher forcing e que problema ele cria?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
