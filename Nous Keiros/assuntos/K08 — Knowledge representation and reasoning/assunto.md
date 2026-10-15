# K08 — Knowledge representation and reasoning

*Representação do conhecimento e raciocínio*

- **Trilha:** Cognitive Architectures
- **Nível:** 4 — A máquina de aprender · onda 1
- **Termos:** knowledge representation, first-order logic, resolution, forward chaining, backward chaining, Prolog, ontologies, description logic, knowledge graphs, frame problem
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Antes das redes neurais, a IA era sobretudo esta pergunta: como escrever o que se sabe de um jeito que a máquina consiga raciocinar? Lógica, regras, ontologias e grafos de conhecimento continuam vivos em sistemas neurossimbólicos, em verificadores de raciocínio e na memória estruturada de agentes. Para o Rei Ichi, é a diferença entre lembrar texto e saber coisas que se combinam.

## Pré-requisitos

- **Depende de:** M05 (Logic, sets and the language of mathematics), A02 (Search and classical planning)
- **Destrava:** K05 (Neurosymbolic systems)

## Base

1. O que é uma representação de conhecimento: os cinco papéis de Davis, Shrobe e Szolovits.
2. Lógica proposicional e de primeira ordem como linguagem de representação; consequência lógica **M05**.
3. Inferência: resolução, forward e backward chaining, cláusulas de Horn.
4. Programação lógica: Prolog, unificação e busca em profundidade com retrocesso **A02**.
5. Regras de produção e sistemas especialistas.
6. Redes semânticas, frames e herança.
7. Ontologias e lógicas de descrição; RDF, OWL e grafos de conhecimento.

## Meio

- Raciocínio não monotônico, default e a hipótese do mundo fechado.
- Raciocínio sobre ações e tempo: cálculo de situações e o problema do frame.
- Answer set programming e solvers SAT/SMT como motores de raciocínio.
- Senso comum: Cyc, ConceptNet e por que ele foi tão difícil de escrever à mão.

## Avançado

- Grafos de conhecimento combinados com embeddings; consultas em grafos.
- LLMs como bases de conhecimento: o que guardam, o que inventam e como checar com lógica (prévia de → K05).
- Incerteza: redes bayesianas e lógica probabilística (prévia de → L06).

## Matemática necessária

**M05**: lógica e conjuntos; **A02**: busca.

## Métodos

- Leia os capítulos de lógica e representação do AIMA (4ª ed.) e faça os exercícios.
- Faça o Learn Prolog Now! no SWI-Prolog e escreva uma base de conhecimento do próprio mapa: assunto, depende_de, ensina.
- Escreva a mesma base em RDF e faça consultas em SPARQL.

## Desafios

- Achar que lógica "não serve mais": verificadores formais e solvers estão por trás de muito raciocínio confiável.
- O problema do frame: dizer o que não muda é mais difícil do que dizer o que muda.
- Ontologias grandes demais, que ninguém consegue manter.

## Fontes

- 📖 [Knowledge Representation and Reasoning](https://doi.org/10.1016/B978-1-55860-932-7.X5083-3) — Ronald J. Brachman & Hector J. Levesque, 2004 · livro
- 📖 [Artificial Intelligence: A Modern Approach (4ª ed.)](https://aima.cs.berkeley.edu/) — Stuart Russell & Peter Norvig · livro
- 📄 [What Is a Knowledge Representation?](https://doi.org/10.1609/aimag.v14i1.1029) — Randall Davis, Howard Shrobe & Peter Szolovits, 1993 · paper
- 📄 [Programs with Common Sense](https://www-formal.stanford.edu/jmc/mcc59/mcc59.html) — John McCarthy, 1959 · paper
- 🧭 [Knowledge Graphs](https://arxiv.org/abs/2003.02320) — Aidan Hogan et al., 2021 · review
- 📖 [Learn Prolog Now!](https://www.let.rug.nl/bos/lpn/) — Patrick Blackburn, Johan Bos & Kristina Striegnitz · livro. livre
- 🔧 [SWI-Prolog](https://www.swi-prolog.org/) — Jan Wielemaker et al. · ferramenta

## Boss fight

Dê ao Rei Ichi uma memória declarativa estruturada: uma base de conhecimento em Prolog (ou num motor de regras seu, em C ou REIXU) com o próprio O MAPA — assuntos, dependências e o que cada um ensina — e regras que respondem "o que preciso dominar para chegar a L14?", "que assuntos dependem de M17?" e detectam inconsistências. Compare as respostas com o cálculo do app e escreva onde a representação lógica ganha e onde perde de uma busca por texto.

## Checkpoint

- [ ] Quais são os papéis de uma representação de conhecimento segundo Davis, Shrobe e Szolovits?
- [ ] Qual a diferença entre forward e backward chaining, e quando cada um é melhor?
- [ ] O que é o problema do frame?
- [ ] O que uma ontologia OWL consegue expressar que uma tabela de banco de dados não consegue?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
