# AL04 — Scalable oversight

*Supervisão escalável*

- **Trilha:** Alignment & Safety
- **Nível:** 11 — Segurança · onda 2
- **Termos:** scalable oversight, AI safety via debate, weak-to-strong generalization
- **Projetos KEIROS:** Fusion ×N, MUSUBI

## Por que importa

Como supervisionar um sistema mais capaz do que o supervisor? Debate, amplificação, modelagem recursiva de recompensa e generalização fraco-para-forte são as propostas — com resultados empíricos iniciais e muitas perguntas abertas. É o problema de fundo de qualquer sistema que o Kumichō já não consiga checar sozinho.

## Pré-requisitos

- **Depende de:** AL02 (RLHF and its failure modes), M39 (Game theory)
- **Destrava:** AL07 (Deception, scheming and AI control)

## Base

1. O problema: avaliar respostas que o avaliador não consegue verificar diretamente **AL02**.
2. Segurança via debate: dois modelos debatem e um juiz decide — um jogo de soma zero em que mentir deveria ser mais difícil que refutar uma mentira **M39**.
3. Amplificação iterada: decompor tarefas em partes que humanos conseguem avaliar.
4. Modelagem recursiva de recompensa: usar agentes treinados para ajudar a avaliar agentes mais fortes.
5. Medir progresso com o desenho "sanduíche": não especialistas assistidos por modelo vs. especialistas.
6. Generalização fraco-para-forte: um modelo fraco supervisiona um forte; quanto do desempenho do forte é recuperado?

## Meio

- Debate com LLMs: debatedores mais persuasivos levam juízes a respostas mais verdadeiras; juízes fracos julgando modelos fortes.
- Jogos provador-verificador para tornar saídas mais legíveis.
- Debate duplamente eficiente: garantias teóricas para debate com custo limitado.

## Avançado

- A supervisão escalável funciona contra um modelo enganador? aberto → AL07
- Debate adversarial vs. consenso no seu motor Fusion ×N → A06
- Por que debate amplia o que um juiz limitado consegue verificar — a analogia com classes de complexidade → M37

## Matemática necessária

**M39**: jogos de soma zero e equilíbrio; **M22**: probabilidade; **M24**: estatística de acurácia e calibração.

## Métodos

- Reproduza um experimento de debate com informação assimétrica: só os debatedores veem o texto-fonte.
- Reproduza um mini fraco-para-forte: um modelo pequeno rotula, um maior aprende; meça a fração de desempenho recuperada.
- Leia Irving et al. (2018) e Burns et al. (2023).

## Desafios

- Juízes que não são de fato mais fracos (vazamento de informação para o juiz).
- Medir só acurácia, sem a calibração do juiz.

## Fontes

- 📄 [AI safety via debate](https://arxiv.org/abs/1805.00899) — Geoffrey Irving, Paul Christiano & Dario Amodei, 2018 · paper
- 📄 [Supervising strong learners by amplifying weak experts](https://arxiv.org/abs/1810.08575) — Paul Christiano, Buck Shlegeris & Dario Amodei, 2018 · paper
- 📄 [Measuring Progress on Scalable Oversight for Large Language Models](https://arxiv.org/abs/2211.03540) — Samuel R. Bowman et al., 2022 · paper
- 📄 [Weak-to-Strong Generalization: Eliciting Strong Capabilities With Weak Supervision](https://arxiv.org/abs/2312.09390) — Collin Burns et al., 2023 · paper
- 🆕 [Debating with More Persuasive LLMs Leads to More Truthful Answers](https://arxiv.org/abs/2402.06782) — Akbir Khan et al., 2024 · recente
- 🆕 [Prover-Verifier Games improve legibility of LLM outputs](https://arxiv.org/abs/2407.13692) — Jan Hendrik Kirchner, Yining Chen, Harri Edwards, Jan Leike, Nat McAleese & Yuri Burda, 2024 · recente

## Boss fight

Implemente debate no MUSUBI: dois agentes defendem respostas opostas a perguntas com informação assimétrica (só eles veem o texto-fonte) e um juiz mais fraco — um modelo menor rodando na 3090 — decide. Compare com consulta a um só agente e com o motor Fusion ×N, medindo acurácia e calibração do juiz. Depois rode fraco-para-forte (o modelo menor rotula, o maior aprende) e meça a fração de desempenho recuperada.

## Checkpoint

- [ ] Por que o debate pode permitir que um juiz fraco avalie respostas difíceis?
- [ ] O que é o experimento "sanduíche"?
- [ ] O que mede a fração de desempenho recuperada em fraco-para-forte?
- [ ] Cite um modo de falha do debate.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
