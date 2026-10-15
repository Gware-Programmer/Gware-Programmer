# N11 — Oscillations and large-scale dynamics

*Oscilações e dinâmica em larga escala*

- **Trilha:** Computational Neuroscience
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** neural oscillations, theta-gamma coupling, criticality, EEG/MEG
- **Projetos KEIROS:** Rei Ichi

## Por que importa

O cérebro não é só neurônios disparando: é ritmo. Oscilações, acoplamento entre frequências, criticalidade e redes em larga escala organizam comunicação e memória — e EEG/MEG são a janela barata que um pesquisador independente consegue abrir.

## Pré-requisitos

- **Depende de:** N05 (Neural network dynamics and attractors), M31 (Fourier analysis and signal processing)
- **Destrava:** —

## Base

1. De onde vêm os sinais extracelulares: LFP, ECoG, EEG → B01.
2. Bandas (delta, theta, alfa, beta, gama), análise espectral e tempo-frequência **M31**.
3. Componentes periódicos vs. aperiódicos (1/f) do espectro (Donoghue et al., 2020).
4. Acoplamento theta–gama e o código de sequências (Lisman & Jensen).
5. Comunicação por coerência (Fries) contestado
6. Avalanches neuronais e a hipótese de criticalidade contestado

## Meio

- Modelos de massa neural e dinâmica em larga escala.
- Redes em larga escala: a rede de modo padrão (default mode network) e as redes de atenção.
- MNE-Python para análise de EEG e MEG reais.

## Avançado

- Assinaturas dinâmicas de consciência: ignição e complexidade → S03.
- Sono, replay e consolidação → N07.
- Criticalidade em redes artificiais e a "borda do caos" → X02.

## Matemática necessária

**M31**: Fourier, filtragem e tempo-frequência; **M28**: osciladores e acoplamento.

## Métodos

- Faça os tutoriais do MNE-Python com os dados de exemplo.
- Separe componentes periódicos e aperiódicos com specparam (FOOOF).
- Baixe dados abertos de EEG do OpenNeuro.

## Desafios

- Filtrar o sinal e "descobrir" uma oscilação criada pelo próprio filtro.
- Confundir mudança na inclinação 1/f com mudança de oscilação.

## Fontes

- 📖 [Rhythms of the Brain](https://doi.org/10.1093/acprof:oso/9780195301069.001.0001) — György Buzsáki, 2006 · livro
- 🔧 [MNE-Python — EEG/MEG analysis](https://mne.tools/stable/index.html) — MNE Developers · ferramenta
- 📄 [The Theta-Gamma Neural Code](https://doi.org/10.1016/j.neuron.2013.03.007) — John E. Lisman & Ole Jensen, 2013 · paper
- 📄 [Parameterizing neural power spectra into periodic and aperiodic components](https://doi.org/10.1038/s41593-020-00744-x) — Thomas Donoghue et al., 2020 · paper
- 📄 [A default mode of brain function](https://doi.org/10.1073/pnas.98.2.676) — Marcus E. Raichle et al., 2001 · paper. a rede de modo padrão
- 🧭 [25 years of criticality in neuroscience — established results, open controversies, novel concepts](https://doi.org/10.1016/j.conb.2019.08.002) — Jens Wilting & Viola Priesemann, 2019 · review
- 🗺️ [MNE-Python tutorials](https://mne.tools/stable/auto_tutorials/index.html) — Projeto MNE · guia. EEG/MEG: espectros, oscilações e conectividade na prática
- 🔧 [MNE-Python](https://mne.tools/) — Projeto MNE · ferramenta. análise de EEG e MEG
- 🆕 [Emergent Spatiotemporal Dynamics in Large-Scale Brain Networks with Next Generation Neural Mass Models](https://arxiv.org/abs/2512.03907) — Rosa Maria Delicado, Gemma Huguet & Pau Clusella, 2025 · recente. oscilações em larga escala com modelos de massa neural de nova geração

**Exceções na regra de materiais:**

- sem aula ou vídeo: não há curso em vídeo aberto e estável sobre este tema

## Boss fight

Baixe um conjunto aberto de EEG do OpenNeuro com repouso e tarefa e construa um pipeline reprodutível em MNE: pré-processamento, espectros com separação aperiódica, acoplamento theta–gama por índice de modulação e estatística por permutação entre condições. Depois defina o que seria "repouso" para o subsistema de modo padrão do Rei Ichi, que assinatura dinâmica ele deveria mostrar, e meça se mostra.

## Checkpoint

- [ ] Diferencie componentes periódicos e aperiódicos do espectro.
- [ ] O que é acoplamento theta–gama e que função se propõe para ele?
- [ ] O que é a hipótese de criticalidade e por que ela é contestada?
- [ ] O que é a rede de modo padrão?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
