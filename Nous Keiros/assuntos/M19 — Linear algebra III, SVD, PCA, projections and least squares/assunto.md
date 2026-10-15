# M19 — Linear algebra III: SVD, PCA, projections and least squares

*Álgebra linear III: SVD, PCA, projeções e mínimos quadrados*

- **Trilha:** Mathematics
- **Nível:** 4 — A máquina de aprender · onda 2
- **Termos:** singular value decomposition, PCA, least squares, pseudoinverse

## Por que importa

A decomposição em valores singulares (SVD) é o canivete suíço da IA: compressão, PCA, mínimos quadrados, pseudoinversa, adaptação de baixo posto (LoRA) e comparação de representações. Entender a SVD é entender a estrutura de qualquer matriz.

## Pré-requisitos

- **Depende de:** M18 (Linear algebra II: determinants, eigenvalues and the spectral theorem)
- **Destrava:** M24 (Statistics and frequentist inference), M32 (Numerical analysis and floating-point arithmetic), M35 (Functional analysis and Hilbert spaces)

## Base

1. Projeção ortogonal sobre um subespaço; matriz de projeção.
2. Mínimos quadrados: equações normais AᵀAx = Aᵀb; ajuste de retas e polinômios.
3. SVD A = UΣVᵀ: existência e geometria (rotação, escala, rotação).
4. Posto e aproximação de posto baixo; teorema de Eckart–Young.
5. Pseudoinversa de Moore-Penrose.
6. PCA pela SVD da matriz de dados centrada; variância explicada.
7. Normas matriciais (Frobenius, espectral) e número de condição.

## Meio

- Mínimos quadrados por QR e por SVD, e por que são mais estáveis que as equações normais.
- Regularização de Tikhonov (ridge) vista pela SVD.
- Compressão de imagens por posto baixo; whitening dos dados.

## Avançado

- SVD randomizada para matrizes enormes (Halko, Martinsson & Tropp).
- LoRA: ΔW = BA de posto baixo; o espectro de matrizes de pesos treinadas → L18.
- Comparação de representações (CCA, SVCCA, CKA) entre camadas, modelos e cérebros → N12.
- Compressed sensing e recuperação esparsa, prévia da superposição → I04.

## Matemática necessária

**M18**: autovalores, teorema espectral e matrizes semidefinidas positivas.

## Métodos

- Derive as equações normais pela geometria da projeção, não por fórmula.
- Implemente PCA do zero e aplique a dígitos manuscritos; visualize os componentes.
- Comprima uma imagem por SVD e plote erro × posto.

## Desafios

- Formar AᵀA explicitamente: eleva ao quadrado o número de condição.
- Fazer PCA sem centralizar os dados.
- Interpretar componentes principais como "causas".

## Fontes

- 🎓 [Matrix Methods in Data Analysis, Signal Processing, and Machine Learning (18.065)](https://ocw.mit.edu/courses/18-065-matrix-methods-in-data-analysis-signal-processing-and-machine-learning-spring-2018/) — Gilbert Strang (MIT OpenCourseWare), 2018 · curso
- 📖 [Mathematics for Machine Learning](https://mml-book.com/) — Deisenroth, Faisal & Ong, 2020 · livro. cap. 4 (decomposições) e cap. 10 (PCA)
- 📖 [Linear Algebra Done Right (4ª ed.)](https://linear.axler.net/) — Sheldon Axler, 2024 · livro. cap. 7, SVD com provas
- 📄 [Finding Structure with Randomness: Probabilistic Algorithms for Constructing Approximate Matrix Decompositions](https://arxiv.org/abs/0909.4061) — Nathan Halko, Per-Gunnar Martinsson & Joel A. Tropp, 2011 · paper

## Boss fight

Implemente SVD de dois jeitos — via autovetores de AᵀA (para entender) e via QR iterativo sobre a forma bidiagonal (para estabilidade) — e compare a precisão em matrizes mal condicionadas. Use a sua SVD para: comprimir uma imagem confirmando Eckart–Young numericamente; fazer PCA dos 70 mil dígitos do MNIST e reportar quantos componentes guardam 95% da variância; e ajustar polinômios a dados ruidosos mostrando como o número de condição explode com o grau.

## Checkpoint

- [ ] Mostre que a solução de mínimos quadrados projeta b no espaço coluna de A.
- [ ] Qual a relação entre os valores singulares de A e os autovalores de AᵀA?
- [ ] Pelo teorema de Eckart–Young, qual o erro de Frobenius da melhor aproximação de posto k?
- [ ] Por que se centralizam os dados antes do PCA?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
