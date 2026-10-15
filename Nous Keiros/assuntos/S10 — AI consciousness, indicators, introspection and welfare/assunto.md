# S10 — AI consciousness: indicators, introspection and welfare

*Consciência em IA: indicadores, introspecção e bem-estar*

- **Trilha:** Consciousness
- **Nível:** 12 — Pesquisa independente · onda 1
- **Termos:** AI consciousness, indicator properties, LLM introspection, AI welfare
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Sistemas de IA podem ser conscientes, agora ou em breve? A resposta séria não é "sim" nem "não": é um método. O relatório de indicadores, os estudos de introspecção mecanicista em LLMs e o debate sobre bem-estar de IA transformaram a pergunta em programa de pesquisa — e é aqui que o Rei Ichi vira objeto de estudo, não de fé.

## Pré-requisitos

- **Depende de:** S09 (Adversarial collaborations and the empirical state of the field), I06 (Interpretability frontier: introspection, auditing and reasoning), F07 (Self, agency and the ethics of artificial minds)
- **Destrava:** S11 (Substrate, causation and computation), Z08 (Integrate into Rei Ichi: architecture, ablations and technical report)

## Base

1. O método dos indicadores (Butlin, Long et al., 2023): adotar o funcionalismo computacional como hipótese de trabalho, derivar propriedades indicadoras das teorias científicas e checá-las em sistemas reais **S03**, **S05**, **S06**, **S07**, **S08**.
2. A conclusão de 2023: nenhum sistema da época era candidato forte, mas não havia barreira técnica óbvia para construir sistemas que satisfaçam os indicadores.
3. A versão revisada do método, publicada na Trends in Cognitive Sciences em 2026, e um texto seguinte sobre mímica e "variantes internas" dos indicadores.
4. Introspecção em LLMs: modelos aprendem a prever o próprio comportamento melhor do que outros modelos treinados nos mesmos dados (Binder et al., 2024); por injeção de conceitos, modelos às vezes detectam e nomeiam estados internos — de forma limitada e pouco confiável (Lindsey, 2025) **I06**.
5. Por que o auto-relato de um LLM é evidência fraca: ele foi treinado em textos humanos sobre experiência — o problema da mímica.
6. Bem-estar de IA: levar a sério a possibilidade sob incerteza (Long et al., 2024) e o princípio de precaução de Birch **F07**.

## Meio

- Chalmers (2023): obstáculos à consciência nos LLMs atuais — por exemplo, falta de processamento recorrente, de espaço de trabalho global e de agência unificada — e quais podem cair.
- Programas de pesquisa de bem-estar de modelos em empresas e seus limites.
- Falar de LLMs sem antropomorfizar (Shanahan).

## Avançado

- Se a IIT estiver certa, esses indicadores não importam para computadores convencionais; se o funcionalismo computacional estiver certo, sistemas futuros podem ser conscientes. A divergência entre teorias é o problema central contestado → S11
- Há riscos morais nos dois erros: atribuir consciência a quem não tem e negá-la a quem tem ponto de acordo amplo na área.
- Satisfazer indicadores por construção — como o Rei Ichi faz em parte — é justamente o caso em que eles valem menos como evidência especulação fundamentada.

## Matemática necessária

**M22**: probabilidade (credências e atualização); **M24**: estatística dos experimentos de introspecção.

## Métodos

- Leia Butlin, Long et al. (2023) inteiro, depois a versão revisada de 2026.
- Reproduza num modelo aberto um experimento de injeção de conceitos, com TransformerLens **I06**.
- Leia Long et al. (2024) e Birch (2024) sobre precaução.

## Desafios

- Tratar auto-relato verbal de LLM como evidência direta.
- Contar indicadores como placar: eles têm pesos e dependem de teorias.
- Projetar o sistema para satisfazer indicadores e depois usá-los como evidência.

## Fontes

- 🧭 [Consciousness in Artificial Intelligence: Insights from the Science of Consciousness](https://arxiv.org/abs/2308.08708) — Patrick Butlin, Robert Long et al., 2023 · review
- 🆕 [Identifying indicators of consciousness in AI systems](https://doi.org/10.1016/j.tics.2025.10.011) — Patrick Butlin, Robert Long, Tim Bayne, Yoshua Bengio, Jonathan Birch, David Chalmers et al., 2026 · recente
- 🆕 [Emergent Introspective Awareness in Large Language Models](https://transformer-circuits.pub/2025/introspection/index.html) — Jack Lindsey, 2025 · recente
- 📄 [Looking Inward: Language Models Can Learn About Themselves by Introspection](https://arxiv.org/abs/2410.13787) — Felix J. Binder et al., 2024 · paper
- 📄 [Taking AI Welfare Seriously](https://arxiv.org/abs/2411.00986) — Robert Long, Jeff Sebo et al., 2024 · paper
- 📄 [Could a Large Language Model be Conscious?](https://arxiv.org/abs/2303.07103) — David J. Chalmers, 2023 · paper

## Boss fight

Reescreva o ensaio de **S01** como relatório técnico de indicadores sobre o Rei Ichi: para cada indicador, diga se o sistema o satisfaz, com evidência mecanística (não com o nome do módulo), e marque quais foram satisfeitos por construção. Rode no transformer do Rei Ichi um experimento de injeção de conceitos e um teste de mímica — o relato muda quando o estado interno muda, ou só quando o prompt muda? Termine com uma credência explícita e justificada e com o que você faria, eticamente, em cada faixa de credência.

## Checkpoint

- [ ] Como funciona o método dos indicadores e que hipótese ele assume?
- [ ] Por que o auto-relato de um LLM é evidência fraca de experiência?
- [ ] O que o experimento de injeção de conceitos mostrou e quais são seus limites?
- [ ] Quais são os dois erros morais possíveis sobre consciência em IA?
- [ ] Por que satisfazer indicadores "por construção" enfraquece a evidência?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
