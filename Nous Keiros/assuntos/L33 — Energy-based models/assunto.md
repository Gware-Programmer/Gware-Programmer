# L33 — Energy-based models

*Modelos baseados em energia*

- **Trilha:** Machine Learning
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** energy-based models, Boltzmann distribution, partition function, Hopfield networks, restricted Boltzmann machines, contrastive divergence, Langevin dynamics, score matching, noise-contrastive estimation, JEPA
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Um modelo baseado em energia atribui um número a cada configuração — baixo para o que é compatível, alto para o que não é — sem precisar normalizar uma probabilidade. É a ideia por trás das redes de Hopfield e das máquinas de Boltzmann, da ligação entre difusão e score matching e da proposta de LeCun (JEPA) para máquinas que entendem o mundo.

## Pré-requisitos

- **Depende de:** L19 (Latent generative models: VAEs, flows and GANs), M25 (Bayesian inference, MCMC and variational inference)
- **Destrava:** R09 (World models)

## Base

1. Energia e probabilidade: a distribuição de Boltzmann e a função de partição **M25**.
2. Redes de Hopfield como memória associativa.
3. Máquinas de Boltzmann restritas e divergência contrastiva.
4. Treinar EBMs: máxima verossimilhança e o problema da normalização.
5. Amostrar: MCMC e dinâmica de Langevin.
6. Score matching e a ligação com a difusão (prévia de → L20).
7. Métodos contrastivos vs. regularizados (a taxonomia de LeCun) **L19**.

## Meio

- EBMs para gerar e classificar ao mesmo tempo.
- Redes de Hopfield modernas e a ligação com a atenção.
- Estimação por contraste com ruído (NCE) e InfoNCE.
- Arquiteturas preditivas de embeddings conjuntos (JEPA) (prévia de → R09).

## Avançado

- Raciocínio como minimização de energia na hora da inferência.
- Transformers baseados em energia.
- Física estatística do aprendizado.

## Matemática necessária

**M25**: MCMC e inferência; **L19**: modelos generativos latentes.

## Métodos

- Leia o tutorial de LeCun et al. (2006) e "How to Train Your Energy-Based Models" (Song e Kingma).
- Implemente em NumPy uma rede de Hopfield clássica e uma RBM.
- Treine um EBM pequeno em 2D com dinâmica de Langevin e visualize a paisagem de energia.

## Desafios

- Esquecer que a função de partição é intratável e "normalizar" errado.
- Amostradores MCMC que não misturam e dão amostras enganosas.
- Confundir energia com perda.

## Fontes

- 📄 [A Tutorial on Energy-Based Learning](http://yann.lecun.com/exdb/publis/pdf/lecun-06.pdf) — Yann LeCun, Sumit Chopra, Raia Hadsell, Marc'Aurelio Ranzato & Fu Jie Huang, 2006 · paper
- 📄 [Neural networks and physical systems with emergent collective computational abilities](https://doi.org/10.1073/pnas.79.8.2554) — J. J. Hopfield, 1982 · paper
- 📄 [Training Products of Experts by Minimizing Contrastive Divergence](https://doi.org/10.1162/089976602760128018) — Geoffrey E. Hinton, 2002 · paper
- 📄 [How to Train Your Energy-Based Models](https://arxiv.org/abs/2101.03288) — Yang Song & Diederik P. Kingma, 2021 · paper
- 📄 [Implicit Generation and Generalization in Energy-Based Models](https://arxiv.org/abs/1903.08689) — Yilun Du & Igor Mordatch, 2019 · paper
- 📄 [Hopfield Networks is All You Need](https://arxiv.org/abs/2008.02217) — Hubert Ramsauer et al., 2020 · paper
- 📄 [A Path Towards Autonomous Machine Intelligence](https://openreview.net/forum?id=BZ5a1r-kVsf) — Yann LeCun, 2022 · paper
- 🆕 [Energy-Based Transformers are Scalable Learners and Thinkers](https://arxiv.org/abs/2507.02092) — Alexi Gladstone et al., 2025 · recente
- 📖 [Probabilistic Machine Learning: Advanced Topics](https://probml.github.io/pml-book/book2.html) — Kevin P. Murphy, 2023 · livro
- 🎓 [Deep Learning (NYU DS-GA 1008)](https://atcold.github.io/NYU-DLSP21/) — Yann LeCun & Alfredo Canziani (NYU) · curso. aulas em vídeo e notebooks; forte em modelos de energia
- 🎓 [CS236: Deep Generative Models](https://deepgenerativemodels.github.io/) — Stefano Ermon (Stanford) · curso. notas e aulas

## Boss fight

Dê ao Rei Ichi uma memória associativa: implemente uma rede de Hopfield moderna (contínua) que guarda e recupera padrões dos estados internos dele, compare a capacidade com a da rede de Hopfield clássica e mostre a equivalência com uma camada de atenção. Depois treine um EBM pequeno em 2D com dinâmica de Langevin e escreva, com figuras da paisagem de energia, o que o modelo aprendeu e onde a amostragem falha.

## Checkpoint

- [ ] Como a distribuição de Boltzmann transforma energia em probabilidade?
- [ ] Por que a função de partição torna o treino de EBMs difícil?
- [ ] Qual a relação entre uma rede de Hopfield moderna e a atenção?
- [ ] O que a dinâmica de Langevin faz para amostrar de um EBM?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
