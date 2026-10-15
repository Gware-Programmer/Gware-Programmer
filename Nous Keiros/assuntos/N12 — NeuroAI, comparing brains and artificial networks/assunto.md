# N12 — NeuroAI: comparing brains and artificial networks

*NeuroAI: comparando cérebros e redes artificiais*

- **Trilha:** Computational Neuroscience
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** NeuroAI, RSA, encoding models, Brain-Score, backprop and the brain
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Comparar cérebros e redes artificiais virou ciência com métodos próprios: RSA, modelos de codificação, CKA, benchmarks como o Brain-Score. Saber fazer essas comparações — e conhecer seus limites — é o que separa "inspirado no cérebro" de afirmação testável sobre o cérebro.

## Pré-requisitos

- **Depende de:** N03 (Synapses and plasticity), N06 (Sensory systems and the visual system), L14 (Transformers)
- **Destrava:** N13 (Connectomics and large-scale neuroscience), B04 (Neural foundation models and brain decoding)

## Base

1. O programa orientado a objetivos: treinar para a tarefa e comparar com o cérebro **N06**.
2. Análise de similaridade representacional (RSA): matrizes de dissimilaridade comparadas entre sistemas **M17**.
3. Modelos de codificação: regressão das ativações para as respostas neurais, com teto de ruído **M24**.
4. Similaridade entre representações: CKA e seus vieses.
5. Benchmarks integrativos: Brain-Score.
6. Linguagem: modelos de linguagem preveem a atividade da rede de linguagem humana **L14**.

## Meio

- Objetivos, arquiteturas e regras de aprendizado como as três escolhas que definem um modelo do cérebro **N03**.
- O programa neuroconexionista.
- A hipótese da representação platônica: modelos diferentes convergem para a mesma representação? contestado

## Avançado

- Predição não é explicação: a crítica "deep problems" contestado
- NeuroAI como fonte de ideias para a IA aposta programática, não consenso
- Gêmeos digitais e modelos de fundação neurais → N13, → B04.

## Matemática necessária

**M17**, **M19**: projeções, regressão e decomposições; **M24**: validação cruzada e incerteza.

## Métodos

- Faça o curso de NeuroAI do Neuromatch.
- Implemente RSA e CKA do zero e teste a sensibilidade a transformações.
- Rode localmente alguns benchmarks do Brain-Score num modelo seu.

## Desafios

- Comparar modelos com uma única métrica e um único conjunto de dados.
- Confundir capacidade preditiva com explicação mecanística.

## Fontes

- 🎓 [Neuromatch Academy: NeuroAI](https://neuroai.neuromatch.io/) — Neuromatch · curso
- 📄 [Using goal-driven deep learning models to understand sensory cortex](https://doi.org/10.1038/nn.4244) — Daniel L. K. Yamins & James J. DiCarlo, 2016 · paper
- 📄 [Representational similarity analysis – connecting the branches of systems neuroscience](https://doi.org/10.3389/neuro.06.004.2008) — Nikolaus Kriegeskorte, Marieke Mur & Peter Bandettini, 2008 · paper
- 📄 [Integrative Benchmarking to Advance Neurally Mechanistic Models of Human Intelligence](https://doi.org/10.1016/j.neuron.2020.07.040) — Martin Schrimpf et al., 2020 · paper
- 📄 [The neural architecture of language: Integrative modeling converges on predictive processing](https://doi.org/10.1073/pnas.2105646118) — Martin Schrimpf et al., 2021 · paper
- 📄 [Deep problems with neural network models of human vision](https://doi.org/10.1017/S0140525X22002813) — Jeffrey S. Bowers et al., 2023 · paper. a crítica

## Boss fight

Pegue o transformer de ~125M parâmetros do Rei Ichi (ou um modelo aberto do mesmo porte) e meça, com modelos de codificação e RSA, quanto suas camadas preveem dados abertos de fMRI de pessoas lendo ou ouvindo linguagem natural. Compare com o mesmo modelo sem treino e com modelos maiores, com validação cruzada e teto de ruído, e escreva o que um resultado positivo provaria — e o que não provaria.

## Checkpoint

- [ ] Como funciona a RSA e por que ela dispensa mapear unidade a unidade?
- [ ] O que é teto de ruído (noise ceiling)?
- [ ] O que o Brain-Score mede e quais são seus limites?
- [ ] Por que prever atividade neural não é o mesmo que explicar o mecanismo?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
