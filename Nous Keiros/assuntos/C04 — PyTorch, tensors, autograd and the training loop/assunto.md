# C04 — PyTorch: tensors, autograd and the training loop

*PyTorch: tensores, autograd e o loop de treino*

- **Trilha:** Computing for AI
- **Nível:** 4 — A máquina de aprender · onda 2
- **Termos:** PyTorch, tensors, autograd, training loop

## Por que importa

PyTorch é a ferramenta padrão da pesquisa em deep learning. Dominar tensores, autograd, nn.Module e o loop de treino é o que permite reproduzir papers e testar ideias depressa — na sua RTX 3090 (CUDA) e no M1 (MPS).

## Pré-requisitos

- **Depende de:** C03 (Scalar automatic differentiation from scratch), M20 (Multivariable calculus and gradients)
- **Destrava:** C05 (Tensor automatic differentiation from scratch), C07 (GPU and CUDA: execution model and kernels), C16 (ML engineering: experiment tracking, configs, checkpoints and data versioning), L09 (Training deep networks), Z01 (Train a tiny GPT from scratch)

## Base

1. Tensores: dtype, device (cpu, cuda, mps) e shape; semântica herdada do NumPy.
2. Autograd: requires_grad, backward, .grad, no_grad, detach; o grafo dinâmico.
3. nn.Module, parâmetros, nn.Linear, ativações e inicialização.
4. Funções de perda e otimizadores: o ciclo forward → perda → backward → step → zero_grad **M20**.
5. Dataset, DataLoader, batches, embaralhamento e sementes.
6. Salvar e carregar checkpoints (state_dict).
7. Modo de treino vs. modo de avaliação (dropout, batchnorm).

## Meio

- GPU na prática: transferências host↔device, sincronização, medir tempo corretamente.
- Precisão mista (autocast, GradScaler) → C08.
- torch.compile, profiler e hooks de forward/backward — os hooks são a base da interpretabilidade → I01.
- Operações customizadas com torch.autograd.Function.

## Avançado

- Por dentro: dispatcher, motor de autograd em C++, alocador de memória CUDA com cache, streams.
- torch.compile (Dynamo + Inductor): captura de grafos a partir do bytecode Python → C12.
- JAX como alternativa funcional (jit, grad, vmap) e quando preferi-lo.

## Matemática necessária

**M20**: gradientes e Jacobianos.

## Métodos

- Refaça no PyTorch tudo o que fez no seu autograd escalar e compare os gradientes.
- Tutoriais oficiais "Learn the Basics" e depois o texto "PyTorch internals".
- Hábito permanente: todo experimento novo começa sobreajustando um único batch (teste de sanidade).

## Desafios

- Esquecer zero_grad, model.eval() ou torch.no_grad() na avaliação.
- Medir tempo de GPU sem torch.cuda.synchronize().
- Vazar memória guardando tensores ligados ao grafo (guarde loss.item(), não loss).
- Diferenças entre CUDA e MPS: operações sem suporte ou não determinísticas.

## Fontes

- 🎓 [Learn the Basics — PyTorch Tutorials](https://docs.pytorch.org/tutorials/beginner/basics/intro.html) — PyTorch · curso
- 📄 [PyTorch: An Imperative Style, High-Performance Deep Learning Library](https://arxiv.org/abs/1912.01703) — Adam Paszke et al., 2019 · paper
- 📰 [PyTorch internals](http://blog.ezyang.com/2019/05/pytorch-internals/) — Edward Z. Yang, 2019 · artigo. como o PyTorch funciona por dentro
- 🎬 [Neural Networks: Zero to Hero — aulas 2 a 4 (makemore)](https://karpathy.ai/zero-to-hero.html) — Andrej Karpathy · video. PyTorch construído passo a passo
- 📄 [PyTorch 2: Faster Machine Learning Through Dynamic Python Bytecode Transformation and Graph Compilation](https://doi.org/10.1145/3620665.3640366) — Jason Ansel et al., 2024 · paper

## Boss fight

Escreva do zero, em PyTorch, um pipeline de treino completo e honesto para classificar dígitos do MNIST: Dataset próprio, DataLoader, modelo, loop com registro, checkpoints, retomada de treino, avaliação, sementes e determinismo — rodando na RTX 3090 (CUDA) e no M1 (MPS). Documente as diferenças numéricas e de velocidade e escreva uma torch.autograd.Function customizada aprovada pelo gradcheck.

## Checkpoint

- [ ] O que acontece se você esquecer optimizer.zero_grad()?
- [ ] Diferencie detach(), no_grad() e requires_grad=False.
- [ ] Como medir corretamente o tempo de um forward na GPU?
- [ ] Por que sobreajustar um único batch é um teste de sanidade?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
