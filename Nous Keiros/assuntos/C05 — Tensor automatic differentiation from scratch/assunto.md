# C05 — Tensor automatic differentiation from scratch

*Autodiferenciação tensorial do zero*

- **Trilha:** Computing for AI
- **Nível:** 5 — A matemática do aprendizado · onda 1
- **Termos:** tensor autodiff, VJP, JVP, checkpointing, tinygrad, minitorch
- **Projetos KEIROS:** REIXU

## Por que importa

Depois do autograd escalar vem o de verdade: autodiff sobre tensores, com broadcasting, VJPs por operação e gestão de memória. É o que separa quem usa frameworks de quem pode construir um — e a base para entender compiladores de ML, checkpointing e otimizações de memória.

## Pré-requisitos

- **Depende de:** C04 (PyTorch: tensors, autograd and the training loop), M21 (Matrix calculus)
- **Destrava:** C12 (ML compilers)

## Base

1. Tensores com shape, strides e dtype; operações elementares e reduções com broadcasting.
2. Regras de VJP por operação **M21**: matmul, soma com broadcasting (reduzir o gradiente ao shape original), reshape, transpose, exp, log, softmax.
3. Motor de backward: tape, ordenação topológica, acumulação e liberação de buffers.
4. JVP (forward mode), e por que JVP + VJP geram qualquer derivada.
5. Gradientes de reduções e de indexação (scatter/gather).

## Meio

- Checkpointing de ativações: memória × recomputação.
- Derivadas de ordem superior e produtos Hessiana-vetor.
- vmap (vetorização automática) e transformações de funções no estilo JAX.
- Fusão de operações, prévia de compiladores → C12.

## Avançado

- Diferenciar programas com controle de fluxo e soluções de sistemas (diferenciação implícita).
- Autodidax: reconstruir o núcleo do JAX (tracing, jaxprs, transformações compostas).
- Autodiff dentro de uma linguagem: como seria no REIXU (Enzyme fez isso no LLVM).

## Matemática necessária

**M21**: VJP, JVP e cálculo matricial; **M20**: gradientes.

## Métodos

- Faça o MiniTorch (Cornell) até o fim: é um curso inteiro de construir um framework.
- Leia o tinygrad (cabe na cabeça) e o Autodidax.
- Teste cada regra contra o PyTorch com tensores aleatórios.

## Desafios

- Broadcasting no backward: gradiente com shape errado é o bug número um.
- Guardar referências demais e estourar a memória, ou liberar cedo demais e quebrar o backward.
- Diferenças sutis entre view e cópia no backward de operações in-place.

## Fontes

- 🎓 [MiniTorch](https://minitorch.github.io/) — Sasha Rush et al. (Cornell Tech) · curso. construa um framework de deep learning do zero
- 📄 [The Elements of Differentiable Programming](https://arxiv.org/abs/2403.14606) — Mathieu Blondel & Vincent Roulet, 2024 · paper. o livro moderno do assunto
- 🗺️ [Autodidax: JAX core from scratch](https://docs.jax.dev/en/latest/autodidax.html) — The JAX authors · guia
- 🔧 [tinygrad](https://github.com/tinygrad/tinygrad) — tiny corp · ferramenta
- 📖 [Evaluating Derivatives (2ª ed.)](https://doi.org/10.1137/1.9780898717761) — Andreas Griewank & Andrea Walther, 2008 · livro. a referência teórica

## Boss fight

Construa o seu "mini-torch" em C ou REIXU com front-end em Python: tensores com strides, broadcasting, matmul, reduções e softmax; autograd tensorial com cada VJP conferido contra o PyTorch; JVP; checkpointing opcional; e um vmap simples. Treine com ele uma rede totalmente conectada no MNIST até atingir a mesma acurácia do PyTorch e compare memória e tempo.

## Checkpoint

- [ ] Qual o VJP de C = A @ B em relação a A e a B?
- [ ] Como reduzir o gradiente quando houve broadcasting no forward?
- [ ] O que o checkpointing troca, e quando compensa?
- [ ] Como calcular um produto Hessiana-vetor com duas passagens de autodiff?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
