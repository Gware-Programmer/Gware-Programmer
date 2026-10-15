# N10 — Free energy principle and active inference

*Princípio da energia livre e inferência ativa*

- **Trilha:** Computational Neuroscience
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** free energy principle, active inference, expected free energy, Markov blanket

## Por que importa

O princípio da energia livre afirma que todo sistema que persiste minimiza um limite da própria surpresa; a inferência ativa transforma isso em percepção, ação e planejamento. É ambicioso, influente e muito contestado — saber exatamente o que ele afirma, matematicamente, é a única defesa contra usá-lo como vocabulário mágico.

## Pré-requisitos

- **Depende de:** N09 (Predictive coding), R02 (Markov decision processes and Bellman equations)
- **Destrava:** S08 (Predictive processing and consciousness)

## Base

1. Energia livre variacional: F = KL[q(s) ‖ p(s|o)] − log p(o), um limite superior da surpresa −log p(o) **M25**, **M26**.
2. Percepção como minimização de F em relação às crenças; ação como minimização em relação às observações futuras.
3. Inferência ativa em espaços discretos: POMDPs com as matrizes A, B, C e D **R02**.
4. Energia livre esperada: valor epistêmico (curiosidade) + valor pragmático (preferências).
5. Cobertores de Markov (Markov blankets) e a separação entre sistema e ambiente.

## Meio

- O tutorial passo a passo de Smith, Friston & Whyte e a biblioteca pymdp.
- Relação com RL: preferências como recompensas, exploração dirigida por informação.
- Testes experimentais com neurônios in vitro (Isomura et al., 2023) — e o que eles de fato mostram.

## Avançado

- Críticas sobre cobertores de Markov, sobre a física do FEP e sobre a origem da energia livre esperada contestado
- O FEP é falseável? Princípio (como o de mínima ação) ou teoria empírica contestado → F05
- Inferência ativa e consciência → S08.

## Matemática necessária

**M25**: inferência variacional; **M26**: KL e entropia; **M29**: processos estocásticos (formulação contínua).

## Métodos

- Leia os capítulos iniciais do livro aberto Active Inference (Parr, Pezzulo & Friston).
- Faça o tutorial de Smith et al. e reproduza-o com pymdp.
- Leia Gershman (2019) e Bruineberg et al. (2022) antes de formar opinião.

## Desafios

- Confundir o princípio (quase tautológico numa leitura) com modelos de processo específicos e testáveis.
- Notação pesada escondendo suposições.

## Fontes

- 📖 [Active Inference: The Free Energy Principle in Mind, Brain, and Behavior](https://doi.org/10.7551/mitpress/12441.001.0001) — Thomas Parr, Giovanni Pezzulo & Karl J. Friston, 2022 · livro. acesso aberto
- 📄 [The free-energy principle: a unified brain theory?](https://doi.org/10.1038/nrn2787) — Karl Friston, 2010 · paper
- 📄 [A step-by-step tutorial on active inference and its application to empirical data](https://doi.org/10.1016/j.jmp.2021.102632) — Ryan Smith, Karl J. Friston & Christopher J. Whyte, 2022 · paper
- 🔧 [infer-actively/pymdp](https://github.com/infer-actively/pymdp) — Conor Heins et al. · ferramenta
- 📄 [The Emperor's New Markov Blankets](https://doi.org/10.1017/S0140525X21002351) — Jelle Bruineberg, Krzysztof Dołęga, Joe Dewhurst & Manuel Baltieri, 2022 · paper. crítica
- 📄 [What does the free energy principle tell us about the brain?](https://arxiv.org/abs/1901.07945) — Samuel J. Gershman, 2019 · paper
- 🗺️ [pymdp: active inference in Python (documentation and tutorials)](https://pymdp-rtd.readthedocs.io/) — Conor Heins et al. · guia. tutoriais de inferência ativa do zero
- 🆕 [Expected Free Energy-based Planning as Variational Inference](https://arxiv.org/abs/2504.14898) — Bert de Vries et al., 2025 · recente

**Exceções na regra de materiais:**

- sem aula ou vídeo: não há curso em vídeo aberto e estável sobre este tema

## Boss fight

Implemente do zero, sem pymdp, um agente de inferência ativa no labirinto em T com pista, com a energia livre esperada separada em termos epistêmico e pragmático, e valide os resultados contra o pymdp. Depois coloque um agente de RL com bônus de exploração na mesma tarefa e responda por escrito: o que a inferência ativa ganhou que o RL com bônus não tem, e o que é só reformulação?

## Checkpoint

- [ ] Escreva a energia livre variacional e mostre por que ela limita a surpresa.
- [ ] Quais são os dois termos da energia livre esperada?
- [ ] O que é um cobertor de Markov e qual é a crítica de Bruineberg et al.?
- [ ] O FEP é uma teoria testável ou um princípio? Defenda uma posição.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
