# B02 — Neural decoding and motor BCIs

*Decodificação neural e BCIs motoras*

- **Trilha:** Mind–Machine Interfaces
- **Nível:** 8 — Escala · onda 1
- **Termos:** neural decoding, Kalman filter decoder, intracortical BCI, closed loop

## Por que importa

Interfaces cérebro-computador intracorticais já permitem que pessoas com paralisia controlem cursores e braços robóticos e escrevam pensando nos movimentos da mão. O núcleo de tudo é decodificação: do filtro de Kalman às redes recorrentes, e do laço aberto ao laço fechado, em que cérebro e decodificador aprendem juntos.

## Pré-requisitos

- **Depende de:** B01 (Neural recording and signals), N04 (Neural coding), L06 (Probabilistic graphical models and filtering)
- **Destrava:** B03 (Speech and language BCIs)

## Base

1. Decodificação de movimento: sintonia cossenoidal e vetor de população **N04**.
2. O filtro de Kalman como decodificador: modelo de estado (cinemática) e modelo de observação (disparos) **L06**.
3. BCIs intracorticais em pessoas com tetraplegia: controle de cursor (2006) e de braço robótico (2012) no programa BrainGate.
4. Laço fechado e recalibração: o ReFIT e o salto de desempenho por desenho do algoritmo de controle.
5. Comparação sistemática de métodos de aprendizado de máquina para decodificação.
6. Dinâmica latente de populações: LFADS e o Neural Latents Benchmark.

## Meio

- Escrita por pensamento: decodificar a tentativa de escrever à mão (Willett et al., 2021).
- Interface cérebro-medula: voltar a andar após lesão medular (Lorach et al., 2023).
- Co-adaptação: o cérebro também aprende o decodificador.

## Avançado

- Neuropróteses de fala → B03.
- Estimulação para devolver tato: interfaces bidirecionais → B07.
- Decodificação entre sessões e pessoas com modelos de fundação → B04.

## Matemática necessária

**M22**, **M23**: o filtro de Kalman como inferência gaussiana; **M24**: regressão e validação; **M19**: redução de dimensionalidade.

## Métodos

- Use o conjunto MC_Maze do Neural Latents Benchmark para treinar decodificadores.
- Implemente decodificadores de Wiener, Kalman e RNN e compare-os.
- Leia o livro de Wolpaw & Wolpaw para a visão clínica e de engenharia.

## Desafios

- Avaliar só offline: o desempenho em laço fechado pode ser muito diferente.
- Vazamento entre treino e teste em séries temporais.

## Fontes

- 📖 [Brain–Computer Interfaces: Principles and Practice](https://doi.org/10.1093/acprof:oso/9780195388855.001.0001) — Jonathan R. Wolpaw & Elizabeth Winter Wolpaw (orgs.), 2012 · livro
- 📄 [Bayesian Population Decoding of Motor Cortical Activity Using a Kalman Filter](https://doi.org/10.1162/089976606774841585) — Wei Wu, Yun Gao, Elie Bienenstock, John P. Donoghue & Michael J. Black, 2006 · paper
- 📄 [Neuronal ensemble control of prosthetic devices by a human with tetraplegia](https://doi.org/10.1038/nature04970) — Leigh R. Hochberg et al., 2006 · paper
- 📄 [A high-performance neural prosthesis enabled by control algorithm design](https://doi.org/10.1038/nn.3265) — Vikash Gilja et al., 2012 · paper
- 📄 [Machine Learning for Neural Decoding](https://doi.org/10.1523/ENEURO.0506-19.2020) — Joshua I. Glaser, Ari S. Benjamin, Raeed H. Chowdhury, Matthew G. Perich, Lee E. Miller & Konrad P. Kording, 2020 · paper
- 📄 [High-performance brain-to-text communication via handwriting](https://doi.org/10.1038/s41586-021-03506-2) — Francis R. Willett, Donald T. Avansino, Leigh R. Hochberg, Jaimie M. Henderson & Krishna V. Shenoy, 2021 · paper
- 🎓 [Neuromatch Academy: Computational Neuroscience](https://compneuro.neuromatch.io/) — Neuromatch · curso. aulas em vídeo e notebooks em Python
- 🆕 [A high-performance brain–computer interface for finger decoding and quadcopter game control in an individual with paralysis](https://doi.org/10.1038/s41591-024-03341-8) — Matthew S. Willsey et al., 2025 · recente

## Boss fight

Com o MC_Maze do Neural Latents Benchmark, implemente e compare decodificadores da velocidade da mão: Wiener, Kalman, RNN e um modelo de dinâmica latente simplificado no estilo LFADS. Depois simule laço fechado — um "usuário" que corrige o cursor a partir do erro visual, com atraso — e mostre como o desempenho difere do offline. Por fim, escreva em C a inferência do melhor decodificador e meça se ela cabe em menos de 10 ms por passo no M1.

## Checkpoint

- [ ] Como o filtro de Kalman é usado como decodificador e o que são seus dois modelos?
- [ ] Por que o desempenho em laço fechado difere do offline?
- [ ] O que o ReFIT mudou?
- [ ] O que é decodificação por dinâmica latente?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
