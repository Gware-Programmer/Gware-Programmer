# P03 — Experimental design and ablations

*Desenho experimental e ablações*

- **Trilha:** Research Craft
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** experimental design, ablation study, baselines, controls, confounds
- **Projetos KEIROS:** MUSUBI, Rei Ichi

## Por que importa

Um experimento só vale o que valem seus controles. Linhas de base fortes, ablações, variáveis de confusão e comparações justas separam "funciona na minha máquina" de conhecimento — e são o padrão que revisores cobram.

## Pré-requisitos

- **Depende de:** P02 (Reproducing results)
- **Destrava:** P05 (Writing a paper)

## Base

1. Pergunta → hipótese → predição → experimento → análise, escritos antes de rodar.
2. Linhas de base fortes, ajustadas com o mesmo orçamento que o seu método (Melis, Dyer & Blunsom) **P02**.
3. Ablações: remover cada componente para medir sua contribuição; ablação vs. análise de sensibilidade.
4. Confundimento (confounding) e controles: o que exatamente se compara com o quê.
5. Variância de benchmarks e orçamento de ajuste: relatar a curva de desempenho em função do orçamento (Bouthillier et al.; Dodge et al.).
6. Tendências problemáticas na escrita de ML: explicação misturada com especulação, ganhos de ajuste atribuídos à arquitetura (Lipton & Steinhardt).

## Meio

- Desenhos fatoriais e varreduras de hiperparâmetros com método (o "Tuning Playbook").
- Inferência causal aplicada a experimentos → M38.
- Avaliação humana e seus vieses.

## Avançado

- Estatística de comparações múltiplas → P04
- Escrever o resultado → P05
- Experimentos de verdade com orçamento de uma pessoa e uma RTX 3090 → P08

## Matemática necessária

**M24**: inferência e variância; **M22**: probabilidade.

## Métodos

- Leia Lipton & Steinhardt (2018) e marque cada tendência problemática num paper recente.
- Use o Deep Learning Tuning Playbook para planejar varreduras.
- Para cada experimento seu, escreva antes o que contaria como resultado negativo.

## Desafios

- Linhas de base fracas ou mal ajustadas.
- Ajustar muito o próprio método e pouco o concorrente.

## Fontes

- 📄 [Troubling Trends in Machine Learning Scholarship](https://arxiv.org/abs/1807.03341) — Zachary C. Lipton & Jacob Steinhardt, 2018 · paper
- 📄 [On the State of the Art of Evaluation in Neural Language Models](https://arxiv.org/abs/1707.05589) — Gábor Melis, Chris Dyer & Phil Blunsom, 2017 · paper
- 📄 [Accounting for Variance in Machine Learning Benchmarks](https://arxiv.org/abs/2103.03098) — Xavier Bouthillier et al., 2021 · paper
- 📄 [Show Your Work: Improved Reporting of Experimental Results](https://arxiv.org/abs/1909.03004) — Jesse Dodge, Suchin Gururangan, Dallas Card, Roy Schwartz & Noah A. Smith, 2019 · paper
- 🗺️ [Deep Learning Tuning Playbook](https://github.com/google-research/tuning_playbook) — Google Research · guia

## Boss fight

Pegue um componente do Rei Ichi ou do MUSUBI que você acredita que ajuda e desenhe o experimento que poderia provar o contrário: hipótese escrita antes, linha de base forte com o mesmo orçamento de ajuste, ablação de cada subcomponente, controles para confundimento, pelo menos cinco sementes e o critério de resultado negativo definido de antemão. Execute e registre o resultado, qualquer que seja.

## Checkpoint

- [ ] O que é uma ablação e o que ela não mostra?
- [ ] Por que linhas de base precisam do mesmo orçamento de ajuste?
- [ ] O que é confundimento? Dê um exemplo em ML.
- [ ] Cite duas tendências problemáticas apontadas por Lipton & Steinhardt.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
