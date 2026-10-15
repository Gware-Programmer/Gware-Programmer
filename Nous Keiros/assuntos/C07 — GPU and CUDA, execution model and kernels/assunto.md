# C07 — GPU and CUDA: execution model and kernels

*GPU e CUDA: modelo de execução e kernels*

- **Trilha:** Computing for AI
- **Nível:** 5 — A matemática do aprendizado · onda 1
- **Termos:** GPU, CUDA, SIMT, shared memory, tiled matmul

## Por que importa

GPUs são a fábrica da IA. Entender o modelo SIMT, a hierarquia de memória da GPU e como escrever um kernel eficiente é o que permite otimizar treino e inferência — e é o passo natural de quem já escreveu um compilador para ARM64. A sua RTX 3090 (Ampere) é um laboratório excelente.

## Pré-requisitos

- **Depende de:** C04 (PyTorch: tensors, autograd and the training loop), C06 (Computer architecture for AI)
- **Destrava:** C08 (Numerical precision, efficient attention and frontier kernels), C09 (Distributed training), C10 (AI hardware), C12 (ML compilers)

## Base

1. Modelo de execução: threads, warps de 32, blocos e grid; SIMT e divergência.
2. Hierarquia de memória: registradores, shared memory, L1/L2, memória global; coalescência.
3. Kernels CUDA básicos: soma de vetores, redução, scan (soma de prefixos), transposição.
4. Matmul com blocos em shared memory; ocupância; conflitos de banco.
5. Tensor cores e precisões (fp16, bf16, tf32, int8).
6. Profiling com Nsight Compute e Nsight Systems; roofline da GPU **C06**.

## Meio

- Streams, sincronização, cópias assíncronas e sobreposição de comunicação com computação.
- Triton: kernels programados por blocos, em Python.
- Fusão de operações (elemento a elemento + redução) e por que ela economiza banda.
- CUTLASS/CuTe e a álgebra de layouts.

## Avançado

- Kernels de atenção (FlashAttention) → C08 e DSLs de kernel → C12.
- Arquiteturas recentes (Hopper, Blackwell): TMA, MMA por warpgroup, fp4 — o que muda no modelo de programação.
- GPUs da Apple (Metal) vs. CUDA: memória unificada e limites práticos.

## Matemática necessária

**M17**: matrizes e multiplicação em blocos; **M03**: ordens de grandeza.

## Métodos

- Use o PMPP como livro-texto e a comunidade GPU MODE como sala de aula.
- Refaça na sua 3090 o worklog de matmul de Simon Boehm, do ingênuo ao quase-cuBLAS.
- Nunca otimize sem medir: profile tudo no Nsight.

## Desafios

- Acesso não coalescido à memória global derruba o desempenho em uma ordem de grandeza.
- Divergência de warp e conflitos de banco, invisíveis sem profiler.
- Comparar com cuBLAS sem fixar tamanhos e precisão.

## Fontes

- 📖 [Programming Massively Parallel Processors (4th ed.)](https://shop.elsevier.com/books/programming-massively-parallel-processors/hwu/978-0-323-91231-0) — Wen-mei W. Hwu, David B. Kirk & Izzat El Hajj, 2022 · livro
- 🗺️ [CUDA C++ Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/) — NVIDIA · guia
- 📰 [How to Optimize a CUDA Matmul Kernel for cuBLAS-like Performance: a Worklog](https://siboehm.com/articles/22/CUDA-MMM) — Simon Boehm, 2022 · artigo
- 🎓 [GPU MODE lectures](https://github.com/gpu-mode/lectures) — Comunidade GPU MODE · curso
- 🗺️ [Triton tutorials](https://triton-lang.org/main/getting-started/tutorials/index.html) — Triton (OpenAI) · guia

## Boss fight

Na RTX 3090: escreva em CUDA uma redução, um scan e um matmul fp32 que chegue a pelo menos 70% do cuBLAS, mais um matmul fp16 com tensor cores (WMMA ou mma.sync). Reescreva o matmul em Triton e compare. Para cada versão, entregue o perfil do Nsight Compute e a posição no roofline da 3090, explicando qual é o gargalo.

## Checkpoint

- [ ] O que é coalescência e por que importa?
- [ ] Para que serve a shared memory num matmul em blocos?
- [ ] O que limita a ocupância de um kernel?
- [ ] Por que fundir operações elemento a elemento acelera mesmo sem reduzir FLOPs?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
