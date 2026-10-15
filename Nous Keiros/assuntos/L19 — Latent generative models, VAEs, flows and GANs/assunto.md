# L19 — Latent generative models: VAEs, flows and GANs

*Modelos generativos latentes: VAEs, flows e GANs*

- **Trilha:** Machine Learning
- **Nível:** 8 — Escala · onda 1
- **Termos:** variational autoencoders, normalizing flows, GANs

## Por que importa

Gerar dados exige modelar distribuições inteiras. VAEs, fluxos normalizantes e GANs são as três respostas clássicas — e cada uma ensina uma ideia que sobrevive nos modelos atuais: inferência amortizada (ELBO), densidades exatas por mudança de variáveis e aprendizado adversarial.

## Pré-requisitos

- **Depende de:** L09 (Training deep networks), M25 (Bayesian inference, MCMC and variational inference)
- **Destrava:** L20 (Diffusion and flow matching), L33 (Energy-based models), R09 (World models)

## Base

1. Modelos de variáveis latentes e a verossimilhança marginal intratável.
2. VAE: encoder (inferência amortizada), decoder, ELBO **M25** e truque de reparametrização.
3. Fluxos normalizantes: mudança de variáveis com determinante do Jacobiano **M20**; RealNVP.
4. GANs: jogo min-max entre gerador e discriminador; colapso de modos.
5. Métricas: verossimilhança, FID, precisão e recall generativos.

## Meio

- β-VAE e "desemaranhamento" — e os seus limites.
- VQ-VAE e tokens discretos, base de modelos autoregressivos de imagem e áudio.
- Estabilidade de GANs (Wasserstein, normalização espectral).

## Avançado

- VAEs como modelos de um cérebro que comprime e prevê → N10.
- Modelos latentes dentro de world models → R09.
- Identificabilidade dos latentes e representações causais → M38.

## Matemática necessária

**M25**: inferência variacional e ELBO; **M20**: Jacobiano; **M26**: KL.

## Métodos

- Implemente VAE, RealNVP e uma DCGAN e compare amostras e métricas.
- Derive à mão a ELBO e o gradiente com reparametrização.
- Interpole no espaço latente e descreva o que muda.

## Desafios

- Colapso do posterior em VAEs com decoders poderosos.
- Colapso de modos escondido em amostras escolhidas a dedo.
- Comparar FIDs calculados com implementações diferentes.

## Fontes

- 📄 [Auto-Encoding Variational Bayes](https://arxiv.org/abs/1312.6114) — Diederik P. Kingma & Max Welling, 2013 · paper
- 📄 [Generative Adversarial Networks](https://arxiv.org/abs/1406.2661) — Ian J. Goodfellow et al., 2014 · paper
- 🧭 [Normalizing Flows for Probabilistic Modeling and Inference](https://arxiv.org/abs/1912.02762) — George Papamakarios, Eric Nalisnick, Danilo Jimenez Rezende, Shakir Mohamed & Balaji Lakshminarayanan, 2019 · review
- 📄 [Density estimation using Real NVP](https://arxiv.org/abs/1605.08803) — Laurent Dinh, Jascha Sohl-Dickstein & Samy Bengio, 2016 · paper
- 📖 [Understanding Deep Learning](https://udlbook.github.io/udlbook/) — Simon J. D. Prince, 2023 · livro. caps. 14–17
- 🎓 [CS236: Deep Generative Models](https://deepgenerativemodels.github.io/) — Stefano Ermon (Stanford) · curso. notas e aulas
- 🆕 [The GAN is dead; long live the GAN! A Modern GAN Baseline](https://arxiv.org/abs/2501.05441) — Yiwen Huang et al., 2025 · recente

## Boss fight

Implemente do zero um VAE, um RealNVP e uma DCGAN; treine-os no Fashion-MNIST e compare verossimilhança (onde houver), FID e cobertura de modos. Demonstre o colapso do posterior e uma correção, e confira numericamente a mudança de variáveis do fluxo calculando a log-verossimilhança exata de pontos conhecidos.

## Checkpoint

- [ ] Derive a ELBO e diga por que ela é um limite inferior.
- [ ] Para que serve o truque de reparametrização?
- [ ] Por que fluxos precisam de transformações invertíveis com Jacobiano barato?
- [ ] O que é colapso de modos?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
