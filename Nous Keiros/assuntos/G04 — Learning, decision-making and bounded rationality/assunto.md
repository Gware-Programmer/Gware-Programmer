# G04 — Learning, decision-making and bounded rationality

*Aprendizado, decisão e racionalidade limitada*

- **Trilha:** Cognitive Science
- **Nível:** 3 — Cálculo e incerteza · onda 2
- **Termos:** Rescorla-Wagner, heuristics and biases, prospect theory, bounded rationality

## Por que importa

Humanos aprendem por erro de predição, decidem com atalhos e violam sistematicamente a teoria da escolha racional. Rescorla-Wagner, heurísticas e vieses, teoria do prospecto e racionalidade limitada são a base da psicologia da decisão — e do RL, da economia comportamental e do uso de LLMs como participantes de experimentos.

## Pré-requisitos

- **Depende de:** G01 (Cognitive science: Marr's levels and the method), M22 (Probability: events, conditioning and Bayes)
- **Destrava:** G06 (Reasoning, concepts and Bayesian cognition), G07 (Metacognition, theory of mind and introspection), G08 (Emotion, motivation and homeostasis), N08 (Basal ganglia, dopamine and reinforcement learning)

## Base

1. Condicionamento clássico e o modelo de Rescorla-Wagner: ΔV = α(λ − ΣV) — aprender pelo erro de predição; o bloqueio (blocking) sai da equação **M22**.
2. Condicionamento operante e a lei do efeito.
3. Utilidade esperada e suas violações (paradoxo de Allais).
4. Heurísticas e vieses (Tversky & Kahneman): representatividade, disponibilidade, ancoragem.
5. Teoria do prospecto: ponto de referência, aversão à perda e ponderação não linear de probabilidades **M09**.
6. Racionalidade limitada (Simon): "satisficing"; heurísticas rápidas e frugais (Gigerenzer) como adaptação, não como defeito.

## Meio

- Análise racional de recursos: vieses como uso ótimo de computação limitada.
- "Sistema 1 e Sistema 2" como metáfora útil e limitada; alguns estudos de priming popularizados nessa literatura não replicaram.
- Decisão com tempo: modelos de deriva-difusão (drift-diffusion) ligam acurácia e tempo de reação.

## Avançado

- O erro de predição de Rescorla-Wagner reaparece no erro de diferença temporal e nos neurônios de dopamina → R04, → N08.
- LLMs como sujeitos de experimentos cognitivos e o Centaur, modelo treinado para prever escolhas humanas — com críticas de que prever escolhas não é capturar cognição contestado → G06
- Decisão, confiança e metacognição → G07.

## Matemática necessária

**M22**: probabilidade e valor esperado; **M09**: funções logarítmicas (utilidade côncava).

## Métodos

- Simule Rescorla-Wagner e reproduza aquisição, extinção e bloqueio.
- Aplique problemas clássicos (o "problema da doença asiática", o problema da Linda) a você e a LLMs, com variações de números e contexto para detectar memorização.
- Leia Lieder & Griffiths para o contraponto de racionalidade limitada.

## Desafios

- Chamar vieses de "irracionalidade" sem considerar o custo computacional de evitá-los.
- Citar efeitos não replicados como fatos.

## Fontes

- 📄 [Judgment under Uncertainty: Heuristics and Biases](https://doi.org/10.1126/science.185.4157.1124) — Amos Tversky & Daniel Kahneman, 1974 · paper
- 📄 [Prospect Theory: An Analysis of Decision under Risk](https://doi.org/10.2307/1914185) — Daniel Kahneman & Amos Tversky, 1979 · paper
- 📄 [A Behavioral Model of Rational Choice](https://doi.org/10.2307/1884852) — Herbert A. Simon, 1955 · paper
- 🧭 [Reinforcement learning in the brain](https://doi.org/10.1016/j.jmp.2008.12.005) — Yael Niv, 2009 · review. de Rescorla-Wagner ao TD
- 📄 [Resource-rational analysis: Understanding human cognition as the optimal use of limited computational resources](https://doi.org/10.1017/S0140525X1900061X) — Falk Lieder & Thomas L. Griffiths, 2020 · paper
- 🆕 [A foundation model to predict and capture human cognition](https://doi.org/10.1038/s41586-025-09215-4) — Marcel Binz et al., 2025 · recente. o Centaur; leia junto com as críticas
- 🎓 [Probabilistic Models of Cognition](http://probmods.org/) — Noah D. Goodman & Joshua B. Tenenbaum · curso. livro interativo com código que roda no navegador

## Boss fight

Implemente Rescorla-Wagner e um aprendiz por diferença temporal e reproduza aquisição, extinção e bloqueio — e mostre um fenômeno que só o TD explica (condicionamento de segunda ordem). Depois aplique uma bateria de 10 problemas clássicos de vieses e de teoria do prospecto a três LLMs, a você e a alguns voluntários, com versões alteradas para separar raciocínio de memorização, e escreva o que os resultados dizem — e o que não dizem — sobre cognição nos modelos.

## Checkpoint

- [ ] Escreva a regra de Rescorla-Wagner e explique o bloqueio com ela.
- [ ] O que é aversão à perda na teoria do prospecto?
- [ ] O que Simon quis dizer com racionalidade limitada?
- [ ] Por que um viés pode ser racional dados limites computacionais?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
