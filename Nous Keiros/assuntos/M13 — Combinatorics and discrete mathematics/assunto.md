# M13 — Combinatorics and discrete mathematics

*Combinatória e matemática discreta*

- **Trilha:** Mathematics
- **Nível:** 2 — O motor · onda 1
- **Termos:** combinatorics, discrete mathematics, recurrences

## Por que importa

Contar é a base da probabilidade discreta, da análise de algoritmos e da explosão combinatória que torna a IIT intratável — o número de partições de um sistema cresce como os números de Bell. É também a matemática do espaço de busca do planejamento clássico.

## Pré-requisitos

- **Depende de:** M06 (Proofs: direct, contrapositive, contradiction and induction)
- **Destrava:** M22 (Probability: events, conditioning and Bayes), M30 (Graph theory and networks), M36 (Theory of computation: automata, grammars and computability), C15 (Algorithms and data structures)

## Base

1. Princípios multiplicativo e aditivo.
2. Permutações, arranjos e combinações; fatorial.
3. Binômio de Newton, triângulo de Pascal e identidades combinatórias.
4. Combinações com repetição (estrelas e barras — stars and bars).
5. Inclusão-exclusão.
6. Princípio da casa dos pombos.
7. Recorrências lineares simples (Fibonacci) e sua solução.

## Meio

- Provas combinatórias: contar a mesma coisa de dois jeitos.
- Funções geradoras, primeiro contato.
- Partições de conjuntos: números de Stirling e de Bell, e seu crescimento super-exponencial.
- Notação assintótica O, Ω, Θ e análise de algoritmos.

## Avançado

- Explosão combinatória: por que busca exaustiva em planejamento e o cálculo exato de Φ só funcionam para sistemas minúsculos → A02→ S04.
- Aproximação de Stirling para n! e métodos assintóticos.
- Combinatória na teoria do aprendizado: o lema de Sauer–Shelah e a dimensão VC → L07.

## Matemática necessária

**M06**: provas e indução (potências de **M03** pelo fecho).

## Métodos

- Para cada fórmula, escreva um contador por força bruta e compare com a fórmula fechada.
- Resolva os problemas de contagem da OBMEP: são curtos, difíceis e formam intuição.
- Explique cada identidade com uma "história de contagem" (prova combinatória).

## Desafios

- Ordem importa ou não? Com ou sem repetição? Essas duas perguntas resolvem 90% dos erros.
- Contar duas vezes (overcounting) e esquecer de dividir pelas simetrias.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Princípios básicos de contagem](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=15) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Métodos sofisticados de contagem](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=16) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Binômio de Newton e o triângulo de Pascal](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=37) — IMPA/OBMEP · curso
- 📖 [Discrete Mathematics: An Open Introduction](https://discrete.openmathbooks.org/) — Oscar Levin · livro. gratuito, com exercícios resolvidos
- 📖 [Mathematics for Computer Science](https://courses.csail.mit.edu/6.042/spring18/mcs.pdf) — Lehman, Leighton & Meyer (MIT), 2018 · livro. partes de contagem e assintóticas
- 📖 [Introduction to Counting & Probability](https://artofproblemsolving.com/store/book/intro-counting) — David Patrick (Art of Problem Solving) · livro. problemas de olimpíada graduados

## Boss fight

Escreva um programa que conta as partições de um conjunto de n elementos por força bruta e pela recorrência dos números de Bell, e tabele até n = 20. Depois, supondo que avaliar uma partição custe um microssegundo, calcule até que tamanho de sistema dá para varrer todas as bipartições e todas as partições. Feche com um parágrafo, apoiado nesses números, explicando por que o cálculo exato de Φ — que busca partições em vários níveis — só é viável para sistemas de uma dúzia de elementos.

## Checkpoint

- [ ] Quantas palavras de 5 letras distintas, formadas com A, B, C, D, E, F, G, começam com vogal?
- [ ] Prove C(n, k) = C(n − 1, k − 1) + C(n − 1, k) com um argumento de contagem.
- [ ] Quantas soluções inteiras não negativas tem x₁ + x₂ + x₃ = 10?
- [ ] Quantas bipartições não triviais tem um conjunto de n elementos?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
