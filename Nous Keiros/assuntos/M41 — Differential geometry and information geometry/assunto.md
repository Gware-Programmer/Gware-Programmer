# M41 — Differential geometry and information geometry

*Geometria diferencial e geometria da informação*

- **Trilha:** Mathematics
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** differential geometry, manifolds, Fisher information, natural gradient

## Por que importa

Espaços de modelos não são planos: a geometria da informação mede distâncias entre distribuições pela informação de Fisher, e o gradiente natural segue essa geometria. Variedades (manifolds) descrevem a "hipótese da variedade" dos dados e as dinâmicas neurais de baixa dimensão.

## Pré-requisitos

- **Depende de:** M21 (Matrix calculus), M26 (Information theory), M33 (Real analysis)
- **Destrava:** —

## Base

1. Variedades suaves: cartas, atlas e exemplos (esfera, toro, grupo de rotações).
2. Espaço tangente, campos vetoriais e diferencial de um mapa **M21**.
3. Métricas riemannianas, comprimento e geodésicas.
4. Família estatística como variedade; informação de Fisher como métrica **M26**.
5. Gradiente natural (Amari): o gradiente na métrica de Fisher.
6. A KL como "distância" local: KL ≈ ½·dθᵀ F dθ.

## Meio

- Conexões, curvatura (noção) e a geometria dual das famílias exponenciais.
- Aproximações práticas do gradiente natural (diagonal, K-FAC) e TRPO/PPO como gradiente natural com restrição de KL → R06.
- Otimização em variedades (matrizes ortogonais, variedade de Stiefel) e otimizadores que ortogonalizam atualizações.

## Avançado

- Hipótese da variedade e geometria de representações em redes e cérebros (variedades neurais) → N12.
- Teoria singular do aprendizado (Watanabe): quando a Fisher é degenerada, a geometria usual quebra — uma teoria recente de generalização → L26.
- Geometria da informação e o princípio da energia livre → N10.

## Matemática necessária

**M33**: análise real; **M26**: KL e informação; **M21**: diferenciais.

## Métodos

- Nielsen (introdução elementar) primeiro; Amari para profundidade; Lee para variedades com rigor.
- Visualize geodésicas na esfera e na variedade das gaussianas 1D com a métrica de Fisher.
- Implemente gradiente natural para regressão logística e compare com o gradiente comum.

## Desafios

- O formalismo de variedades pode virar fim em si: mantenha exemplos computáveis.
- Fisher degenerada (modelos superparametrizados) invalida aproximações ingênuas.

## Fontes

- 📄 [An Elementary Introduction to Information Geometry](https://arxiv.org/abs/1808.08271) — Frank Nielsen, 2020 · paper. o ponto de entrada
- 📖 [Information Geometry and Its Applications](https://link.springer.com/book/10.1007/978-4-431-55978-8) — Shun-ichi Amari, 2016 · livro
- 📄 [Natural Gradient Works Efficiently in Learning](https://doi.org/10.1162/089976698300017746) — Shun-ichi Amari, 1998 · paper
- 📄 [New Insights and Perspectives on the Natural Gradient Method](https://arxiv.org/abs/1412.1193) — James Martens, 2020 · paper
- 📖 [Introduction to Smooth Manifolds (2nd ed.)](https://link.springer.com/book/10.1007/978-1-4419-9982-5) — John M. Lee, 2012 · livro

**Exceções na regra de materiais:**

- sem aula ou vídeo: não há curso em vídeo aberto e estável sobre este tema
- sem material prático: matemática pura: a prática é o boss fight
- sem material de entrada: a entrada é o texto introdutório de Frank Nielsen

## Boss fight

Mostre, com derivação e gráfico de geodésicas, que a família das gaussianas 1D com a métrica de Fisher é o semiplano hiperbólico. Implemente gradiente natural exato e aproximado (diagonal) para regressão logística e para uma família exponencial, e compare trajetórias e invariância à reparametrização com o gradiente comum.

## Checkpoint

- [ ] Defina informação de Fisher e explique por que ela é uma métrica no espaço de parâmetros.
- [ ] Por que o gradiente natural é invariante à reparametrização?
- [ ] Mostre que KL(p_θ ‖ p_{θ+dθ}) ≈ ½·dθᵀ F(θ) dθ.
- [ ] O que é a hipótese da variedade dos dados?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
