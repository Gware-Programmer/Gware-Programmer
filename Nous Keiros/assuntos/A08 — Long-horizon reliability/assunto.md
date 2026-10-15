# A08 — Long-horizon reliability

*Confiabilidade em horizontes longos*

- **Trilha:** Agents
- **Nível:** 11 — Segurança · onda 2
- **Termos:** long-horizon reliability, error compounding, self-correction, verification
- **Projetos KEIROS:** REIXU

## Por que importa

O gargalo prático dos agentes não é inteligência pontual, é confiabilidade ao longo de muitas etapas: pequenos erros se acumulam. Entender por que agentes falham em tarefas longas — e como recuperar — separa demos de sistemas autônomos, e continua sendo um problema aberto de pesquisa.

## Pré-requisitos

- **Depende de:** A04 (Memory for agents), A05 (Agentic planning and reasoning with LLMs), A07 (Agent evaluation)
- **Destrava:** A09 (Autonomy, self-improvement and open-ended systems), AL07 (Deception, scheming and AI control)

## Base

1. Erros compostos: com sucesso p por etapa, n etapas independentes dão cerca de pⁿ **M22**.
2. O modelo de "meia-vida" de Ord (taxa de falha constante) e a evidência de taxas que caem ao longo da tarefa.
3. Verificação e checkpoints; testes como oráculos.
4. Autocorreção: funciona com feedback externo, falha sem ele (Huang et al.).
5. Gestão de contexto em tarefas longas: resumir, persistir estado, notas externas **A04**.
6. Recuperação de falhas e replanejamento **A05**.

## Meio

- Harnesses para agentes de longa duração (planejador, executor, avaliador).
- Detectar laços e deriva de objetivo.
- Medir com horizonte de tempo e pass^k **A07**.

## Avançado

- Confiabilidade × capacidade: por que o horizonte a 80% é tão menor que o a 50%.
- Agentes que trapaceiam para "concluir" tarefas longas → AL07.
- Objetivos estáveis ao longo do tempo → AL08.

## Matemática necessária

**M22**: probabilidade de eventos encadeados; **M24**: ajuste e incerteza; **M09**: escalas logarítmicas.

## Métodos

- Modele matematicamente o seu agente: estime p por etapa e preveja a taxa de sucesso por comprimento; confira com dados.
- Adicione verificação automática e checkpoints ao MUSUBI e meça o ganho.
- Leia Ord e o relatório de riscos do METR sobre trapaça.

## Desafios

- Medir em tarefas curtas e extrapolar.
- Confiar em autoavaliação sem oráculo externo.

## Fontes

- 📰 [Is there a Half-Life for the Success Rates of AI Agents?](https://www.tobyord.com/writing/half-life) — Toby Ord, 2025 · artigo
- 📄 [Large Language Models Cannot Self-Correct Reasoning Yet](https://arxiv.org/abs/2310.01798) — Jie Huang et al., 2023 · paper
- 📄 [Measuring AI Ability to Complete Long Software Tasks](https://arxiv.org/abs/2503.14499) — Thomas Kwa et al. (METR), 2025 · paper
- 📊 [Frontier Risk Report (February to March 2026)](https://metr.org/blog/2026-05-19-frontier-risk-report) — METR, 2026 · relatório
- 🗺️ [Effective context engineering for AI agents](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents) — Anthropic, 2025 · guia

## Boss fight

Construa uma suíte de tarefas longas do seu domínio (por exemplo, implementar módulos completos do REIXU com testes) em quatro faixas de comprimento. Meça a taxa de sucesso por comprimento do seu agente, ajuste os modelos de meia-vida constante e decrescente e compare-os. Depois acrescente verificação por testes, checkpoints e replanejamento e quantifique quanto a curva se desloca.

## Checkpoint

- [ ] Se cada etapa tem 99% de sucesso, qual a chance de cem etapas seguidas darem certo?
- [ ] O que é o modelo de meia-vida de Ord e o que a evidência posterior sugere?
- [ ] Quando a autocorreção funciona?
- [ ] Por que o horizonte a 80% é muito menor que o a 50%?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
