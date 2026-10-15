# G05 — Language: structure, acquisition and processing

*Linguagem: estrutura, aquisição e processamento*

- **Trilha:** Cognitive Science
- **Nível:** 3 — Cálculo e incerteza · onda 2
- **Termos:** linguistics, language acquisition, sentence processing, surprisal

## Por que importa

Linguagem é a capacidade mais estudada da cognição humana e a porta de entrada dos LLMs. Estrutura, aquisição e processamento em tempo real — e a surpresa (surprisal) como ponte entre teoria da informação e leitura humana — são o mapa para julgar o que os modelos de linguagem aprenderam de fato.

## Pré-requisitos

- **Depende de:** G01 (Cognitive science: Marr's levels and the method), M22 (Probability: events, conditioning and Bayes)
- **Destrava:** B03 (Speech and language BCIs)

## Base

1. Níveis da linguagem: fonologia, morfologia, sintaxe, semântica e pragmática.
2. Gramáticas formais e a hierarquia de Chomsky → M36.
3. Aquisição: aprendizado estatístico em bebês (Saffran, Aslin & Newport), a "pobreza do estímulo" e o debate inato vs. aprendido.
4. Processamento incremental e frases "labirinto" (garden-path), em que a interpretação inicial precisa ser desfeita.
5. Teoria da surpresa: o custo de processar uma palavra é proporcional a −log P(palavra | contexto) (Hale; Levy) **M22**, **M09**.
6. Linguagem e pensamento: competência linguística formal vs. funcional (Mahowald et al.) e a evidência neural de que linguagem é sobretudo ferramenta de comunicação (Fedorenko et al.).

## Meio

- Modelos de linguagem como modelos psicolinguísticos: a surpresa prevê tempos de leitura em muitas línguas, mas modelos maiores ajustam pior.
- BabyLM: treinar modelos com a quantidade de dados que uma criança recebe.
- Pragmática e implicaturas: o que o falante quer dizer além do que diz.

## Avançado

- "Modelos de linguagem refutam a abordagem de Chomsky?" (Piantadosi) contestado
- A rede de linguagem do cérebro comparada com LLMs → N12.
- O que significa um LLM "entender" → F03.

## Matemática necessária

**M22**: probabilidade condicional; **M09**: logaritmos (surpresa em bits).

## Métodos

- Calcule a surpresa por palavra com um modelo de linguagem pequeno e compare com seus tempos de leitura.
- Use Jurafsky & Martin como referência técnica de processamento de linguagem.
- Leia Mahowald et al. e Piantadosi lado a lado e escreva onde discordam de verdade.

## Desafios

- Confundir fluência com compreensão.
- Assumir que o que LLMs fazem é o que humanos fazem — ou o contrário.

## Fontes

- 📖 [Speech and Language Processing (3rd ed. draft)](https://web.stanford.edu/~jurafsky/slp3/) — Daniel Jurafsky & James H. Martin · livro
- 📄 [Statistical Learning by 8-Month-Old Infants](https://doi.org/10.1126/science.274.5294.1926) — Jenny R. Saffran, Richard N. Aslin & Elissa L. Newport, 1996 · paper
- 📄 [A Probabilistic Earley Parser as a Psycholinguistic Model](https://aclanthology.org/N01-1021/) — John Hale, 2001 · paper
- 📄 [Expectation-based syntactic comprehension](https://doi.org/10.1016/j.cognition.2007.05.006) — Roger Levy, 2008 · paper
- 🧭 [Dissociating language and thought in large language models](https://doi.org/10.1016/j.tics.2024.01.011) — Kyle Mahowald, Anna A. Ivanova, Idan A. Blank, Nancy Kanwisher, Joshua B. Tenenbaum & Evelina Fedorenko, 2024 · review
- 🆕 [Language is primarily a tool for communication rather than thought](https://doi.org/10.1038/s41586-024-07522-w) — Evelina Fedorenko, Steven T. Piantadosi & Edward A. F. Gibson, 2024 · recente
- 🎓 [9.00SC Introduction to Psychology](https://ocw.mit.edu/courses/9-00sc-introduction-to-psychology-fall-2011/) — John Gabrieli (MIT OpenCourseWare) · curso. aulas em vídeo

## Boss fight

Monte um experimento de leitura autocadenciada (self-paced reading) com 60 frases, incluindo frases labirinto e controles, e colete os seus tempos e os de mais uma pessoa. Calcule a surpresa por palavra com três modelos de tamanhos diferentes e meça quanto cada um se correlaciona com os tempos. Você reproduz o resultado de que modelos maiores ajustam pior? Escreva uma hipótese para o porquê.

## Checkpoint

- [ ] Defina surpresa e explique por que ela prevê tempo de leitura.
- [ ] O que o experimento de Saffran, Aslin & Newport mostrou?
- [ ] Diferencie competência linguística formal e funcional.
- [ ] Por que "modelos maiores ajustam pior" é um resultado intrigante?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
