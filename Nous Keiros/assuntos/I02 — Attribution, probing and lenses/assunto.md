# I02 — Attribution, probing and lenses

*Atribuição, probing e lentes*

- **Trilha:** Mechanistic Interpretability
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** attribution, integrated gradients, probing, logit lens

## Por que importa

Antes dos circuitos, as ferramentas mais usadas para olhar dentro de modelos foram a atribuição (que entradas importam), as sondas (o que está representado) e as lentes (o que cada camada "prevê"). Saber usá-las — e saber quando mentem — é obrigatório para qualquer interpretabilidade honesta.

## Pré-requisitos

- **Depende de:** I01 (Interpretability foundations and the mechanistic program)
- **Destrava:** I03 (Causal interventions and circuit discovery)

## Base

1. Saliência por gradiente e gradiente × entrada **M21**.
2. Integrated Gradients e seus axiomas.
3. Sanity checks: mapas de saliência que não dependem do modelo.
4. Sondas lineares **L02** e controles (tarefas de controle, seletividade).
5. Logit lens e tuned lens: decodificar o fluxo residual camada a camada.
6. Correlação vs. uso: uma sonda acertar não prova que o modelo usa a informação.

## Meio

- Sondas não lineares e o risco de a sonda aprender a tarefa sozinha.
- Atribuição por oclusão, ablação e valores de Shapley.
- Atribuição a dados de treino (funções de influência).

## Avançado

- Sondas de verdade e mentira e seu uso em segurança → AL05.
- Atribuição em escala: grafos de atribuição → I05.
- Limites teóricos: nenhum método de atribuição satisfaz todos os axiomas desejáveis ao mesmo tempo.

## Matemática necessária

**M21**: gradientes; **M24**: estatística para controles de sondas; **M19**: projeções.

## Métodos

- Implemente gradiente, Integrated Gradients e oclusão; rode os sanity checks e veja quais métodos falham.
- Treine sondas lineares camada a camada para várias propriedades, sempre com tarefas de controle.
- Aplique logit lens e tuned lens a um modelo aberto e compare.

## Desafios

- Sondas com capacidade demais.
- Mapa de saliência bonito tomado como explicação.
- Esquecer a linha de base (o que é "ausência de sinal" no Integrated Gradients).

## Fontes

- 📄 [Axiomatic Attribution for Deep Networks](https://arxiv.org/abs/1703.01365) — Mukund Sundararajan, Ankur Taly & Qiqi Yan, 2017 · paper. o Integrated Gradients
- 📄 [Sanity Checks for Saliency Maps](https://arxiv.org/abs/1810.03292) — Julius Adebayo, Justin Gilmer, Michael Muelly, Ian Goodfellow, Moritz Hardt & Been Kim, 2018 · paper
- 🧭 [Probing Classifiers: Promises, Shortcomings, and Advances](https://arxiv.org/abs/2102.12452) — Yonatan Belinkov, 2022 · review
- 📄 [Designing and Interpreting Probes with Control Tasks](https://arxiv.org/abs/1909.03368) — John Hewitt & Percy Liang, 2019 · paper
- 📰 [interpreting GPT: the logit lens](https://www.lesswrong.com/posts/AcKRB8wDpdaN6v6ru/interpreting-gpt-the-logit-lens) — nostalgebraist, 2020 · artigo
- 📄 [Eliciting Latent Predictions from Transformers with the Tuned Lens](https://arxiv.org/abs/2303.08112) — Nora Belrose et al., 2023 · paper
- 🎓 [ARENA](https://www.arena.education/) — ARENA · curso. exercícios práticos de interpretabilidade, avaliações e RL
- 🆕 [Are Sparse Autoencoders Useful? A Case Study in Sparse Probing](https://arxiv.org/abs/2502.16681) — Subhash Kantamneni et al., 2025 · recente

## Boss fight

Num modelo aberto pequeno (GPT-2 small ou Pythia), implemente gradiente × entrada, Integrated Gradients, oclusão, logit lens e tuned lens; aplique os sanity checks de randomização e mostre quais métodos falham. Treine sondas lineares por camada para três propriedades (por exemplo, número gramatical, sujeito, sentimento), com tarefas de controle, e escreva onde a informação aparece e por que isso não prova que ela é usada.

## Checkpoint

- [ ] Que axiomas o Integrated Gradients satisfaz?
- [ ] O que um sanity check de randomização revela?
- [ ] Por que uma sonda bem-sucedida não prova que o modelo usa a informação?
- [ ] O que o logit lens mostra e que limitação o tuned lens corrige?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
