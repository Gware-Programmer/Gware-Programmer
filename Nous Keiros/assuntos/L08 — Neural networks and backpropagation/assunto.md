# L08 — Neural networks and backpropagation

*Redes neurais e backpropagation*

- **Trilha:** Machine Learning
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** neural networks, MLP, backpropagation, universal approximation

## Por que importa

A rede neural é o objeto central da IA moderna. Entender um perceptron multicamada por inteiro — forward, backward, inicialização, o que cada camada representa — é a fundação de CNNs, RNNs, transformers e de toda a interpretabilidade.

## Pré-requisitos

- **Depende de:** L02 (Linear models and maximum likelihood), C03 (Scalar automatic differentiation from scratch), M21 (Matrix calculus)
- **Destrava:** L09 (Training deep networks), L27 (Language modeling basics: n-grams, perplexity, neural LMs and decoding), R06 (Policy gradients: REINFORCE, TRPO and PPO), N09 (Predictive coding)

## Base

1. Neurônio artificial: soma ponderada + não linearidade; o perceptron de Rosenblatt e seu algoritmo.
2. O limite do perceptron (XOR) e a necessidade de camadas ocultas.
3. MLP: composição de camadas lineares e ativações (sigmoide, tanh, ReLU, GELU).
4. Backpropagation em forma matricial **M21** — exatamente o seu autograd **C03**.
5. Perdas: erro quadrático e entropia cruzada **L02**.
6. Teorema da aproximação universal: o que garante e o que não garante.
7. Inicialização (Glorot, He) e por que ela importa.

## Meio

- Profundidade vs. largura: funções que exigem largura exponencial em redes rasas.
- Gradientes que desaparecem ou explodem.
- O que as camadas ocultas aprendem: visualização.

## Avançado

- Redes superparametrizadas como interpoladores → L26.
- O cérebro não parece fazer backprop exato; alternativas biologicamente plausíveis → N12.
- O que as redes aprendem primeiro: viés de simplicidade e viés espectral.

## Matemática necessária

**M21**: cálculo matricial; **M14**: regra da cadeia.

## Métodos

- Implemente um MLP com o seu mini-autograd e depois em PyTorch; compare.
- Assista à série de redes neurais do 3Blue1Brown e leia o capítulo de backprop de Nielsen.
- Visualize a fronteira de decisão 2D evoluindo ao longo do treino.

## Desafios

- Inicializar com zeros: a simetria nunca se quebra.
- Achar que aproximação universal implica que o treino vai encontrar a solução.
- Esquecer a não linearidade: camadas lineares empilhadas são uma camada linear.

## Fontes

- 📖 [Understanding Deep Learning](https://udlbook.github.io/udlbook/) — Simon J. D. Prince, 2023 · livro. caps. 3–7; PDF gratuito com notebooks
- 🎬 [Neural Networks (série)](https://www.3blue1brown.com/topics/neural-networks) — Grant Sanderson (3Blue1Brown) · video
- 📖 [Neural Networks and Deep Learning](http://neuralnetworksanddeeplearning.com/) — Michael Nielsen, 2015 · livro. o melhor texto introdutório sobre backprop
- 📄 [Learning representations by back-propagating errors](https://doi.org/10.1038/323533a0) — David E. Rumelhart, Geoffrey E. Hinton & Ronald J. Williams, 1986 · paper
- 📄 [Approximation by superpositions of a sigmoidal function](https://doi.org/10.1007/BF02551274) — George Cybenko, 1989 · paper

## Boss fight

Escreva um MLP vetorizado sobre o seu autograd e outro em PyTorch, com inicialização, ativações e perdas configuráveis, e leve ambos a cerca de 98% no MNIST. Reproduza experimentalmente: (1) o XOR impossível sem camada oculta; (2) gradientes que somem com sigmoides empilhadas e inicialização ruim; (3) a fronteira de decisão evoluindo num problema 2D.

## Checkpoint

- [ ] Derive o backward de uma camada linear seguida de ReLU.
- [ ] Por que empilhar camadas lineares sem ativação não aumenta a expressividade?
- [ ] O que o teorema da aproximação universal não diz?
- [ ] Por que inicializar todos os pesos com zero é um erro?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
