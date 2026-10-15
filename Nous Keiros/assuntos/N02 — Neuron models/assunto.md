# N02 — Neuron models

*Modelos de neurônio*

- **Trilha:** Computational Neuroscience
- **Nível:** 5 — A matemática do aprendizado · onda 2
- **Termos:** neuron models, LIF, Hodgkin-Huxley, Izhikevich, cable theory

## Por que importa

Um neurônio biológico é um sistema dinâmico rico: canais iônicos, limiares, ressonância, dendritos que computam. Hodgkin-Huxley, integra-e-dispara e Izhikevich são os modelos que separam "neurônio como ponto ponderado" de "neurônio como computador" — e o primeiro lugar onde suas EDOs viram biologia.

## Pré-requisitos

- **Depende de:** N01 (The brain for engineers), M28 (Differential equations and dynamical systems)
- **Destrava:** C10 (AI hardware), N03 (Synapses and plasticity), N05 (Neural network dynamics and attractors)

## Base

1. A membrana como circuito RC: C·dV/dt = −g_L·(V − E_L) + I **M28**.
2. Integra-e-dispara com vazamento (leaky integrate-and-fire, LIF): limiar, reset, período refratário e a curva f–I.
3. Hodgkin-Huxley: canais de Na⁺ e K⁺ dependentes de voltagem, variáveis m, h e n; o potencial de ação como fenômeno dinâmico.
4. Modelos bidimensionais (FitzHugh–Nagumo) e análise no plano de fase.
5. Izhikevich (2003): duas equações que reproduzem muitos padrões de disparo corticais a custo baixo.
6. Teoria do cabo e dendritos: atenuação e computação dendrítica.

## Meio

- Tipos de excitabilidade e as bifurcações que os geram (sela-nó, Hopf) **M28**.
- Ruído de canais e variabilidade de disparo.
- Neurônios com vários compartimentos.

## Avançado

- Um neurônio cortical detalhado precisa de uma rede profunda temporal de 5 a 8 camadas para ser imitado (Beniaguev et al.); o que isso significa para o "neurônio artificial" contestado
- Redes de neurônios com disparos (spiking) e hardware neuromórfico → C10.
- Neurônios como unidade de emulação de cérebros → N13.

## Matemática necessária

**M28**: EDOs, plano de fase e bifurcações; **M14**: derivadas; **M09**: exponenciais (soluções da membrana RC).

## Métodos

- Siga os capítulos iniciais de Neuronal Dynamics (texto online com exercícios em Python).
- Faça os tutoriais de modelos de neurônio do Neuromatch Academy.
- Implemente Hodgkin-Huxley com RK4 e compare passos de tempo.

## Desafios

- Passo de integração grande demais (o modelo de Hodgkin-Huxley é rígido).
- Unidades erradas (mV, ms, µA/cm²).

## Fontes

- 📖 [Neuronal Dynamics: From Single Neurons to Networks and Models of Cognition](https://neuronaldynamics.epfl.ch/) — Wulfram Gerstner, Werner M. Kistler, Richard Naud & Liam Paninski, 2014 · livro. texto completo online
- 🎓 [Neuromatch Academy: Computational Neuroscience](https://compneuro.neuromatch.io/) — Neuromatch · curso
- 📖 [Dynamical Systems in Neuroscience: The Geometry of Excitability and Bursting](https://doi.org/10.7551/mitpress/2526.001.0001) — Eugene M. Izhikevich, 2007 · livro
- 📄 [A quantitative description of membrane current and its application to conduction and excitation in nerve](https://doi.org/10.1113/jphysiol.1952.sp004764) — Alan L. Hodgkin & Andrew F. Huxley, 1952 · paper
- 📄 [Simple model of spiking neurons](https://doi.org/10.1109/TNN.2003.820440) — Eugene M. Izhikevich, 2003 · paper
- 🆕 [Single cortical neurons as deep artificial neural networks](https://doi.org/10.1016/j.neuron.2021.07.002) — David Beniaguev, Idan Segev & Michael London, 2021 · recente

## Boss fight

Escreva em C, otimizado para o M1 (NEON opcional), um simulador de neurônios: LIF, Hodgkin-Huxley com RK4 e Izhikevich com os tipos de disparo do paper (regular, em rajadas, rápido). Produza curvas f–I, mostre a transição para disparo repetitivo do Hodgkin-Huxley ao aumentar a corrente e meça quantos neurônios Izhikevich o M1 simula em tempo real. Valide os traços contra um simulador estabelecido.

## Checkpoint

- [ ] Escreva a equação do LIF e derive a taxa de disparo para corrente constante.
- [ ] O que representam as variáveis m, h e n no modelo de Hodgkin-Huxley?
- [ ] Por que o modelo de Izhikevich é tão usado em simulações grandes?
- [ ] O que é uma bifurcação de Hopf no contexto da excitabilidade?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
