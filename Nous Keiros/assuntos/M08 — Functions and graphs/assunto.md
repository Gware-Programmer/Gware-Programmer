# M08 — Functions and graphs

*Funções e gráficos*

- **Trilha:** Mathematics
- **Nível:** 1 — Provas e código · onda 2
- **Termos:** functions, graphs, composition, inverse
- **Projetos KEIROS:** REIXU

## Por que importa

Um modelo de IA é uma função: entrada → saída, com parâmetros. Redes neurais são composições de funções e treinar é escolher a função certa dentro de uma família. Ler e esboçar gráficos é ver o comportamento antes de calcular.

## Pré-requisitos

- **Depende de:** M05 (Logic, sets and the language of mathematics), M07 (Polynomials, factoring and quadratic equations)
- **Destrava:** M09 (Exponentials and logarithms), M10 (Trigonometry)

## Base

1. Função como regra entrada → saída; domínio, contradomínio e imagem **M05**.
2. Plano cartesiano e gráfico; teste da reta vertical.
3. Função afim y = ax + b: o coeficiente angular como taxa de variação.
4. Função quadrática: vértice, concavidade e raízes **M07**.
5. Composição f∘g, função inversa, e quando a inversa existe.
6. Transformações de gráficos: f(x − a), f(x) + a, a·f(x), f(bx), reflexões.
7. Funções definidas por partes e valor absoluto; ReLU(x) = max(0, x) como exemplo.

## Meio

- Crescimento, decrescimento, máximos e mínimos — no olho, antes do cálculo.
- Funções pares, ímpares e periódicas; simetrias.
- Funções de duas variáveis f(x, y) como superfícies e curvas de nível: é assim que você vai ver a "paisagem de perda" (loss landscape).
- Famílias paramétricas f_θ(x): a ideia central de "modelo".

## Avançado

- Composição profunda f_L ∘ … ∘ f_1: uma rede profunda é exatamente isso → L08.
- Funções que recebem funções (funcionais): em ML se otimiza sobre espaços de funções → M35.
- Teorema da aproximação universal: o que promete (existência) e o que não promete (como achar, quantos neurônios, se generaliza) → L08.

## Matemática necessária

**M05**: funções como relações; **M07**: polinômios e quadráticas.

## Métodos

- No Desmos ou no matplotlib, mova os parâmetros de cada família — mas preveja o gráfico antes de ver.
- Implemente composição e inversa numérica (busca binária para inverter funções monótonas).
- Esboce gráficos à mão a partir de transformações: é o que você fará ao ler papers sem computador.

## Desafios

- f⁻¹(x) não é 1/f(x).
- Confundir f(x + a) (desloca para a esquerda) com f(x) + a (desloca para cima).
- Achar que toda curva desenhada é gráfico de função.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Funções: noções básicas](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=34) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Função afim](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=35) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Função quadrática](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=61) — IMPA/OBMEP · curso
- 📖 [Precalculus 2e](https://openstax.org/details/books/precalculus-2e) — Jay Abramson et al. (OpenStax), 2021 · livro. caps. 1–3
- 🔧 [Desmos — calculadora gráfica](https://www.desmos.com/calculator) — Desmos Studio · ferramenta

## Boss fight

Construa um "laboratório de funções" (Python + matplotlib, ou REIXU gerando SVG): parser de expressões, gráfico, composição, inversa numérica e transformações controladas por parâmetros. Desafio final: o programa sorteia uma função-base e aplica três transformações aleatórias; você recebe só o gráfico e precisa descobrir a expressão exata.

## Checkpoint

- [ ] Com f(x) = 2x + 3 e g(x) = x², calcule f∘g e g∘f. São iguais?
- [ ] Qual o domínio de f(x) = 1/(x² − 4)?
- [ ] Como fica o gráfico de y = −2f(x − 1) + 3 a partir do gráfico de f?
- [ ] Por que ReLU não tem inversa em ℝ? Em que domínio teria?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
