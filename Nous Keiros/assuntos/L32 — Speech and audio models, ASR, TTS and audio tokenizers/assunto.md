# L32 — Speech and audio models: ASR, TTS and audio tokenizers

*Modelos de fala e áudio: ASR, TTS e tokens de áudio*

- **Trilha:** Machine Learning
- **Nível:** 8 — Escala · onda 1
- **Termos:** speech recognition, ASR, CTC, Whisper, wav2vec 2.0, text-to-speech, TTS, vocoder, neural audio codec, audio tokens, AudioLM, WER
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Uma IA que escuta e fala precisa transformar ondas de pressão em representações e de volta. Áudio é o caso mais claro de sinal contínuo encontrando modelos de sequência: espectrogramas, codecs neurais que viram "tokens de áudio" e transformers que transcrevem ou sintetizam voz. Para o Rei Ichi conversar em voz, este é o assunto.

## Pré-requisitos

- **Depende de:** L14 (Transformers), M31 (Fourier analysis and signal processing)
- **Destrava:** L21 (Multimodal models)

## Base

1. Som como sinal: amostragem, espectro, espectrogramas e escala mel **M31**.
2. Reconhecimento de fala (ASR): do pipeline clássico ao end-to-end; a perda CTC.
3. Encoder-decoder para fala: Whisper e o treino fracamente supervisionado em escala **L14**.
4. Aprendizado auto-supervisionado em áudio: wav2vec 2.0.
5. Síntese de fala (TTS): Tacotron 2 e vocoders neurais.
6. Codecs neurais e tokens de áudio: SoundStream e EnCodec.
7. Avaliação: WER, MOS e testes de inteligibilidade.

## Meio

- Modelos de linguagem sobre tokens de áudio (AudioLM).
- Detecção de atividade de voz e diarização (quem falou quando).
- Fala em português: dados, sotaques e avaliação.
- Latência e streaming para conversa em tempo real.

## Avançado

- Modelos de fala full-duplex, que escutam e falam ao mesmo tempo.
- Multimodalidade texto-áudio-visão (prévia de → L21).
- Riscos: clonagem de voz e marca d'água em áudio.

## Matemática necessária

**M31**: Fourier e amostragem; **L14**: transformers.

## Métodos

- Faça o Audio Course da Hugging Face.
- Calcule espectrogramas mel à mão em NumPy e compare com uma biblioteca.
- Rode um modelo aberto de ASR e um de TTS no M1 e meça o WER em gravações suas em português.

## Desafios

- Errar a taxa de amostragem e perder metade do sinal (aliasing).
- Medir WER sem normalizar o texto (maiúsculas, pontuação, números).
- Ignorar a latência quando o objetivo é conversar.

## Fontes

- 📖 [Speech and Language Processing (3rd ed. draft)](https://web.stanford.edu/~jurafsky/slp3/) — Daniel Jurafsky & James H. Martin · livro. capítulos de reconhecimento e síntese de fala
- 📄 [Connectionist Temporal Classification: Labelling Unsegmented Sequence Data with Recurrent Neural Networks](https://www.cs.toronto.edu/~graves/icml_2006.pdf) — Alex Graves, Santiago Fernández, Faustino Gomez & Jürgen Schmidhuber, 2006 · paper
- 📄 [wav2vec 2.0: A Framework for Self-Supervised Learning of Speech Representations](https://arxiv.org/abs/2006.11477) — Alexei Baevski et al., 2020 · paper
- 📄 [Robust Speech Recognition via Large-Scale Weak Supervision](https://arxiv.org/abs/2212.04356) — Alec Radford et al., 2022 · paper. o Whisper
- 📄 [Natural TTS Synthesis by Conditioning WaveNet on Mel Spectrogram Predictions](https://arxiv.org/abs/1712.05884) — Jonathan Shen et al., 2018 · paper. o Tacotron 2
- 📄 [High Fidelity Neural Audio Compression](https://arxiv.org/abs/2210.13438) — Alexandre Défossez et al., 2022 · paper. o EnCodec
- 📄 [AudioLM: a Language Modeling Approach to Audio Generation](https://arxiv.org/abs/2209.03143) — Zalán Borsos et al., 2022 · paper
- 🆕 [Moshi: a speech-text foundation model for real-time dialogue](https://arxiv.org/abs/2410.00037) — Alexandre Défossez et al., 2024 · recente
- 🎓 [Audio Course](https://huggingface.co/learn/audio-course) — Hugging Face · curso

## Boss fight

Dê voz ao Rei Ichi: um pipeline que escuta (ASR com um modelo aberto rodando no M1), entende (o seu modelo de linguagem) e responde falando (TTS aberto), com medição de latência de ponta a ponta. Avalie o WER em 20 minutos de áudio seu em português, com a normalização documentada, e compare dois modelos de ASR. Escreva onde está o gargalo de latência e o que faria para conversar em tempo real.

## Checkpoint

- [ ] O que é um espectrograma mel, e por que a escala mel?
- [ ] Que problema a perda CTC resolve no reconhecimento de fala?
- [ ] O que um codec neural como o EnCodec produz, e por que isso permite modelos de linguagem de áudio?
- [ ] Como se calcula o WER?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
