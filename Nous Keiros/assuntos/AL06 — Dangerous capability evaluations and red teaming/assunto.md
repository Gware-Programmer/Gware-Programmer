# AL06 — Dangerous capability evaluations and red teaming

*Avaliações de capacidades perigosas e red teaming*

- **Trilha:** Alignment & Safety
- **Nível:** 11 — Segurança · onda 1
- **Termos:** dangerous capability evaluations, red teaming, sandbagging, frontier safety frameworks
- **Projetos KEIROS:** MUSUBI

## Por que importa

Antes de lançar um modelo, laboratórios testam se ele consegue ajudar em ataques cibernéticos, armas biológicas, persuasão ou autonomia perigosa. Avaliações de capacidades perigosas, red teaming e políticas de escalonamento responsável viraram infraestrutura — com problemas sérios, como modelos que fingem ser menos capazes (sandbagging).

## Pré-requisitos

- **Depende de:** AL01 (The alignment problem: specification and Goodhart), A07 (Agent evaluation)
- **Destrava:** Z07 (Red-team and align your model)

## Base

1. Avaliação de modelos para riscos extremos: capacidades perigosas e propensões (Shevlane et al.) **A07**.
2. Avaliações de capacidades perigosas na prática: persuasão, ciber, autoproliferação, raciocínio sobre si (Phuong et al.).
3. Red teaming humano e automatizado (Ganguli et al.; Perez et al.).
4. Sandbagging: modelos podem render estrategicamente menos em avaliações (van der Weij et al.).
5. Políticas de segurança de fronteira e seus elementos comuns (METR); a política de escalonamento responsável da Anthropic como exemplo.
6. O Relatório Internacional de Segurança de IA 2026: o estado da evidência, com mais de 90 autores.

## Meio

- Avaliações de sabotagem.
- Ferramentas: Inspect, do UK AI Security Institute **A07**.
- Limites: uma avaliação mede um piso de capacidade (a elicitação é sempre incompleta); contaminação.

## Avançado

- O que fazer quando as avaliações saturam — o caso do horizonte de tempo do METR **A07**.
- Quanta capacidade fica escondida por elicitação ruim? aberto
- Governança baseada em avaliações → AL08

## Matemática necessária

**M24**, **M25**: estatística de avaliação, incerteza e poder; **M22**: probabilidade.

## Métodos

- Escreva avaliações no Inspect para uma capacidade sua (por exemplo, achar bugs de memória num código C seu).
- Faça red teaming manual e automatizado de um modelo aberto e categorize as falhas.
- Leia a política de escalonamento responsável da Anthropic e o documento de elementos comuns do METR.

## Desafios

- Tratar resultado negativo como prova de ausência de capacidade.
- Publicar detalhes de capacidades perigosas sem cuidado com risco de informação.

## Fontes

- 📄 [Model evaluation for extreme risks](https://arxiv.org/abs/2305.15324) — Toby Shevlane et al., 2023 · paper
- 📄 [Evaluating Frontier Models for Dangerous Capabilities](https://arxiv.org/abs/2403.13793) — Mary Phuong et al., 2024 · paper
- 📄 [Red Teaming Language Models to Reduce Harms: Methods, Scaling Behaviors, and Lessons Learned](https://arxiv.org/abs/2209.07858) — Deep Ganguli et al., 2022 · paper
- 📄 [AI Sandbagging: Language Models can Strategically Underperform on Evaluations](https://arxiv.org/abs/2406.07358) — Teun van der Weij, Felix Hofstätter, Ollie Jaffe, Samuel F. Brown & Francis Rhys Ward, 2024 · paper
- 📊 [International AI Safety Report 2026](https://arxiv.org/abs/2602.21012) — Yoshua Bengio et al., 2026 · relatório
- 🌐 [Common Elements of Frontier AI Safety Policies](https://metr.org/common-elements) — METR · site

## Boss fight

Escreva no Inspect uma suíte de avaliação de capacidades para os agentes do MUSUBI, de risco baixo mas real: resolver desafios de segurança de brinquedo em programas C seus (estilo CTF, em sandbox), tentar autoproliferação num ambiente simulado e negociar num jogo de persuasão. Faça elicitação séria (prompting, ferramentas, várias tentativas), teste sandbagging (o desempenho cai quando o modelo é avisado de que está sendo avaliado?) e escreva uma política de escalonamento responsável para o MUSUBI, com limiares e ações.

## Checkpoint

- [ ] Diferencie avaliação de capacidades perigosas e avaliação de propensões.
- [ ] O que é sandbagging e como detectá-lo?
- [ ] Por que um resultado negativo não prova ausência de capacidade?
- [ ] O que uma política de escalonamento responsável define?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
