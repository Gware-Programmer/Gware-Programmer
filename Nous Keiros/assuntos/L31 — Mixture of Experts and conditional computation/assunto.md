# L31 — Mixture of Experts and conditional computation

*Mixture of Experts e computação condicional*

- **Trilha:** Machine Learning
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** mixture of experts, MoE, sparse models, gating, router, top-k routing, load balancing, expert parallelism, Switch Transformer, Mixtral, DeepSeekMoE, conditional computation, mixture of depths
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Muitos dos maiores modelos abertos de hoje são mixtures of experts: muitos parâmetros no total, poucos ativos por token. É assim que se ganha capacidade sem pagar o custo inteiro a cada passo. Entender roteamento, balanceamento e o custo real de memória é necessário para ler qualquer relatório técnico recente — e para decidir se um MoE cabe no seu M1.

## Pré-requisitos

- **Depende de:** L15 (LLM pretraining)
- **Destrava:** C11 (Efficient inference)

## Base

1. Computação condicional: ativar só parte da rede para cada entrada.
2. A camada MoE: especialistas (FFNs), roteador e seleção top-k **L15**.
3. Balanceamento de carga: perdas auxiliares, capacidade por especialista, tokens descartados.
4. Parâmetros totais vs. ativos; computação vs. memória.
5. Switch Transformer: roteamento top-1 e estabilidade.
6. Paralelismo de especialistas e o custo de comunicação.
7. MoEs abertos: Mixtral e DeepSeekMoE (especialistas finos e compartilhados).

## Meio

- Balanceamento sem perda auxiliar (viés no roteador, como no DeepSeek-V3).
- Especialização: o que cada especialista aprende de fato.
- Ajuste fino e destilação de MoEs.
- Servir MoEs: memória, offloading e quantização (prévia de → C11).

## Avançado

- Mixture of Depths e outras formas de computação adaptativa.
- Upcycling: transformar um modelo denso em MoE.
- Leis de escala para modelos esparsos.

## Matemática necessária

**L15**: o transformer moderno; **M26**: entropia (para medir o balanceamento do roteamento).

## Métodos

- Leia o Switch Transformer e as seções de MoE do relatório do DeepSeek-V3 com caneta na mão.
- Implemente uma camada MoE top-2 em PyTorch, com perda de balanceamento, e treine num modelo pequeno.
- Visualize a carga de cada especialista ao longo do treino.

## Desafios

- Achar que MoE economiza memória: economiza computação; todos os especialistas precisam estar carregados.
- Colapso do roteamento: poucos especialistas recebem quase tudo.
- Comparar MoE e modelo denso por parâmetros totais em vez de ativos.

## Fontes

- 📄 [Outrageously Large Neural Networks: The Sparsely-Gated Mixture-of-Experts Layer](https://arxiv.org/abs/1701.06538) — Noam Shazeer et al., 2017 · paper
- 📄 [GShard: Scaling Giant Models with Conditional Computation and Automatic Sharding](https://arxiv.org/abs/2006.16668) — Dmitry Lepikhin et al., 2020 · paper
- 📄 [Switch Transformers: Scaling to Trillion Parameter Models with Simple and Efficient Sparsity](https://arxiv.org/abs/2101.03961) — William Fedus, Barret Zoph & Noam Shazeer, 2021 · paper
- 🧭 [A Review of Sparse Expert Models in Deep Learning](https://arxiv.org/abs/2209.01667) — William Fedus, Jeff Dean & Barret Zoph, 2022 · review
- 📄 [Mixtral of Experts](https://arxiv.org/abs/2401.04088) — Albert Q. Jiang et al., 2024 · paper
- 📄 [DeepSeekMoE: Towards Ultimate Expert Specialization in Mixture-of-Experts Language Models](https://arxiv.org/abs/2401.06066) — Damai Dai et al., 2024 · paper
- 📄 [Mixture-of-Depths: Dynamically allocating compute in transformer-based language models](https://arxiv.org/abs/2404.02258) — David Raposo et al., 2024 · paper
- 🆕 [DeepSeek-V3 Technical Report](https://arxiv.org/abs/2412.19437) — DeepSeek-AI, 2024 · recente
- 🎓 [CS336: Language Modeling from Scratch](https://cs336.stanford.edu/) — Percy Liang & Tatsunori Hashimoto (Stanford) · curso. aulas e tarefas implementando tudo do zero

## Boss fight

Transforme o modelo que você treinou num MoE: troque as FFNs por 8 especialistas com roteamento top-2 e perda de balanceamento, treine com o mesmo orçamento de computação ativa do modelo denso e compare perplexidade, velocidade e memória no M1. Mostre a carga e a especialização dos especialistas (que tokens cada um recebe) e escreva quando, para você, um MoE vale a pena.

## Checkpoint

- [ ] Qual a diferença entre parâmetros totais e ativos num MoE?
- [ ] Por que é preciso balancear a carga entre os especialistas?
- [ ] Por que um MoE não economiza memória na inferência?
- [ ] O que o roteador top-k decide para cada token?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
