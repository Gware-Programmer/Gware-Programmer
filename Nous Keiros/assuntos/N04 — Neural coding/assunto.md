# N04 — Neural coding

*Codificação neural*

- **Trilha:** Computational Neuroscience
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** neural coding, tuning curves, population coding, Poisson spikes, decoding, efficient coding

## Por que importa

Como neurônios representam o mundo em disparos? Curvas de sintonia, códigos de população, decodificação e o princípio de codificação eficiente conectam neurociência a teoria da informação — e são as mesmas ideias por trás de probing, decodificadores de BCI e análise de representações em redes.

## Pré-requisitos

- **Depende de:** N01 (The brain for engineers), M26 (Information theory), M29 (Stochastic processes and stochastic differential equations)
- **Destrava:** N06 (Sensory systems and the visual system), N09 (Predictive coding), B02 (Neural decoding and motor BCIs)

## Base

1. Trens de disparos como processo pontual; o modelo de Poisson e o fator de Fano **M29**.
2. Curvas de sintonia e campos receptivos; o modelo linear–não linear–Poisson (LNP).
3. Código de taxa vs. código temporal; códigos de população e decodificação por vetor de população.
4. Decodificação bayesiana e limites de precisão (informação de Fisher) **M23**.
5. Codificação eficiente (Barlow): reduzir redundância; códigos esparsos de imagens naturais (Olshausen & Field) **M26**.
6. Informação mútua entre estímulo e resposta e o viés dos estimadores.

## Meio

- Modelos lineares generalizados (GLM) para populações acopladas.
- A geometria de alta dimensão das respostas no córtex visual (Stringer et al.).
- Embeddings latentes conjuntos de atividade e comportamento (CEBRA).

## Avançado

- Codificação neural e superposição em redes artificiais: o mesmo problema visto dos dois lados → I04.
- Computação como trajetórias de população → N05.
- Decodificação para interfaces cérebro-máquina → B02.

## Matemática necessária

**M29**: processos de Poisson; **M26**: entropia e informação mútua; **M23**: distribuições; **M17**: álgebra linear (decodificadores lineares).

## Métodos

- Faça os tutoriais de GLM e decodificação do Neuromatch.
- Use dados abertos do Allen Brain Observatory pelo AllenSDK.
- Implemente o modelo LNP, ajuste-o a dados simulados e depois a dados reais.

## Desafios

- Estimar informação mútua com poucos dados (o viés é positivo).
- Confundir "decodificável" com "usado pelo cérebro".

## Fontes

- 📖 [Theoretical Neuroscience: Computational and Mathematical Modeling of Neural Systems](https://mitpress.mit.edu/9780262541855/theoretical-neuroscience/) — Peter Dayan & L. F. Abbott, 2001 · livro. caps. 1–4: o texto clássico de codificação e decodificação ⚠ não verificado — a página bloqueia leitura automática (desafio anti-bot)
- 📄 [Possible Principles Underlying the Transformations of Sensory Messages](https://doi.org/10.7551/mitpress/9780262518420.003.0013) — Horace B. Barlow, 1961 · paper
- 📄 [Emergence of simple-cell receptive field properties by learning a sparse code for natural images](https://doi.org/10.1038/381607a0) — Bruno A. Olshausen & David J. Field, 1996 · paper
- 🧭 [Information processing with population codes](https://doi.org/10.1038/35039062) — Alexandre Pouget, Peter Dayan & Richard Zemel, 2000 · review
- 📄 [High-dimensional geometry of population responses in visual cortex](https://doi.org/10.1038/s41586-019-1346-5) — Carsen Stringer, Marius Pachitariu, Nicholas Steinmetz, Matteo Carandini & Kenneth D. Harris, 2019 · paper
- 🗃️ [Allen Brain Observatory (AllenSDK)](https://allensdk.readthedocs.io/en/latest/brain_observatory.html) — Allen Institute · dados

## Boss fight

Baixe uma sessão aberta do Allen Brain Observatory (córtex visual), ajuste modelos LNP/GLM por neurônio, decodifique o estímulo com decodificadores linear e bayesiano, estime a informação mútua com correção de viés e compare código de taxa com código temporal. Depois aplique exatamente as mesmas análises às ativações de uma camada de uma CNN vendo os mesmos estímulos e compare as duas "populações".

## Checkpoint

- [ ] O que é o fator de Fano e quanto ele vale num processo de Poisson?
- [ ] Explique o princípio de codificação eficiente de Barlow.
- [ ] Como funciona um decodificador por vetor de população?
- [ ] Por que estimar informação mútua com poucos dados é enganoso?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
