# B04 — Neural foundation models and brain decoding

*Modelos de fundação neurais e decodificação cerebral*

- **Trilha:** Mind–Machine Interfaces
- **Nível:** 11 — Segurança · onda 1
- **Termos:** neural foundation models, brain decoding, fMRI reconstruction

## Por que importa

A receita que criou os LLMs — muitos dados, transformers, pré-treino — está sendo aplicada a dados neurais: modelos que decodificam entre sessões e pessoas, gêmeos digitais do córtex e reconstrução de imagens a partir de fMRI. É uma fronteira ativa onde é fácil se enganar com resultados espetaculares.

## Pré-requisitos

- **Depende de:** B03 (Speech and language BCIs), N12 (NeuroAI: comparing brains and artificial networks), L21 (Multimodal models)
- **Destrava:** —

## Base

1. Transformers para atividade neural: os Neural Data Transformers e o pré-treino em vários contextos (NDT2) **L14**.
2. Decodificação escalável entre sessões e animais (POYO).
3. Gêmeos digitais: um modelo de fundação do córtex visual do camundongo que prevê respostas a tipos novos de estímulo **N12**.
4. Reconstrução de imagens vistas a partir de fMRI com modelos de difusão; o conjunto NSD **L20**.
5. Decodificação em tempo real com MEG **L21**.

## Meio

- Reconstruções espúrias: quando a imagem bonita vem do prior generativo, não do cérebro (Shirakawa et al., 2024).
- Como tokenizar disparos e sinais contínuos.
- Leis de escala para dados neurais: a evidência ainda é inicial aberto.

## Avançado

- Modelos de fundação neurais como ferramenta científica ou caixa-preta contestado → N13
- Decodificação e privacidade mental → B07
- Alinhamento entre representações de modelos multimodais e do cérebro.

## Matemática necessária

**M24**: estatística e validação; **M26**: informação; **M19**: redução de dimensionalidade.

## Métodos

- Leia POYO e NDT2 e rode os códigos públicos em dados do DANDI.
- Reproduza a avaliação de Shirakawa et al. como controle de qualquer reconstrução.
- Use o NSD (sob os termos de uso) para um decodificador linear de embeddings de imagem.

## Desafios

- Confundir qualidade visual de reconstruções com informação neural.
- Avaliar só com similaridade de imagens, sem controles do prior.

## Fontes

- 📄 [A Unified, Scalable Framework for Neural Population Decoding](https://arxiv.org/abs/2310.16046) — Mehdi Azabou et al., 2023 · paper. POYO
- 📄 [Neural Data Transformer 2: Multi-context Pretraining for Neural Spiking Activity](https://doi.org/10.1101/2023.09.18.558113) — Joel Ye, Jennifer L. Collinger, Leila Wehbe & Robert Gaunt, 2023 · paper
- 🆕 [Foundation model of neural activity predicts response to new stimulus types](https://doi.org/10.1038/s41586-025-08829-y) — Eric Y. Wang et al., 2025 · recente
- 🗃️ [A massive 7T fMRI dataset to bridge cognitive neuroscience and artificial intelligence](https://doi.org/10.1038/s41593-021-00962-x) — Emily J. Allen et al., 2022 · dados. o NSD
- 📄 [Reconstructing the Mind's Eye: fMRI-to-Image with Contrastive Learning and Diffusion Priors](https://arxiv.org/abs/2305.18274) — Paul S. Scotti et al., 2023 · paper
- 📄 [Spurious reconstruction from brain activity](https://arxiv.org/abs/2405.10078) — Ken Shirakawa et al., 2024 · paper. o controle obrigatório
- 🎓 [Neuromatch Academy: NeuroAI](https://neuroai.neuromatch.io/) — Neuromatch · curso. aulas em vídeo e notebooks

## Boss fight

Pré-treine na RTX 3090 um pequeno transformer de atividade neural, no estilo NDT2/POYO, em várias sessões abertas do DANDI, e teste a decodificação numa sessão nunca vista com poucos exemplos de calibração; compare com um decodificador treinado só na sessão nova. Depois aplique o protocolo de Shirakawa et al. a um modelo público de reconstrução de imagens e meça quanto do resultado vem do prior generativo.

## Checkpoint

- [ ] O que um modelo de fundação neural ganha ao treinar em muitas sessões?
- [ ] O que é um gêmeo digital do córtex e como ele foi validado?
- [ ] Por que reconstruções a partir de fMRI podem ser espúrias?
- [ ] Que controles você exigiria antes de acreditar numa reconstrução?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
