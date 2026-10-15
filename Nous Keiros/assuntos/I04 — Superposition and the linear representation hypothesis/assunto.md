# I04 — Superposition and the linear representation hypothesis

*Superposição e a hipótese da representação linear*

- **Trilha:** Mechanistic Interpretability
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** superposition, polysemanticity, linear representation hypothesis

## Por que importa

Por que neurônios individuais são confusos (polissemânticos)? Porque redes representam mais features do que têm dimensões, sobrepondo-as quase ortogonalmente. A superposição é a chave para entender por que interpretar redes é difícil — e por que dicionários esparsos ajudam.

## Pré-requisitos

- **Depende de:** I01 (Interpretability foundations and the mechanistic program)
- **Destrava:** I05 (Sparse dictionaries: SAEs, transcoders and attribution graphs)

## Base

1. Features como direções; a hipótese da representação linear **L12**.
2. Polissemanticidade de neurônios.
3. Modelos de brinquedo de superposição: esparsidade × importância × dimensões.
4. Quase ortogonalidade em alta dimensão **M16**.
5. Geometria das features: politopos e interferência.
6. Compressed sensing como analogia: recuperar sinais esparsos de poucas medidas **M19**.

## Meio

- Superposição, memorização e dupla descida em modelos de brinquedo.
- Features não lineares e multidimensionais (dias da semana dispostos em círculo).
- Linearidade causal vs. linearidade de embedding.

## Avançado

- Até onde vale a hipótese linear? Há evidência a favor e contra contestado
- Superposição computacional: não só armazenar, mas computar em superposição.
- Features perigosas escondidas em superposição e suas implicações para segurança → AL05.

## Matemática necessária

**M19**: SVD e geometria; **M23**: probabilidade em alta dimensão; **M16**: produto escalar.

## Métodos

- Reproduza os modelos de brinquedo de superposição (barato e revelador) e mapeie o diagrama de fases.
- Encontre a direção linear de um conceito num modelo aberto (diferença de médias) e teste-a causalmente por steering.
- Reproduza uma feature circular (dias da semana ou meses).

## Desafios

- Supor que toda feature é linear e unidimensional.
- Confundir a direção de uma sonda com uma direção causal.

## Fontes

- 📄 [Toy Models of Superposition](https://arxiv.org/abs/2209.10652) — Nelson Elhage et al. (Anthropic), 2022 · paper
- 📄 [The Linear Representation Hypothesis and the Geometry of Large Language Models](https://arxiv.org/abs/2311.03658) — Kiho Park, Yo Joong Choe & Victor Veitch, 2023 · paper
- 📄 [Not All Language Model Features Are One-Dimensionally Linear](https://arxiv.org/abs/2405.14860) — Joshua Engels, Eric J. Michaud, Isaac Liao, Wes Gurnee & Max Tegmark, 2024 · paper
- 🧭 [Mechanistic Interpretability for AI Safety — A Review](https://arxiv.org/abs/2404.14082) — Leonard Bereska & Efstratios Gavves, 2024 · review

## Boss fight

Reproduza os modelos de brinquedo de superposição: varie esparsidade e importância, mapeie o diagrama de fases e mostre as geometrias que surgem. Depois, num modelo aberto pequeno, encontre a direção linear de um conceito, teste-a causalmente por steering e reproduza uma feature circular como a dos dias da semana.

## Checkpoint

- [ ] O que é superposição e por que ela causa polissemanticidade?
- [ ] Por que a esparsidade das features torna a superposição possível?
- [ ] O que diz a hipótese da representação linear e que evidência a contesta?
- [ ] Qual a relação entre superposição e compressed sensing?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
