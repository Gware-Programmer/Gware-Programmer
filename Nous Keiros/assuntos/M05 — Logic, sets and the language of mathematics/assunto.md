# M05 — Logic, sets and the language of mathematics

*Lógica, conjuntos e a linguagem da matemática*

- **Trilha:** Mathematics
- **Nível:** 1 — Provas e código · onda 1
- **Termos:** logic, set theory, quantifiers, mathematical notation

## Por que importa

A matemática de pesquisa é escrita em lógica e conjuntos: papers de ML usam ∀, ∃, ⇒ e notação de conjuntos em toda definição. Esta é a gramática que permite ler e escrever provas — e a mesma lógica que sustenta a teoria da computação e os sistemas simbólicos das arquiteturas cognitivas.

## Pré-requisitos

- **Depende de:** M01 (Arithmetic: natural numbers and integers)
- **Destrava:** M06 (Proofs: direct, contrapositive, contradiction and induction), M08 (Functions and graphs), A01 (What is an agent: classical architectures), K08 (Knowledge representation and reasoning), P01 (Reading papers: the three-pass method)

## Base

1. Proposições e conectivos (¬, ∧, ∨, ⇒, ⇔); tabelas-verdade.
2. Implicação: hipótese e tese, recíproca, contrapositiva, negação; por que "se P então Q" é verdadeira quando P é falsa.
3. Quantificadores ∀ e ∃; negar frases quantificadas (¬∀x P(x) ≡ ∃x ¬P(x)).
4. Conjuntos: pertinência, subconjunto, união, interseção, diferença, complemento, vazio, conjunto das partes.
5. Produto cartesiano, pares ordenados e relações.
6. Funções como relações especiais: domínio, contradomínio, imagem; injetora, sobrejetora, bijetora.
7. Notação padrão: ℕ, ℤ, ℚ, ℝ, intervalos e {x ∈ A : P(x)}.

## Meio

- Leis de De Morgan para lógica e para conjuntos; equivalências lógicas.
- Relações de equivalência e classes (a congruência mod n de **M01** é o exemplo-mãe).
- Lógica de primeira ordem (first-order logic): sintaxe e semântica intuitiva.
- Cardinalidade: finito, enumerável, não enumerável; o argumento diagonal de Cantor como leitura.

## Avançado

- Sistemas formais (axiomas + regras de inferência): correção (soundness), completude da lógica de 1ª ordem (Gödel, 1929) e incompletude da aritmética (Gödel, 1931) — os limites do que sistemas simbólicos podem provar → M36.
- Lógica como base da IA simbólica, dos sistemas de produção de Soar e ACT-R e dos provadores de teoremas → K01→ P09.
- Proposições como tipos (correspondência de Curry-Howard): programar e provar são a mesma atividade — é isso que você vai usar em Lean → P09.

## Matemática necessária

**M01**: os inteiros são o universo dos primeiros exemplos.

## Métodos

- Traduza frases do português para a lógica e de volta, inclusive definições copiadas de papers.
- Escreva um avaliador de tabelas-verdade e um verificador de equivalência por força bruta: trivial para você, mas fixa as definições.
- Para cada definição, produza um exemplo, um contraexemplo e a negação formal.

## Desafios

- A implicação material parece "errada" até se entender que ela só proíbe P verdadeira com Q falsa.
- Confundir recíproca com contrapositiva é a fonte nº 1 de raciocínio inválido em ciência: "toda consciência integra informação; este sistema integra informação; logo é consciente" é afirmar o consequente — erro central no debate sobre testes de consciência → S02.
- Negar quantificadores na ordem errada (∀ε ∃δ vira ∃ε ∀δ).

## Fontes

- 🎓 [Portal da Matemática OBMEP — Introdução à lógica matemática](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=153) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Conjuntos](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=87) — IMPA/OBMEP · curso
- 📖 [forall x: Calgary — An Introduction to Formal Logic](https://forallx.openlogicproject.org/) — P. D. Magnus, Tim Button, J. Robert Loftis, Aaron Thomas-Bolduc, Robert Trueman & Richard Zach · livro. gratuito, rigoroso e didático
- 📖 [Book of Proof (3rd ed.)](https://richardhammack.github.io/BookOfProof/) — Richard Hammack, 2018 · livro. caps. 1–3 e 12; gratuito
- 📖 [Mathematics for Computer Science](https://courses.csail.mit.edu/6.042/spring18/mcs.pdf) — Eric Lehman, F. Thomson Leighton & Albert R. Meyer (MIT), 2018 · livro. caps. 1–4, escritos para quem programa

## Boss fight

Construa um provador de lógica proposicional: parser de fórmulas, verificação de tautologia por tabela-verdade, conversão para forma normal conjuntiva (CNF) e um resolvedor DPLL. Use-o para verificar 20 equivalências (De Morgan, contrapositiva, distributivas) e para exibir, como contraexemplo concreto, por que "afirmar o consequente" não é válido.

## Checkpoint

- [ ] Negue formalmente: "para todo ε > 0 existe δ > 0 tal que, se |x − a| < δ, então |f(x) − L| < ε".
- [ ] Qual a diferença entre recíproca e contrapositiva? Qual delas equivale à implicação original?
- [ ] Dê uma função de ℤ em ℤ injetora e não sobrejetora.
- [ ] Mostre por tabela-verdade que P ⇒ Q ≡ ¬P ∨ Q.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
