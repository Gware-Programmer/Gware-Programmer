# N03 — Synapses and plasticity

*Sinapses e plasticidade*

- **Trilha:** Computational Neuroscience
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** synaptic plasticity, Hebbian learning, STDP, three-factor rules

## Por que importa

Aprender, no cérebro, é mudar sinapses. Hebb, STDP e as regras de três fatores mostram como plasticidade local pode produzir aprendizado global — e o debate sobre se o cérebro faz algo parecido com backpropagation é um dos mais importantes da NeuroAI.

## Pré-requisitos

- **Depende de:** N02 (Neuron models)
- **Destrava:** N08 (Basal ganglia, dopamine and reinforcement learning), N12 (NeuroAI: comparing brains and artificial networks)

## Base

1. Transmissão sináptica: liberação probabilística, potenciais pós-sinápticos, facilitação e depressão de curto prazo.
2. Hebb ("neurônios que disparam juntos se conectam") e a regra de Oja, que converge para o primeiro componente principal **M18**.
3. Potenciação e depressão de longo prazo (LTP e LTD); receptores NMDA como detectores de coincidência.
4. STDP (spike-timing-dependent plasticity): o sinal da mudança depende da ordem pré → pós (Markram et al.; Bi & Poo).
5. Regras de três fatores: Hebb mais um sinal neuromodulador (recompensa, surpresa) com traços de elegibilidade **N02**.
6. Homeostase sináptica: escalonamento que estabiliza a atividade.

## Meio

- Plasticidade em escala comportamental (BTSP): um único evento cria um campo de lugar em CA1.
- Atribuição de crédito no cérebro: feedback alignment, propagação de alvos e codificação preditiva → N09.
- O dilema estabilidade–plasticidade e a consolidação.

## Avançado

- O cérebro aproxima gradientes? ("Backpropagation and the brain") contestado
- Aprendizado local em hardware neuromórfico → C10.
- Plasticidade e aprendizado contínuo sem esquecimento catastrófico → L24.

## Matemática necessária

**M18**: autovalores e autovetores (convergência da regra de Oja); **M28**: dinâmica de pesos como EDO; **M20**: gradientes.

## Métodos

- Implemente Hebb puro (instável) e Oja (estável) e mostre a convergência para o 1º componente principal.
- Implemente STDP com traços e reproduza a janela de Bi & Poo.
- Leia Gerstner et al. (2018) sobre regras de três fatores.

## Desafios

- Esquecer que Hebb puro explode sem normalização.
- Tratar STDP como regra universal: ela varia com o tipo de sinapse e a região.

## Fontes

- 📖 [Neuronal Dynamics (parte IV: plasticidade e aprendizado)](https://neuronaldynamics.epfl.ch/online/index.html) — Wulfram Gerstner, Werner M. Kistler, Richard Naud & Liam Paninski, 2014 · livro
- 📄 [Simplified neuron model as a principal component analyzer](https://doi.org/10.1007/BF00275687) — Erkki Oja, 1982 · paper
- 📄 [Synaptic Modifications in Cultured Hippocampal Neurons: Dependence on Spike Timing, Synaptic Strength, and Postsynaptic Cell Type](https://doi.org/10.1523/JNEUROSCI.18-24-10464.1998) — Guo-qiang Bi & Mu-ming Poo, 1998 · paper
- 📄 [Eligibility Traces and Plasticity on Behavioral Time Scales: Experimental Support of NeoHebbian Three-Factor Learning Rules](https://doi.org/10.3389/fncir.2018.00053) — Wulfram Gerstner, Marco Lehmann, Vasiliki Liakoni, Dane Corneil & Johanni Brea, 2018 · paper
- 📄 [Behavioral time scale synaptic plasticity underlies CA1 place fields](https://doi.org/10.1126/science.aan3846) — Katie C. Bittner, Aaron D. Milstein, Christine Grienberger, Sandro Romani & Jeffrey C. Magee, 2017 · paper
- 🧭 [Backpropagation and the brain](https://doi.org/10.1038/s41583-020-0277-3) — Timothy P. Lillicrap, Adam Santoro, Luke Marris, Colin J. Akerman & Geoffrey Hinton, 2020 · review

## Boss fight

Construa uma rede de neurônios LIF com STDP e com uma regra de três fatores (STDP modulada por recompensa via traços de elegibilidade) e treine-a para reconhecer padrões temporais de disparo. Compare com feedback alignment e com backprop numa rede equivalente sem disparos, e escreva, para cada regra, que informação não local ela exige.

## Checkpoint

- [ ] Por que a regra de Hebb pura é instável e como Oja a corrige?
- [ ] Descreva a janela de STDP.
- [ ] O que é um traço de elegibilidade e que problema ele resolve?
- [ ] Cite duas alternativas propostas ao backprop no cérebro.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
