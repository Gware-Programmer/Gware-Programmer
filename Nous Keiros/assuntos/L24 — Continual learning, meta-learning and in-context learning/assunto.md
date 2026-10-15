# L24 — Continual learning, meta-learning and in-context learning

*Aprendizado contínuo, meta-aprendizado e aprendizado em contexto*

- **Trilha:** Machine Learning
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** continual learning, catastrophic forgetting, meta-learning, in-context learning

## Por que importa

Humanos aprendem a vida inteira sem apagar o que sabiam; redes esquecem catastroficamente. Ao mesmo tempo, LLMs "aprendem" dentro do contexto sem mudar pesos. Aprendizado contínuo, meta-aprendizado e aprendizado em contexto tocam um dos maiores problemas abertos — central para qualquer arquitetura cognitiva que viva no tempo, como o Rei Ichi.

## Pré-requisitos

- **Depende de:** L15 (LLM pretraining), M25 (Bayesian inference, MCMC and variational inference)
- **Destrava:** —

## Base

1. Esquecimento catastrófico e os três cenários (tarefa, domínio e classe incrementais).
2. Soluções: regularização (EWC, via informação de Fisher **M25**), replay (de experiência e gerativo), arquiteturas que crescem.
3. Perda de plasticidade em aprendizado contínuo longo.
4. Meta-aprendizado: MAML, aprender a aprender.
5. Aprendizado em contexto (in-context learning) em LLMs; induction heads **L15**.
6. ICL como gradiente implícito? Uma hipótese testada só em casos simples.

## Meio

- Métricas: transferência para frente e para trás, acurácia média ao longo das tarefas.
- Memória externa vs. pesos (RAG, test-time training) → A04.
- Sistemas de aprendizagem complementares (hipocampo e neocórtex) como inspiração → N07.

## Avançado

- Aprendizado contínuo em LLMs (pré-treino continuado, edição de conhecimento): ainda sem solução satisfatória.
- Teoria do ICL: transformers que implementam algoritmos de aprendizado.
- Estabilidade × plasticidade no cérebro → N03.

## Matemática necessária

**M25**: aproximação de Laplace e posterior; **M26**: informação de Fisher e KL.

## Métodos

- Implemente fine-tuning ingênuo, EWC e replay em Split-MNIST e Permuted-MNIST e reproduza os três cenários.
- Reproduza a perda de plasticidade num treino contínuo longo.
- Treine um transformer pequeno para fazer regressão linear em contexto.

## Desafios

- Avaliar só no cenário mais fácil (incremental por tarefa).
- Confundir ICL com aprendizado persistente.

## Fontes

- 📄 [Overcoming catastrophic forgetting in neural networks](https://doi.org/10.1073/pnas.1611835114) — James Kirkpatrick et al., 2017 · paper. o EWC
- 📄 [Three types of incremental learning](https://doi.org/10.1038/s42256-022-00568-3) — Gido M. van de Ven, Tinne Tuytelaars & Andreas S. Tolias, 2022 · paper
- 🆕 [Loss of plasticity in deep continual learning](https://doi.org/10.1038/s41586-024-07711-7) — Shibhansh Dohare et al., 2024 · recente
- 📄 [Model-Agnostic Meta-Learning for Fast Adaptation of Deep Networks](https://arxiv.org/abs/1703.03400) — Chelsea Finn, Pieter Abbeel & Sergey Levine, 2017 · paper
- 📰 [In-context Learning and Induction Heads](https://transformer-circuits.pub/2022/in-context-learning-and-induction-heads/index.html) — Catherine Olsson et al. (Anthropic), 2022 · artigo
- 📄 [What Can Transformers Learn In-Context? A Case Study of Simple Function Classes](https://arxiv.org/abs/2208.01066) — Shivam Garg, Dimitris Tsipras, Percy Liang & Gregory Valiant, 2022 · paper

## Boss fight

Monte um banco de testes de aprendizado contínuo: Split-MNIST e Permuted-MNIST nos três cenários, com fine-tuning ingênuo, EWC, replay e replay gerativo. Reproduza a perda de plasticidade num treino longo e teste uma correção (reinicialização seletiva de unidades). Depois treine um transformer pequeno para regressão linear em contexto e compare o que ele faz com mínimos quadrados e com gradiente descendente.

## Checkpoint

- [ ] Por que redes esquecem catastroficamente?
- [ ] Como o EWC usa a informação de Fisher?
- [ ] O que é perda de plasticidade e como ela difere do esquecimento?
- [ ] O que são induction heads e qual a sua relação com o aprendizado em contexto?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
