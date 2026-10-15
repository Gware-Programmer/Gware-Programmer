# M31 — Fourier analysis and signal processing

*Análise de Fourier e processamento de sinais*

- **Trilha:** Mathematics
- **Nível:** 4 — A máquina de aprender · onda 1
- **Termos:** Fourier analysis, FFT, convolution, sampling, signal processing

## Por que importa

Todo sinal neural (EEG, LFP, ECoG), toda fala e toda imagem podem ser decompostos em frequências. Fourier é a lente para oscilações cerebrais, para a convolução (o "C" de CNN) e para os filtros de qualquer BCI; a FFT é um dos algoritmos mais importantes já escritos.

## Pré-requisitos

- **Depende de:** M15 (Integral calculus and Taylor series), M17 (Linear algebra I: matrices, linear systems and vector spaces)
- **Destrava:** L10 (Convolutional networks and computer vision), L23 (State space models and post-transformer architectures), L32 (Speech and audio models: ASR, TTS and audio tokenizers), N11 (Oscillations and large-scale dynamics), B01 (Neural recording and signals)

## Base

1. Sinais contínuos e discretos; amostragem; teorema de Nyquist–Shannon e aliasing.
2. Série de Fourier: funções periódicas como soma de senos e cossenos; coeficientes por projeção ortogonal **M17**.
3. Forma complexa com e^{iωt} **M11**.
4. Transformada discreta de Fourier (DFT) como mudança de base; FFT de Cooley–Tukey.
5. Convolução e o teorema da convolução (convolução no tempo = produto na frequência).
6. Filtros passa-baixa, passa-alta e passa-banda; resposta ao impulso; FIR vs. IIR.
7. Espectro de potência e espectrograma (STFT); janelas.

## Meio

- Transformada de Fourier contínua; princípio da incerteza tempo-frequência (Gabor).
- Wavelets e análise tempo-frequência de EEG.
- Densidade espectral de potência (Welch) e coerência entre sinais.
- Sistemas lineares invariantes no tempo (LTI).

## Avançado

- A "convolução" das CNNs (na verdade, correlação cruzada) e a equivariância à translação → L10.
- Modelos de espaço de estados (S4, Mamba) como convoluções longas calculadas por FFT → L23.
- Fourier em grafos e em grupos → L22.
- Fase e acoplamento fase-amplitude em oscilações neurais → N11.

## Matemática necessária

**M15**: integrais; **M17**: bases e ortogonalidade; **M11**: complexos.

## Métodos

- Implemente a DFT ingênua e a FFT radix-2 recursiva e iterativa em C, e otimize — exercício perfeito para quem conhece hardware.
- Analise sinais reais: sua própria voz e um dataset público de EEG.
- Verifique numericamente o teorema da convolução.

## Desafios

- Aliasing por amostragem insuficiente; vazamento espectral (spectral leakage) sem janelas.
- Misturar Hz, frequência angular e índice de bin.
- Ler picos espectrais como "oscilações" quando são harmônicos ou artefatos — como o ruído da rede elétrica de 60 Hz no Brasil.

## Fontes

- 📖 [The Scientist and Engineer's Guide to Digital Signal Processing](https://www.dspguide.com/) — Steven W. Smith · livro. gratuito e prático
- 📖 [Think DSP](https://greenteapress.com/wp/think-dsp/) — Allen B. Downey · livro. gratuito, em Python
- 🎓 [Signals and Systems (6.003)](https://ocw.mit.edu/courses/6-003-signals-and-systems-fall-2011/) — MIT OpenCourseWare · curso
- 📖 [Lectures on the Fourier Transform and its Applications (EE261)](https://see.stanford.edu/materials/lsoftaee261/book-fall-07.pdf) — Brad Osgood (Stanford) · livro. rigor com intuição
- 📄 [An Algorithm for the Machine Calculation of Complex Fourier Series](https://doi.org/10.1090/S0025-5718-1965-0178586-1) — James W. Cooley & John W. Tukey, 1965 · paper. o paper da FFT

## Boss fight

Escreva em C uma FFT radix-2 iterativa (in-place, com bit-reversal) e compare velocidade e erro com FFTW ou NumPy. Use-a para montar um mini-analisador de EEG: filtros FIR passa-banda (teta 4–8 Hz, alfa 8–12 Hz, gama 30–80 Hz), espectrograma com janela de Hann e remoção do ruído de 60 Hz, aplicado a um dataset público com registros de olhos abertos e fechados. Reporte a potência por banda nas duas condições — o ritmo alfa deve aparecer.

## Checkpoint

- [ ] Qual a taxa de amostragem mínima para um sinal com componentes até 100 Hz?
- [ ] Enuncie o teorema da convolução e explique por que ele barateia convoluções longas.
- [ ] Por que a FFT custa O(n log n)?
- [ ] O que é vazamento espectral e como as janelas o reduzem?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
