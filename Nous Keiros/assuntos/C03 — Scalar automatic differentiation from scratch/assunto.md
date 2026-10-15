# C03 — Scalar automatic differentiation from scratch

*Autodiferenciação escalar do zero*

- **Trilha:** Computing for AI
- **Nível:** 3 — Cálculo e incerteza · onda 2
- **Termos:** automatic differentiation, reverse mode, computational graph, micrograd
- **Projetos KEIROS:** REIXU

## Por que importa

Autodiferenciação é o motor de todo deep learning: sem ela ninguém treinaria redes com bilhões de parâmetros. Construir uma do zero — um grafo de computação com backward pela regra da cadeia — desmonta a "mágica" e é o primeiro grande chefe de quem quer entender IA por dentro.

## Pré-requisitos

- **Depende de:** C02 (NumPy: vectorization, broadcasting and memory layout), M14 (Single-variable differential calculus), C14 (C and systems programming: memory, pointers and concurrency)
- **Destrava:** C04 (PyTorch: tensors, autograd and the training loop), L08 (Neural networks and backpropagation)

Novo pré-requisito: **C14** — o boss é escrito em C.

## Base

1. Grafo computacional: nós são operações, arestas são dependências.
2. Diferenciação numérica vs. simbólica vs. automática (modos forward e reverse).
3. Modo forward com números duais (dual numbers).
4. Modo reverso (backpropagation): forward guardando valores, backward acumulando gradientes pela regra da cadeia **M14**.
5. Ordenação topológica para o backward; soma de gradientes quando um nó é reutilizado.
6. Um neurônio e uma rede minúscula treinados com o seu próprio autograd, como no micrograd.

## Meio

- Custos: o forward escala com o número de entradas, o reverse com o número de saídas — por isso redes usam o reverse.
- Memória: o que precisa ser guardado para o backward (as ativações).
- Verificação por diferenças finitas (gradient checking).
- Pontos não diferenciáveis (ReLU em 0, max) e subgradientes.

## Avançado

- A história certa: Wengert (1964), Linnainmaa (1970) e Rumelhart, Hinton e Williams (1986) — backpropagation é um caso particular do modo reverso.
- Diferenciar programas com if e laços: o grafo é o rastro da execução (tape).
- Checkpointing e derivadas de ordem superior → C05.

## Matemática necessária

**M14**: derivadas e regra da cadeia.

## Métodos

- Siga a aula do micrograd (Karpathy) linha por linha; depois apague tudo e reescreva sem olhar.
- Implemente primeiro em Python, depois em C ou REIXU (alocação de nós, tape, liberação de memória).
- Teste cada operação contra diferenças finitas.

## Desafios

- Esquecer de zerar gradientes entre iterações.
- Sobrescrever em vez de somar o gradiente de um nó reutilizado (o certo é somar).
- Achar que autodiff é diferenciação simbólica: ela não produz fórmulas, produz números exatos até o arredondamento.

## Fontes

- 🎬 [Neural Networks: Zero to Hero — aula 1 (micrograd)](https://karpathy.ai/zero-to-hero.html) — Andrej Karpathy · video
- 🔧 [micrograd](https://github.com/karpathy/micrograd) — Andrej Karpathy · ferramenta. cerca de 150 linhas com toda a essência
- 📄 [Automatic Differentiation in Machine Learning: a Survey](https://arxiv.org/abs/1502.05767) — Atılım Güneş Baydin, Barak A. Pearlmutter, Alexey Andreyevich Radul & Jeffrey Mark Siskind, 2018 · paper
- 📄 [A simple automatic derivative evaluation program](https://doi.org/10.1145/355586.364791) — R. E. Wengert, 1964 · paper. o modo forward já em 1964
- 📄 [Learning representations by back-propagating errors](https://doi.org/10.1038/323533a0) — David E. Rumelhart, Geoffrey E. Hinton & Ronald J. Williams, 1986 · paper

## Boss fight

Escreva um autograd escalar em C ou REIXU (não em Python): nós alocados em arena, tape, backward por ordenação topológica, operações +, ×, potência, exp, log, tanh e ReLU, e modo forward com números duais. Treine com ele uma rede minúscula de duas camadas para separar duas classes no plano, como no micrograd (a teoria completa vem em → L08), verifique todos os gradientes por diferenças finitas e compare a velocidade com o micrograd em Python.

## Checkpoint

- [ ] Por que o modo reverso é preferível ao forward para treinar redes?
- [ ] Desenhe o grafo de f(x, y) = (x·y + sen x)² e faça o backward à mão.
- [ ] Por que os gradientes de um nó usado duas vezes devem ser somados?
- [ ] O que precisa ser guardado do forward para fazer o backward?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
