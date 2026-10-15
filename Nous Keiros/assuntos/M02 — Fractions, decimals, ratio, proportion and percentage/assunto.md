# M02 — Fractions, decimals, ratio, proportion and percentage

*Frações, decimais, razão, proporção e porcentagem*

- **Trilha:** Mathematics
- **Nível:** 0 — Fundamentos · onda 2
- **Termos:** fractions, decimals, ratio, percentage

## Por que importa

Probabilidades são frações; taxas de aprendizado, normalizações e médias também. Quem não opera frações com fluência trava em Bayes, em softmax e em qualquer derivada — é o maior gargalo de quem teve um fundamental fraco.

## Pré-requisitos

- **Depende de:** M01 (Arithmetic: natural numbers and integers)
- **Destrava:** M03 (Exponents, roots and scientific notation)

## Base

1. Fração como parte de um todo, como divisão e como ponto na reta numérica.
2. Frações equivalentes e simplificação (pelo MDC de **M01**).
3. Soma e subtração (denominador comum pelo MMC), multiplicação e divisão (multiplicar pelo inverso) — e por que cada regra funciona.
4. Comparação de frações e números mistos.
5. Decimais: conversão fração ↔ decimal, dízimas periódicas, e por que 0,999… = 1.
6. Razão e proporção, regra de três, grandezas direta e inversamente proporcionais.
7. Porcentagem como fração de 100; aumentos e descontos sucessivos são multiplicativos, não aditivos.

## Meio

- Os racionais ℚ como estrutura: entre dois racionais sempre existe outro (densidade).
- Médias aritmética, ponderada e harmônica — e quando cada uma é a correta (o F1-score é a média harmônica de precisão e recall).
- Porcentagem vs. pontos percentuais; erro absoluto vs. erro relativo.
- Frações algébricas simples, como preparação para a álgebra.

## Avançado

- √2 não é racional: leia a prova clássica agora e refaça-a sozinho em → M06.
- 0,1 não tem representação finita em base 2 — por isso 0.1 + 0.2 ≠ 0.3 em IEEE 754 → M32.
- Frações contínuas e melhores aproximações racionais (355/113 ≈ π).
- Aritmética racional exata em software (`fractions.Fraction`) vs. ponto flutuante: custo contra erro.

## Matemática necessária

**M01**: MDC, MMC e divisão euclidiana.

## Métodos

- Desenhe barras e áreas para cada operação até a regra ficar óbvia; só então automatize.
- Implemente um tipo Fração em C ou REIXU (normalização pelo MDC, sinal no numerador) e teste contra `fractions` do Python.
- Traduza toda porcentagem que encontrar (notícias, papers, benchmarks) para fração e decimal.

## Desafios

- Somar numeradores e denominadores (1/2 + 1/3 ≠ 2/5): se o erro persistir, volte ao significado de fração, não à regra.
- +10% seguido de −10% não volta ao valor original.
- Média de taxas e de razões: a média aritmética quase sempre é a média errada.
- Proporções agregadas podem inverter as proporções por grupo (paradoxo de Simpson) — você reencontra isso em inferência causal → M38.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Frações, o primeiro contato](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=28) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Razões e proporções](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=57) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Porcentagem](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=21) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Dízimas periódicas e números reais](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=12) — IMPA/OBMEP · curso
- 📖 [Prealgebra 2e](https://openstax.org/details/books/prealgebra-2e) — Marecek, Anthony-Smith & Mathis (OpenStax), 2020 · livro. caps. 4–6

## Boss fight

Construa um "auditor de porcentagens": um programa que recebe afirmações como "subiu 20% e depois caiu 20%" ou "a taxa média é a média das taxas" e calcula o resultado correto com frações exatas (sem ponto flutuante), explicando onde o raciocínio ingênuo erra. Inclua uma tabela sua em que a proporção agregada inverte a de cada grupo.

## Checkpoint

- [ ] Calcule 3/4 − 5/6 + 7/12 à mão e explique o MMC usado.
- [ ] Por que dividir por uma fração é o mesmo que multiplicar pelo seu inverso?
- [ ] Mostre que 0,333… = 1/3 usando só manipulação de frações.
- [ ] Precisão 0,9 e recall 0,5: por que a média harmônica (≈ 0,64) descreve melhor o modelo do que a aritmética (0,7)?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
