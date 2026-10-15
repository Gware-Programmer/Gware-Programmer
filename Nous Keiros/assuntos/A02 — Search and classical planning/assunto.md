# A02 — Search and classical planning

*Busca e planejamento clássico*

- **Trilha:** Agents
- **Nível:** 3 — Cálculo e incerteza · onda 2
- **Termos:** search, A*, STRIPS, PDDL, HTN planning, MCTS
- **Projetos KEIROS:** MUSUBI

## Por que importa

Planejar é escolher uma sequência de ações que leva a um objetivo. Busca heurística (A*), planejamento simbólico (STRIPS, PDDL) e busca em árvore (MCTS) são a base de qualquer agente que precisa "pensar antes de agir" — e o que LLMs, sozinhos, ainda fazem mal.

## Pré-requisitos

- **Depende de:** A01 (What is an agent: classical architectures), M22 (Probability: events, conditioning and Bayes), C15 (Algorithms and data structures)
- **Destrava:** A03 (LLM agents: the agentic loop and tool use), K02 (Soar), K08 (Knowledge representation and reasoning)

Novo pré-requisito: **C15** — busca é algoritmo sobre grafos e filas de prioridade.

## Base

1. Busca não informada: largura, profundidade, custo uniforme **M13**.
2. Busca informada: A* e heurísticas admissíveis e consistentes.
3. Busca local: subida de encosta e têmpera simulada (simulated annealing).
4. Busca adversarial: minimax e poda alfa-beta.
5. Planejamento clássico: STRIPS, PDDL, busca em espaço de estados e de planos.
6. Planejamento hierárquico (HTN).
7. MCTS, na intuição **M22**.

## Meio

- Planejamento como SAT e heurísticas por relaxamento.
- Planejamento sob incerteza: prévia de MDPs e POMDPs → R02.
- Planejadores modernos (Fast Downward).

## Avançado

- LLMs como planejadores: PlanBench e a tese "LLMs não planejam, mas ajudam a planejar" → A05.
- Resolução de problemas como busca em espaços de problema — a base do Soar → K02.
- Planejamento clássico é PSPACE-completo → M37.

## Matemática necessária

**M13**: combinatória e explosão do espaço de estados; **M22**: probabilidade.

## Métodos

- Implemente BFS, A*, IDA* e minimax com alfa-beta; resolva o 8-puzzle e o 15-puzzle com heurísticas diferentes e compare nós expandidos.
- Escreva domínios em PDDL e resolva com um planejador clássico.
- Use Ghallab, Nau & Traverso para a teoria.

## Desafios

- Heurística não admissível no A* (perde a otimalidade).
- Explosão combinatória sem poda.

## Fontes

- 📖 [Artificial Intelligence: A Modern Approach (4ª ed.)](http://aima.cs.berkeley.edu/) — Stuart Russell & Peter Norvig, 2020 · livro. caps. 3–6 e 11
- 📖 [Acting, Planning, and Learning](https://projects.laas.fr/planning/) — Malik Ghallab, Dana Nau & Paolo Traverso · livro. a referência atual em planejamento e atuação
- 📄 [A Formal Basis for the Heuristic Determination of Minimum Cost Paths](https://doi.org/10.1109/TSSC.1968.300136) — Peter E. Hart, Nils J. Nilsson & Bertram Raphael, 1968 · paper. o A*
- 📄 [STRIPS: A new approach to the application of theorem proving to problem solving](https://doi.org/10.1016/0004-3702(71)90010-5) — Richard E. Fikes & Nils J. Nilsson, 1971 · paper
- 🧭 [A Survey of Monte Carlo Tree Search Methods](https://doi.org/10.1109/TCIAIG.2012.2186810) — Cameron B. Browne et al., 2012 · review

## Boss fight

Implemente BFS, A*, IDA* (com duas heurísticas), minimax com alfa-beta e um MCTS simples; resolva o 15-puzzle e jogue Connect-4. Escreva três domínios em PDDL — um deles do MUSUBI, por exemplo distribuir tarefas entre agentes com dependências — e resolva-os com um planejador clássico. Compare com os planos que um LLM produz para os mesmos problemas, verificando cada plano automaticamente.

## Checkpoint

- [ ] Por que o A* com heurística admissível é ótimo?
- [ ] O que é uma heurística consistente?
- [ ] Escreva uma ação STRIPS com pré-condições e efeitos.
- [ ] Por que o planejamento clássico é computacionalmente difícil?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
