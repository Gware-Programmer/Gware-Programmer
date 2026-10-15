# Z08 — Integrate into Rei Ichi: architecture, ablations and technical report

*Integrar no Rei Ichi: arquitetura, ablações e relatório técnico*

- **Trilha:** Build Your Own AI
- **Nível:** 12 — Pesquisa independente · onda 3
- **Termos:** system integration, cognitive architecture, language model core, agent layer, interpretability monitoring, AI control protocol, ablation studies, consciousness indicators, technical report, preprint
- **Projetos KEIROS:** Rei Ichi, MUSUBI, REIXU, .kei

## Por que importa

É o ponto de chegada do caminho prático: as peças que você construiu — modelo base, pós-treino, inferência local, agente, interpretabilidade e segurança — viram uma arquitetura só, o Rei Ichi. A integração mostra os problemas que nenhuma peça isolada mostra, e o relatório técnico é o que torna o seu trabalho verificável por outras pessoas.

## Pré-requisitos

- **Depende de:** Z04 (Run your model on the M1: quantization and local serving), Z05 (Build an agent on your model: tools, memory and retrieval), Z06 (Open your model: probes, SAEs and circuits), Z07 (Red-team and align your model), K07 (Forty years of cognitive architectures: what was solved and what wasn't), S10 (AI consciousness: indicators, introspection and welfare), AL07 (Deception, scheming and AI control), S11 (Substrate, causation and computation), AL08 (Safe self-improvement, corrigibility and technical governance), P05 (Writing a paper)
- **Destrava:** —

## Base

1. A arquitetura cognitiva do Rei Ichi: módulos, memória e ciclo de controle **K07**.
2. O seu modelo como núcleo de linguagem, rodando localmente **Z04**.
3. O agente como camada de ação **Z05**.
4. Interpretabilidade e monitoramento embutidos **Z06**.
5. Segurança e controle desde o projeto **Z07** **AL07**.
6. Indicadores de consciência avaliados com honestidade **S10**.
7. Ablações: o que cada módulo acrescenta de verdade.

## Meio

- Testes de integração e de regressão para cada módulo.
- Orçamento de recursos no M1 com tudo rodando junto.
- Documentação de arquitetura e de decisões.

## Avançado

- Autonomia graduada com controle **AL08**.
- O que o substrato digital implica para as afirmações sobre o sistema **S11**.
- Um programa de pesquisa a partir do que o Rei Ichi ainda não consegue fazer.

## Matemática necessária

**P04**: estatística das ablações; **P05**: escrever o relatório.

## Métodos

- Comece pela arquitetura no papel (diagrama e interfaces) antes de juntar código.
- Integre um módulo de cada vez, com testes e medições.
- Escreva o relatório técnico em paralelo, não no fim.

## Desafios

- Integrar tudo de uma vez e não saber o que quebrou.
- Ablações sem estatística.
- Afirmar mais do que os experimentos sustentam, sobretudo sobre consciência.

## Fontes

- 📄 [Cognitive Architectures for Language Agents](https://arxiv.org/abs/2309.02427) — Theodore R. Sumers, Shunyu Yao, Karthik Narasimhan & Thomas L. Griffiths, 2023 · paper
- 📄 [A Standard Model of the Mind: Toward a Common Computational Framework across Artificial Intelligence, Cognitive Science, Neuroscience, and Robotics](https://doi.org/10.1609/aimag.v38i4.2744) — John E. Laird, Christian Lebiere & Paul S. Rosenbloom, 2017 · paper
- 📄 [Consciousness in Artificial Intelligence: Insights from the Science of Consciousness](https://arxiv.org/abs/2308.08708) — Patrick Butlin et al., 2023 · paper
- 🆕 [Identifying indicators of consciousness in AI systems](https://doi.org/10.1016/j.tics.2025.10.011) — Patrick Butlin et al., 2026 · recente
- 📄 [AI Control: Improving Safety Despite Intentional Subversion](https://arxiv.org/abs/2312.06942) — Ryan Greenblatt et al., 2023 · paper
- 📄 [Deep Reinforcement Learning that Matters](https://arxiv.org/abs/1709.06560) — Peter Henderson et al., 2018 · paper
- 📄 [Model Cards for Model Reporting](https://arxiv.org/abs/1810.03993) — Margaret Mitchell et al., 2019 · paper

**Exceções na regra de materiais:**

- sem material de entrada: projeto integrador: os materiais vêm dos projetos Z01–Z07
- sem material prático: é o próprio projeto
- sem aula ou vídeo: projeto integrador: os materiais vêm dos projetos Z01–Z07

## Boss fight

Integre a sua IA no Rei Ichi e escreva o relatório técnico: arquitetura (diagrama e interfaces), o seu modelo como núcleo, o agente, o monitoramento por interpretabilidade e o protocolo de segurança e controle; ablações de cada módulo com intervalos de confiança; a avaliação dos indicadores de consciência, com o que eles podem e não podem dizer; e limitações honestas. Deixe o relatório em formato de preprint — ele é a base do boss do nível 12.

## Checkpoint

- [ ] Por que integrar um módulo de cada vez?
- [ ] O que uma ablação mostra sobre a contribuição de um módulo?
- [ ] Que afirmações sobre consciência os indicadores permitem, e quais não permitem?
- [ ] Como o protocolo de controle limita o que o Rei Ichi pode fazer sozinho?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
