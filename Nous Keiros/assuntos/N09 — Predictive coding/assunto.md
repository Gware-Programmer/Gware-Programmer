# N09 — Predictive coding

*Codificação preditiva*

- **Trilha:** Computational Neuroscience
- **Nível:** 8 — Escala · onda 1
- **Termos:** predictive coding, Bayesian brain, prediction error, canonical microcircuit
- **Projetos KEIROS:** Rei Ichi

## Por que importa

A hipótese de que o cérebro prevê constantemente suas entradas e propaga apenas o erro de predição unifica percepção, aprendizado e talvez consciência. Rao-Ballard, o cérebro bayesiano e os microcircuitos canônicos fundamentam o subsistema de codificação preditiva do Rei Ichi — e a evidência empírica é mais mista do que a popularidade da ideia sugere.

## Pré-requisitos

- **Depende de:** N04 (Neural coding), M25 (Bayesian inference, MCMC and variational inference), L08 (Neural networks and backpropagation)
- **Destrava:** N10 (Free energy principle and active inference)

## Base

1. A ideia: um modelo generativo hierárquico; cada nível prevê o de baixo; erros sobem, predições descem **M25**.
2. Rao & Ballard (1999): efeitos extraclássicos em V1 explicados por codificação preditiva.
3. O cérebro bayesiano e a formulação de energia livre de Friston (2005); o tutorial de Bogacz **M26**.
4. Implementação: populações de erro e de predição; microcircuitos canônicos **N04**.
5. Codificação preditiva e backprop: redes de codificação preditiva aproximam o gradiente com regras locais **L08**.
6. Configuração prospectiva: inferir a atividade antes de mudar os pesos (Song et al., 2024).

## Meio

- Atenção como precisão: o peso dado a cada erro de predição.
- Evidência: supressão por repetição, respostas a violações de expectativa e a revisão crítica de Walsh et al. (2020).
- Processamento preditivo como teoria geral da mente (Clark) contestado

## Avançado

- Energia livre e inferência ativa → N10.
- Processamento preditivo e consciência → S08.
- Aprendizado local sem backprop em hardware neuromórfico → C10.

## Matemática necessária

**M25**: inferência bayesiana e variacional; **M20**: gradientes; **M26**: entropia e divergência KL.

## Métodos

- Implemente Rao-Ballard em imagens naturais e observe os campos receptivos.
- Implemente uma rede de codificação preditiva com regras locais e compare com backprop no MNIST.
- Leia Millidge, Seth & Buckley (2021) como revisão de entrada.

## Desafios

- Chamar de codificação preditiva qualquer modelo que calcula um erro.
- Tomar a hipótese como confirmada: várias predições específicas nunca foram testadas ou não se confirmaram.

## Fontes

- 📄 [Predictive coding in the visual cortex: a functional interpretation of some extra-classical receptive-field effects](https://doi.org/10.1038/4580) — Rajesh P. N. Rao & Dana H. Ballard, 1999 · paper
- 📄 [A theory of cortical responses](https://doi.org/10.1098/rstb.2005.1622) — Karl Friston, 2005 · paper
- 📄 [A tutorial on the free-energy framework for modelling perception and learning](https://doi.org/10.1016/j.jmp.2015.11.003) — Rafal Bogacz, 2017 · paper
- 🧭 [Predictive Coding: a Theoretical and Experimental Review](https://arxiv.org/abs/2107.12979) — Beren Millidge, Anil Seth & Christopher L. Buckley, 2021 · review
- 🧭 [Evaluating the neurophysiological evidence for predictive processing as a model of perception](https://doi.org/10.1111/nyas.14321) — Kevin S. Walsh, David P. McGovern, Andy Clark & Redmond G. O'Connell, 2020 · review. a evidência, com cautela
- 🆕 [Inferring neural activity before plasticity as a foundation for learning beyond backpropagation](https://doi.org/10.1038/s41593-023-01514-1) — Yuhang Song et al., 2024 · recente
- 🎓 [Neuromatch Academy: Computational Neuroscience](https://compneuro.neuromatch.io/) — Neuromatch · curso. aulas em vídeo e notebooks em Python

## Boss fight

Audite o subsistema de codificação preditiva do Rei Ichi contra a definição: existe um modelo generativo explícito? Erros e predições vivem em populações separadas? A precisão é aprendida? O aprendizado é local? Depois implemente uma rede de codificação preditiva hierárquica com regras locais, treine-a em imagens e em sequências, compare com backprop e use-a para corrigir ou substituir o subsistema — mostrando ganho mensurável ou a ausência dele.

## Checkpoint

- [ ] Descreva o fluxo de predições e erros numa hierarquia preditiva.
- [ ] O que Rao & Ballard explicaram em V1?
- [ ] Como redes de codificação preditiva aproximam o backprop?
- [ ] Que evidência pesa contra a codificação preditiva como teoria geral?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
