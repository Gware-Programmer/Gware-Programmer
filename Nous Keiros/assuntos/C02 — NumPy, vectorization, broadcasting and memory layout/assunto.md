# C02 — NumPy: vectorization, broadcasting and memory layout

*NumPy: vetorização, broadcasting e layout de memória*

- **Trilha:** Computing for AI
- **Nível:** 1 — Provas e código · onda 1
- **Termos:** NumPy, vectorization, broadcasting, strides, einsum
- **Projetos KEIROS:** REIXU

## Por que importa

NumPy é a camada sobre a qual a pilha científica inteira foi construída — e a semântica que PyTorch e JAX copiaram. Pensar em arrays, não em laços, é o que transforma fórmulas de papers em código rápido. Strides e layout de memória vão parecer naturais para você.

## Pré-requisitos

- **Depende de:** C01 (Scientific Python: the lab), M04 (Elementary algebra: expressions, equations and inequalities)
- **Destrava:** C03 (Scalar automatic differentiation from scratch), C06 (Computer architecture for AI), L01 (Foundations of supervised learning), R01 (Bandits and the exploration–exploitation dilemma), S04 (Integrated information theory (IIT): versions and computing Φ)

## Base

1. ndarray: dtype, shape, ndim; criação (zeros, arange, linspace, aleatórios).
2. Indexação e fatiamento (views vs. cópias); indexação booleana e avançada.
3. Operações elemento a elemento (ufuncs) e reduções por eixo.
4. Broadcasting: as regras e por que ele substitui laços.
5. reshape, transpose, stack, concatenate, newaxis.
6. Álgebra linear como ferramenta (@, np.linalg) — a teoria vem em → M17.
7. Aleatoriedade reprodutível com np.random.default_rng.

## Meio

- Strides, layout C vs. Fortran e contiguidade: por que transpor é grátis e copiar não.
- einsum como linguagem de contrações tensoriais.
- Vetorizar algoritmos "naturalmente iterativos": distâncias par a par, histogramas, convoluções.
- float32 vs. float64; overflow em inteiros **M03**.

## Avançado

- Como o NumPy implementa ufuncs (laços em C com despacho SIMD) e o protocolo de buffer — integre arrays da sua biblioteca C/REIXU sem copiar.
- O padrão Array API e a convergência NumPy/PyTorch/JAX/CuPy.
- Quando NumPy não basta: Numba, JAX, ou escrever o kernel você mesmo → C06.

## Matemática necessária

**M04**: álgebra elementar; **M03**: potências e ordens de grandeza.

## Métodos

- Faça os "100 numpy exercises" do começo ao fim, sem laços.
- Para cada laço que escrever, reescreva vetorizado e meça o ganho.
- Leia "From Python to Numpy": ensina a pensar vetorialmente.

## Desafios

- Views mutáveis alterando os dados "originais" sem você perceber.
- Broadcasting silencioso produzindo shapes errados ((n,) com (n, 1) vira (n, n)).
- Misturar dtypes e perder precisão sem aviso.

## Fontes

- 🗺️ [NumPy: the absolute basics for beginners](https://numpy.org/doc/stable/user/absolute_beginners.html) — NumPy Developers · guia
- 📖 [From Python to Numpy](https://www.labri.fr/perso/nrougier/from-python-to-numpy/) — Nicolas P. Rougier, 2017 · livro. pensar em vetores
- 🔧 [100 numpy exercises](https://github.com/rougier/numpy-100) — Nicolas P. Rougier · ferramenta
- 📄 [Array programming with NumPy](https://doi.org/10.1038/s41586-020-2649-2) — Charles R. Harris et al., 2020 · paper. o desenho por trás da biblioteca
- 📖 [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/) — Jake VanderPlas · livro. cap. 2
- 🎓 [Scientific Python Lectures](https://lectures.scientific-python.org/) — Comunidade Scientific Python · curso. NumPy, SciPy e Matplotlib em aulas com exercícios

## Boss fight

Em NumPy puro, sem nenhum laço Python: o Jogo da Vida de Conway, distâncias par a par entre 10 mil pontos, k vizinhos mais próximos, um histograma 2D e uma convolução 2D por stride tricks (as_strided). Depois exponha ao NumPy um array da sua biblioteca em C ou REIXU sem cópia (protocolo de buffer ou ctypes) e demonstre, medindo, que nenhuma cópia ocorreu.

## Checkpoint

- [ ] Explique as regras de broadcasting e o shape resultante de (3, 1) + (4,).
- [ ] Quando o fatiamento devolve view e quando devolve cópia?
- [ ] O que são strides e por que transpor não copia dados?
- [ ] Escreva com einsum: traço, produto matricial e produto externo.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
