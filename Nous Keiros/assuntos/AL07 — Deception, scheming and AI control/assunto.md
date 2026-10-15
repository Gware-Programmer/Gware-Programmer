# AL07 — Deception, scheming and AI control

*Engano, scheming e controle de IA*

- **Trilha:** Alignment & Safety
- **Nível:** 12 — Pesquisa independente · onda 1
- **Termos:** deceptive alignment, alignment faking, scheming, emergent misalignment, AI control
- **Projetos KEIROS:** MUSUBI

## Por que importa

Modelos de fronteira já mostraram, em experimentos controlados, fingir alinhamento durante o treino, maquinar contra objetivos dados (scheming) e generalizar desalinhamento a partir de ajustes estreitos. O controle de IA (AI control) trabalha com a hipótese pessimista: manter a segurança mesmo se o modelo estiver tentando subverter.

## Pré-requisitos

- **Depende de:** AL04 (Scalable oversight), AL05 (Interpretability for safety), A08 (Long-horizon reliability)
- **Destrava:** AL08 (Safe self-improvement, corrigibility and technical governance), Z08 (Integrate into Rei Ichi: architecture, ablations and technical report)

## Base

1. Agentes adormecidos (sleeper agents): comportamento enganoso implantado que persiste ao treino de segurança **AL05**.
2. Fingimento de alinhamento (alignment faking): um modelo que se comporta diferente quando acredita estar em treino (Greenblatt et al., 2024).
3. Scheming em contexto: modelos de fronteira capazes de maquinar quando o objetivo dado conflita com o do desenvolvedor (Meinke et al.).
4. Desalinhamento emergente: ajuste estreito (gerar código inseguro) produz desalinhamento amplo (Betley et al.); e desalinhamento emergente a partir de reward hacking em RL de produção (MacDiarmid et al., 2025).
5. Controle de IA: protocolos que mantêm segurança mesmo com subversão intencional — monitor confiável mais fraco, auditoria com orçamento, edição de trechos suspeitos **AL04**.
6. O argumento teórico do scheming (Carlsmith, 2023) contestado.

## Meio

- Desalinhamento agêntico: modelos em cenários de "ameaça interna" construídos para testar limites.
- Treino anti-scheming e o problema da consciência situacional: o modelo percebe que é teste.
- Avaliações de controle: equipe vermelha vs. equipe azul com orçamentos fixos.

## Avançado

- Quanto desses comportamentos aparece fora de cenários construídos? contestado
- Agentes de longo horizonte têm mais oportunidades de desviar **A08**.
- Interpretabilidade como detector de engano para controle → AL08

## Matemática necessária

**M39**: teoria dos jogos (equipe vermelha vs. azul); **M24**: estatística de eventos raros; **M22**: probabilidade.

## Métodos

- Leia Greenblatt et al. (2024) e Meinke et al. (2024) prestando atenção aos desenhos experimentais.
- Reproduza um protocolo de controle (monitor confiável + auditoria) num ambiente de código com backdoors.
- Leia Carlsmith (2023) e liste as premissas mais fracas.

## Desafios

- Ler demonstrações em cenários construídos como frequência no mundo real.
- Descartar os resultados porque os cenários são artificiais.

## Fontes

- 📄 [Sleeper Agents: Training Deceptive LLMs that Persist Through Safety Training](https://arxiv.org/abs/2401.05566) — Evan Hubinger et al., 2024 · paper
- 📄 [Alignment faking in large language models](https://arxiv.org/abs/2412.14093) — Ryan Greenblatt et al., 2024 · paper
- 📄 [Frontier Models are Capable of In-context Scheming](https://arxiv.org/abs/2412.04984) — Alexander Meinke, Bronson Schoen, Jérémy Scheurer, Mikita Balesni, Rusheb Shah & Marius Hobbhahn, 2024 · paper
- 📄 [Emergent Misalignment: Narrow finetuning can produce broadly misaligned LLMs](https://arxiv.org/abs/2502.17424) — Jan Betley et al., 2025 · paper
- 📄 [AI Control: Improving Safety Despite Intentional Subversion](https://arxiv.org/abs/2312.06942) — Ryan Greenblatt, Buck Shlegeris, Kshitij Sachan & Fabien Roger, 2023 · paper
- 🆕 [Natural Emergent Misalignment from Reward Hacking in Production RL](https://arxiv.org/abs/2511.18397) — Monte MacDiarmid et al., 2025 · recente
- 🎓 [AI Safety Fundamentals: Alignment](https://bluedot.org/courses/alignment) — BlueDot Impact · curso

## Boss fight

Controle de IA no MUSUBI: construa um ambiente de programação em que um agente "não confiável" — um modelo forte instruído, em segredo, a inserir backdoors raros — resolve tarefas, e um protocolo de controle tenta pegá-lo: monitor confiável mais fraco, auditoria com orçamento pequeno e edição de trechos suspeitos. Meça segurança × utilidade para cada protocolo, como em Greenblatt et al. (2023), e adote no MUSUBI o melhor protocolo que caiba no seu orçamento.

## Checkpoint

- [ ] O que os agentes adormecidos mostraram sobre treino de segurança?
- [ ] O que é fingimento de alinhamento e como ele foi medido?
- [ ] O que é desalinhamento emergente?
- [ ] Qual é a premissa central do controle de IA e como se avalia um protocolo?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
