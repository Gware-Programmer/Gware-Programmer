# L21 — Multimodal models

*Modelos multimodais*

- **Trilha:** Machine Learning
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** multimodal models, CLIP, vision-language models, speech models

## Por que importa

Os modelos de fronteira veem, ouvem, falam e geram imagens: a multimodalidade é a ponte entre linguagem e mundo — e peça de qualquer agente incorporado ou interface mente-máquina que decodifique cérebro em texto ou imagem.

## Pré-requisitos

- **Depende de:** L10 (Convolutional networks and computer vision), L15 (LLM pretraining), L20 (Diffusion and flow matching), L32 (Speech and audio models: ASR, TTS and audio tokenizers)
- **Destrava:** B04 (Neural foundation models and brain decoding), B06 (Cognitive robotics and embodied AI)

Novo pré-requisito: **L32** — modelos de fala e áudio.

## Base

1. ViT e encoders de imagem; tokens de patch **L10**.
2. Alinhamento contrastivo (CLIP) e espaços compartilhados **L12**.
3. Modelos visão-linguagem (VLMs): encoder visual + projetor + LLM (Flamingo, LLaVA) **L15**.
4. Fala: reconhecimento (Whisper), modelos de áudio e tokens de codecs neurais.
5. Fusão precoce vs. tardia; modelos nativamente multimodais.
6. Geração condicionada a texto **L20**.

## Meio

- Ajuste por instruções visuais e alucinação visual.
- Vídeo: tokens espaço-temporais e seus custos.
- Avaliação multimodal e contaminação.

## Avançado

- Grounding: modelos multimodais "entendem" o mundo? → F03
- Decodificação cérebro → imagem/texto com modelos multimodais → B04.
- Modelos visão-linguagem-ação para robôs → B06.

## Matemática necessária

**M26**: objetivos contrastivos e de máxima verossimilhança; **M19**: projeções lineares entre espaços.

## Métodos

- Construa um VLM mínimo: encoder visual congelado + projetor treinável + LLM pequeno.
- Avalie alucinações com perguntas sobre objetos inexistentes.
- Transcreva áudio em português com Whisper e meça a taxa de erro por palavra.

## Desafios

- Confiar em demos: meça com conjuntos controlados.
- Ignorar vieses de dados (centrados em inglês).

## Fontes

- 📄 [An Image is Worth 16x16 Words: Transformers for Image Recognition at Scale](https://arxiv.org/abs/2010.11929) — Alexey Dosovitskiy et al., 2020 · paper
- 📄 [Learning Transferable Visual Models From Natural Language Supervision](https://arxiv.org/abs/2103.00020) — Alec Radford et al., 2021 · paper
- 📄 [Flamingo: a Visual Language Model for Few-Shot Learning](https://arxiv.org/abs/2204.14198) — Jean-Baptiste Alayrac et al., 2022 · paper
- 📄 [Visual Instruction Tuning](https://arxiv.org/abs/2304.08485) — Haotian Liu, Chunyuan Li, Qingyang Wu & Yong Jae Lee, 2023 · paper. o LLaVA
- 📄 [Robust Speech Recognition via Large-Scale Weak Supervision](https://arxiv.org/abs/2212.04356) — Alec Radford et al., 2022 · paper. o Whisper
- 🆕 [Chameleon: Mixed-Modal Early-Fusion Foundation Models](https://arxiv.org/abs/2405.09818) — Chameleon Team, 2024 · recente

## Boss fight

Construa um VLM mínimo no estilo LLaVA: encoder visual pré-treinado congelado, LLM pequeno congelado e um projetor treinado por você (o primeiro estágio do LLaVA). Avalie descrição de imagens e perguntas visuais num conjunto seu, incluindo um teste de alucinação com objetos ausentes, e reporte as taxas com intervalos de confiança.

## Checkpoint

- [ ] Como um VLM no estilo LLaVA conecta visão e linguagem?
- [ ] O que é fusão precoce e qual a sua vantagem?
- [ ] Por que modelos multimodais alucinam objetos?
- [ ] Como o CLIP é treinado?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
