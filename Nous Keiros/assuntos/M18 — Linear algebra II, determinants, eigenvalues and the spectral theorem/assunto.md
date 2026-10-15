# M18 — Linear algebra II: determinants, eigenvalues and the spectral theorem

*Álgebra linear II: determinantes, autovalores e teorema espectral*

- **Trilha:** Mathematics
- **Nível:** 4 — A máquina de aprender · onda 1
- **Termos:** determinants, eigenvalues, eigenvectors, spectral theorem

## Por que importa

Autovalores e autovetores revelam a anatomia de uma transformação: as direções que ela só estica. Eles governam a estabilidade de sistemas dinâmicos e de redes recorrentes, a convergência dos otimizadores, a análise espectral de grafos e a estrutura da matriz de covariância dos dados.

## Pré-requisitos

- **Depende de:** M11 (Complex numbers and Euler's formula), M17 (Linear algebra I: matrices, linear systems and vector spaces)
- **Destrava:** M19 (Linear algebra III: SVD, PCA, projections and least squares), M21 (Matrix calculus), M23 (Continuous random variables, distributions and limit theorems), M28 (Differential equations and dynamical systems), M30 (Graph theory and networks), M40 (Abstract algebra: groups, symmetry and representations)

## Base

1. Determinante como fator de escala de volume (com sinal); propriedades e cálculo por eliminação.
2. Autovalor e autovetor: Av = λv; polinômio característico det(A − λI) = 0 **M07**.
3. Diagonalização A = PDP⁻¹ e quando ela é possível.
4. Potências de matrizes e dinâmica xₜ₊₁ = A·xₜ: crescimento e decaimento pelos autovalores.
5. Matrizes simétricas: autovalores reais e autovetores ortogonais (teorema espectral).
6. Formas quadráticas xᵀAx; matrizes positivas definidas e semidefinidas.
7. Autovalores complexos de matrizes reais ↔ rotação **M11**.

## Meio

- Traço = soma dos autovalores; determinante = produto.
- Método da potência (power iteration) e PageRank.
- Matrizes não diagonalizáveis e a forma de Jordan (noção).
- Quociente de Rayleigh: autovalores como problema de otimização.
- Matriz de covariância como exemplo canônico de matriz semidefinida positiva.

## Avançado

- Teorema espectral para operadores autoadjuntos e decomposição de Schur (Axler).
- Espectro da Hessiana e condicionamento do treino; "edge of stability" → L09.
- Matrizes aleatórias: semicírculo de Wigner e Marchenko–Pastur no espectro de pesos e covariâncias → L26.
- Raio espectral e estabilidade de redes recorrentes e de dinâmicas neurais → L11→ N05.

## Matemática necessária

**M17**: matrizes e espaços vetoriais; **M11**: complexos; **M07**: polinômios.

## Métodos

- Calcule autovalores 2×2 e 3×3 à mão; visualize o que A faz com o círculo unitário (vira elipse).
- Implemente o método da potência e o algoritmo QR (com e sem deslocamentos) e compare com LAPACK.
- Prove o teorema espectral no caso 2×2 simétrico.

## Desafios

- Achar que toda matriz é diagonalizável.
- Confundir autovalores com valores singulares → M19.
- Calcular autovalores numericamente pelas raízes do polinômio característico: instável.

## Fontes

- 📖 [Linear Algebra Done Right (4ª ed.)](https://linear.axler.net/) — Sheldon Axler, 2024 · livro. caps. 5–7
- 🎓 [Linear Algebra (18.06SC)](https://ocw.mit.edu/courses/18-06sc-linear-algebra-fall-2011/) — Gilbert Strang (MIT OpenCourseWare) · curso. unidade II
- 📖 [Introduction to Linear Algebra (6ª ed.)](https://math.mit.edu/~gs/linearalgebra/ila6/) — Gilbert Strang, 2023 · livro
- 🎬 [Essence of Linear Algebra](https://www.3blue1brown.com/topics/linear-algebra) — Grant Sanderson (3Blue1Brown) · video. determinantes e autovetores
- 🎓 [Portal da Matemática OBMEP — Determinantes como áreas, parte 1](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=240) — IMPA/OBMEP · curso. o determinante como área, em português

## Boss fight

Implemente o algoritmo QR com deslocamentos para matrizes simétricas e o método da potência. Use-os para: (1) calcular o PageRank de um grafo real de links; (2) classificar a estabilidade de 20 sistemas xₜ₊₁ = A·xₜ pela posição dos autovalores e confirmar simulando; (3) mostrar, com uma matriz 2×2 de autovalores complexos, a trajetória em espiral prevista pela teoria.

## Checkpoint

- [ ] Ache os autovalores e autovetores de [[2, 1], [1, 2]] e diagonalize.
- [ ] Por que uma matriz real simétrica tem autovalores reais?
- [ ] Se A tem autovalores 0,5 e 1,2, o que acontece com Aᵗx₀ para um x₀ genérico?
- [ ] O que significa, geometricamente, uma matriz ser positiva definida?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
