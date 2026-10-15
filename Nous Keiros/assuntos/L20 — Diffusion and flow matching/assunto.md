# L20 — Diffusion and flow matching

*Difusão e flow matching*

- **Trilha:** Machine Learning
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** diffusion models, score matching, flow matching, classifier-free guidance

## Por que importa

Difusão e flow matching geram as melhores imagens, vídeos, áudios e até moléculas de hoje. A ideia — aprender a reverter um processo de ruído — conecta EDEs, score matching e transporte, e já chegou à geração de texto (modelos de linguagem por difusão).

## Pré-requisitos

- **Depende de:** L14 (Transformers), L19 (Latent generative models: VAEs, flows and GANs), M29 (Stochastic processes and stochastic differential equations)
- **Destrava:** L21 (Multimodal models)

## Base

1. Processo direto: ruído gaussiano adicionado em etapas; DDPM **M29**.
2. Objetivo de predição do ruído e sua relação com o score ∇log p.
3. O processo reverso como EDE e a EDO de fluxo de probabilidade (determinística).
4. Flow matching e rectified flow: campos de velocidade entre ruído e dados.
5. Guidance: por classificador e sem classificador (classifier-free).
6. Difusão latente e transformers de difusão (DiT) **L14**.

## Meio

- Amostradores rápidos (DDIM, solvers de EDO), destilação e consistency models.
- Parametrizações (EDM, de Karras et al.).
- Condicionamento por texto.

## Avançado

- Difusão para texto (LLaDA) e o debate autoregressivo vs. difusão.
- Por que a difusão generaliza em vez de memorizar — e quando memoriza dados de treino.
- Difusão em robótica (diffusion policy) → B06 e em world models de vídeo → R09.

## Matemática necessária

**M29**: EDEs; **M25**: inferência variacional; **M26**: KL.

## Métodos

- Siga o tutorial "Step-by-Step Diffusion" e as notas do MIT 6.S184; implemente DDPM e flow matching do zero.
- Compare DDPM, DDIM e flow matching com a mesma rede.
- Visualize o campo de velocidade em 2D com dados sintéticos.

## Desafios

- Confundir predição de ruído, de dado e de velocidade (são reparametrizações).
- Guidance alto demais: saturação e perda de diversidade.
- Avaliar com poucas amostras.

## Fontes

- 📄 [Denoising Diffusion Probabilistic Models](https://arxiv.org/abs/2006.11239) — Jonathan Ho, Ajay Jain & Pieter Abbeel, 2020 · paper
- 📄 [Score-Based Generative Modeling through Stochastic Differential Equations](https://arxiv.org/abs/2011.13456) — Yang Song et al., 2021 · paper
- 📄 [Flow Matching for Generative Modeling](https://arxiv.org/abs/2210.02747) — Yaron Lipman, Ricky T. Q. Chen, Heli Ben-Hamu, Maximilian Nickel & Matt Le, 2022 · paper
- 🗺️ [Step-by-Step Diffusion: An Elementary Tutorial](https://arxiv.org/abs/2406.08929) — Preetum Nakkiran, Arwen Bradley, Hattie Zhou & Madhu Advani, 2024 · guia
- 🎓 [An Introduction to Flow Matching and Diffusion Models (MIT 6.S184)](https://arxiv.org/abs/2506.02070) — Peter Holderrieth & Ezra Erives, 2025 · curso
- 🆕 [The Principles of Diffusion Models](https://arxiv.org/abs/2510.21890) — Chieh-Hsin Lai, Yang Song, Dongjun Kim, Yuki Mitsufuji & Stefano Ermon, 2025 · recente. monografia de referência

## Boss fight

Implemente do zero DDPM, DDIM e flow matching (rectified flow) com a mesma rede (U-Net ou DiT pequeno) e treine no CIFAR-10 ou num dataset seu, na 3090. Compare qualidade (FID), número de passos e tempo. Adicione classifier-free guidance condicionado à classe e meça o trade-off entre qualidade e diversidade.

## Checkpoint

- [ ] Qual a relação entre prever o ruído e estimar o score?
- [ ] O que é a EDO de fluxo de probabilidade e por que ela permite amostrar deterministicamente?
- [ ] Como funciona o classifier-free guidance?
- [ ] Qual a diferença entre difusão e flow matching?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
