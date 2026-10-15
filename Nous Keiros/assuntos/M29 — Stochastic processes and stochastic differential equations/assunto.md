# M29 — Stochastic processes and stochastic differential equations

*Processos estocásticos e equações diferenciais estocásticas*

- **Trilha:** Mathematics
- **Nível:** 5 — A matemática do aprendizado · onda 2
- **Termos:** stochastic processes, Markov chains, Poisson process, Brownian motion, SDE

## Por que importa

Spikes neurais são processos pontuais; o ruído do SGD, a difusão generativa e a dinâmica de Langevin são processos estocásticos. É a matemática do acaso que evolui no tempo — e da geração de imagens por difusão.

## Pré-requisitos

- **Depende de:** M23 (Continuous random variables, distributions and limit theorems), M28 (Differential equations and dynamical systems)
- **Destrava:** L20 (Diffusion and flow matching), N04 (Neural coding), X02 (Self-organization, emergence and criticality)

## Base

1. Processo estocástico: uma família de variáveis aleatórias indexada pelo tempo.
2. Cadeias de Markov: transição, distribuição estacionária, ergodicidade, mistura.
3. Processo de Poisson; intervalos exponenciais — o modelo básico de spikes.
4. Passeio aleatório e movimento browniano (processo de Wiener).
5. EDEs: dX = f dt + g dW; interpretação; método de Euler–Maruyama.
6. Processo de Ornstein–Uhlenbeck: ruído com memória, modelo de membrana neural.
7. Equação de Fokker–Planck: a densidade evolui de forma determinística.

## Meio

- Lema de Itô e por que (dW)² = dt.
- Dinâmica de Langevin para amostrar distribuições (SGLD).
- Processos de renovação e de Hawkes (excitação mútua) para trens de spikes.
- Martingales (noção) → M34.

## Avançado

- Difusão generativa como EDE direta (adiciona ruído) e reversa (guiada pelo score) → L20.
- SGD como EDE: aproximações contínuas do ruído do gradiente e onde elas falham.
- Processos gaussianos como distribuições sobre funções → L04.

## Matemática necessária

**M23**: distribuições, LGN e TCL; **M28**: EDOs e estabilidade.

## Métodos

- Simule cada processo e compare histogramas com as previsões teóricas.
- Derive a Fokker–Planck do OU e confirme a distribuição estacionária por simulação.
- Use Särkkä & Solin como texto principal: é aplicado, didático e vem com código.

## Desafios

- Tratar ruído branco como uma função comum.
- Esquecer o termo de Itô ao aplicar a regra da cadeia.
- Confundir convergência em distribuição de uma cadeia com convergência das trajetórias.

## Fontes

- 📖 [Applied Stochastic Differential Equations](https://users.aalto.fi/~asolin/sde-book/sde-book.pdf) — Simo Särkkä & Arno Solin, 2019 · livro. PDF dos autores
- 📖 [Markov Chains](https://doi.org/10.1017/cbo9780511810633) — J. R. Norris, 1997 · livro
- 📖 [Introduction to Probability (2ª ed.)](http://probabilitybook.net/) — Joseph K. Blitzstein & Jessica Hwang, 2019 · livro. caps. 11–13 (cadeias de Markov, MCMC, Poisson)
- 📖 [Stochastic Differential Equations (6ª ed.)](https://link.springer.com/book/10.1007/978-3-642-14394-6) — Bernt Øksendal, 2003 · livro. o rigor, para depois
- 📄 [Score-Based Generative Modeling through Stochastic Differential Equations](https://arxiv.org/abs/2011.13456) — Yang Song, Jascha Sohl-Dickstein, Diederik P. Kingma, Abhishek Kumar, Stefano Ermon & Ben Poole, 2021 · paper. ponte para a difusão

## Boss fight

Monte um laboratório estocástico: Euler–Maruyama para EDEs; processos de Poisson, Hawkes e OU; cadeias de Markov com diagnóstico de mistura. Gere trens de spikes de um neurônio integra-e-dispara com corrente de ruído OU e compare a distribuição dos intervalos entre spikes com a teoria. Feche amostrando uma mistura de gaussianas 2D com dinâmica de Langevin usando o score analítico — o coração da difusão.

## Checkpoint

- [ ] Qual a distribuição estacionária de uma cadeia de 2 estados com probabilidades de troca a e b?
- [ ] Por que os intervalos entre eventos de um processo de Poisson são exponenciais?
- [ ] Escreva a EDE do processo de Ornstein–Uhlenbeck e sua média estacionária.
- [ ] O que a equação de Fokker–Planck descreve?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
