# G06 — Reasoning, concepts and Bayesian cognition

*Raciocínio, conceitos e cognição bayesiana*

- **Trilha:** Cognitive Science
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** categorization, analogy, causal reasoning, Bayesian models of cognition, core knowledge

## Por que importa

Como humanos aprendem um conceito com um único exemplo, raciocinam por analogia e inferem causas? A cognição bayesiana e o conhecimento nuclear (core knowledge) dão as melhores respostas formais — e definem o padrão que a IA ainda não atinge: aprender muito com pouco.

## Pré-requisitos

- **Depende de:** G04 (Learning, decision-making and bounded rationality), M25 (Bayesian inference, MCMC and variational inference)
- **Destrava:** —

## Base

1. Categorização: protótipos, exemplares e teorias.
2. Modelos bayesianos de cognição: hipóteses, priors e verossimilhança; "como crescer uma mente" com estatística, estrutura e abstração **M25**.
3. Programas probabilísticos como linguagem do pensamento (o livro aberto probmods).
4. Aprender conceitos com um exemplo: o Omniglot e a indução de programas probabilísticos (Lake et al.).
5. Conhecimento nuclear (Spelke): objetos, agentes, número e espaço desde muito cedo.
6. Raciocínio causal e analogia como mapeamento estrutural (Gentner).

## Meio

- O princípio do tamanho (size principle): hipóteses menores ganham peso quando os exemplos se encaixam nelas **M22**.
- Simplicidade e comprimento de descrição como prior **M26**.
- A crítica das "histórias bayesianas just-so" (Bowers & Davis) contestado
- Raciocínio analógico emergente em LLMs (Webb, Holyoak & Lu) e o debate sobre o que isso mostra.

## Avançado

- Da linguagem natural para modelos de mundo probabilísticos → L25.
- Aprendizado de conceitos e síntese de programas → K05.
- Modelos de mundo em agentes → R09.

## Matemática necessária

**M25**: inferência bayesiana e MCMC; **M22**: probabilidade; **M26**: informação e comprimento de descrição.

## Métodos

- Faça os capítulos do probmods (WebPPL roda no navegador).
- Implemente o "jogo dos números" de Tenenbaum com o princípio do tamanho.
- Leia Bowers & Davis depois de Tenenbaum et al., para equilibrar.

## Desafios

- Escolher priors depois de ver os dados para "explicar" qualquer coisa.
- Confundir um modelo bayesiano no nível computacional com a afirmação de que o cérebro calcula Bayes exato.

## Fontes

- 📖 [Bayesian Models of Cognition: Reverse Engineering the Mind](https://doi.org/10.7551/mitpress/8765.001.0001) — Thomas L. Griffiths, Nick Chater & Joshua B. Tenenbaum (orgs.), 2024 · livro
- 🎓 [Probabilistic Models of Cognition (2ª ed.)](http://probmods.org/) — Noah D. Goodman & Joshua B. Tenenbaum · curso. livro interativo em WebPPL
- 📄 [How to Grow a Mind: Statistics, Structure, and Abstraction](https://doi.org/10.1126/science.1192788) — Joshua B. Tenenbaum, Charles Kemp, Thomas L. Griffiths & Noah D. Goodman, 2011 · paper
- 📄 [Human-level concept learning through probabilistic program induction](https://doi.org/10.1126/science.aab3050) — Brenden M. Lake, Ruslan Salakhutdinov & Joshua B. Tenenbaum, 2015 · paper
- 📄 [Core knowledge](https://doi.org/10.1111/j.1467-7687.2007.00569.x) — Elizabeth S. Spelke & Katherine D. Kinzler, 2007 · paper
- 📄 [Bayesian just-so stories in psychology and neuroscience](https://doi.org/10.1037/a0026450) — Jeffrey S. Bowers & Colin J. Davis, 2012 · paper. a crítica

## Boss fight

Implemente três modelos bayesianos de cognição: o jogo dos números com o princípio do tamanho, indução de conceitos por programas numa gramática pequena e analogia por mapeamento estrutural. Para cada um, compare as previsões do modelo com as respostas de pessoas (você e voluntários) e de um LLM em itens inéditos, criados para fugir de qualquer dado de treino. Onde o LLM se parece com humanos e onde se parece com memorização?

## Checkpoint

- [ ] Explique o princípio do tamanho no jogo dos números.
- [ ] O que é conhecimento nuclear e por que ele importa para IA?
- [ ] Qual é a crítica central de Bowers & Davis?
- [ ] Como a indução de programas explica aprender um conceito com um exemplo?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
