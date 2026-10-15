# R03 — Dynamic programming

*Programação dinâmica*

- **Trilha:** Reinforcement Learning
- **Nível:** 6 — Aprendizado de máquina · onda 2
- **Termos:** dynamic programming, policy iteration, value iteration, contraction

## Por que importa

Quando o modelo do ambiente é conhecido, a programação dinâmica encontra a política ótima exatamente. Iteração de política e de valor são os algoritmos-mãe de todo RL — e a prova de convergência por contração é um dos teoremas mais elegantes que você vai provar.

## Pré-requisitos

- **Depende de:** R02 (Markov decision processes and Bellman equations)
- **Destrava:** R04 (Temporal-difference learning: Monte Carlo, TD, SARSA and Q-learning), R11 (Optimal control and RL theory)

## Base

1. Avaliação iterativa de política.
2. Melhoria de política e o teorema de melhoria.
3. Iteração de política.
4. Iteração de valor.
5. A contração de Bellman na norma do máximo e a convergência por ponto fixo **M06**.
6. Iteração de política generalizada (GPI).

## Meio

- Programação dinâmica assíncrona e varredura priorizada (prioritized sweeping).
- A maldição da dimensionalidade.
- MDPs resolvidos por programação linear.

## Avançado

- Controle ótimo e a equação de Hamilton–Jacobi–Bellman → R11.
- Programação dinâmica aproximada e por que ela fica instável com aproximação de funções → R05.
- Complexidade de resolver MDPs.

## Matemática necessária

**M17**: álgebra linear; **M06**: provas; **M12**: séries.

## Métodos

- Implemente iteração de política e de valor e compare iterações e tempo.
- Prove a contração de Bellman à mão.
- Use Bertsekas para o rigor.

## Desafios

- Critérios de parada mal escolhidos.
- Achar que programação dinâmica escala sem aproximação.

## Fontes

- 📖 [Reinforcement Learning: An Introduction (2nd ed.)](http://incompleteideas.net/book/the-book-2nd.html) — Richard S. Sutton & Andrew G. Barto, 2018 · livro. cap. 4
- 📖 [A Course in Reinforcement Learning](https://web.mit.edu/dimitrib/www/RLbook.html) — Dimitri P. Bertsekas · livro. material gratuito do autor
- 📖 [Algorithms of Reinforcement Learning](https://sites.ualberta.ca/~szepesva/rlbook.html) — Csaba Szepesvári, 2010 · livro
- 🎓 [Reinforcement Learning (UCL)](https://www.davidsilver.uk/teaching/) — David Silver · curso. aula 3

## Boss fight

Implemente iteração de política, iteração de valor e programação dinâmica assíncrona com varredura priorizada; resolva um MDP de estoque ou de fila com milhares de estados e compare iterações, tempo e erro. Escreva a prova completa da contração de Bellman e da convergência da iteração de valor.

## Checkpoint

- [ ] Prove que o operador de Bellman é uma contração na norma do máximo.
- [ ] Por que a iteração de política converge num número finito de passos?
- [ ] Qual a diferença prática entre iteração de valor e de política?
- [ ] O que é a iteração de política generalizada?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
