# C12 — ML compilers

*Compiladores de ML*

- **Trilha:** Computing for AI
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** ML compilers, XLA, MLIR, Triton, torch.compile, TVM
- **Projetos KEIROS:** REIXU

## Por que importa

Este é o seu território: compiladores de ML transformam grafos de tensores em kernels rápidos, e o conhecimento que construiu o REIXU vale aqui. XLA, MLIR, Triton e torch.compile definem como modelos viram código de máquina — uma área em que um autor de compilador solo pode contribuir de verdade.

## Pré-requisitos

- **Depende de:** C05 (Tensor automatic differentiation from scratch), C07 (GPU and CUDA: execution model and kernels)
- **Destrava:** —

## Base

1. Grafos de computação como IR; níveis de IR (grafo, tensor, laço, hardware).
2. Otimizações de grafo: fusão de operadores, eliminação de subexpressões, escolha de layout.
3. Otimizações de laço: blocagem, vetorização, desenrolamento — o modelo de Halide (algoritmo separado do schedule).
4. Geração de código para GPU com Triton (programação por blocos) **C07**.
5. MLIR: dialetos e lowering progressivo; XLA e StableHLO.
6. torch.compile: Dynamo (captura de bytecode) + Inductor (geração de Triton e C++).

## Meio

- Auto-tuning e modelos de custo (TVM/Ansor).
- Formas dinâmicas e recompilação.
- Autodiff dentro do compilador (Enzyme no LLVM) **C05**.

## Avançado

- Compiladores para hardware novo (neuromórfico, analógico) e DSLs de kernel.
- Superotimização e geração de kernels por busca ou por IA, com verificação formal de equivalência.
- Tensores e autodiff de primeira classe no REIXU: as decisões de IR que um compilador de ML impõe.

## Matemática necessária

**M21**: autodiff e cálculo matricial; **M17**: álgebra de laços e blocos.

## Métodos

- Leia Halide, TVM, MLIR e Triton; para cada um, anote o que o seu compilador já faz e o que falta.
- Use torch.compile com TORCH_LOGS para ver os grafos capturados e os kernels Triton gerados.
- Escreva um pequeno compilador de expressões tensoriais que gere C com NEON e CUDA.

## Desafios

- Subestimar o custo de formas dinâmicas e do próprio tempo de compilação.
- Otimizar o grafo sem um modelo de custo do hardware.

## Fontes

- 📄 [Halide: A Language and Compiler for Optimizing Parallelism, Locality, and Recomputation in Image Processing Pipelines](https://doi.org/10.1145/2491956.2462176) — Jonathan Ragan-Kelley et al., 2013 · paper
- 📄 [TVM: An Automated End-to-End Optimizing Compiler for Deep Learning](https://arxiv.org/abs/1802.04799) — Tianqi Chen et al., 2018 · paper
- 📄 [MLIR: A Compiler Infrastructure for the End of Moore's Law](https://arxiv.org/abs/2002.11054) — Chris Lattner et al., 2020 · paper
- 📄 [Triton: An Intermediate Language and Compiler for Tiled Neural Network Computations](https://doi.org/10.1145/3315508.3329973) — Philippe Tillet, H. T. Kung & David Cox, 2019 · paper
- 📄 [PyTorch 2: Faster Machine Learning Through Dynamic Python Bytecode Transformation and Graph Compilation](https://doi.org/10.1145/3620665.3640366) — Jason Ansel et al., 2024 · paper
- 🧭 [The Deep Learning Compiler: A Comprehensive Survey](https://arxiv.org/abs/2002.03794) — Mingzhen Li et al., 2020 · review
- 🎓 [Machine Learning Compilation](https://mlc.ai/summer22/) — Tianqi Chen · curso. aulas e notebooks

## Boss fight

Escreva um mini compilador de ML: recebe um grafo de operações tensoriais (do seu mini-torch ou do torch.fx), aplica fusão de operadores elemento a elemento e blocagem de matmul guiada por um modelo de custo simples, e gera C com NEON (para o M1) e CUDA (para a 3090). Compare com o PyTorch eager e com o torch.compile em três grafos de teste — um MLP, uma normalização seguida de softmax e um bloco de atenção que você reencontra em → L14 — e escreva o que levaria dessa experiência para o REIXU.

## Checkpoint

- [ ] Por que fundir operadores acelera modelos limitados por memória?
- [ ] O que o Halide separou, e por que isso foi tão importante?
- [ ] O que é um dialeto MLIR e o que é lowering progressivo?
- [ ] Como o torch.compile captura o grafo de um programa Python?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
