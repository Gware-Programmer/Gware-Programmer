# N05 — Neural network dynamics and attractors

*Dinâmica de redes neurais e atratores*

- **Trilha:** Computational Neuroscience
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** network dynamics, E/I balance, attractor networks, Hopfield, reservoir computing
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Memória, decisão, integração e geração de padrões emergem da dinâmica coletiva de redes recorrentes. Atratores, balanço excitação–inibição e reservatórios são as ferramentas para pensar a "física" de qualquer sistema recorrente — do córtex ao estado interno do Rei Ichi.

## Pré-requisitos

- **Depende de:** N02 (Neuron models)
- **Destrava:** N07 (Hippocampus, memory and cognitive maps), N11 (Oscillations and large-scale dynamics), N13 (Connectomics and large-scale neuroscience), N15 (Motor control, the cerebellum and internal models), S03 (Global workspace theories (GWT and GNWT))

## Base

1. Redes de taxa: τ·dr/dt = −r + f(W·r + I) **M28**.
2. Redes de Hopfield: função de energia, memórias como atratores, capacidade de cerca de 0,14·N padrões **M18**.
3. Atratores contínuos: o anel da orientação da cabeça na mosca (Kim et al.) e integradores para memória de trabalho e integração de caminho.
4. Balanço excitação–inibição e o regime assíncrono caótico (van Vreeswijk & Sompolinsky).
5. Computação de reservatório: echo state networks e liquid state machines.
6. Treinar redes caóticas: o algoritmo FORCE (Sussillo & Abbott).

## Meio

- Engenharia reversa de RNNs treinadas: pontos fixos e linearização (Sussillo & Barak).
- Computação por dinâmica de populações.
- Hopfield moderno e a ligação com a atenção dos transformers → L13.

## Avançado

- Atratores persistentes vs. plasticidade de curto prazo como base da memória de trabalho contestado
- Oscilações e criticalidade → N11.
- Dinâmica de redes artificiais e interpretabilidade mecanicista → I03.

## Matemática necessária

**M28**: estabilidade, atratores e caos; **M18**: espectro da matriz de conectividade; **M17**: álgebra linear.

## Métodos

- Implemente Hopfield, meça a capacidade e encontre estados espúrios.
- Implemente um atrator em anel e mostre a deriva causada por ruído.
- Implemente uma echo state network e preveja uma série caótica.

## Desafios

- Raio espectral mal ajustado em reservatórios.
- Chamar qualquer platô de atividade de atrator sem testar perturbações.

## Fontes

- 📖 [Neuronal Dynamics (partes III e IV: redes e cognição)](https://neuronaldynamics.epfl.ch/) — Wulfram Gerstner, Werner M. Kistler, Richard Naud & Liam Paninski, 2014 · livro
- 📄 [Neural networks and physical systems with emergent collective computational abilities](https://doi.org/10.1073/pnas.79.8.2554) — John J. Hopfield, 1982 · paper
- 📄 [Chaos in Neuronal Networks with Balanced Excitatory and Inhibitory Activity](https://doi.org/10.1126/science.274.5293.1724) — Carl van Vreeswijk & Haim Sompolinsky, 1996 · paper
- 📄 [Generating Coherent Patterns of Activity from Chaotic Neural Networks](https://doi.org/10.1016/j.neuron.2009.07.018) — David Sussillo & L. F. Abbott, 2009 · paper
- 📄 [Opening the Black Box: Low-Dimensional Dynamics in High-Dimensional Recurrent Neural Networks](https://doi.org/10.1162/NECO_a_00409) — David Sussillo & Omri Barak, 2013 · paper
- 🧭 [Attractor and integrator networks in the brain](https://doi.org/10.1038/s41583-022-00642-0) — Mikail Khona & Ila R. Fiete, 2022 · review

## Boss fight

Treine na RTX 3090 uma RNN em três tarefas cognitivas — memória de trabalho de um valor contínuo, decisão por acumulação de evidência e reprodução de sequência — e faça a engenharia reversa: encontre pontos fixos, linearize em torno deles, identifique atratores de linha ou anel e explique a computação. Depois aplique o mesmo procedimento a um subsistema recorrente do Rei Ichi: ele tem atratores? Eles fazem algo útil?

## Checkpoint

- [ ] Escreva a função de energia de Hopfield e explique por que a dinâmica a diminui.
- [ ] O que é um atrator contínuo e onde ele aparece no cérebro?
- [ ] O que o balanço excitação–inibição produz na atividade de uma rede?
- [ ] Como se faz engenharia reversa de uma RNN treinada?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
