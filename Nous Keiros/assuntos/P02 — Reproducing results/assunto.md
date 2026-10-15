# P02 — Reproducing results

*Reproduzir resultados*

- **Trilha:** Research Craft
- **Nível:** 6 — Aprendizado de máquina · onda 3
- **Termos:** reproducibility, replication, seeds, determinism, experiment tracking

## Por que importa

Reproduzir um resultado publicado é o teste mais honesto de entendimento — e a porta de entrada mais realista para um pesquisador independente publicar. Sementes, não determinismo, vazamento de dados e variância entre execuções explicam por que tanto resultado de ML não se reproduz.

## Pré-requisitos

- **Depende de:** P01 (Reading papers: the three-pass method), L09 (Training deep networks)
- **Destrava:** C16 (ML engineering: experiment tracking, configs, checkpoints and data versioning), P03 (Experimental design and ablations)

## Base

1. Reprodutibilidade, replicabilidade e robustez; o estado da área em IA (Gundersen & Kjensmo, 2018).
2. Fontes de não reprodutibilidade: sementes, não determinismo de GPU, versões de bibliotecas, pré-processamento, hiperparâmetros não relatados **L09**.
3. Deep RL que importa: variância enorme entre sementes e entre implementações (Henderson et al., 2018).
4. Vazamento de dados (leakage) e a crise de reprodutibilidade em ciência feita com ML (Kapoor & Narayanan, 2023).
5. O programa de reprodutibilidade do NeurIPS 2019 e o checklist (Pineau et al.).
6. Infraestrutura: controle de versão, rastreamento de experimentos, ambientes congelados, determinismo no PyTorch.

## Meio

- O MLRC (desafio de reprodutibilidade em ML) como porta de publicação.
- A receita de Karpathy para treinar redes sem se enganar.
- Reproduzir com orçamento pequeno: escalas menores que preservam a pergunta.

## Avançado

- Desenho experimental e ablações → P03
- Estatística para afirmar diferenças → P04
- Reproduzir resultados de consciência e interpretabilidade → S09

## Matemática necessária

**M24**: variância e intervalos; **M22**: probabilidade.

## Métodos

- Siga o guia de reprodutibilidade do PyTorch para tornar um treino determinístico e meça o custo disso.
- Escolha um paper com código e reproduza a figura principal, registrando cada divergência.
- Leia Henderson et al. (2018) e Kapoor & Narayanan (2023).

## Desafios

- Comparar com os números do paper usando outro protocolo de avaliação.
- Reportar uma semente só.

## Fontes

- 📄 [Improving Reproducibility in Machine Learning Research (A Report from the NeurIPS 2019 Reproducibility Program)](https://jmlr.org/papers/v22/20-303.html) — Joelle Pineau et al., 2021 · paper
- 📄 [Deep Reinforcement Learning that Matters](https://arxiv.org/abs/1709.06560) — Peter Henderson, Riashat Islam, Philip Bachman, Joelle Pineau, Doina Precup & David Meger, 2018 · paper
- 📄 [Leakage and the reproducibility crisis in machine-learning-based science](https://doi.org/10.1016/j.patter.2023.100804) — Sayash Kapoor & Arvind Narayanan, 2023 · paper
- 📄 [State of the Art: Reproducibility in Artificial Intelligence](https://doi.org/10.1609/aaai.v32i1.11503) — Odd Erik Gundersen & Sigbjørn Kjensmo, 2018 · paper
- 🗺️ [A Recipe for Training Neural Networks](https://karpathy.github.io/2019/04/25/recipe/) — Andrej Karpathy, 2019 · guia
- 🌐 [MLRC — Machine Learning Reproducibility Challenge](https://reproml.org/) — MLRC · site

## Boss fight

Reproduza de ponta a ponta um resultado publicado de treinamento de redes, com código aberto, das trilhas que você já fez: ambiente congelado, cinco sementes, determinismo onde for possível e registro de cada divergência. Escreva o relatório no formato do MLRC — o que reproduziu, o que não reproduziu e por quê — e submeta ao MLRC ou publique como preprint.

## Checkpoint

- [ ] Diferencie reprodutibilidade de replicabilidade.
- [ ] Cite quatro fontes de não reprodutibilidade em ML.
- [ ] O que é vazamento de dados e por que ele é tão comum?
- [ ] Por que reportar várias sementes?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
