# G02 — Perception, attention and signal detection

*Percepção, atenção e detecção de sinal*

- **Trilha:** Cognitive Science
- **Nível:** 5 — A matemática do aprendizado · onda 1
- **Termos:** perception, attention, psychophysics, signal detection theory

## Por que importa

Perceber é inferir o mundo a partir de sinais ruidosos; atender é escolher o que processar. A teoria de detecção de sinal separa sensibilidade de viés — ferramenta que você vai reusar em metacognição, em consciência e na avaliação de qualquer classificador.

## Pré-requisitos

- **Depende de:** G01 (Cognitive science: Marr's levels and the method), M23 (Continuous random variables, distributions and limit theorems)
- **Destrava:** G07 (Metacognition, theory of mind and introspection), S02 (The science of consciousness: methods and measures)

## Base

1. Psicofísica: limiares, função psicométrica, método de estímulos constantes e escadas adaptativas.
2. Teoria de detecção de sinal (signal detection theory): duas distribuições normais, sensibilidade d′ = z(acertos) − z(falsos alarmes) e critério c **M23**.
3. Curvas ROC — as mesmas usadas para avaliar classificadores.
4. Percepção como inferência bayesiana: integração estatisticamente ótima de pistas (Ernst & Banks) **M22**.
5. Atenção: orientação espacial (Posner), seleção precoce vs. tardia, teoria de integração de características (Treisman) e busca visual.
6. Atenção endógena (voluntária) vs. exógena (capturada) e capacidade limitada.

## Meio

- Ilusões como janelas para os priors do sistema visual.
- Cegueira por desatenção e cegueira para mudanças.
- Modelos computacionais de atenção: mapas de saliência e normalização.

## Avançado

- O que a "atenção" dos transformers tem e não tem da atenção biológica → L13.
- Detecção de sinal aplicada a relatos de consciência e à metacognição (meta-d′) → G07, → S02.
- Percepção como inferência e codificação preditiva → N09.

## Matemática necessária

**M23**: distribuição normal e escores z; **M22**: regra de Bayes; **M14**: derivadas (inclinação da função psicométrica).

## Métodos

- Programe um experimento de detecção (sim/não) e um de escolha forçada; colete seus dados e calcule d′ e c.
- Ajuste uma função psicométrica por máxima verossimilhança.
- Use o guia de detecção de sinal para as contas e Lindsay (2020) para conectar atenção humana e de máquina.

## Desafios

- Usar porcentagem de acerto quando há viés de resposta — d′ existe para isso.
- Confundir atenção com consciência → S02.

## Fontes

- 📖 [Detection Theory: A User's Guide (3ª ed.)](https://doi.org/10.4324/9781003203636) — Michael J. Hautus, Neil A. Macmillan & C. Douglas Creelman, 2021 · livro
- 📄 [Orienting of Attention](https://doi.org/10.1080/00335558008248231) — Michael I. Posner, 1980 · paper
- 📄 [A feature-integration theory of attention](https://doi.org/10.1016/0010-0285(80)90005-5) — Anne M. Treisman & Garry Gelade, 1980 · paper
- 📄 [Humans integrate visual and haptic information in a statistically optimal fashion](https://doi.org/10.1038/415429a) — Marc O. Ernst & Martin S. Banks, 2002 · paper
- 🧭 [Visual attention: The past 25 years](https://doi.org/10.1016/j.visres.2011.04.012) — Marisa Carrasco, 2011 · review
- 🧭 [Attention in Psychology, Neuroscience, and Machine Learning](https://doi.org/10.3389/fncom.2020.00029) — Grace W. Lindsay, 2020 · review

## Boss fight

Construa em Python um laboratório de psicofísica: detecção sim/não e escolha forçada com escada adaptativa, relato de confiança em quatro níveis, cálculo de d′ e c, curva ROC pelos níveis de confiança e ajuste da função psicométrica por máxima verossimilhança com intervalos por bootstrap (as duas técnicas são estudadas em paralelo, em → M24). Colete os seus dados e depois rode o mesmo protocolo num classificador seu, variando o limiar de decisão: o que é "viés" para uma rede?

## Checkpoint

- [ ] Calcule d′ para 84% de acertos e 16% de falsos alarmes.
- [ ] O que o critério c mede?
- [ ] Explique a integração ótima de pistas de Ernst & Banks.
- [ ] Diferencie atenção endógena e exógena e descreva a busca visual segundo Treisman.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
