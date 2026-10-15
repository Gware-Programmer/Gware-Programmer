# B03 — Speech and language BCIs

*BCIs de fala e linguagem*

- **Trilha:** Mind–Machine Interfaces
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** speech neuroprosthesis, inner speech decoding, brain-to-text

## Por que importa

Em 2023, duas equipes mostraram neuropróteses de fala decodificando dezenas de palavras por minuto de pessoas que não conseguem falar; em 2025 vieram a síntese de voz quase instantânea e a decodificação de fala interna. É onde LLMs, neurociência da linguagem e privacidade mental colidem.

## Pré-requisitos

- **Depende de:** B02 (Neural decoding and motor BCIs), L15 (LLM pretraining), G05 (Language: structure, acquisition and processing)
- **Destrava:** B04 (Neural foundation models and brain decoding), B07 (Neuroethics, neurorights and bidirectional interfaces)

## Base

1. Da articulação tentada ao texto: córtex motor ventral com arranjos intracorticais (Willett et al., 2023) e ECoG (Metzger et al., 2023) **B02**.
2. A pilha de decodificação: rede recorrente → fonemas → modelo de linguagem para palavras **L15**.
3. Calibração rápida e alta precisão em uso prolongado (Card et al., 2024).
4. Síntese de voz em tempo real a partir da atividade cortical (Wairagkar et al., 2025).
5. Fala interna no córtex motor e o risco de decodificar o que a pessoa não quis dizer — com uma "senha" mental para evitar isso (Kunz et al., 2025).
6. Decodificação não invasiva: reconstrução semântica de linguagem por fMRI (Tang et al., 2023), com limites importantes **G05**.

## Meio

- O benchmark Brain-to-Text '24 e o que ele ensinou.
- O modelo de linguagem como prior: ganho de precisão e risco de frases plausíveis e erradas.
- Métricas: taxa de erro de palavras e palavras por minuto.

## Avançado

- Privacidade mental: decodificar fala interna sem intenção questão ética aberta → B07
- Modelos de fundação para dados neurais de fala → B04
- O que a decodificação revela sobre a organização da linguagem no cérebro → N12

## Matemática necessária

**M22**: decodificação bayesiana com prior de linguagem; **M26**: perplexidade e informação; **M24**: avaliação estatística.

## Métodos

- Leia Willett et al. (2023) e Metzger et al. (2023) juntos.
- Treine um decodificador no conjunto público do Brain-to-Text.
- Leia Tang et al. (2023) com atenção à seção sobre privacidade e cooperação do participante.

## Desafios

- Atribuir ao cérebro o acerto que é do modelo de linguagem.
- Esquecer que a maioria dos resultados vem de poucos participantes.

## Fontes

- 📄 [A high-performance speech neuroprosthesis](https://doi.org/10.1038/s41586-023-06377-x) — Francis R. Willett et al., 2023 · paper
- 📄 [A high-performance neuroprosthesis for speech decoding and avatar control](https://doi.org/10.1038/s41586-023-06443-4) — Sean L. Metzger et al., 2023 · paper
- 📄 [An Accurate and Rapidly Calibrating Speech Neuroprosthesis](https://doi.org/10.1056/NEJMoa2314132) — Nicholas S. Card et al., 2024 · paper
- 🆕 [An instantaneous voice-synthesis neuroprosthesis](https://doi.org/10.1038/s41586-025-09127-3) — Maitreyee Wairagkar et al., 2025 · recente
- 🆕 [Inner speech in motor cortex and implications for speech neuroprostheses](https://doi.org/10.1016/j.cell.2025.06.015) — Erin M. Kunz et al., 2025 · recente
- 📄 [Semantic reconstruction of continuous language from non-invasive brain recordings](https://doi.org/10.1038/s41593-023-01304-9) — Jerry Tang, Amanda LeBel, Shailee Jain & Alexander G. Huth, 2023 · paper
- 🎓 [Neuromatch Academy: NeuroAI](https://neuroai.neuromatch.io/) — Neuromatch · curso. aulas em vídeo e notebooks

## Boss fight

Treine um decodificador de fala no conjunto público do Brain-to-Text: rede recorrente para fonemas, decodificação com um modelo n-grama e depois com um LLM pequeno como prior. Meça a taxa de erro de palavras com e sem o prior e quantifique quanto do acerto vem do sinal neural e quanto do modelo de linguagem. Feche com uma seção de privacidade: que salvaguardas técnicas — como a senha mental de Kunz et al. — você exigiria antes de usar algo assim.

## Checkpoint

- [ ] Descreva a pilha de decodificação de uma neuroprótese de fala.
- [ ] O que o modelo de linguagem acrescenta e que risco ele traz?
- [ ] O que Kunz et al. (2025) mostraram sobre fala interna e que salvaguarda propuseram?
- [ ] Quais são os limites da decodificação semântica por fMRI?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
