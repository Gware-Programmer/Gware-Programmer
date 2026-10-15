# B01 — Neural recording and signals

*Registro neural e sinais*

- **Trilha:** Mind–Machine Interfaces
- **Nível:** 5 — A matemática do aprendizado · onda 1
- **Termos:** neural recording, EEG, ECoG, Utah array, Neuropixels, spike sorting

## Por que importa

Toda interface cérebro-computador e toda neurociência de sistemas começam num sinal: do EEG no couro cabeludo a milhares de neurônios registrados ao mesmo tempo por sondas Neuropixels. Saber o que cada técnica mede, com que resolução e com que ruído — e como transformar voltagem bruta em disparos — é a base prática da neurotecnologia.

## Pré-requisitos

- **Depende de:** N01 (The brain for engineers), M31 (Fourier analysis and signal processing)
- **Destrava:** B02 (Neural decoding and motor BCIs)

## Base

1. A origem dos sinais extracelulares: correntes sinápticas, potenciais de ação, LFP, ECoG e EEG **N01**.
2. Resolução espacial × temporal × invasividade: EEG/MEG, ECoG, arranjos intracorticais (Utah), sondas de alta densidade (Neuropixels), imagem de cálcio e fMRI.
3. Amostragem, filtragem e ruído: Nyquist, filtros passa-banda, referência comum, artefatos **M31**.
4. Ordenação de disparos (spike sorting): detecção, extração de características, agrupamento, curadoria.
5. Formatos e dados abertos: NWB e o arquivo DANDI.

## Meio

- Neuropixels 2.0: registros estáveis por longos períodos em animais.
- Deriva (drift) dos eletrodos e sua correção.
- EEG de consumo vs. de pesquisa: o que dá para medir com hardware barato e o que não dá.

## Avançado

- De centenas para dezenas de milhares de canais: escala e modelos de fundação neurais → B04.
- Biocompatibilidade e longevidade de implantes → B07.
- Registros em humanos, consentimento e privacidade → B07.

## Matemática necessária

**M31**: Fourier, filtragem e amostragem; **M17**: álgebra linear (projeções e referenciamento).

## Métodos

- Leia Buzsáki, Anastassiou & Koch (2012) para entender de onde vem cada sinal.
- Baixe uma sessão de Neuropixels do DANDI e rode o Kilosort4 pelo SpikeInterface.
- Compare a saída com e sem correção de deriva.

## Desafios

- Filtrar e criar artefatos (ringing) que parecem dados.
- Confiar em ordenação automática de disparos sem curadoria.

## Fontes

- 📄 [The origin of extracellular fields and currents — EEG, ECoG, LFP and spikes](https://doi.org/10.1038/nrn3241) — György Buzsáki, Costas A. Anastassiou & Christof Koch, 2012 · paper
- 📄 [Fully integrated silicon probes for high-density recording of neural activity](https://doi.org/10.1038/nature24636) — James J. Jun et al., 2017 · paper. a sonda Neuropixels
- 📄 [Neuropixels 2.0: A miniaturized high-density probe for stable, long-term brain recordings](https://doi.org/10.1126/science.abf4588) — Nicholas A. Steinmetz et al., 2021 · paper
- 📄 [Spike sorting with Kilosort4](https://doi.org/10.1038/s41592-024-02232-7) — Marius Pachitariu, Shashwat Sridhar, Jacob Pennington & Carsen Stringer, 2024 · paper
- 🔧 [SpikeInterface, a unified framework for spike sorting](https://doi.org/10.7554/eLife.61834) — Alessio P. Buccino et al., 2020 · ferramenta
- 🗃️ [DANDI Archive — open neurophysiology data in NWB](https://dandiarchive.org/) — DANDI · dados
- 🎓 [9.40 Introduction to Neural Computation](https://ocw.mit.edu/courses/9-40-introduction-to-neural-computation-spring-2018/) — Michale Fee (MIT OpenCourseWare) · curso. aulas em vídeo
- 🔧 [MNE-Python](https://mne.tools/) — Projeto MNE · ferramenta. análise de EEG e MEG

## Boss fight

Construa um pipeline completo: baixe uma sessão de Neuropixels do DANDI, aplique filtragem e referência comum, rode o Kilosort4 pelo SpikeInterface, faça curadoria com métricas de qualidade e gere um relatório por unidade (forma de onda, taxa, violações de período refratário). Depois escreva em C, para o M1, um detector de disparos por limiar com filtro IIR e meça a latência por amostra: o que seria preciso para rodar isso em tempo real dentro de um implante?

## Checkpoint

- [ ] O que EEG, LFP e disparos medem e de onde vem cada sinal?
- [ ] Compare EEG, ECoG, arranjos de Utah e Neuropixels em resolução e invasividade.
- [ ] Quais são as etapas da ordenação de disparos?
- [ ] Por que a deriva dos eletrodos é um problema e como ela é corrigida?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
