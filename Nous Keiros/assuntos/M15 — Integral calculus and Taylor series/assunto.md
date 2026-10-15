# M15 — Integral calculus and Taylor series

*Cálculo integral e séries de Taylor*

- **Trilha:** Mathematics
- **Nível:** 3 — Cálculo e incerteza · onda 2
- **Termos:** integral calculus, fundamental theorem, Taylor series

## Por que importa

Integrais são somas contínuas: probabilidades de variáveis contínuas, esperanças, entropia diferencial e a normalização de densidades são integrais. As séries de Taylor explicam por que aproximações locais funcionam — a base do gradiente (1ª ordem) e do método de Newton (2ª ordem).

## Pré-requisitos

- **Depende de:** M11 (Complex numbers and Euler's formula), M14 (Single-variable differential calculus)
- **Destrava:** M20 (Multivariable calculus and gradients), M31 (Fourier analysis and signal processing), M32 (Numerical analysis and floating-point arithmetic), M33 (Real analysis)

## Base

1. Área sob a curva e somas de Riemann.
2. Integral definida e teorema fundamental do cálculo: derivar e integrar são operações inversas.
3. Antiderivadas e integrais imediatas.
4. Técnicas: substituição e integração por partes.
5. Integrais impróprias (limites infinitos); ∫ e^(−x²) dx converge.
6. Polinômio de Taylor e séries de Taylor de eˣ, sen x, cos x, ln(1 + x); o resto e o erro.
7. Prova de e^{iθ} = cos θ + i·sen θ pelas séries **M11**.

## Meio

- Integração numérica: trapézio, Simpson e Monte Carlo.
- Valor médio de uma função como prévia da esperança.
- Séries de potências e raio de convergência.
- f(x + h) ≈ f(x) + f′(x)h + ½f″(x)h²: por que Newton converge tão rápido perto do mínimo.

## Avançado

- ∫ e^(−x²) dx = √π, com a prova por coordenadas polares em → M20.
- Taylor como fundamento comum de gradiente, Newton, análise de estabilidade e aproximação de Laplace na inferência bayesiana → M25.
- Riemann vs. Lebesgue: por que a teoria da medida precisou existir → M34.

## Matemática necessária

**M14**: derivadas e regra da cadeia.

## Métodos

- Calcule integrais à mão e confira numericamente com o seu próprio integrador.
- Implemente eˣ, sen e cos por Taylor, agora com a teoria do resto para limitar o erro.
- Plote polinômios de Taylor de grau crescente aproximando cada função — e onde deixam de aproximar.

## Desafios

- Esquecer a constante de integração; confundir integral definida com indefinida.
- Usar Taylor longe do ponto de expansão.
- Escolher mal u e dv na integração por partes e andar em círculos.

## Fontes

- 🎓 [Single Variable Calculus (18.01SC)](https://ocw.mit.edu/courses/18-01sc-single-variable-calculus-fall-2010/) — MIT OpenCourseWare · curso. unidades de integração e séries
- 📖 [Calculus Volume 2](https://openstax.org/details/books/calculus-volume-2) — Gilbert Strang & Edwin Herman (OpenStax), 2016 · livro. caps. 1–3 e 6 (séries de potências e Taylor)
- 📖 [Calculus (3rd ed.)](https://ocw.mit.edu/courses/res-18-001-calculus-fall-2023/) — Gilbert Strang (MIT OCW RES.18-001), 2017 · livro. livro completo gratuito
- 📖 [Active Calculus](https://activecalculus.org/) — Matt Boelkins et al. · livro. livro aberto com atividades guiadas
- 🎬 [Essence of Calculus](https://www.3blue1brown.com/topics/calculus) — Grant Sanderson (3Blue1Brown) · video. capítulos de integral e Taylor

## Boss fight

Escreva uma biblioteca de integração numérica (trapézio, Simpson, quadratura adaptativa e Monte Carlo) e compare erro × custo em ∫₀¹ eˣ dx, ∫ e^(−x²) dx sobre a reta inteira e numa função com singularidade integrável. Depois implemente eˣ, sen e cos por Taylor com redução de argumento e prove, pela fórmula do resto, um limite de erro que o seu código garante — e confirme o limite empiricamente.

## Checkpoint

- [ ] Calcule ∫₀^π x·sen x dx por partes.
- [ ] Enuncie o teorema fundamental do cálculo e explique por que derivar a integral devolve a função.
- [ ] Escreva o polinômio de Taylor de grau 4 de ln(1 + x) em 0 e estime o erro em x = 0,1.
- [ ] Por que a aproximação de 2ª ordem explica a convergência rápida do método de Newton?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
