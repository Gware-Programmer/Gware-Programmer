# I05 — Sparse dictionaries: SAEs, transcoders and attribution graphs

*Dicionários esparsos: SAEs, transcoders e grafos de atribuição*

- **Trilha:** Mechanistic Interpretability
- **Nível:** 10 — Circuitos e agentes · onda 2
- **Termos:** sparse autoencoders, transcoders, cross-layer transcoders, attribution graphs, circuit tracing

## Por que importa

Se a rede guarda features em superposição, dá para "desembaralhá-las" com dicionários esparsos. SAEs, transcoders e cross-layer transcoders viraram o método central da interpretabilidade em 2023–2026, culminando nos grafos de atribuição que mostram cadeias de computação dentro de modelos de produção — com limitações que os próprios autores documentam.

## Pré-requisitos

- **Depende de:** I03 (Causal interventions and circuit discovery), I04 (Superposition and the linear representation hypothesis)
- **Destrava:** I06 (Interpretability frontier: introspection, auditing and reasoning), AL05 (Interpretability for safety), Z06 (Open your model: probes, SAEs and circuits)

## Base

1. Sparse autoencoders (SAEs): reconstruir ativações com poucas features ativas (L1, top-k, JumpReLU) **M27**.
2. Avaliação: reconstrução, esparsidade, perda downstream, interpretabilidade automática.
3. "Towards" e "Scaling Monosemanticity": features interpretáveis em escala.
4. Transcoders: substituir o MLP por uma versão esparsa e interpretável.
5. Cross-layer transcoders (CLTs) e o modelo de substituição.
6. Grafos de atribuição (circuit tracing) e seus "nós de erro".

## Meio

- Ferramentas abertas: Gemma Scope, circuit-tracer, Neuronpedia.
- Patologias: feature splitting, absorção, "matéria escura" (o que não se reconstrói).
- Avaliação sistemática com o SAEBench.

## Avançado

- O que os grafos de atribuição revelaram (planejamento de rimas, raciocínio em dois passos, aritmética) e o que ainda escapa (atenção, reconstrução incompleta).
- As features são do modelo ou do dicionário? A fidelidade dos modelos de substituição está em debate.
- Decomposição no espaço de parâmetros como alternativa → I06.

## Matemática necessária

**M27**: otimização esparsa (L1); **M19**: dicionários e projeções; **M38**: validação causal.

## Métodos

- Treine um SAE pequeno em ativações de um modelo aberto na sua 3090.
- Use o Neuronpedia e o circuit-tracer para gerar e ler grafos de atribuição no Gemma-2-2B.
- Valide uma hipótese tirada do grafo com intervenção (steering ou ablação de features).

## Desafios

- Interpretar features só pelos exemplos de ativação máxima.
- Ignorar o erro de reconstrução.
- Tomar o grafo como "o modelo": ele é uma hipótese sobre o modelo.

## Fontes

- 📰 [Towards Monosemanticity: Decomposing Language Models With Dictionary Learning](https://transformer-circuits.pub/2023/monosemantic-features/index.html) — Trenton Bricken et al. (Anthropic), 2023 · artigo
- 📰 [Scaling Monosemanticity: Extracting Interpretable Features from Claude 3 Sonnet](https://transformer-circuits.pub/2024/scaling-monosemanticity/index.html) — Adly Templeton et al. (Anthropic), 2024 · artigo
- 📄 [Transcoders Find Interpretable LLM Feature Circuits](https://arxiv.org/abs/2406.11944) — Jacob Dunefsky, Philippe Chlenski & Neel Nanda, 2024 · paper
- 🆕 [Circuit Tracing: Revealing Computational Graphs in Language Models](https://transformer-circuits.pub/2025/attribution-graphs/methods.html) — Emmanuel Ameisen et al. (Anthropic), 2025 · recente
- 🆕 [On the Biology of a Large Language Model](https://transformer-circuits.pub/2025/attribution-graphs/biology.html) — Jack Lindsey et al. (Anthropic), 2025 · recente
- 🔧 [circuit-tracer](https://github.com/safety-research/circuit-tracer) — safety-research (GitHub) · ferramenta. grafos de atribuição em modelos abertos

## Boss fight

Treine um SAE (top-k ou JumpReLU) e um transcoder em ativações de um modelo aberto pequeno na sua 3090; avalie reconstrução, esparsidade, perda downstream e interpretabilidade (rotulação automática por LLM, conferida à mão). Depois, com o circuit-tracer no Gemma-2-2B, gere grafos de atribuição para um comportamento seu — por exemplo, raciocínio em dois passos em português —, formule uma hipótese e teste-a com intervenções em features.

## Checkpoint

- [ ] Por que um SAE recupera features que estão em superposição?
- [ ] O que é um transcoder e por que ele permite atribuição de feature para feature?
- [ ] O que são os nós de erro de um grafo de atribuição?
- [ ] Cite duas patologias de SAEs e como detectá-las.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
