# M36 — Theory of computation: automata, grammars and computability

*Teoria da computação: autômatos, gramáticas e computabilidade*

- **Trilha:** Mathematics
- **Nível:** 2 — O motor · onda 2
- **Termos:** theory of computation, automata, Turing machines, decidability
- **Projetos KEIROS:** REIXU

## Por que importa

O que pode ser computado? É a pergunta por trás de "a mente é computação?" (funcionalismo), dos limites de qualquer IA e da expressividade das arquiteturas. Para quem escreveu um compilador, autômatos e gramáticas são terreno conhecido; computabilidade é o próximo degrau.

## Pré-requisitos

- **Depende de:** M13 (Combinatorics and discrete mathematics)
- **Destrava:** M37 (Computational complexity), L25 (Reasoning, search and compositional generalization), K05 (Neurosymbolic systems), F02 (Functionalism and computationalism), X03 (Artificial life and self-reproducing automata)

## Base

1. Alfabetos e linguagens; autômatos finitos determinísticos e não determinísticos; equivalência.
2. Expressões regulares; lema do bombeamento.
3. Gramáticas livres de contexto e autômatos de pilha — o seu parser.
4. Máquinas de Turing e a tese de Church–Turing.
5. Decidibilidade; o problema da parada (halting problem) e sua prova por diagonalização **M06**.
6. Reduções e teorema de Rice.

## Meio

- Máquina de Turing universal; um interpretador como máquina universal.
- Funções recursivas e cálculo lambda (equivalência com máquinas de Turing).
- Complexidade de Kolmogorov e a incomputabilidade da compressão ideal.
- Incompletude de Gödel vista pela computação.

## Avançado

- Expressividade de redes: RNNs com precisão infinita são Turing-completas (Siegelmann & Sontag); transformers de precisão finita ficam em classes de circuitos pequenas sem chain-of-thought → M37→ L25.
- Hipercomputação e o argumento de Penrose–Lucas — e por que quase todos os lógicos o rejeitam → F02.
- Computação física: o que significa um sistema físico "implementar" uma computação, problema que alimenta o debate sobre consciência em máquinas → S11.

## Matemática necessária

**M13**: combinatória; **M06**: provas por diagonalização e indução; **M05**: lógica e conjuntos.

## Métodos

- Sipser em vídeo (18.404J) e em livro, provando cada teorema.
- Implemente simulador de máquina de Turing, NFA → DFA, minimização de DFA e regex → NFA (Thompson).
- Escreva um interpretador de cálculo lambda e codifique os numerais de Church.

## Desafios

- Confundir "indecidível" com "difícil": é impossível no caso geral, não lento.
- Achar que o problema da parada impede analisar programas específicos: impede o caso geral.
- Usar Gödel para conclusões vagas sobre mentes — a maior fonte de má filosofia neste tema.

## Fontes

- 🎓 [Theory of Computation (18.404J)](https://ocw.mit.edu/courses/18-404j-theory-of-computation-fall-2020/) — Michael Sipser (MIT OpenCourseWare), 2020 · curso. aulas do autor do livro-texto padrão
- 📄 [On Computable Numbers, with an Application to the Entscheidungsproblem](https://doi.org/10.1112/plms/s2-42.1.230) — Alan M. Turing, 1937 · paper. o paper fundador
- 📄 [Why Philosophers Should Care About Computational Complexity](https://arxiv.org/abs/1108.1791) — Scott Aaronson, 2011 · paper
- 📄 [On the Computational Power of Neural Nets](https://doi.org/10.1006/jcss.1995.1013) — Hava T. Siegelmann & Eduardo D. Sontag, 1995 · paper

## Boss fight

Escreva em REIXU ou C: (1) um simulador de máquinas de Turing com uma máquina universal codificada; (2) um compilador de regex para NFA (Thompson), daí para DFA (subconjuntos) e DFA mínimo (Hopcroft); (3) um interpretador de cálculo lambda com aritmética de Church. Prove por escrito a indecidibilidade do problema da parada e o teorema de Rice, mostrando exatamente onde a diagonalização entra.

## Checkpoint

- [ ] Prove que {aⁿbⁿ} não é regular.
- [ ] Prove que o problema da parada é indecidível.
- [ ] O que diz o teorema de Rice? Dê uma propriedade de programas indecidível.
- [ ] Que classe de gramática o parser do seu compilador reconhece, e que tipo de autômato corresponde a ela?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
