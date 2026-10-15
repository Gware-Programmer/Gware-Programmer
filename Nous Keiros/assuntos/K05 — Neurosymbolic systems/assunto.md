# K05 — Neurosymbolic systems

*Sistemas neurossimbólicos*

- **Trilha:** Cognitive Architectures
- **Nível:** 8 — Escala · onda 1
- **Termos:** neurosymbolic AI, program synthesis, differentiable logic, theorem proving

## Por que importa

Redes neurais aprendem padrões a partir de dados; sistemas simbólicos raciocinam com garantias. A IA neurossimbólica tenta juntar os dois, e já produziu marcos — AlphaGeometry, AlphaProof, DreamCoder. Para quem escreve compiladores, é o território mais natural de toda a IA.

## Pré-requisitos

- **Depende de:** K01 (What is a cognitive architecture), L14 (Transformers), M36 (Theory of computation: automata, grammars and computability), K08 (Knowledge representation and reasoning)
- **Destrava:** K07 (Forty years of cognitive architectures: what was solved and what wasn't)

Novo pré-requisito: **K08** — representação do conhecimento e raciocínio lógico.

## Base

1. Os limites de cada lado: generalização sistemática e garantias (falta às redes) vs. percepção e aprendizado com ruído (falta aos símbolos) **L14**.
2. A taxonomia de Kautz: seis maneiras de combinar neural e simbólico (de "simbólico chama neural" a "neural chama simbólico").
3. Síntese de programas: busca em espaços de programas guiada por redes **M36**.
4. Aprendizado de bibliotecas: DreamCoder e o ciclo vigília-sono de abstração.
5. Provadores de teoremas com redes neurais: AlphaGeometry (motor de dedução simbólica + modelo de linguagem) e AlphaProof (RL sobre provas verificadas em Lean) → P09.

## Meio

- Lógica diferenciável e restrições lógicas como regularização.
- LLMs + verificadores formais: geração de código e de provas com checagem.
- O ARC (Abstraction and Reasoning Corpus) como teste de abstração: ARC-AGI-1, -2 e -3 (este último interativo, agêntico).

## Avançado

- O "simbólico" emerge dentro das redes? Circuitos que implementam algoritmos → I03.
- Raciocínio com busca e verificação → L25.
- Programas como modelos de mundo e o aprendizado de conceitos em humanos → G06.

## Matemática necessária

**M36**: computabilidade, gramáticas e linguagens formais; **M05**: lógica; **M22**: probabilidade (busca guiada por probabilidades).

## Métodos

- Implemente uma síntese de programas por enumeração numa DSL pequena e depois guie a busca com uma rede.
- Leia DreamCoder e reproduza a ideia de biblioteca num domínio de listas.
- Tente tarefas do ARC-AGI com busca em uma DSL própria e registre onde ela falha.

## Desafios

- Interfaces frágeis entre o lado neural e o simbólico.
- Explosão do espaço de busca de programas.
- Benchmarks contaminados por dados de treino.

## Fontes

- 🧭 [Neurosymbolic AI: the 3rd wave](https://doi.org/10.1007/s10462-023-10448-w) — Artur d'Avila Garcez & Luís C. Lamb, 2023 · review
- 📄 [The Third AI Summer: AAAI Robert S. Engelmore Memorial Lecture](https://doi.org/10.1609/aimag.v43i1.19122) — Henry Kautz, 2022 · paper. a taxonomia em seis tipos
- 📄 [DreamCoder: Growing generalizable, interpretable knowledge with wake-sleep Bayesian program learning](https://arxiv.org/abs/2006.08381) — Kevin Ellis et al., 2020 · paper
- 📄 [Solving olympiad geometry without human demonstrations](https://doi.org/10.1038/s41586-023-06747-5) — Trieu H. Trinh, Yuhuai Wu, Quoc V. Le, He He & Thang Luong, 2024 · paper. AlphaGeometry
- 🆕 [Olympiad-level formal mathematical reasoning with reinforcement learning](https://doi.org/10.1038/s41586-025-09833-y) — Thomas Hubert et al., 2025 · recente. AlphaProof
- 📄 [On the Measure of Intelligence](https://arxiv.org/abs/1911.01547) — François Chollet, 2019 · paper. origem do ARC

## Boss fight

Construa um sintetizador de programas para uma DSL de manipulação de grades no estilo ARC: enumeração com poda por tipos, depois busca guiada por uma rede treinada na RTX 3090 e uma biblioteca de abstrações aprendidas no estilo DreamCoder. Meça quantas tarefas de avaliação pública do ARC-AGI-1 cada versão resolve com o mesmo orçamento de computação e escreva o que falta para o ARC-AGI-2.

## Checkpoint

- [ ] Cite três das seis categorias de Kautz com um exemplo de cada.
- [ ] O que o ciclo vigília-sono do DreamCoder aprende?
- [ ] Como o AlphaGeometry divide o trabalho entre rede e motor simbólico?
- [ ] Por que o ARC é difícil para modelos treinados em grandes volumes de dados?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
