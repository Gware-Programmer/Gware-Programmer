# M21 — Matrix calculus

*Cálculo matricial*

- **Trilha:** Mathematics
- **Nível:** 4 — A máquina de aprender · onda 2
- **Termos:** matrix calculus, vector-Jacobian product, tensor derivatives

## Por que importa

Backpropagation é cálculo matricial: derivadas de uma perda escalar em relação a matrizes de pesos, propagadas por produtos vetor-Jacobiano. Dominar essa notação permite derivar à mão o gradiente de qualquer camada e entender o que o autograd realmente faz.

## Pré-requisitos

- **Depende de:** M18 (Linear algebra II: determinants, eigenvalues and the spectral theorem), M20 (Multivariable calculus and gradients)
- **Destrava:** M27 (Convex and non-convex optimization), M41 (Differential geometry and information geometry), C05 (Tensor automatic differentiation from scratch), L08 (Neural networks and backpropagation)

## Base

1. Convenções de layout (numerador vs. denominador) e por que confundem tanto.
2. Derivadas de formas lineares e quadráticas: ∂(aᵀx)/∂x, ∂(xᵀAx)/∂x.
3. Derivadas em relação a matrizes: ∂tr(AX)/∂X, ∂‖Ax − b‖²/∂x.
4. Diferencial como mapa linear: df = ⟨∇f, dX⟩ — a abordagem de Bright, Edelman e Johnson.
5. Produto vetor-Jacobiano (VJP) e Jacobiano-vetor (JVP); por que o modo reverso nunca forma o Jacobiano.
6. Regra da cadeia em forma matricial; gradiente de uma camada linear seguida de erro quadrático.
7. Identidades úteis: derivadas de det, log det, inversa e traço **M18**.

## Meio

- Gradientes de uma rede de duas camadas à mão, verificados por diferenças finitas.
- Jacobiano da softmax.
- Notação de Einstein e `einsum` para tensores.
- Gradientes de normas e regularizadores.

## Avançado

- Diferenciar decomposições (SVD, autovalores) e soluções de sistemas (diferenciação implícita) → C05.
- Diferenciar através de otimizadores e pontos fixos (camadas implícitas, deep equilibrium models).
- Produtos Hessiana-vetor sem formar a Hessiana (truque de Pearlmutter).

## Matemática necessária

**M20**: gradiente, Jacobiano e regra da cadeia; **M18**: traço, determinante e simetria.

## Métodos

- Para cada identidade, derive pelo diferencial e confira numericamente.
- Faça o curso 18.S096 do MIT: é exatamente este assunto, na visão de diferenciais.
- Derive à mão o backward de linear, ReLU, softmax e LayerNorm (o mais traiçoeiro).

## Desafios

- Misturar convenções de layout dentro da mesma derivação.
- Insistir em índices quando a forma matricial é mais clara (e o contrário quando há broadcasting).
- Esquecer que o gradiente tem sempre a mesma forma do parâmetro.

## Fontes

- 🎓 [Matrix Calculus for Machine Learning and Beyond (18.S096, IAP 2023)](https://ocw.mit.edu/courses/18-s096-matrix-calculus-for-machine-learning-and-beyond-january-iap-2023/) — Alan Edelman & Steven G. Johnson (MIT OpenCourseWare) · curso
- 📄 [Matrix Calculus (for Machine Learning and Beyond)](https://arxiv.org/abs/2501.14787) — Paige Bright, Alan Edelman & Steven G. Johnson, 2025 · paper. as notas do curso em forma de livro
- 📄 [The Matrix Calculus You Need For Deep Learning](https://arxiv.org/abs/1802.01528) — Terence Parr & Jeremy Howard, 2018 · paper. ponte direta para redes
- 📖 [The Matrix Cookbook](https://www.math.uwaterloo.ca/~hwolkowi/matrixcookbook.pdf) — Kaare B. Petersen & Michael S. Pedersen, 2012 · livro. consulta de identidades

## Boss fight

Derive à mão, em forma matricial, o backward de: camada linear, ReLU, softmax, LayerNorm e da expressão softmax(QKᵀ/√d)·V (que você reencontra como atenção em → L13). Implemente cada backward em NumPy e faça todos passarem num teste de gradiente por diferenças finitas com erro relativo abaixo de 10⁻⁶ em float64.

## Checkpoint

- [ ] Calcule ∂(xᵀAx)/∂x para A não simétrica.
- [ ] Qual o gradiente de L = ‖Wx − y‖² em relação a W?
- [ ] Por que o modo reverso calcula ∇f, para f: ℝⁿ → ℝ, a um custo de poucas avaliações de f, qualquer que seja n?
- [ ] Escreva o Jacobiano da softmax.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
