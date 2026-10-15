# C14 — C and systems programming: memory, pointers and concurrency

*C e programação de sistemas: memória, ponteiros e concorrência*

- **Trilha:** Computing for AI
- **Nível:** 1 — Provas e código · onda 1
- **Termos:** C programming, pointers, memory management, stack, heap, undefined behavior, sanitizers, POSIX threads, concurrency
- **Projetos KEIROS:** REIXU

## Por que importa

Vinte e três assuntos deste mapa pedem que você implemente algo em C — de bigints a autograd e kernels. C é a linguagem em que a máquina aparece sem disfarce: memória como bytes endereçáveis, ponteiros, layout de structs, o custo de cada acesso. É também a base do REIXU e de quase toda a infraestrutura de IA: PyTorch, llama.cpp e CUDA são C e C++ por baixo.

## Pré-requisitos

- **Depende de:** C13 (Unix shell, Git and research tooling), M01 (Arithmetic: natural numbers and integers)
- **Destrava:** C03 (Scalar automatic differentiation from scratch), C06 (Computer architecture for AI), C15 (Algorithms and data structures)

## Base

1. Compilação: pré-processador, compilador e linker; clang no Mac; avisos (`-Wall -Wextra`) e otimização.
2. Tipos e representação: inteiros com e sem sinal, tamanho e alinhamento, complemento de dois **M01**; ponto flutuante como bits (prévia de → M32).
3. Ponteiros e arrays: aritmética de ponteiros, strings terminadas em zero, ponteiros para função.
4. Memória: pilha e heap, `malloc`/`free`, tempo de vida, vazamentos e use-after-free.
5. Structs, unions e layout de memória; array de structs vs. struct de arrays.
6. Ferramentas: make, depuração com lldb, AddressSanitizer e UndefinedBehaviorSanitizer.
7. Comportamento indefinido: overflow com sinal, aliasing, leitura fora dos limites.

## Meio

- Processos e chamadas de sistema: `fork`/`exec`, arquivos, `mmap`.
- Concorrência: threads POSIX, condições de corrida, mutexes, variáveis de condição e deadlock.
- Atomics e o modelo de memória do C11 (acquire/release).
- Medir: tempo, contagem de instruções e leitura do assembly gerado (Compiler Explorer).

## Avançado

- Alocadores próprios (arena, pool) — o padrão de memória de runtimes de ML e de compiladores.
- Estruturas lock-free e filas produtor-consumidor.
- Interoperabilidade: chamar C a partir de Python (ctypes, cffi) e de Swift.
- C moderno (C11, C17, C23) e quando C++ ou Rust fazem mais sentido.

## Matemática necessária

**M01**: representação binária, complemento de dois e aritmética modular.

## Métodos

- Leia Modern C (Gustedt) com o compilador aberto: compile cada exemplo com `-Wall -Wextra -fsanitize=address,undefined`.
- Faça os labs do CS:APP (Data Lab, Bomb Lab, Malloc Lab).
- Leia a parte de concorrência do OSTEP e implemente cada exemplo.
- Reescreva em C um script Python seu e meça a diferença.

## Desafios

- Ponteiros "funcionam" até não funcionarem: comportamento indefinido nem sempre quebra na hora.
- Esquecer quem é dono de cada bloco de memória.
- Confiar em testes rodados sem sanitizers.
- Condições de corrida que só aparecem uma vez em mil execuções.

## Fontes

- 📖 [Modern C](https://gustedt.gitlabpages.inria.fr/modern-c/) — Jens Gustedt · livro. livre; C17 e C23
- 📖 [Computer Systems: A Programmer's Perspective (3rd ed.)](https://csapp.cs.cmu.edu/) — Randal E. Bryant & David R. O'Hallaron · livro. a referência de sistemas para programadores; labs gratuitos
- 🎓 [15-213: Introduction to Computer Systems](https://www.cs.cmu.edu/~213/) — Carnegie Mellon University · curso
- 📖 [Operating Systems: Three Easy Pieces](https://pages.cs.wisc.edu/~remzi/OSTEP/) — Remzi H. Arpaci-Dusseau & Andrea C. Arpaci-Dusseau · livro. livre; a parte de concorrência
- 🗺️ [Beej's Guide to C Programming](https://beej.us/guide/bgc/) — Brian "Beej Jorgensen" Hall · guia
- 📄 [What Every Programmer Should Know About Memory](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf) — Ulrich Drepper, 2007 · paper
- 🔧 [AddressSanitizer](https://clang.llvm.org/docs/AddressSanitizer.html) — Projeto LLVM · ferramenta
- 🔧 [Compiler Explorer](https://godbolt.org/) — Matt Godbolt · ferramenta

## Boss fight

Escreva em C uma pequena biblioteca de tensores para o REIXU: um tipo com shape, strides e buffer próprio, criação, fatiamento sem cópia, soma e produto elemento a elemento, com um alocador de arena e testes que passam limpos sob AddressSanitizer e UndefinedBehaviorSanitizer. Depois paralelize a soma com threads POSIX e mostre, com medições no M1, quando duas, quatro e oito threads ajudam e quando atrapalham.

## Checkpoint

- [ ] Qual a diferença entre um array e um ponteiro em C, e onde ela aparece?
- [ ] O que é use-after-free, e como o AddressSanitizer o detecta?
- [ ] Por que somar 1 a `INT_MAX` é comportamento indefinido, mas o mesmo com `unsigned` não é?
- [ ] O que é uma condição de corrida, e como um mutex a evita?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
