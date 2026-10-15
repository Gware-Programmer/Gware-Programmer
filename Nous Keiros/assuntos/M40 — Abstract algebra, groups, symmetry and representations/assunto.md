# M40 — Abstract algebra: groups, symmetry and representations

*Álgebra abstrata: grupos, simetria e representações*

- **Trilha:** Mathematics
- **Nível:** 5 — A matemática do aprendizado · onda 1
- **Termos:** abstract algebra, group theory, symmetry, representation theory

## Por que importa

Simetria é o princípio unificador do deep learning geométrico: CNNs são equivariantes a translações, GNNs a permutações, modelos moleculares a rotações. Grupos e representações são a linguagem precisa disso — e também da física e da criptografia.

## Pré-requisitos

- **Depende de:** M18 (Linear algebra II: determinants, eigenvalues and the spectral theorem)
- **Destrava:** L22 (Geometric deep learning: graphs, symmetry and equivariance)

## Base

1. Operações binárias e grupos; exemplos: ℤ, ℤ/nℤ **M01**, permutações, rotações, simetrias de polígonos.
2. Subgrupos, ordem, geradores e grupos cíclicos.
3. Homomorfismos, isomorfismos e núcleo; grupos quocientes.
4. Ações de grupo; órbitas e estabilizadores; lema de Burnside.
5. Anéis e corpos (noção); corpos finitos.
6. Representações lineares de grupos por matrizes **M18**; representações irredutíveis (noção).

## Meio

- O grupo simétrico Sₙ; sinal de permutações e sua ligação com o determinante.
- Grupos de Lie (noção): SO(2), SO(3), SE(3).
- Caracteres e decomposição em irredutíveis; a transformada de Fourier como representação do grupo de translações.

## Avançado

- Equivariância em redes: G-CNNs (Cohen & Welling) e o "blueprint" geométrico (Bronstein et al.) → L22.
- Representações em interpretabilidade: redes que aprendem aritmética modular usando caracteres de Fourier do grupo cíclico → I03.
- Simetrias de parâmetros (permutar neurônios) e conectividade entre mínimos (mode connectivity).

## Matemática necessária

**M18**: matrizes, autovalores e determinantes; **M06**: provas; **M01**: aritmética modular.

## Métodos

- Carter (Visual Group Theory) para a intuição; um texto aberto como Judson para exercícios.
- Implemente grupos de permutações e verifique axiomas; calcule órbitas e use Burnside para contar colares.
- Desenhe grafos de Cayley de grupos pequenos.

## Desafios

- Pensar em grupo como "conjunto de números" em vez de "conjunto de transformações".
- Confundir invariância com equivariância.

## Fontes

- 📖 [Visual Group Theory](https://doi.org/10.1090/clrm/032) — Nathan Carter, 2009 · livro. intuição visual antes do formalismo
- 📖 [Abstract Algebra: Theory and Applications](https://judsonbooks.org/abstract-algebra-theory-and-applications/) — Thomas W. Judson · livro. livro aberto com exercícios e Sage
- 📄 [Group Equivariant Convolutional Networks](https://arxiv.org/abs/1602.07576) — Taco S. Cohen & Max Welling, 2016 · paper
- 📄 [Geometric Deep Learning: Grids, Groups, Graphs, Geodesics, and Gauges](https://arxiv.org/abs/2104.13478) — Michael M. Bronstein, Joan Bruna, Taco Cohen & Petar Veličković, 2021 · paper
- 🆕 [A Toy Model of Universality: Reverse Engineering How Networks Learn Group Operations](https://arxiv.org/abs/2302.03025) — Bilal Chughtai, Lawrence Chan & Neel Nanda, 2023 · recente
- 🎓 [Math 4120: Modern Algebra (Visual Group Theory, online)](https://www.math.clemson.edu/~macaule/classes/m20_math4120/) — Matthew Macauley (Clemson University) · curso. cerca de 50 aulas em vídeo

## Boss fight

Escreva uma biblioteca de grupos finitos (permutações, cíclicos e diedrais) com verificação de axiomas, subgrupos, órbitas e lema de Burnside; use-a para contar colares e colorações do cubo. Depois construa à mão os caracteres de ℤ/nℤ e mostre numericamente que eles diagonalizam toda matriz circulante — a semente matemática da equivariância.

## Checkpoint

- [ ] Verifique os axiomas de grupo para as rotações de um quadrado.
- [ ] Quantos elementos tem o grupo de simetrias de um triângulo equilátero? Ele é comutativo?
- [ ] Diferencie invariância de equivariância com um exemplo de imagem.
- [ ] Use o lema de Burnside para contar colares de 4 contas com 2 cores.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
