# P09 — Machine-checked proofs: Lean 4

*Provas verificadas por máquina: Lean 4*

- **Trilha:** Research Craft
- **Nível:** 1 — Provas e código · onda 3
- **Termos:** Lean 4, Mathlib, formal verification, interactive theorem proving
- **Projetos KEIROS:** REIXU

## Por que importa

Provas verificadas por máquina eliminam o "acho que está certo". Lean 4 e a Mathlib ensinam matemática com rigor absoluto, são a base da IA que prova teoremas (AlphaProof, DeepSeek-Prover) e — para quem escreve compiladores — são uma linguagem funcional com tipos dependentes. É a melhor forma de aprender demonstrações do zero.

## Pré-requisitos

- **Depende de:** M06 (Proofs: direct, contrapositive, contradiction and induction), C01 (Scientific Python: the lab)
- **Destrava:** —

## Base

1. Proposições como tipos e provas como programas: a correspondência de Curry-Howard **M06**.
2. Lean 4 como linguagem: funções, tipos indutivos, casamento de padrões **C01**.
3. Táticas: intro, apply, exact, rw, simp, induction, cases.
4. O Natural Number Game: provar a aritmética do zero, jogando.
5. Mathlib: a biblioteca matemática da comunidade e como procurar lemas.
6. Programação funcional em Lean, para quem quer usá-lo como linguagem.

## Meio

- Matemática formal colaborativa: o Equational Theories Project e o repositório de conjecturas formais da Google DeepMind.
- Provadores automáticos com IA: DeepSeek-Prover-V2 e AlphaProof → K05.
- Lean para verificar software: especificações e provas de correção.

## Avançado

- Formalizar teoremas de ML (convergência, limites de generalização) → L26
- IA que prova teoremas e a autoformalização → K05
- Verificar partes do compilador REIXU em Lean projeto ambicioso

## Matemática necessária

**M06**: demonstrações — direta, contrapositiva, absurdo e indução —, agora escritas de forma que a máquina confere; **M05**: lógica.

## Métodos

- Jogue o Natural Number Game até o fim.
- Leia Theorem Proving in Lean 4 e depois Mathematics in Lean.
- Formalize em Lean cada demonstração que fizer em **M06**.

## Desafios

- Brigar com a sintaxe antes de entender a ideia: escreva a prova no papel primeiro.
- Usar `sorry` e esquecer que ele ficou lá.

## Fontes

- 🎓 [Natural Number Game (Lean 4)](https://adam.math.hhu.de/#/g/leanprover-community/nng4) — Kevin Buzzard et al. (comunidade Lean) · curso
- 📖 [Theorem Proving in Lean 4](https://lean-lang.org/theorem_proving_in_lean4/) — Jeremy Avigad, Leonardo de Moura, Soonho Kong & Sebastian Ullrich · livro
- 📖 [Mathematics in Lean](https://leanprover-community.github.io/mathematics_in_lean/) — Jeremy Avigad & Patrick Massot · livro
- 📄 [The Lean 4 Theorem Prover and Programming Language](https://doi.org/10.1007/978-3-030-79876-5_37) — Leonardo de Moura & Sebastian Ullrich, 2021 · paper
- 🔧 [leanprover-community/mathlib4](https://github.com/leanprover-community/mathlib4) — Comunidade Lean · ferramenta
- 🆕 [DeepSeek-Prover-V2: Advancing Formal Mathematical Reasoning via Reinforcement Learning for Subgoal Decomposition](https://arxiv.org/abs/2504.21801) — Z. Z. Ren et al., 2025 · recente

## Boss fight

Termine o Natural Number Game e formalize em Lean 4, sem nenhum `sorry`, cinco resultados que você provou em **M06**: a soma dos n primeiros ímpares é n², a irracionalidade de √2, a infinitude dos primos (com a Mathlib), uma desigualdade por indução e um resultado de divisibilidade. Por último, escreva em Lean o avaliador de expressões aritméticas de um pedaço do REIXU e prove uma propriedade dele — por exemplo, que uma otimização de constantes preserva o valor.

## Checkpoint

- [ ] O que diz a correspondência de Curry-Howard?
- [ ] Para que servem as táticas intro, apply e rw?
- [ ] Como procurar um lema na Mathlib?
- [ ] Por que uma prova em Lean é mais confiável do que uma prova no papel?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
