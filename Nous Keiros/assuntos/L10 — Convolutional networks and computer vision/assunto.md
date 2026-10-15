# L10 — Convolutional networks and computer vision

*Redes convolucionais e visão computacional*

- **Trilha:** Machine Learning
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** CNN, convolution, ResNet, inductive bias

## Por que importa

As CNNs inauguraram a era do deep learning (AlexNet, 2012) e são o melhor exemplo de viés indutivo bem escolhido: localidade e equivariância à translação. São também o modelo computacional mais bem-sucedido do sistema visual dos primatas.

## Pré-requisitos

- **Depende de:** L09 (Training deep networks), M31 (Fourier analysis and signal processing)
- **Destrava:** L21 (Multimodal models), N06 (Sensory systems and the visual system), AL03 (Robustness and adversarial attacks)

## Base

1. Convolução discreta 2D (na prática, correlação cruzada) **M31**; filtros, stride, padding.
2. Campos receptivos e hierarquia de features.
3. Pooling e redução de resolução.
4. Arquiteturas: LeNet, AlexNet, VGG, ResNet **L09**.
5. Equivariância à translação e invariância aproximada.
6. Aumento de dados para visão.

## Meio

- Convoluções 1×1, separáveis em profundidade (depthwise) e dilatadas.
- Transfer learning e fine-tuning de modelos pré-treinados.
- Detecção e segmentação (U-Net), em visão geral.
- Visualização de features (Olah et al.).

## Avançado

- Vision Transformers vs. CNNs: quando o viés indutivo ainda importa → L14.
- CNNs como modelos do córtex visual ventral → N06.
- Exemplos adversariais em visão → AL03.

## Matemática necessária

**M31**: convolução; **M21**: gradientes matriciais.

## Métodos

- Implemente convolução ingênua, por im2col e via FFT, e compare.
- Treine LeNet e uma ResNet pequena do zero; visualize filtros e mapas de ativação.
- Faça as notas e exercícios do CS231n.

## Desafios

- Errar shapes e canais (o bug mais comum).
- Aplicar aumento de dados no teste por engano.
- Ignorar que o pooling quebra parte da equivariância.

## Fontes

- 🎓 [CS231n: Deep Learning for Computer Vision](https://cs231n.stanford.edu/) — Stanford · curso
- 📄 [Gradient-based learning applied to document recognition](https://doi.org/10.1109/5.726791) — Yann LeCun, Léon Bottou, Yoshua Bengio & Patrick Haffner, 1998 · paper
- 📄 [ImageNet Classification with Deep Convolutional Neural Networks](https://doi.org/10.1145/3065386) — Alex Krizhevsky, Ilya Sutskever & Geoffrey E. Hinton, 2017 · paper. versão em periódico do paper de 2012
- 📄 [Deep Residual Learning for Image Recognition](https://arxiv.org/abs/1512.03385) — Kaiming He, Xiangyu Zhang, Shaoqing Ren & Jian Sun, 2015 · paper
- 📰 [Feature Visualization](https://distill.pub/2017/feature-visualization/) — Chris Olah, Alexander Mordvintsev & Ludwig Schubert, 2017 · artigo
- 📖 [Understanding Deep Learning](https://udlbook.github.io/udlbook/) — Simon J. D. Prince, 2023 · livro. cap. 10

## Boss fight

Implemente uma camada convolucional do zero (forward e backward via im2col), confira contra o PyTorch e treine uma ResNet-18 adaptada no CIFAR-10 até pelo menos 93%. Visualize features de camadas profundas por otimização da entrada e demonstre empiricamente a equivariância à translação — e onde o pooling a quebra.

## Checkpoint

- [ ] Calcule o shape de saída de uma convolução sobre 32×32×3 com 16 filtros 5×5, stride 1, sem padding.
- [ ] O que significa equivariância à translação e por que convoluções a têm?
- [ ] Quantos parâmetros tem uma convolução 3×3 de 64 para 128 canais?
- [ ] Por que as ResNets permitiram redes com mais de cem camadas?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
