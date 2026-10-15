# M34 — Measure theory and rigorous probability

*Teoria da medida e probabilidade rigorosa*

- **Trilha:** Mathematics
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** measure theory, Lebesgue integral, sigma-algebra, Radon-Nikodym

## Por que importa

Probabilidade de verdade é teoria da medida: é a língua dos papers de teoria (concentração, processos, convergência de algoritmos estocásticos, difusão em tempo contínuo). É onde "densidade", "quase certamente" e "esperança condicional" ganham sentido preciso.

## Pré-requisitos

- **Depende de:** M23 (Continuous random variables, distributions and limit theorems), M33 (Real analysis)
- **Destrava:** M35 (Functional analysis and Hilbert spaces)

## Base

1. σ-álgebras, medidas e espaços de medida; por que nem todo conjunto é mensurável (Vitali).
2. Medida de Lebesgue e funções mensuráveis.
3. Integral de Lebesgue e comparação com a de Riemann.
4. Convergência monótona, convergência dominada e lema de Fatou.
5. Espaços de probabilidade (Ω, F, P); variáveis aleatórias como funções mensuráveis; esperança como integral **M23**.
6. Modos de convergência: quase certa, em probabilidade, em Lᵖ e em distribuição.
7. Medidas produto e Fubini–Tonelli.

## Meio

- Radon–Nikodym: densidades como derivadas de medidas, e a KL definida com rigor → M26.
- Esperança condicional como projeção; martingales; teorema da parada opcional.
- Lei forte dos grandes números; TCL por funções características.
- Espaços Lᵖ, desigualdades de Hölder e Minkowski.

## Avançado

- Processos estocásticos com rigor: filtrações, movimento browniano, integral de Itô → M29.
- Transporte ótimo e distância de Wasserstein (base de GANs de Wasserstein e do flow matching) → L20.
- Teoria ergódica.

## Matemática necessária

**M33**: análise real; **M23**: probabilidade contínua.

## Métodos

- Axler (acesso aberto) como texto principal; Durrett para a probabilidade.
- Prove os teoremas de convergência e construa um contraexemplo para cada hipótese removida.
- Traduza sempre: "o que este teorema diz sobre amostras e algoritmos?"

## Desafios

- O formalismo assusta, mas os conceitos são poucos: o trabalho é ganhar fluência.
- Trocar limite e esperança sem verificar as hipóteses (convergência dominada).
- Confundir convergência quase certa com convergência em probabilidade.

## Fontes

- 📖 [Measure, Integration & Real Analysis](https://measure.axler.net/) — Sheldon Axler, 2020 · livro. acesso aberto
- 📖 [Probability: Theory and Examples (5ª ed.)](https://services.math.duke.edu/~rtd/PTE/PTE5_011119.pdf) — Rick Durrett, 2019 · livro. PDF do autor
- 📖 [Probability with Martingales](https://www.cambridge.org/core/books/probability-with-martingales/B4CFCE0D08930FB46C6E93E775503926) — David Williams, 1991 · livro. curto e luminoso
- 📖 [An Introduction to Measure Theory](https://terrytao.files.wordpress.com/2012/12/gsm-126-tao5-measure-book.pdf) — Terence Tao, 2011 · livro. rascunho gratuito do autor

## Boss fight

Prove sem consulta a convergência monótona, a dominada e o lema de Fatou; para cada uma, construa um contraexemplo quando uma hipótese é removida e reproduza-o numericamente. Depois escreva, com rigor de medida, a prova de que o estimador de Monte Carlo é não viesado e converge quase certamente, e de que a esperança condicional é a melhor previsão em L².

## Checkpoint

- [ ] Por que precisamos de σ-álgebras em vez de "todos os subconjuntos"?
- [ ] Dê uma sequência de funções que converge pontualmente mas cujas integrais não convergem para a integral do limite.
- [ ] O que significa P(A) = 1 com A ≠ Ω?
- [ ] Defina E[X | G] e explique por que ela é uma projeção.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
