# M04 — Elementary algebra: expressions, equations and inequalities

*Álgebra elementar: expressões, equações e inequações*

- **Trilha:** Mathematics
- **Nível:** 0 — Fundamentos · onda 4
- **Termos:** elementary algebra, linear equations, inequalities

## Por que importa

Álgebra é a passagem de "fazer contas" para "raciocinar com o desconhecido". Toda fórmula de IA — da regra de atualização do gradiente à equação de Bellman — é álgebra; sem fluência para manipular expressões, nenhuma derivação de paper se sustenta.

## Pré-requisitos

- **Depende de:** M03 (Exponents, roots and scientific notation)
- **Destrava:** M06 (Proofs: direct, contrapositive, contradiction and induction), M07 (Polynomials, factoring and quadratic equations), C02 (NumPy: vectorization, broadcasting and memory layout), N01 (The brain for engineers)

## Base

1. Variável, expressão, termo, coeficiente; avaliar expressões.
2. Simplificar: distributiva, termos semelhantes.
3. Equações do 1º grau: operações equivalentes ("o mesmo dos dois lados") e por que preservam as soluções.
4. Inequações do 1º grau; por que a desigualdade inverte ao multiplicar por um negativo.
5. Sistemas lineares 2×2 por substituição e eliminação; interpretação como interseção de retas no plano cartesiano.
6. Valor absoluto em equações e inequações: |x − a| < ε como "x está a menos de ε de a".
7. Isolar uma variável em fórmulas.

## Meio

- Sistemas 3×3 por eliminação: o embrião da eliminação gaussiana → M17.
- Equações com frações algébricas e domínio (onde a expressão deixa de existir).
- Modelagem: traduzir problemas em palavras para equações — a habilidade que mais transfere para pesquisa.
- Produtos notáveis simples, como ponte para os polinômios → M07.

## Avançado

- Álgebra como reescrita de símbolos: simplificar expressões é o que um compilador faz em constant folding e strength reduction. Implementar um simplificador é entender a álgebra por dentro.
- |x − a| < ε é o embrião da definição de limite ε-δ → M33.
- Sistemas lineares grandes e mal condicionados: quando "resolver" numericamente falha → M32.

## Matemática necessária

**M03**: potências; **M02**: frações.

## Métodos

- Em cada passo de uma derivação, anote a propriedade usada ("distributiva", "somei −3 dos dois lados"). É esse hábito que torna papers legíveis depois.
- Confira toda solução substituindo de volta na equação.
- Use o Desmos para ver um sistema 2×2 e o que significam "sem solução" e "infinitas soluções".
- Aproveite o parser do seu compilador para fazer um mini sistema de álgebra simbólica (CAS).

## Desafios

- Dividir os dois lados por uma expressão que pode valer zero: perde soluções ou cria soluções falsas.
- Esquecer de inverter a desigualdade ao multiplicar por negativo.
- "Cancelar" termos de uma soma: (x + 2)/2 ≠ x + 1.
- Ler "=" como "a resposta é" em vez de uma relação simétrica entre duas expressões.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Notação algébrica e introdução às equações](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=32) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Equações e inequações do primeiro grau](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=44) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — O plano cartesiano e sistemas de equações](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=49) — IMPA/OBMEP · curso
- 📖 [Algebra](https://doi.org/10.1007/978-1-4612-0335-3) — I. M. Gelfand & A. Shen, 2004 · livro
- 📖 [Elementary Algebra 2e](https://openstax.org/details/books/elementary-algebra-2e) — Marecek, Anthony-Smith & Mathis (OpenStax), 2020 · livro
- 🔧 [Desmos — calculadora gráfica](https://www.desmos.com/calculator) — Desmos Studio · ferramenta. para ver cada equação

## Boss fight

Escreva um resolvedor simbólico de equações lineares: entrada em texto ("3(x − 2) + 5 = 2x − 7"), saída com cada passo justificado pela propriedade usada, detectando os casos sem solução e com infinitas soluções. Estenda para sistemas 2×2 e 3×3 por eliminação e valide contra o SymPy.

## Checkpoint

- [ ] Resolva 2(3x − 1) − 4 = 5x + 7 justificando cada passo.
- [ ] Resolva |2x − 3| ≤ 5 e desenhe a solução na reta.
- [ ] Explique geometricamente quando um sistema 2×2 não tem solução e quando tem infinitas.
- [ ] Isole r em A = P(1 + r)ⁿ.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
