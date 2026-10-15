# M22 — Probability: events, conditioning and Bayes

*Probabilidade: eventos, condicionamento e Bayes*

- **Trilha:** Mathematics
- **Nível:** 3 — Cálculo e incerteza · onda 1
- **Termos:** probability, conditional probability, Bayes' theorem, random variables

## Por que importa

A IA moderna é probabilística até o osso: um LLM é uma distribuição sobre o próximo token, e Bayes é a matemática de atualizar crenças com evidência — a mesma usada para atribuir credências sobre consciência em IA. Sem probabilidade não há aprendizado nem ciência honesta.

## Pré-requisitos

- **Depende de:** M12 (Sequences, series and summations), M13 (Combinatorics and discrete mathematics)
- **Destrava:** M23 (Continuous random variables, distributions and limit theorems), M37 (Computational complexity), M39 (Game theory), L01 (Foundations of supervised learning), A02 (Search and classical planning), K03 (ACT-R), G04 (Learning, decision-making and bounded rationality), G05 (Language: structure, acquisition and processing), F05 (Philosophy of science: what makes a theory testable)

## Base

1. Espaço amostral, eventos e axiomas de Kolmogorov (versão discreta).
2. Probabilidade por contagem **M13**; complemento e inclusão-exclusão.
3. Probabilidade condicional, regra do produto e independência.
4. Lei da probabilidade total e teorema de Bayes.
5. Variáveis aleatórias discretas; Bernoulli, binomial, geométrica e Poisson.
6. Esperança, linearidade da esperança, variância e desvio-padrão.
7. Distribuições conjuntas e marginais; independência de variáveis.

## Meio

- Bayes com taxas-base: falácia da taxa-base, razões de verossimilhança e chances (odds).
- Esperança condicional e lei da esperança total.
- Desigualdades de Markov e Chebyshev.
- Cadeias de Markov discretas e matrizes de transição.
- Monte Carlo para conferir qualquer cálculo.

## Avançado

- Interpretações de probabilidade (frequentista, bayesiana, lógica de Cox–Jaynes) e o que significa ter uma credência → M25.
- Paradoxos (Monty Hall, Bertrand, dois envelopes) como testes de definição do espaço amostral.
- O método probabilístico e a ponte para desigualdades de concentração → M23.

## Matemática necessária

**M13**: contagem; **M12**: somatórios e séries para esperanças; **M02**: frações.

## Métodos

- Em todo exercício, faça o cálculo exato e uma simulação: discordância revela erro de modelagem.
- Assista Stat 110 (Blitzstein) e faça os problemas: é o melhor treino de intuição probabilística que existe.
- Em problemas pequenos, enumere o espaço amostral em código.

## Desafios

- Confundir P(A|B) com P(B|A) (a falácia do promotor).
- Confundir independência com exclusão mútua.
- Ignorar taxas-base.
- Confiar na intuição em problemas condicionais: simule.

## Fontes

- 📖 [Introduction to Probability (2ª ed.)](http://probabilitybook.net/) — Joseph K. Blitzstein & Jessica Hwang, 2019 · livro. PDF gratuito oficial
- 🎬 [Statistics 110: Probability (Harvard)](https://www.youtube.com/playlist?list=PL2SOU6wwxB0uwwH80KTQ6ht66KWxbzTIo) — Joe Blitzstein · video. o curso completo em vídeo
- 🎓 [Probabilistic Systems Analysis and Applied Probability (6.041SC)](https://ocw.mit.edu/courses/6-041sc-probabilistic-systems-analysis-and-applied-probability-fall-2013/) — John Tsitsiklis (MIT OpenCourseWare) · curso
- 🎓 [Portal da Matemática OBMEP — Introdução à probabilidade](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=46) — IMPA/OBMEP · curso
- 🎓 [Portal da Matemática OBMEP — Probabilidade condicional](https://portaldaobmep.impa.br/index.php/modulo/ver?modulo=47) — IMPA/OBMEP · curso

## Boss fight

Construa um verificador de probabilidade: para 20 problemas clássicos (Monty Hall, aniversários, teste médico com taxa-base, colecionador de figurinhas, ruína do jogador), calcule a resposta exata e confirme com um milhão de simulações. Depois escreva um "calculador de evidências" que mostre como a probabilidade posterior muda com a taxa-base para um teste de sensibilidade e especificidade dadas — e aplique ao caso de um "detector de consciência" com falsos positivos.

## Checkpoint

- [ ] Um teste tem 99% de sensibilidade e 95% de especificidade para uma condição com prevalência de 1%. Qual P(condição | positivo)?
- [ ] Prove que E[X + Y] = E[X] + E[Y] mesmo sem independência.
- [ ] Qual a diferença entre eventos independentes e mutuamente exclusivos?
- [ ] Calcule esperança e variância de uma binomial(n, p) usando variáveis indicadoras.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
