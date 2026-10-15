# F03 — The Chinese room and the problem of understanding

*O quarto chinês e o problema do entendimento*

- **Trilha:** Philosophy of Mind & Science
- **Nível:** 3 — Cálculo e incerteza · onda 1
- **Termos:** Chinese room, symbol grounding, understanding in LLMs

## Por que importa

Um sistema que manipula símbolos perfeitamente entende alguma coisa? O quarto chinês de Searle, o problema da ancoragem de símbolos e o debate atual sobre se LLMs "entendem" são a mesma pergunta em três épocas — e a resposta muda o que você pode afirmar sobre o Rei Ichi.

## Pré-requisitos

- **Depende de:** F02 (Functionalism and computationalism)
- **Destrava:** —

## Base

1. O argumento do quarto chinês (Searle, 1980): sintaxe não basta para semântica **F02**.
2. As respostas clássicas — do sistema, do robô, do simulador de cérebro — e as tréplicas de Searle.
3. O problema da ancoragem de símbolos (symbol grounding) (Harnad, 1990): como símbolos ganham significado sem depender de outros símbolos.
4. LLMs e significado: "forma não basta para significado" (Bender & Koller, 2020) vs. significado sem referência (Piantadosi & Hill, 2022).
5. O debate sobre entendimento em LLMs (Mitchell & Krakauer, 2023) contestado.
6. Evidência empírica: representações do estado do mundo emergindo em modelos treinados só com sequências (Othello-GPT).

## Meio

- "Papagaios estocásticos" (Bender et al., 2021) e as críticas à metáfora.
- O que filósofos pensam: na pesquisa PhilPapers de 2020, cerca de 67% diziam que o quarto chinês não entende chinês e 18% que entende.
- Entendimento como capacidade graduada, não propriedade binária.

## Avançado

- Interpretabilidade como teste empírico de "entendimento": representações causais do mundo → I03
- Intencionalidade e representação → F06
- Entendimento e consciência são separáveis? → S10

## Matemática necessária

**M36**: computação e sintaxe formal; **M05**: lógica (estrutura de argumentos).

## Métodos

- Leia Searle (1980) junto com os comentários publicados na mesma edição.
- Leia Bender & Koller (2020) e Piantadosi & Hill (2022) lado a lado.
- Leia o verbete "The Chinese Room Argument" da Stanford Encyclopedia.

## Desafios

- Achar que desempenho comportamental encerra a questão — ou que nunca pode dizer nada.
- Usar "entender" sem um critério.

## Fontes

- 📄 [Minds, brains, and programs](https://doi.org/10.1017/S0140525X00005756) — John R. Searle, 1980 · paper
- 📄 [The symbol grounding problem](https://doi.org/10.1016/0167-2789(90)90087-6) — Stevan Harnad, 1990 · paper
- 📄 [Climbing towards NLU: On Meaning, Form, and Understanding in the Age of Data](https://aclanthology.org/2020.acl-main.463/) — Emily M. Bender & Alexander Koller, 2020 · paper
- 📄 [Meaning without reference in large language models](https://arxiv.org/abs/2208.02957) — Steven T. Piantadosi & Felix Hill, 2022 · paper
- 📄 [The debate over understanding in AI's large language models](https://doi.org/10.1073/pnas.2215907120) — Melanie Mitchell & David C. Krakauer, 2023 · paper
- 📄 [Emergent World Representations: Exploring a Sequence Model Trained on a Synthetic Task](https://arxiv.org/abs/2210.13382) — Kenneth Li, Aspen K. Hopkins, David Bau, Fernanda Viégas, Hanspeter Pfister & Martin Wattenberg, 2022 · paper. Othello-GPT

## Boss fight

Construa um quarto chinês literal em Python: um programa que responde perguntas sobre partidas de jogo da velha usando só uma tabela de regras sobre sequências de símbolos, e outro que mantém um modelo explícito do tabuleiro. Faça perguntas novas aos dois e compare onde cada um quebra. Escreva a resposta do sistema e a do robô aplicadas a cada programa — e guarde o texto: em → I03 você testará a mesma pergunta numa rede treinada.

## Checkpoint

- [ ] Reconstrua o argumento do quarto chinês em premissas e conclusão.
- [ ] Qual é a resposta do sistema e como Searle a rebate?
- [ ] O que é o problema da ancoragem de símbolos?
- [ ] O que o Othello-GPT mostra e o que ele não mostra?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
