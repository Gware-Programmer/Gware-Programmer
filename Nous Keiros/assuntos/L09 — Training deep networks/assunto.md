# L09 — Training deep networks

*Treinando redes profundas*

- **Trilha:** Machine Learning
- **Nível:** 6 — Aprendizado de máquina · onda 2
- **Termos:** optimizers, Adam, normalization, initialization, regularization, debugging training

## Por que importa

Conhecer a arquitetura não basta: treinar bem é um ofício de otimização, normalização, regularização e depuração. A diferença entre um modelo que funciona e um que não converge está aqui — e é onde pesquisadores iniciantes mais perdem tempo.

## Pré-requisitos

- **Depende de:** L08 (Neural networks and backpropagation), C04 (PyTorch: tensors, autograd and the training loop), M27 (Convex and non-convex optimization)
- **Destrava:** L10 (Convolutional networks and computer vision), L11 (Recurrent networks and sequence modeling), L12 (Representations, embeddings and self-supervised learning), L19 (Latent generative models: VAEs, flows and GANs), L22 (Geometric deep learning: graphs, symmetry and equivariance), R05 (Value-based deep RL), AL01 (The alignment problem: specification and Goodhart), P02 (Reproducing results), X03 (Artificial life and self-reproducing automata), Z01 (Train a tiny GPT from scratch)

## Base

1. SGD com mini-batches, momentum, Adam e AdamW (weight decay desacoplado) **M27**.
2. Taxa de aprendizado: varredura em escala log, warmup, decaimento por cosseno — o hiperparâmetro mais importante.
3. Normalização: BatchNorm, LayerNorm, RMSNorm — o que cada uma normaliza.
4. Conexões residuais e treinabilidade em profundidade.
5. Regularização: weight decay, dropout, aumento de dados, parada antecipada.
6. Inicialização e escala das ativações **M23**.
7. A receita de depuração (Karpathy): começar pequeno, sobreajustar um batch, conferir a perda inicial, visualizar tudo.

## Meio

- Clipping de gradiente; picos de perda e suas causas.
- Tamanho de batch, ruído e batch crítico.
- Precisão mista na prática.
- Busca de hiperparâmetros e o "Tuning Playbook" do Google.

## Avançado

- Edge of stability e a dinâmica da nitidez (sharpness) → L26.
- Otimizadores modernos (Muon, Shampoo) e parametrizações que transferem hiperparâmetros entre escalas (muP) → L16.
- Por que o Adam funciona (e onde falha): a teoria ainda está incompleta.

## Matemática necessária

**M27**: otimização; **M21**: gradientes; **M23**: estatística da inicialização.

## Métodos

- Siga a receita de Karpathy em todo projeto e mantenha um diário de experimentos.
- Meça o efeito de cada técnica com ablações controladas e várias sementes.
- Leia o Tuning Playbook e aplique num projeto seu.

## Desafios

- Mudar várias coisas ao mesmo tempo.
- Confiar numa única semente.
- Ignorar a perda inicial: num classificador balanceado de n classes ela deve ser ≈ ln n.

## Fontes

- 📖 [Understanding Deep Learning](https://udlbook.github.io/udlbook/) — Simon J. D. Prince, 2023 · livro. caps. 6–9 e 11
- 📰 [A Recipe for Training Neural Networks](https://karpathy.github.io/2019/04/25/recipe/) — Andrej Karpathy, 2019 · artigo
- 🗺️ [Deep Learning Tuning Playbook](https://github.com/google-research/tuning_playbook) — Varun Godbole, George E. Dahl, Justin Gilmer, Christopher J. Shallue & Zachary Nado (Google Research), 2023 · guia
- 📄 [Deep Residual Learning for Image Recognition](https://arxiv.org/abs/1512.03385) — Kaiming He, Xiangyu Zhang, Shaoqing Ren & Jian Sun, 2015 · paper
- 📄 [Decoupled Weight Decay Regularization](https://arxiv.org/abs/1711.05101) — Ilya Loshchilov & Frank Hutter, 2017 · paper
- 📄 [Layer Normalization](https://arxiv.org/abs/1607.06450) — Jimmy Lei Ba, Jamie Ryan Kiros & Geoffrey E. Hinton, 2016 · paper
- 🎓 [UvA Deep Learning Tutorials](https://uvadlc-notebooks.readthedocs.io/) — Phillip Lippe (Universidade de Amsterdã) · curso. notebooks e vídeos

## Boss fight

Treine um MLP residual de 20 camadas no Fashion-MNIST com orçamento de computação fixo e chegue ao melhor resultado que conseguir. Depois faça um estudo de ablação com pelo menos três sementes por condição — sem residual, sem normalização, sem warmup, Adam vs. AdamW vs. SGD, taxa de aprendizado 3× maior — e apresente tudo com barras de erro, explicando com evidência o que cada componente faz.

## Checkpoint

- [ ] Por que AdamW difere de Adam com regularização L2?
- [ ] O que exatamente BatchNorm e LayerNorm normalizam?
- [ ] Qual deve ser a perda inicial de um classificador de 10 classes bem inicializado?
- [ ] Por que conexões residuais permitem treinar redes muito profundas?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
