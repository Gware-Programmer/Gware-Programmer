# C06 — Computer architecture for AI

*Arquitetura de computadores para IA*

- **Trilha:** Computing for AI
- **Nível:** 2 — O motor · onda 1
- **Termos:** memory hierarchy, SIMD, roofline model, arithmetic intensity

## Por que importa

Desempenho em IA é limitado por mover dados, não por calcular. O modelo roofline, a hierarquia de memória e a intensidade aritmética explicam por que a FlashAttention existe, por que a inferência de LLMs é limitada por memória e por que o seu M1 e a sua 3090 se comportam tão diferente. Aqui o seu ARM64 vira vantagem direta.

## Pré-requisitos

- **Depende de:** C02 (NumPy: vectorization, broadcasting and memory layout), C14 (C and systems programming: memory, pointers and concurrency)
- **Destrava:** C07 (GPU and CUDA: execution model and kernels)

Novo pré-requisito: **C14** — arquitetura se mede com programas em C.

## Base

1. Hierarquia de memória: registradores, caches L1/L2/L3, DRAM; latência vs. banda.
2. Localidade espacial e temporal; linhas de cache; padrões de acesso.
3. Paralelismo: pipeline, superescalar, SIMD (NEON no ARM64, AVX no x86), múltiplos núcleos.
4. Medir de verdade: contadores de desempenho, Instruments/perf, microbenchmarks honestos.
5. Intensidade aritmética (FLOPs por byte) e o modelo roofline **M03**.
6. Memória unificada (Apple Silicon) vs. memória discreta da GPU ligada por PCIe.

## Meio

- Matmul rápido em CPU: blocagem, empacotamento e microkernels SIMD (o método GotoBLAS/BLIS).
- A banda de memória como limite da inferência de LLMs: cada token lê todos os pesos.
- NUMA, prefetching e false sharing.

## Avançado

- Roofline aplicado a transformers: quando atenção e MLP são limitadas por computação ou por memória, e o papel do batch → C11.
- Aceleradores de matriz (AMX na Apple, tensor cores) → C07.
- Os capítulos de roofline e TPU de "How to Scale Your Model".

## Matemática necessária

**M03**: ordens de grandeza; **M04**: álgebra.

## Métodos

- Microbenchmarks em C e assembly ARM64 no M1: latência por tamanho de array (a "escada" das caches), banda sustentada, pico de FLOPs em NEON.
- Otimize um matmul em C do ingênuo até passar de metade do pico, medindo cada passo.
- Leia Drepper com os seus microbenchmarks rodando ao lado.

## Desafios

- Benchmarks enganosos: código eliminado pelo compilador, sem aquecimento, sem repetições.
- Contar FLOPs e esquecer os bytes.
- Generalizar resultados de CPU para GPU: os modelos de execução são diferentes.

## Fontes

- 📖 [Computer Architecture: A Quantitative Approach (7ª ed.)](https://shop.elsevier.com/books/computer-architecture/hennessy/978-0-443-15406-5) — John L. Hennessy & David A. Patterson · livro
- 📄 [Roofline: An Insightful Visual Performance Model for Multicore Architectures](https://doi.org/10.1145/1498765.1498785) — Samuel Williams, Andrew Waterman & David Patterson, 2009 · paper
- 📰 [What Every Programmer Should Know About Memory](https://people.freebsd.org/~lstewart/articles/cpumemory.pdf) — Ulrich Drepper, 2007 · artigo
- 📰 [Making Deep Learning Go Brrrr From First Principles](https://horace.io/brrr_intro.html) — Horace He, 2022 · artigo. computação vs. memória vs. overhead
- 🗺️ [How To Scale Your Model](https://jax-ml.github.io/scaling-book/) — Austin et al. (Google DeepMind), 2025 · guia. capítulo de rooflines

## Boss fight

No seu M1, meça e plote a latência por tamanho de array, a banda de memória sustentada e o pico de FLOPs em NEON, e construa o roofline da máquina. Depois otimize um matmul fp32 em C (com intrínsecos NEON ou assembly ARM64) até passar de 50% do pico medido, documentando cada otimização com seu ganho e a posição de cada versão no roofline.

## Checkpoint

- [ ] O que é intensidade aritmética e como ela diz se um kernel é limitado por memória ou por computação?
- [ ] Por que gerar um token de um LLM com batch 1 é limitado pela banda de memória?
- [ ] Explique a blocagem do matmul em termos de reuso de cache.
- [ ] Que armadilhas invalidam um microbenchmark?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
