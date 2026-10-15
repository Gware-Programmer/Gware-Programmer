# M12 — Sequences, series and summations

*Sequências, séries e somatórios*

- **Trilha:** Mathematics
- **Nível:** 2 — O motor · onda 2
- **Termos:** sequences, series, summation, limits

## Por que importa

Somatórios estão em toda função de perda, média e esperança; séries geométricas aparecem no retorno descontado do aprendizado por reforço (Σ γᵗ rₜ) e nas médias móveis dos otimizadores. Limites de sequências são a porta de entrada do cálculo.

## Pré-requisitos

- **Depende de:** M06 (Proofs: direct, contrapositive, contradiction and induction), M09 (Exponentials and logarithms)
- **Destrava:** M14 (Single-variable differential calculus), M22 (Probability: events, conditioning and Bayes)

## Base

1. Sequências definidas por fórmula e por recorrência.
2. Progressões aritméticas e geométricas; somas de PA e PG.
3. Notação Σ e Π: trocar índices, separar somas, somas duplas.
4. Limite de sequência: convergência e divergência, na intuição.
5. Séries como limite das somas parciais; série geométrica Σ rⁿ = 1/(1 − r) para |r| < 1.
6. A série harmônica diverge — e por quê.

## Meio

- Definição ε–N de limite de sequência: o primeiro contato com o rigor **M06**.
- Testes de convergência (comparação, razão).
- Somas telescópicas; Σk, Σk², Σk³ por indução.
- Retorno descontado G = Σ γᵗ rₜ: por que γ < 1 garante soma finita com recompensas limitadas → R02.

## Avançado

- Séries de potências e convergência; eˣ como série → M15.
- Convergência absoluta vs. condicional (teorema do rearranjo de Riemann): a ordem da soma às vezes importa — e em ponto flutuante sempre importa → M32.
- Médias móveis exponenciais como séries geométricas: o momentum e o Adam → L09.

## Matemática necessária

**M06**: indução e o estilo ε de definição; **M09**: exponenciais.

## Métodos

- Prove por indução as fórmulas de somas e confira numericamente.
- Plote somas parciais para ver convergência e divergência acontecendo.
- Para cada Σ que aparecer em papers, reescreva como laço `for` — e vice-versa.

## Desafios

- Confundir sequência (lista de termos) com série (soma dos termos).
- Achar que termos → 0 implica série convergente (a harmônica é o contraexemplo).
- Erros de índice (off-by-one) em somatórios, exatamente como em laços.

## Fontes

- 🎓 [Portal da Matemática OBMEP — Progressões aritméticas](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=79) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Progressões geométricas](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=80) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Recorrências](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=82) — IMPA/OBMEP · curso
- 📖 [Calculus Volume 2](https://openstax.org/details/books/calculus-volume-2) — Gilbert Strang & Edwin Herman (OpenStax), 2016 · livro. cap. 5, sequências e séries
- 📖 [Mathematics for Computer Science](https://courses.csail.mit.edu/6.042/spring18/mcs.pdf) — Lehman, Leighton & Meyer (MIT), 2018 · livro. cap. 14, somas e assintóticas

## Boss fight

Implemente um avaliador de retornos descontados e de médias móveis exponenciais (EMA). Prove por indução a fórmula fechada da soma geométrica finita e use-a para mostrar que uma EMA com β = 0,9 concentra 1 − βᵏ do peso nos últimos k passos (~1/(1 − β) passos efetivos). Entregue um relatório curto com as provas e gráficos que confirmem cada afirmação.

## Checkpoint

- [ ] Calcule Σ_{k≥0} (2/3)ᵏ e Σ_{k=1}^{n} (2k − 1).
- [ ] Prove que a série harmônica diverge.
- [ ] Escreva Gₜ = rₜ + γ·Gₜ₊₁ a partir da definição de Gₜ como série.
- [ ] Dê uma série cujos termos tendem a zero e que mesmo assim diverge.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
