# M32 — Numerical analysis and floating-point arithmetic

*Análise numérica e aritmética de ponto flutuante*

- **Trilha:** Mathematics
- **Nível:** 4 — A máquina de aprender · onda 3
- **Termos:** numerical analysis, floating point, IEEE 754, conditioning, stability

## Por que importa

Toda IA roda em aritmética finita: bf16, fp8 e quantização em int4 são decisões numéricas que mudam resultados. Saber onde o erro nasce — arredondamento, cancelamento, condicionamento — separa "o treino divergiu e não sei por quê" de "a softmax estourou em fp16 na camada 23".

## Pré-requisitos

- **Depende de:** M15 (Integral calculus and Taylor series), M19 (Linear algebra III: SVD, PCA, projections and least squares)
- **Destrava:** C08 (Numerical precision, efficient attention and frontier kernels)

## Base

1. IEEE 754: sinal, expoente e mantissa; épsilon de máquina; subnormais; NaN e Inf.
2. Erros de arredondamento absoluto e relativo, e sua propagação.
3. Cancelamento catastrófico e reformulações estáveis.
4. Condicionamento do problema vs. estabilidade do algoritmo; número de condição **M19**.
5. A soma em ponto flutuante não é associativa; soma de Kahan.
6. Formatos para IA: fp32, tf32, fp16, bf16, fp8 (E4M3, E5M2) — alcance vs. precisão.

## Meio

- Estabilidade de algoritmos de álgebra linear (pivotamento; Householder vs. Gram-Schmidt).
- Treino em precisão mista: escala da perda (loss scaling), acumulação em fp32.
- Quantização: escala, ponto zero, por tensor, por canal e por grupo; o problema dos outliers.
- Determinismo e reprodutibilidade em GPUs (ordem das reduções).

## Avançado

- Análise de erro backward vs. forward (Higham): por que "backward stable" é o padrão-ouro.
- Formatos de microescala (MX) e treino em fp8 e fp4 em larga escala.
- Aritmética de intervalos e verificação numérica rigorosa.

## Matemática necessária

**M19**: normas e número de condição; **M15**: Taylor para análise de erro.

## Métodos

- Experimente em C no seu M1, onde você controla tudo: some 10⁷ números em ordens diferentes, com e sem Kahan.
- Recrie os bugs clássicos: softmax em fp16 sem subtrair o máximo, variância pela fórmula ingênua.
- Leia Goldberg com o compilador aberto ao lado e confira cada exemplo.

## Desafios

- Comparar floats com ==.
- Achar que mais bits resolvem um problema mal condicionado.
- Culpar o "modelo" por instabilidades que são puramente numéricas.

## Fontes

- 📄 [What Every Computer Scientist Should Know About Floating-Point Arithmetic](https://doi.org/10.1145/103162.103163) — David Goldberg, 1991 · paper. o clássico
- 📖 [Numerical Linear Algebra (Twenty-fifth Anniversary Edition)](https://doi.org/10.1137/1.9781611977165) — Lloyd N. Trefethen & David Bau III, 2022 · livro
- 📖 [Accuracy and Stability of Numerical Algorithms (2nd ed.)](https://doi.org/10.1137/1.9780898718027) — Nicholas J. Higham, 2002 · livro. a referência de análise de erro
- 📄 [Mixed Precision Training](https://arxiv.org/abs/1710.03740) — Paulius Micikevicius et al., 2017 · paper
- 📄 [FP8 Formats for Deep Learning](https://arxiv.org/abs/2209.05433) — Paulius Micikevicius et al., 2022 · paper
- 🎓 [Computational Linear Algebra for Coders](https://github.com/fastai/numerical-linear-algebra) — Rachel Thomas (fast.ai) · curso. aulas em vídeo e notebooks

## Boss fight

Escreva um laboratório de ponto flutuante em C: emule fp16, bf16 e fp8 (E4M3 e E5M2) por arredondamento a partir de fp32 e meça o erro de somas longas (ingênua, em pares, Kahan), produto escalar, softmax ingênua vs. estável e variância ingênua vs. Welford. Depois quantize uma matriz de pesos real para int8 e int4 (por tensor, por canal, por grupo) e meça o erro de reconstrução e o peso dos outliers.

## Checkpoint

- [ ] Qual o épsilon de máquina de fp32 e de bf16? Por que o bf16 tem o mesmo alcance do fp32?
- [ ] Mostre um exemplo de cancelamento catastrófico e a reformulação estável.
- [ ] Diferencie problema mal condicionado de algoritmo instável.
- [ ] Por que somar os mesmos números em outra ordem pode mudar o resultado numa GPU?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
