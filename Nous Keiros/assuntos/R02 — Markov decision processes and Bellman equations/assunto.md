# R02 — Markov decision processes and Bellman equations

*Processos de decisão de Markov e equações de Bellman*

- **Trilha:** Reinforcement Learning
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** Markov decision process, Bellman equation, value function, policy

## Por que importa

O processo de decisão de Markov (MDP) é a linguagem formal de todo agente que age no tempo: estados, ações, transições e recompensas. As equações de Bellman — o valor de agora é a recompensa mais o valor descontado do depois — são a ideia mais importante do RL.

## Pré-requisitos

- **Depende de:** R01 (Bandits and the exploration–exploitation dilemma)
- **Destrava:** R03 (Dynamic programming), N10 (Free energy principle and active inference)

## Base

1. Agente, ambiente, estado, ação, recompensa; a propriedade de Markov.
2. Políticas determinísticas e estocásticas; retorno descontado **M12**.
3. Funções de valor V^π e Q^π.
4. Equação de expectativa de Bellman e sua forma matricial V = R + γPV, resolvida como sistema linear **M17**.
5. Equação de otimalidade de Bellman e política ótima.
6. POMDPs: observação parcial e estados de crença **M22**.

## Meio

- Horizonte finito vs. infinito; γ e o horizonte efetivo 1/(1 − γ).
- MDPs como programas lineares.
- Desenho de recompensas e shaping baseado em potencial (Ng, Harada & Russell).

## Avançado

- POMDPs e estados de crença como base da inferência ativa → N10.
- "Reward is enough" (Silver et al.) e suas críticas contestado
- O que são estado, ação e recompensa para um agente de linguagem? → A03

## Matemática necessária

**M17**: sistemas lineares; **M12**: séries; **M22**: probabilidade.

## Métodos

- Escreva MDPs pequenos à mão (mundos de grade) e resolva V^π por sistema linear.
- Sutton & Barto cap. 3 com a aula 2 de David Silver.

## Desafios

- Confundir V com Q; esquecer o desconto.
- Usar um "estado" que não é Markov (falta informação).

## Fontes

- 📖 [Reinforcement Learning: An Introduction (2nd ed.)](http://incompleteideas.net/book/the-book-2nd.html) — Richard S. Sutton & Andrew G. Barto, 2018 · livro. cap. 3
- 🎓 [Reinforcement Learning (UCL)](https://www.davidsilver.uk/teaching/) — David Silver · curso. aulas 1–2
- 📖 [Markov Decision Processes: Discrete Stochastic Dynamic Programming](https://doi.org/10.1002/9780470316887) — Martin L. Puterman, 1994 · livro. a referência rigorosa
- 📄 [Policy invariance under reward transformations: Theory and application to reward shaping](https://people.eecs.berkeley.edu/~pabbeel/cs287-fa09/readings/NgHaradaRussell-shaping-ICML1999.pdf) — Andrew Y. Ng, Daishi Harada & Stuart Russell, 1999 · paper

## Boss fight

Construa um laboratório de MDPs com mundos de grade configuráveis: calcule V^π exatamente por sistema linear, confira numericamente a equação de Bellman e, num MDP minúsculo, enumere todas as políticas determinísticas para achar a ótima em vários valores de γ. Implemente shaping baseado em potencial e mostre, por prova e por enumeração, que ele não altera a política ótima.

## Checkpoint

- [ ] Escreva a equação de expectativa de Bellman para V^π.
- [ ] Por que V^π = (I − γP^π)⁻¹R^π?
- [ ] Qual a diferença entre V* e Q*?
- [ ] O que transforma um problema num POMDP?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
