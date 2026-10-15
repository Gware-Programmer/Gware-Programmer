# M06 — Proofs: direct, contrapositive, contradiction and induction

*Demonstrações: direta, contrapositiva, absurdo e indução*

- **Trilha:** Mathematics
- **Nível:** 1 — Provas e código · onda 2
- **Termos:** proofs, contrapositive, contradiction, induction

## Por que importa

Prova é o que separa quem usa resultados de quem cria resultados. Em teoria do aprendizado, em otimização e na matemática da IIT, as afirmações valem até onde vão as provas — e você pediu provas antes de conclusões: aqui se aprende a produzi-las.

## Pré-requisitos

- **Depende de:** M04 (Elementary algebra: expressions, equations and inequalities), M05 (Logic, sets and the language of mathematics)
- **Destrava:** M12 (Sequences, series and summations), M13 (Combinatorics and discrete mathematics), M17 (Linear algebra I: matrices, linear systems and vector spaces), P09 (Machine-checked proofs: Lean 4)

## Base

1. Anatomia de uma prova: hipóteses, objetivo, passos justificados; definições como ponto de partida.
2. Prova direta (a soma de dois pares é par).
3. Prova por contrapositiva.
4. Prova por contradição (absurdo): √2 é irracional; existem infinitos primos.
5. Contraexemplo para refutar afirmações universais.
6. Indução matemática simples e forte; definição recursiva ↔ prova por indução.
7. Existência e unicidade; prova por casos.

## Meio

- Indução estrutural sobre árvores e listas — exatamente como o seu compilador percorre uma AST — e invariantes de laço (loop invariants) como indução.
- Princípio da boa ordenação; princípio da casa dos pombos.
- Escrever provas legíveis em LaTeX ou Typst.
- Ler provas de livros: reconstruir os passos omitidos ("é fácil ver que…").

## Avançado

- Provas verificadas por máquina em Lean 4: o mesmo raciocínio, com o verificador de tipos como juiz → P09.
- Técnicas de pesquisa: método probabilístico (provar existência mostrando probabilidade positiva) → M22, diagonalização → M36, provas construtivas vs. não construtivas.
- Por que muitas "garantias" provadas em ML são vazias na prática — e o que isso ensina sobre a distância entre teorema e realidade → L07.

## Matemática necessária

**M04**: manipulação algébrica; **M05**: lógica, quantificadores e conjuntos.

## Métodos

- Diante de cada teorema, tente provar antes de ler a prova; depois compare as duas.
- Reescreva provas de livro com todos os passos e a justificativa de cada um.
- Faça o Natural Number Game em paralelo: indução em Lean, com um verificador implacável e gratuito como professor.
- Explique a prova para um "leitor cético" — por escrito ou em voz alta (técnica de Feynman).

## Desafios

- Provar exemplos em vez do caso geral.
- Na indução, usar o que se quer provar (circularidade) ou esquecer o caso base.
- Confundir "não achei contraexemplo" com "provei".
- O bloqueio diante da página em branco: comece escrevendo a definição de cada termo do enunciado.

## Fontes

- 📖 [Book of Proof (3rd ed.)](https://richardhammack.github.io/BookOfProof/) — Richard Hammack, 2018 · livro. caps. 4–10
- 📖 [How to Prove It: A Structured Approach (3rd ed.)](https://doi.org/10.1017/9781108539890) — Daniel J. Velleman, 2019 · livro. o melhor livro para aprender a estruturar provas
- 🎓 [Portal da Matemática OBMEP — Indução matemática](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=48) — IMPA/OBMEP · curso
- 🎓 [Mathematics for Computer Science (6.1200J, 2024)](https://ocw.mit.edu/courses/6-1200j-mathematics-for-computer-science-spring-2024/) — MIT OpenCourseWare · curso
- 🔧 [Natural Number Game (Lean 4)](https://adam.math.hhu.de/#/g/leanprover-community/nng4) — Kevin Buzzard, Mohammad Pedramfar et al. · ferramenta. axiomas de Peano e indução no navegador

## Boss fight

Prove por escrito: (1) √2 é irracional; (2) existem infinitos primos; (3) todo inteiro ≥ 2 é produto de primos (indução forte); (4) o algoritmo de Euclides termina e devolve o MDC (invariante de laço). Entregue as provas a um revisor cético — humano ou LLM instruído a apontar o passo mais fraco — e corrija até não haver objeção válida. Termine o Natural Number Game até o mundo da multiplicação.

## Checkpoint

- [ ] Prove por contrapositiva: se n² é par, então n é par.
- [ ] Prove por indução que 1 + 2 + … + n = n(n + 1)/2.
- [ ] Onde exatamente falha a "prova" por indução de que todos os cavalos têm a mesma cor?
- [ ] Quando a indução forte é necessária e a simples não basta?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
