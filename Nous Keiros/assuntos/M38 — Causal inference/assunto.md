# M38 — Causal inference

*Inferência causal*

- **Trilha:** Mathematics
- **Nível:** 6 — Aprendizado de máquina · onda 1
- **Termos:** causal inference, structural causal models, do-calculus, counterfactuals

## Por que importa

Correlação não é causa — e a interpretabilidade, a neurociência e a avaliação de agentes vivem de afirmações causais. Modelos causais estruturais e o do-calculus dão a linguagem das intervenções, que é exatamente o que o "activation patching" faz dentro de uma rede.

## Pré-requisitos

- **Depende de:** M24 (Statistics and frequentist inference), M30 (Graph theory and networks)
- **Destrava:** I03 (Causal interventions and circuit discovery)

## Base

1. A escada da causalidade (Pearl): associação, intervenção, contrafactual.
2. DAGs causais **M30**; d-separação; confundidores, mediadores e colisores.
3. Intervenção do(X = x) vs. condicionamento P(Y | X = x).
4. Critério da porta dos fundos (backdoor) e ajuste.
5. Experimentos randomizados como padrão-ouro **M24**.
6. O paradoxo de Simpson resolvido pela estrutura causal.

## Meio

- Critério da porta da frente e as regras do do-calculus.
- Contrafactuais e modelos causais estruturais (SCMs).
- Variáveis instrumentais, diferenças-em-diferenças, regressão descontínua.
- Descoberta causal a partir de dados (PC, GES) e seus limites.

## Avançado

- Abstração causal (causal abstraction): quando um modelo de alto nível explica fielmente um sistema de baixo nível — o fundamento formal da interpretabilidade mecanicista → I03.
- Causalidade em neurociência: perturbação (optogenética, TMS) vs. correlação (NCCs) → S02.
- Aprendizado de representações causais e generalização fora da distribuição (Schölkopf et al.).

## Matemática necessária

**M24**: estatística; **M30**: grafos e DAGs.

## Métodos

- Hernán & Robins para a prática, Pearl para o rigor, Brady Neal para o curso.
- Desenhe o DAG antes de calcular qualquer coisa.
- Simule SCMs e verifique que o ajuste correto recupera o efeito e o errado não.

## Desafios

- Ajustar por um colisor (cria associação espúria).
- "Controlar por tudo": inclui mediadores e colisores e destrói a estimativa.
- Tratar descoberta causal observacional como prova.

## Fontes

- 📖 [Causal Inference: What If](https://miguelhernan.org/whatifbook) — Miguel A. Hernán & James M. Robins · livro. gratuito
- 📖 [Causality (2ª ed.)](https://bayes.cs.ucla.edu/BOOK-2K/) — Judea Pearl, 2009 · livro
- 🎓 [Introduction to Causal Inference](https://www.bradyneal.com/causal-inference-course) — Brady Neal · curso. curso gratuito com livro
- 📄 [Causal inference in statistics: An overview](https://doi.org/10.1214/09-SS057) — Judea Pearl, 2009 · paper
- 📄 [Toward Causal Representation Learning](https://arxiv.org/abs/2102.11107) — Bernhard Schölkopf, Francesco Locatello, Stefan Bauer, Nan Rosemary Ke, Nal Kalchbrenner, Anirudh Goyal & Yoshua Bengio, 2021 · paper

## Boss fight

Escreva um motor de SCMs: defina DAGs com mecanismos, gere dados observacionais e intervencionais, identifique automaticamente um conjunto de ajuste pelo critério backdoor e estime efeitos por ajuste e por ponderação de propensão. Teste em 10 cenários com colisores, mediadores e confundimento — incluindo um paradoxo de Simpson — mostrando quando o ajuste ingênuo erra e por quê.

## Checkpoint

- [ ] Qual a diferença entre P(Y | X = x) e P(Y | do(X = x))?
- [ ] Por que condicionar num colisor cria dependência?
- [ ] Enuncie o critério backdoor.
- [ ] Por que a randomização elimina o confundimento?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
