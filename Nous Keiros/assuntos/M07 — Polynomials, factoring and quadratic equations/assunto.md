# M07 — Polynomials, factoring and quadratic equations

*Polinômios, fatoração e equações do 2º grau*

- **Trilha:** Mathematics
- **Nível:** 1 — Provas e código · onda 1
- **Termos:** polynomials, factoring, quadratic equations
- **Projetos KEIROS:** REIXU

## Por que importa

Polinômios são as funções mais simples além das retas: aparecem em aproximações de Taylor, em ajuste de curvas, no polinômio característico que define autovalores e no estudo de funções de ativação. Fatorar é o hábito de decompor um problema em partes simples.

## Pré-requisitos

- **Depende de:** M04 (Elementary algebra: expressions, equations and inequalities)
- **Destrava:** M08 (Functions and graphs)

## Base

1. Monômios, polinômios e grau; soma e multiplicação.
2. Produtos notáveis: (a + b)², (a − b)², (a + b)(a − b), (a + b)³.
3. Fatoração: fator comum, agrupamento, diferença de quadrados, trinômio quadrado perfeito.
4. Equação do 2º grau: completar o quadrado, dedução da fórmula quadrática (a "fórmula de Bhaskara"), discriminante Δ.
5. Soma e produto das raízes (relações de Girard/Vieta).
6. Divisão de polinômios e teorema do resto; raízes ↔ fatores (x − r).

## Meio

- Polinômios de grau maior: candidatos a raízes racionais, multiplicidade.
- Inequações do 2º grau (estudo de sinal).
- Interpolação: por n + 1 pontos passa um único polinômio de grau ≤ n (forma de Lagrange).
- Avaliação eficiente pelo método de Horner — o que um compilador deveria gerar.

## Avançado

- Teorema fundamental da álgebra (todo polinômio complexo de grau n tem n raízes) → M11; Abel–Ruffini: não existe fórmula por radicais para grau ≥ 5.
- Polinômio característico det(A − λI): autovalores são raízes de polinômios → M18.
- Fenômeno de Runge e polinômios de Chebyshev: ajustar grau alto a poucos pontos é perigoso — o embrião do sobreajuste (overfitting) → L01.
- Cancelamento catastrófico na fórmula quadrática e a versão numericamente estável → M32.

## Matemática necessária

**M04**: equações e manipulação algébrica (potências de **M03** pelo fecho).

## Métodos

- Deduza a fórmula quadrática completando o quadrado até conseguir sem olhar.
- Implemente aritmética de polinômios (soma, produto, divisão, Horner) e um interpolador de Lagrange; plote o fenômeno de Runge.
- Confira toda fatoração expandindo de volta.

## Desafios

- Decorar a fórmula quadrática sem saber completar quadrados: a técnica é que generaliza para formas quadráticas em várias variáveis → M18.
- Perder raízes ao dividir os dois lados por x.
- Achar que "sem raiz real" significa "sem solução" — os complexos esperam em → M11.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Expressões algébricas e polinômios](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=13) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Produtos notáveis e fatoração de expressões algébricas](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=14) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Equações do segundo grau](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=25) — IMPA/OBMEP · curso
- 📖 [Algebra](https://doi.org/10.1007/978-1-4612-0335-3) — I. M. Gelfand & A. Shen, 2004 · livro
- 📖 [Intermediate Algebra 2e](https://openstax.org/details/books/intermediate-algebra-2e) — Marecek, Anthony-Smith & Mathis (OpenStax), 2020 · livro

## Boss fight

Escreva uma biblioteca de polinômios em C ou REIXU: soma, produto (ingênuo e Karatsuba), divisão com resto, MDC de polinômios, avaliação por Horner e interpolação de Lagrange. Use-a para achar o polinômio de grau 10 que passa por 11 pontos igualmente espaçados de 1/(1 + 25x²) em [−1, 1], plote, e escreva por que interpolar perfeitamente os dados não é aprender a função.

## Checkpoint

- [ ] Deduza a fórmula quadrática completando o quadrado.
- [ ] Fatore x⁴ − 16 completamente sobre os reais.
- [ ] Se r é raiz de p(x), por que (x − r) divide p(x)?
- [ ] Quantas multiplicações o método de Horner faz para grau n? E a avaliação ingênua?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
