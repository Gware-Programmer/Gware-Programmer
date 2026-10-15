# M33 — Real analysis

*Análise real*

- **Trilha:** Mathematics
- **Nível:** 8 — Escala · onda 1
- **Termos:** real analysis, epsilon-delta, metric spaces, compactness

## Por que importa

É aqui que a matemática vira matemática de pesquisa: limites, continuidade e convergência com rigor ε-δ. Sem análise real, teoria da medida, análise funcional, teoria do aprendizado e geometria da informação são ilegíveis; com ela, você lê e escreve provas de nível de paper.

## Pré-requisitos

- **Depende de:** M15 (Integral calculus and Taylor series)
- **Destrava:** M34 (Measure theory and rigorous probability), M41 (Differential geometry and information geometry)

## Base

1. Os reais: completude (supremo) e propriedade arquimediana; a construção (Dedekind ou Cauchy) como leitura.
2. Sequências: convergência ε–N, sequências de Cauchy, Bolzano–Weierstrass, limsup e liminf.
3. Séries: convergência absoluta, testes e rearranjos.
4. Topologia de ℝ: abertos, fechados e compactos (Heine–Borel).
5. Continuidade ε-δ; valor intermediário; Weierstrass (máximo em compactos); continuidade uniforme.
6. Derivada com rigor; teorema do valor médio; Taylor com resto.
7. Integral de Riemann com rigor e o teorema fundamental.

## Meio

- Sequências e séries de funções: convergência pontual vs. uniforme; quando trocar limite com integral ou derivada.
- Espaços métricos, completude e o teorema do ponto fixo de Banach — que prova a convergência da iteração de valor em RL → R03.
- Séries de potências com rigor; funções analíticas reais.

## Avançado

- Topologia geral: continuidade por abertos, compacidade abstrata.
- Teorema de Stone–Weierstrass, a base da aproximação universal de redes → L08.
- Arzelà–Ascoli e equicontinuidade.

## Matemática necessária

**M15**: integral e Taylor; **M12**: sequências e séries; **M06**: provas.

## Métodos

- Use Abbott como texto principal e prove todos os exercícios-chave.
- Acompanhe o MIT 18.100A em vídeo.
- Formalize alguns resultados de limites em Lean com Mathlib, se já tiver feito → P09: o verificador exige rigor total.
- Elon Lages Lima (IMPA) é a alternativa clássica em português.

## Desafios

- Ordem dos quantificadores (continuidade vs. continuidade uniforme).
- Tomar "intuitivamente óbvio" por prova: a análise está cheia de contraexemplos, como funções contínuas que não são deriváveis em ponto nenhum.
- Pular a completude dos reais e depois não entender por que os teoremas funcionam.

## Fontes

- 📖 [Understanding Analysis (2nd ed.)](https://link.springer.com/book/10.1007/978-1-4939-2712-8) — Stephen Abbott, 2015 · livro. o melhor primeiro livro de análise
- 🎓 [Real Analysis (18.100A)](https://ocw.mit.edu/courses/18-100a-real-analysis-fall-2020/) — Casey Rodriguez (MIT OpenCourseWare), 2020 · curso. aulas em vídeo e notas
- 📖 [Análise Real, vol. 1](https://loja.impa.br/produto/analise-real-vol-1-funcoes-de-uma-variavel/) — Elon Lages Lima (IMPA, Coleção Matemática Universitária) · livro. o clássico brasileiro
- 📖 [Analysis I (4th ed.)](https://link.springer.com/book/10.1007/978-981-19-7261-4) — Terence Tao, 2022 · livro. constrói tudo a partir dos axiomas
- 📖 [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/) — Jeremy Avigad & Patrick Massot · livro. capítulos de topologia e limites

## Boss fight

Prove por escrito, sem consulta, os teoremas centrais: Bolzano–Weierstrass, Heine–Borel em ℝ, valor intermediário, Weierstrass (máximo em compactos), continuidade uniforme em compactos e o ponto fixo de Banach. Submeta as provas a um revisor cético e corrija até não restar objeção válida.

## Checkpoint

- [ ] Defina continuidade e continuidade uniforme com ε-δ e dê uma função contínua que não é uniformemente contínua.
- [ ] Prove que toda sequência convergente é de Cauchy.
- [ ] Por que [0, 1] é compacto e (0, 1) não é?
- [ ] Enuncie o teorema do ponto fixo de Banach e explique por que ele garante a convergência da iteração.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
