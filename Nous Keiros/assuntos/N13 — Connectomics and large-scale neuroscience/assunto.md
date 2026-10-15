# N13 — Connectomics and large-scale neuroscience

*Conectômica e neurociência em larga escala*

- **Trilha:** Computational Neuroscience
- **Nível:** 11 — Segurança · onda 1
- **Termos:** connectomics, MICrONS, FlyWire, brain-wide map, Neuropixels, digital twin

## Por que importa

Pela primeira vez existem o conectoma completo de um cérebro adulto (a mosca), um milímetro cúbico de córtex de camundongo com estrutura e função juntas e um mapa de atividade do cérebro inteiro durante decisões. É a fronteira de dados da neurociência — e o teste real da ideia de emular cérebros.

## Pré-requisitos

- **Depende de:** N05 (Neural network dynamics and attractors), N12 (NeuroAI: comparing brains and artificial networks), M30 (Graph theory and networks)
- **Destrava:** —

## Base

1. Conectômica por microscopia eletrônica: segmentação automática e revisão humana; a escala (1 mm³ de córtex humano ocupa cerca de 1,4 petabyte).
2. FlyWire: o conectoma completo da mosca adulta, com cerca de 140 mil neurônios.
3. MICrONS: estrutura e função medidas no mesmo milímetro cúbico do córtex visual do camundongo.
4. Neuropixels e o mapa de atividade do cérebro inteiro do International Brain Laboratory.
5. Grafos cerebrais: módulos, hubs, propriedades de mundo pequeno **M30**.
6. Do conectoma ao modelo: redes restritas pelo conectoma preveem atividade (Lappalainen et al., 2024).

## Meio

- Gêmeos digitais: modelos de fundação da atividade do córtex visual que generalizam para estímulos novos **N12**.
- Padrões de dados abertos (NWB, DANDI) e ciência aberta.
- O que o conectoma não dá: neuromodulação, plasticidade, parâmetros biofísicos.

## Avançado

- Emulação de cérebro inteiro: o que falta de fato em dados, modelos e validação especulação fundamentada
- Conectomas do camundongo inteiro e do humano: escala e custo.
- Conectoma e consciência: a IIT exige a estrutura causal física → S04.

## Matemática necessária

**M30**: grafos e redes; **M24**: estatística em larga escala; **M19**: redução de dimensionalidade.

## Métodos

- Explore os navegadores públicos FlyWire Codex e MICrONS Explorer.
- Analise o grafo do FlyWire com NetworkX: graus, motivos e módulos.
- Simule uma rede restrita por um subcircuito do conectoma.

## Desafios

- Achar que conectoma é função.
- Ignorar os erros de reconstrução.

## Fontes

- 📖 [Networks of the Brain](https://doi.org/10.7551/mitpress/8476.001.0001) — Olaf Sporns, 2010 · livro
- 📄 [Neuronal wiring diagram of an adult brain](https://doi.org/10.1038/s41586-024-07558-y) — Sven Dorkenwald et al., 2024 · paper. FlyWire
- 🆕 [Functional connectomics spanning multiple areas of mouse visual cortex](https://doi.org/10.1038/s41586-025-08790-w) — The MICrONS Consortium, 2025 · recente
- 🆕 [A brain-wide map of neural activity during complex behaviour](https://doi.org/10.1038/s41586-025-09235-0) — International Brain Laboratory, 2025 · recente
- 🆕 [Foundation model of neural activity predicts response to new stimulus types](https://doi.org/10.1038/s41586-025-08829-y) — Eric Y. Wang et al., 2025 · recente. um gêmeo digital do córtex visual
- 🗃️ [FlyWire Codex — explorador do conectoma](https://codex.flywire.ai/) — FlyWire Consortium · dados

## Boss fight

Baixe o conectoma do FlyWire, extraia um subcircuito com função conhecida (por exemplo, detecção de movimento na via visual), construa uma rede restrita pelo conectoma com parâmetros treináveis e compare suas predições com a atividade relatada por Lappalainen et al. Depois escreva um relatório técnico sobre o que seria necessário — dados, computação, validação — para emular o cérebro inteiro da mosca, com números e fontes, não adjetivos.

## Checkpoint

- [ ] O que um conectoma revela e o que ele não revela?
- [ ] O que o MICrONS acrescentou em relação a conectomas só estruturais?
- [ ] Como redes restritas pelo conectoma foram validadas?
- [ ] Cite três propriedades de grafos cerebrais.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
