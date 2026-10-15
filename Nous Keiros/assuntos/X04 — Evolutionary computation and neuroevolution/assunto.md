# X04 — Evolutionary computation and neuroevolution

*Computação evolutiva e neuroevolução*

- **Trilha:** Cybernetics & Complex Systems
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** evolutionary computation, genetic algorithms, evolution strategies, CMA-ES, genetic programming, neuroevolution, NEAT, novelty search, MAP-Elites, quality-diversity
- **Projetos KEIROS:** Rei Ichi

## Por que importa

A evolução é o único processo conhecido que produziu inteligência geral, sem gradiente e sem objetivo explícito. Algoritmos evolutivos otimizam o que não é diferenciável (arquiteturas, hiperparâmetros, programas), paralelizam sem esforço e, na versão "busca por novidade", geram diversidade aberta. São a base da vida artificial, dos sistemas abertos e, hoje, de agentes que evoluem código com LLMs.

## Pré-requisitos

- **Depende de:** M27 (Convex and non-convex optimization), M23 (Continuous random variables, distributions and limit theorems)
- **Destrava:** A09 (Autonomy, self-improvement and open-ended systems), X03 (Artificial life and self-reproducing automata)

## Base

1. O laço evolutivo: população, aptidão (fitness), seleção e variação (mutação e recombinação).
2. Algoritmos genéticos: representação, operadores e pressão seletiva.
3. Estratégias evolutivas e CMA-ES: adaptar a própria distribuição de busca.
4. Programação genética: evoluir programas.
5. Neuroevolução: evoluir pesos e topologias (NEAT).
6. Evolução vs. descida de gradiente **M27**: quando cada uma vence.

## Meio

- Evolution Strategies como alternativa escalável ao RL.
- Otimização multiobjetivo e frentes de Pareto (NSGA-II).
- Qualidade-diversidade: busca por novidade e MAP-Elites.
- Busca evolutiva de arquiteturas neurais.

## Avançado

- Abertura (open-endedness): POET, e por que objetivos podem atrapalhar a descoberta (prévia de → A09).
- Evolução com LLMs: o modelo de linguagem como operador de mutação para evoluir código e algoritmos.
- Fusão evolutiva de modelos (model merging).

## Matemática necessária

**M27**: otimização; **M23**: distribuições contínuas (a gaussiana do CMA-ES).

## Métodos

- Implemente do zero em NumPy um algoritmo genético e um CMA-ES simples e compare com o pycma.
- Rode NEAT no XOR e num problema de controle simples (CartPole).
- Reproduza em escala pequena o experimento de busca por novidade num labirinto enganoso.

## Desafios

- Achar que evolução é busca aleatória: o que importa é a seleção acumulada.
- A avaliação da aptidão costuma ser o gargalo, não o algoritmo.
- Comparações injustas com gradiente, com orçamentos de computação diferentes.

## Fontes

- 📖 [Introduction to Evolutionary Computing (2ª ed.)](https://doi.org/10.1007/978-3-662-44874-8) — A. E. Eiben & J. E. Smith, 2015 · livro
- 📄 [Evolving Neural Networks through Augmenting Topologies](https://doi.org/10.1162/106365602320169811) — Kenneth O. Stanley & Risto Miikkulainen, 2002 · paper
- 📄 [The CMA Evolution Strategy: A Tutorial](https://arxiv.org/abs/1604.00772) — Nikolaus Hansen, 2016 · paper
- 📄 [Evolution Strategies as a Scalable Alternative to Reinforcement Learning](https://arxiv.org/abs/1703.03864) — Tim Salimans et al., 2017 · paper
- 📄 [Abandoning Objectives: Evolution Through the Search for Novelty Alone](https://doi.org/10.1162/EVCO_a_00025) — Joel Lehman & Kenneth O. Stanley, 2011 · paper
- 🧭 [Designing neural networks through neuroevolution](https://doi.org/10.1038/s42256-018-0006-z) — Kenneth O. Stanley, Jeff Clune, Joel Lehman & Risto Miikkulainen, 2019 · review
- 🆕 [AlphaEvolve: A coding agent for scientific and algorithmic discovery](https://arxiv.org/abs/2506.13131) — Alexander Novikov et al., 2025 · recente
- 🔧 [pycma](https://github.com/CMA-ES/pycma) — Nikolaus Hansen et al. · ferramenta

## Boss fight

Evolua um módulo do Rei Ichi: use CMA-ES ou MAP-Elites para otimizar parâmetros que não têm gradiente — por exemplo, os limiares e as taxas de decaimento da memória ACT-R que você implementou, ou a topologia de uma pequena rede de controle — e compare, com o mesmo orçamento de avaliações, contra busca aleatória e contra gradiente quando ele existir. Mostre o arquivo de diversidade do MAP-Elites e explique o que ele encontrou que a otimização de um único objetivo não encontraria.

## Checkpoint

- [ ] Quais são os componentes do laço evolutivo?
- [ ] O que o CMA-ES adapta ao longo da busca, e por que isso ajuda?
- [ ] Por que a busca por novidade pode achar a saída de um labirinto enganoso melhor do que a busca pelo objetivo?
- [ ] Quando faz sentido usar evolução em vez de descida de gradiente?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
