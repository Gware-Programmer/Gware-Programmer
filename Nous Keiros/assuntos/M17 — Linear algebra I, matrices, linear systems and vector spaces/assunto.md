# M17 — Linear algebra I: matrices, linear systems and vector spaces

*Álgebra linear I: matrizes, sistemas e espaços vetoriais*

- **Trilha:** Mathematics
- **Nível:** 3 — Cálculo e incerteza · onda 1
- **Termos:** linear algebra, matrices, Gaussian elimination, vector spaces, rank
- **Projetos KEIROS:** REIXU

## Por que importa

Matrizes são o formato de toda a computação em deep learning: uma camada é multiplicação matriz-vetor seguida de uma não linearidade, e uma GPU é uma máquina de multiplicar matrizes. Espaço vetorial, base e posto dizem o que uma transformação pode ou não pode fazer.

## Pré-requisitos

- **Depende de:** M06 (Proofs: direct, contrapositive, contradiction and induction), M16 (Vectors and geometry in ℝⁿ)
- **Destrava:** M18 (Linear algebra II: determinants, eigenvalues and the spectral theorem), M20 (Multivariable calculus and gradients), M31 (Fourier analysis and signal processing)

## Base

1. Sistemas lineares e eliminação gaussiana; forma escalonada; tipos de solução.
2. Matriz como tabela e como transformação linear; matriz × vetor como combinação das colunas.
3. Multiplicação de matrizes como composição de transformações; AB ≠ BA.
4. Identidade, inversa e transposta; quando a inversa existe.
5. Espaço vetorial, subespaço, span e independência linear.
6. Base, dimensão e coordenadas numa base.
7. Núcleo (null space), imagem (column space), posto (rank) e o teorema do núcleo e da imagem.

## Meio

- Fatoração LU e o custo O(n³) da eliminação.
- Mudança de base e matrizes semelhantes.
- Os quatro subespaços fundamentais (na visão de Strang).
- Produto interno, ortogonalidade, Gram-Schmidt, matrizes ortogonais e fatoração QR.
- Multiplicação em blocos (tiling): exatamente o que os kernels de GPU fazem → C07.

## Avançado

- Álgebra linear "do jeito certo" (Axler): operadores lineares sem determinantes, espaço dual.
- Custo real de multiplicar matrizes: Strassen e por que quase ninguém o usa em GPU; intensidade aritmética → C06.
- A atenção como cadeia de produtos de matrizes e por que contexto longo custa caro → L13.

## Matemática necessária

**M16**: vetores e produto escalar; **M06**: provas, para os teoremas de base e dimensão.

## Métodos

- Estude Strang (18.06) e Axler em paralelo: Strang para calcular e enxergar, Axler para provar.
- Implemente eliminação com pivotamento, LU e QR, e confira contra NumPy/LAPACK.
- Desenhe o que matrizes 2×2 (rotação, cisalhamento, projeção) fazem com o quadrado unitário.

## Desafios

- Ver a matriz só como tabela, sem ver a transformação.
- (AB)⁻¹ = B⁻¹A⁻¹, não A⁻¹B⁻¹.
- Inverter matrizes explicitamente para resolver sistemas: mais caro e numericamente pior.

## Fontes

- 🎓 [Linear Algebra (18.06SC)](https://ocw.mit.edu/courses/18-06sc-linear-algebra-fall-2011/) — Gilbert Strang (MIT OpenCourseWare) · curso. aulas, exercícios e provas
- 📖 [Linear Algebra Done Right (4ª ed.)](https://linear.axler.net/) — Sheldon Axler, 2024 · livro. acesso aberto; o padrão-ouro para aprender a provar em álgebra linear
- 📖 [Introduction to Linear Algebra (6ª ed.)](https://math.mit.edu/~gs/linearalgebra/ila6/) — Gilbert Strang, 2023 · livro
- 🎬 [Essence of Linear Algebra](https://www.3blue1brown.com/topics/linear-algebra) — Grant Sanderson (3Blue1Brown) · video
- 🎓 [Portal da Matemática OBMEP — Matrizes e sistemas lineares](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=75) — IMPA/OBMEP · curso. a ponte em português

## Boss fight

Escreva em C ou REIXU uma biblioteca de álgebra linear densa: eliminação gaussiana com pivotamento parcial, LU, QR por Gram-Schmidt modificado, posto e base do núcleo. Teste contra LAPACK em matrizes aleatórias e mal condicionadas. Por fim, otimize a multiplicação de matrizes com blocos para a cache até atingir uma fração medida do pico teórico do seu M1, documentando cada ganho.

## Checkpoint

- [ ] Escalone um sistema 3×3 com infinitas soluções e descreva o conjunto solução.
- [ ] Que valores pode ter o posto de uma matriz 5×3? O que significa posto 2?
- [ ] Mostre que as colunas de A são linearmente independentes se e só se o núcleo é {0}.
- [ ] Por que (AB)ᵀ = BᵀAᵀ?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
