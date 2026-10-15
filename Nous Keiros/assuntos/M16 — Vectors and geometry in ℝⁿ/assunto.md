# M16 — Vectors and geometry in ℝⁿ

*Vetores e geometria em ℝⁿ*

- **Trilha:** Mathematics
- **Nível:** 2 — O motor · onda 2
- **Termos:** vectors, dot product, norms, analytic geometry

## Por que importa

Em IA tudo vira vetor: palavras viram embeddings, imagens viram vetores de pixels, estados do cérebro viram vetores de atividade populacional. Produto escalar, normas e ângulos medem semelhança — é assim que a atenção decide "para onde olhar".

## Pré-requisitos

- **Depende de:** M10 (Trigonometry)
- **Destrava:** M17 (Linear algebra I: matrices, linear systems and vector spaces), L01 (Foundations of supervised learning)

## Base

1. Vetor como seta e como lista de números; ℝ², ℝ³ e depois ℝⁿ.
2. Soma, multiplicação por escalar e combinação linear.
3. Norma (comprimento) euclidiana, distância e vetor unitário.
4. Produto escalar (dot product): definição algébrica e geométrica |u||v|cos θ; ortogonalidade.
5. Projeção de um vetor sobre outro.
6. Retas e planos: forma paramétrica e equação pelo vetor normal.
7. Produto vetorial em ℝ³ (para geometria e física).

## Meio

- Normas ℓ1, ℓ2 e ℓ∞; desigualdade triangular e de Cauchy-Schwarz.
- Similaridade de cosseno e busca por vizinhos mais próximos.
- Hiperplanos em ℝⁿ e separação linear — a prévia do perceptron.

## Avançado

- Geometria em alta dimensão: vetores aleatórios são quase ortogonais, a norma se concentra, o volume de uma bola mora perto da casca — a "maldição da dimensionalidade" → M23.
- Busca aproximada de vizinhos (HNSW) em memória de agentes e RAG → A04.
- Hipótese da representação linear: conceitos como direções no espaço de ativações de um modelo → I04.

## Matemática necessária

**M10**: cosseno e ângulos; **M04**: álgebra.

## Métodos

- Faça tudo primeiro em 2D desenhando; depois generalize em código para n dimensões.
- Gere vetores aleatórios em 2, 10 e 1000 dimensões e meça a distribuição dos ângulos entre eles.
- Brinque com vetores de palavras pré-calculados (GloVe) e busque vizinhos por cosseno.

## Desafios

- Confundir ponto (posição) com vetor (deslocamento).
- Confiar na intuição 3D em alta dimensão: ela falha de modo sistemático.
- Pensar no produto escalar como "multiplicar vetores": ele mede alinhamento e devolve um número.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Vetores em R² e R³](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=65) — IMPA/OBMEP · curso
- 🎬 [Essence of Linear Algebra](https://www.3blue1brown.com/topics/linear-algebra) — Grant Sanderson (3Blue1Brown) · video. caps. 1–3 e o de produto escalar
- 📖 [Mathematics for Machine Learning](https://mml-book.com/) — Marc P. Deisenroth, A. Aldo Faisal & Cheng Soon Ong, 2020 · livro. cap. 3 (geometria analítica); PDF gratuito
- 📖 [Immersive Linear Algebra](https://immersivemath.com/ila/index.html) — J. Ström, K. Åström & T. Akenine-Möller · livro. figuras interativas
- 📖 [Calculus Volume 3](https://openstax.org/details/books/calculus-volume-3) — Gilbert Strang & Edwin Herman (OpenStax), 2016 · livro. cap. 2, vetores no espaço

## Boss fight

Escreva uma mini-biblioteca de vetores e um índice de busca semântica exata por similaridade de cosseno sobre vetores de palavras pré-calculados. Em seguida, com vetores aleatórios em 2, 10, 300 e 3000 dimensões, meça e plote como as distâncias e os ângulos se concentram. Feche com um parágrafo, apoiado nos seus números, sobre o que isso implica para busca por vizinhos em alta dimensão.

## Checkpoint

- [ ] Calcule o ângulo entre (1, 2, 2) e (2, 0, 1).
- [ ] Projete v = (3, 4) sobre u = (1, 0) e sobre u = (1, 1).
- [ ] Explique geometricamente por que |⟨u, v⟩| ≤ |u|·|v|.
- [ ] Por que dois vetores aleatórios em 1000 dimensões são quase ortogonais?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
