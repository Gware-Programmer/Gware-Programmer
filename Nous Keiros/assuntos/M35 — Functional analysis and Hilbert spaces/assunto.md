# M35 — Functional analysis and Hilbert spaces

*Análise funcional e espaços de Hilbert*

- **Trilha:** Mathematics
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** functional analysis, Hilbert spaces, operators, RKHS

## Por que importa

Redes, kernels e operadores vivem em espaços de funções de dimensão infinita. Espaços de Hilbert e RKHS são a matemática dos métodos de kernel, do neural tangent kernel e de grande parte da teoria do deep learning; operadores generalizam matrizes para funções.

## Pré-requisitos

- **Depende de:** M19 (Linear algebra III: SVD, PCA, projections and least squares), M34 (Measure theory and rigorous probability)
- **Destrava:** L26 (Deep learning theory)

## Base

1. Espaços normados e de Banach; completude.
2. Espaços com produto interno e de Hilbert; ortogonalidade e projeção ortogonal.
3. Bases ortonormais e expansões em L² (as séries de Fourier são o exemplo-mãe → M31).
4. Operadores lineares limitados, norma de operador e adjunto.
5. Operadores compactos e autoadjuntos; teorema espectral em dimensão infinita **M19**.
6. Teorema de representação de Riesz e espaço dual.
7. RKHS: kernels positivos definidos, teorema de Moore–Aronszajn, teorema do representante.

## Meio

- Hahn–Banach, aplicação aberta e gráfico fechado (noção).
- Espaços de Sobolev (noção).
- Teorema de Mercer e aproximação de kernels por features aleatórias (Rahimi & Recht).

## Avançado

- Neural tangent kernel e o regime "preguiçoso" de redes infinitamente largas → L26.
- Operadores de Koopman e de transferência para sistemas dinâmicos.
- Aprendizado de operadores (DeepONet, neural operators): aprender mapas entre espaços de funções.

## Matemática necessária

**M34**: medida e espaços Lᵖ; **M19**: projeções, SVD e espectro em dimensão finita.

## Métodos

- Brezis para a teoria; Manton & Amblard para RKHS com foco em aprendizado.
- Para cada teorema, pergunte o que muda em relação à álgebra linear finita (quase sempre: compacidade).
- Implemente regressão por kernel e features aleatórias e veja o teorema do representante funcionando.

## Desafios

- Transferir intuição de dimensão finita sem cuidado: a bola unitária deixa de ser compacta.
- Pensar em espaço de Hilbert como "um ℝⁿ grande".

## Fontes

- 📖 [Functional Analysis, Sobolev Spaces and Partial Differential Equations](https://link.springer.com/book/10.1007/978-0-387-70914-7) — Haim Brezis, 2011 · livro
- 📄 [A Primer on Reproducing Kernel Hilbert Spaces](https://arxiv.org/abs/1408.0952) — Jonathan H. Manton & Pierre-Olivier Amblard, 2015 · paper
- 📖 [Learning with Kernels](https://doi.org/10.7551/mitpress/4175.001.0001) — Bernhard Schölkopf & Alexander J. Smola, 2002 · livro
- 📄 [Random Features for Large-Scale Kernel Machines](https://proceedings.neurips.cc/paper/2007/hash/013a006f03dbc5392effeb8f18fda755-Abstract.html) — Ali Rahimi & Benjamin Recht, 2007 · paper
- 🎓 [18.102 Introduction to Functional Analysis](https://ocw.mit.edu/courses/18-102-introduction-to-functional-analysis-spring-2021/) — Casey Rodriguez (MIT OpenCourseWare) · curso. aulas em vídeo

## Boss fight

Prove o teorema da projeção em espaços de Hilbert e o teorema do representante. Implemente regressão por kernel RBF e sua aproximação por features aleatórias, e mostre empiricamente como o erro da aproximação cai com o número de features, conectando o resultado ao teorema de Mercer.

## Checkpoint

- [ ] Defina espaço de Hilbert e dê um exemplo de dimensão infinita.
- [ ] Enuncie o teorema de representação de Riesz.
- [ ] O que torna uma função k(x, y) um kernel válido?
- [ ] O que diz o teorema do representante e por que ele torna kernels computáveis?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
