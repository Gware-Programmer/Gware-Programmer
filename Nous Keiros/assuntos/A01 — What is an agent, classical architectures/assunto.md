# A01 — What is an agent: classical architectures

*O que é um agente: arquiteturas clássicas*

- **Trilha:** Agents
- **Nível:** 1 — Provas e código · onda 2
- **Termos:** intelligent agents, BDI, sense-plan-act, subsumption architecture
- **Projetos KEIROS:** MUSUBI, REIXU

## Por que importa

Agente é qualquer sistema que percebe e age para atingir objetivos. Antes dos LLMs, décadas de IA definiram arquiteturas de agentes — reativas, deliberativas, BDI, híbridas — que continuam explicando por que os agentes atuais funcionam ou falham, inclusive o seu orquestrador.

## Pré-requisitos

- **Depende de:** C01 (Scientific Python: the lab), M05 (Logic, sets and the language of mathematics)
- **Destrava:** A02 (Search and classical planning), K01 (What is a cognitive architecture)

## Base

1. Definição: percepção, ação, ambiente e medida de desempenho (Russell & Norvig).
2. Tipos de ambiente: observável ou não, determinístico ou estocástico, episódico ou sequencial, estático ou dinâmico, discreto ou contínuo, um ou vários agentes.
3. Tipos de agente: reflexo simples, com modelo, baseado em objetivos, baseado em utilidade, que aprende.
4. Arquitetura de subsunção (Brooks): comportamento sem representação central.
5. BDI: crenças, desejos e intenções **M05**.
6. O laço percepção → deliberação → ação.

## Meio

- Arquiteturas híbridas (camada reativa + camada deliberativa).
- Racionalidade limitada → G04.
- Agência em software: atores, mensagens, concorrência.

## Avançado

- Os agentes de linguagem atuais como retorno do BDI com planejamento → A03.
- O que é agência, filosoficamente → F07.
- "Inteligência sem representação" vs. modelos internos: um debate vivo em IA incorporada → B05.

## Matemática necessária

**M05**: lógica (crenças e regras).

## Métodos

- Implemente agentes reflexo, com modelo e baseados em objetivo num mundo de grade.
- Leia Brooks (1991) e escreva o melhor contra-argumento que conseguir.
- Classifique cada componente do MUSUBI pela taxonomia de Russell & Norvig.

## Desafios

- Confundir "agente" com "LLM com ferramentas".
- Não definir a medida de desempenho: o que exatamente o agente otimiza.

## Fontes

- 📖 [Artificial Intelligence: A Modern Approach (4ª ed.)](http://aima.cs.berkeley.edu/) — Stuart Russell & Peter Norvig, 2020 · livro. caps. 1–2
- 📄 [Intelligent agents: theory and practice](https://doi.org/10.1017/S0269888900008122) — Michael Wooldridge & Nicholas R. Jennings, 1995 · paper
- 📄 [Intelligence without representation](https://doi.org/10.1016/0004-3702(91)90053-M) — Rodney A. Brooks, 1991 · paper
- 🧭 [A Survey on Large Language Model based Autonomous Agents](https://arxiv.org/abs/2308.11432) — Lei Wang et al., 2023 · review. a ponte para os agentes atuais

## Boss fight

Implemente em REIXU ou C um simulador de mundo de grade com agentes reflexo, com modelo, baseado em objetivos e uma arquitetura de subsunção de três camadas, e compare-os em ambientes parcialmente observáveis e dinâmicos. Depois escreva uma análise do MUSUBI com a taxonomia de Russell & Norvig: que tipo de agente é cada camada (L0–L7) e cada operador, e em que tipo de ambiente cada um vive?

## Checkpoint

- [ ] Defina agente racional segundo Russell & Norvig.
- [ ] Classifique xadrez e dirigir um carro pelos tipos de ambiente.
- [ ] O que é a arquitetura de subsunção?
- [ ] O que significam crenças, desejos e intenções no BDI?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
