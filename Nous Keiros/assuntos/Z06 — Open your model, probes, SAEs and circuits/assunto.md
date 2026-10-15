# Z06 — Open your model: probes, SAEs and circuits

*Abrir o seu modelo: sondas, SAEs e circuitos*

- **Trilha:** Build Your Own AI
- **Nível:** 10 — Circuitos e agentes · onda 3
- **Termos:** mechanistic interpretability in practice, TransformerLens, nnsight, linear probes, logit lens, activation patching, circuit discovery, sparse autoencoders, SAELens, steering, feature formation during training
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Uma IA que você não consegue olhar por dentro é uma caixa preta, mesmo sendo sua. Aplicar sondas, patching e dicionários esparsos no seu próprio modelo transforma interpretabilidade de leitura em prática — e é uma das áreas em que um pesquisador solo com um modelo pequeno produz resultados de verdade.

## Pré-requisitos

- **Depende de:** Z02 (Pretrain a small LLM end to end), I03 (Causal interventions and circuit discovery), I05 (Sparse dictionaries: SAEs, transcoders and attribution graphs)
- **Destrava:** Z08 (Integrate into Rei Ichi: architecture, ablations and technical report)

## Base

1. Ferramentas: TransformerLens e nnsight; ganchos nas ativações **I03**.
2. Sondas lineares: o que o modelo representa em cada camada.
3. Logit lens e atribuição direta.
4. Activation patching e descoberta de circuitos.
5. Autoencoders esparsos (SAEs) e transcoders **I05**.
6. Validar hipóteses com intervenções (steering e ablação) no seu modelo **Z02**.

## Meio

- Comparar features do seu modelo com as de um modelo aberto (Gemma Scope).
- Ver como uma feature surge ao longo dos checkpoints do pré-treino.
- Interpretar um comportamento específico do seu modelo pós-treinado.

## Avançado

- Grafos de atribuição em modelos pequenos.
- Métricas de qualidade de SAE e os seus limites.
- Interpretabilidade aplicada à segurança (prévia de → AL05).

## Matemática necessária

**I05**: dicionários esparsos; **M19**: SVD e projeções.

## Métodos

- Faça o capítulo de interpretabilidade do ARENA.
- Reproduza o circuito de identificação de objeto indireto (IOI) no GPT-2 small antes de olhar o seu modelo.
- Treine um SAE numa camada do seu modelo com o SAELens.

## Desafios

- Histórias bonitas sem intervenção causal que as confirme.
- Features "interpretáveis" escolhidas a dedo.
- Ignorar o erro de reconstrução do SAE.

## Fontes

- 🔧 [TransformerLens](https://github.com/TransformerLensOrg/TransformerLens) — Neel Nanda et al. · ferramenta
- 🔧 [nnsight](https://nnsight.net/) — NDIF (Northeastern University) · ferramenta
- 🔧 [SAELens](https://github.com/jbloomAus/SAELens) — Joseph Bloom et al. · ferramenta
- 🎓 [ARENA](https://www.arena.education/) — ARENA · curso
- 📄 [Interpretability in the Wild: a Circuit for Indirect Object Identification in GPT-2 small](https://arxiv.org/abs/2211.00593) — Kevin Wang et al., 2022 · paper
- 📄 [Sparse Autoencoders Find Highly Interpretable Features in Language Models](https://arxiv.org/abs/2309.08600) — Hoagy Cunningham et al., 2023 · paper
- 📄 [Gemma Scope: Open Sparse Autoencoders Everywhere All At Once on Gemma 2](https://arxiv.org/abs/2408.05147) — Tom Lieberum et al., 2024 · paper
- 🆕 [Open Problems in Mechanistic Interpretability](https://arxiv.org/abs/2501.16496) — Lee Sharkey et al., 2025 · recente

## Boss fight

Abra a sua IA: treine um SAE numa camada intermediária do modelo de Z02, rotule 30 features com evidência (exemplos que ativam e intervenções que mudam a saída), encontre por patching o circuito de um comportamento simples (por exemplo, concordância de gênero em português) e mostre como essa feature aparece ao longo dos checkpoints do pré-treino. Escreva o relatório como um post de pesquisa, com o que se confirmou e o que foi refutado.

## Checkpoint

- [ ] O que uma sonda linear pode e não pode concluir sobre uma representação?
- [ ] Como o activation patching testa se um componente causa um comportamento?
- [ ] Por que um SAE precisa ser esparso, e o que significa o erro de reconstrução?
- [ ] Que evidência transforma uma feature de "parece interpretável" em "é interpretável"?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
