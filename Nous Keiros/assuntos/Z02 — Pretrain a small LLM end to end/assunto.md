# Z02 — Pretrain a small LLM end to end

*Pré-treinar um LLM pequeno de ponta a ponta*

- **Trilha:** Build Your Own AI
- **Nível:** 8 — Escala · onda 4
- **Termos:** end-to-end LLM pretraining, compute-optimal training, scaling laws, modern transformer architecture, RoPE, RMSNorm, SwiGLU, grouped-query attention, training stability, technical report
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Agora o modelo deixa de ser brinquedo: corpus curado por você, arquitetura moderna, orçamento de computação planejado com leis de escala e uma bancada de avaliação honesta. É a versão de um pesquisador solo do que os laboratórios fazem — e o resultado é um modelo base seu, documentado do primeiro byte ao último checkpoint.

## Pré-requisitos

- **Depende de:** Z01 (Train a tiny GPT from scratch), L15 (LLM pretraining), L16 (Scaling laws), L29 (Data for LLMs: collection, filtering, deduplication, mixtures and synthetic data), L30 (LLM evaluation: benchmarks, contamination and harnesses), AL09 (AI governance and licensing of data and models)
- **Destrava:** Z03 (Post-train an open model: SFT, preferences and RLVR), Z06 (Open your model: probes, SAEs and circuits)

## Base

1. Planejar com leis de escala: quantos parâmetros e tokens cabem no seu orçamento **L16**.
2. Corpus: o seu pipeline de dados **L29**.
3. Arquitetura moderna: RoPE, RMSNorm, SwiGLU e atenção com grupos de chaves (GQA) **L15**.
4. Treino estável: precisão mista, picos de perda, z-loss e checkpoints frequentes.
5. Avaliar durante e depois do treino com a sua bancada **L30**.
6. Model card, datasheet e licenças **AL09**.
7. Documentar tudo para que outra pessoa reproduza.

## Meio

- Treinar em nuvem alugada quando o M1 não bastar, com o mesmo código e o custo registrado.
- Comparar com um modelo aberto do mesmo porte (SmolLM2, Pythia) na mesma bancada.
- Curvas de perda por domínio do corpus.

## Avançado

- Estender o contexto depois do pré-treino.
- Treino em dois estágios: terminar com dados de alta qualidade.
- Publicar o modelo e os dados com licenças claras.

## Matemática necessária

**L16**: leis de escala; **P04**: estatística das comparações.

## Métodos

- Use o CS336 e o Smol Training Playbook como roteiro.
- Use o nanochat (Karpathy) como referência de um pipeline completo em escala pequena.
- Faça uma execução minúscula de ponta a ponta antes de gastar computação de verdade.

## Desafios

- Gastar o orçamento antes de testar o pipeline inteiro em miniatura.
- Mudar várias coisas ao mesmo tempo e não saber o que ajudou.
- Ignorar picos de perda até o treino divergir.

## Fontes

- 🎓 [CS336: Language Modeling from Scratch](https://cs336.stanford.edu/) — Percy Liang & Tatsunori Hashimoto (Stanford) · curso
- 🗺️ [The Smol Training Playbook](https://huggingface.co/spaces/HuggingFaceTB/smol-training-playbook) — Hugging Face (equipe HuggingFaceTB), 2025 · guia
- 🔧 [nanochat](https://github.com/karpathy/nanochat) — Andrej Karpathy, 2025 · ferramenta
- 📄 [Training Compute-Optimal Large Language Models](https://arxiv.org/abs/2203.15556) — Jordan Hoffmann et al., 2022 · paper
- 📄 [Pythia: A Suite for Analyzing Large Language Models Across Training and Scaling](https://arxiv.org/abs/2304.01373) — Stella Biderman et al., 2023 · paper
- 🆕 [SmolLM2: When Smol Goes Big -- Data-Centric Training of a Small Language Model](https://arxiv.org/abs/2502.02737) — Loubna Ben Allal et al., 2025 · recente
- 🆕 [2 OLMo 2 Furious](https://arxiv.org/abs/2501.00656) — Team OLMo, 2025 · recente
- 🔧 [torchtitan](https://github.com/pytorch/torchtitan) — PyTorch · ferramenta

## Boss fight

Pré-treine o modelo base da sua IA de ponta a ponta: planeje tamanho e tokens com leis de escala, use o seu corpus e o seu tokenizador, treine com checkpoints e rastreamento, avalie com a sua bancada (com intervalos de confiança) e compare com um modelo aberto do mesmo porte. Entregue o relatório técnico com curvas, decisões, custos, model card e datasheet — e os pesos, se as licenças permitirem.

## Checkpoint

- [ ] Como as leis de escala ajudam a escolher o tamanho do modelo para um orçamento fixo?
- [ ] Por que testar o pipeline inteiro em miniatura antes do treino de verdade?
- [ ] Que sinais mostram que o treino está ficando instável?
- [ ] O que muda entre um modelo base e um modelo pós-treinado?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
