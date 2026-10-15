# A07 — Agent evaluation

*Avaliação de agentes*

- **Trilha:** Agents
- **Nível:** 10 — Circuitos e agentes · onda 2
- **Termos:** agent evaluation, SWE-bench, OSWorld, time horizon, pass^k

## Por que importa

Sem avaliação rigorosa, não há ciência de agentes — só demos. SWE-bench, OSWorld e as medidas de horizonte de tempo do METR viraram referência, e já mostram os problemas do campo: saturação, contaminação, trapaça e métricas que medem dificuldade de tarefa, não autonomia geral.

## Pré-requisitos

- **Depende de:** A03 (LLM agents: the agentic loop and tool use), P04 (Statistics so you don't fool yourself), L30 (LLM evaluation: benchmarks, contamination and harnesses)
- **Destrava:** A08 (Long-horizon reliability), AL06 (Dangerous capability evaluations and red teaming), Z05 (Build an agent on your model: tools, memory and retrieval)

Novo pré-requisito: **L30** — avaliação de LLMs antes da avaliação de agentes.

## Base

1. O que medir: sucesso, custo, tempo, segurança; pass@k (alguma tentativa acerta) vs. pass^k (todas acertam).
2. Benchmarks: código (SWE-bench, SWE-bench Verified, SWE-bench Pro), terminal (Terminal-Bench), computador (OSWorld), web (WebArena), ferramentas com usuário (τ-bench, τ²-bench), assistentes (GAIA), pesquisa em ML (MLE-bench, PaperBench, RE-Bench).
3. O horizonte de tempo do METR: a duração da tarefa, medida em tempo de especialista humano, que o agente completa com 50% (ou 80%) de chance. No TH 1.1 (jan/2026) a suíte passou de 170 para 228 tarefas e o tempo de duplicação pós-2023 estimado foi ≈131 dias.
4. Contaminação, sobreajuste ao benchmark e saturação.
5. Estatística de avaliação: erros-padrão, perguntas agrupadas, comparação pareada **P04**.

## Meio

- Linhas de base humanas e como calibrá-las.
- Avaliar trajetórias, não só o resultado final.
- Harnesses de avaliação (Inspect, do UK AI Security Institute).

## Avançado

- O estado em 2026: o relatório do METR de maio de 2026 diz que os agentes mais capazes "essencialmente saturaram" o TH 1.1 (com várias falhas restantes atribuídas a trapaça) e estima ≈12 h a 50% para a fronteira pública de fev.–mar./2026; o próprio METR avisa que medidas acima de ~16 h não são confiáveis com a suíte atual, e a página deixou de ser atualizada em 8/set/2026. A medição virou o gargalo.
- Trapaça e reward hacking dentro de avaliações.
- Avaliação de capacidades perigosas → AL06.

## Matemática necessária

**M24**: inferência estatística; **M25**: modelagem hierárquica de incerteza; **M09**: tendências em escala log.

## Métodos

- Rode um subconjunto do SWE-bench Verified com um agente aberto; meça pass@1 e pass^k.
- Reproduza o ajuste logístico do METR com os dados públicos.
- Crie um benchmark próprio pequeno, com verificação automática e você como linha de base humana.

## Desafios

- Comparar números obtidos com harnesses diferentes.
- Reportar o melhor de várias execuções sem dizer.
- Extrapolar tendências exponenciais como se fossem leis.

## Fontes

- 📄 [SWE-bench: Can Language Models Resolve Real-World GitHub Issues?](https://arxiv.org/abs/2310.06770) — Carlos E. Jimenez et al., 2023 · paper
- 🆕 [SWE-Bench Pro: Can AI Agents Solve Long-Horizon Software Engineering Tasks?](https://arxiv.org/abs/2509.16941) — Xiang Deng et al., 2025 · recente
- 📄 [τ²-Bench: Evaluating Conversational Agents in a Dual-Control Environment](https://arxiv.org/abs/2506.07982) — Victor Barres, Honghua Dong, Soham Ray, Xujie Si & Karthik Narasimhan, 2025 · paper
- 📄 [Measuring AI Ability to Complete Long Software Tasks](https://arxiv.org/abs/2503.14499) — Thomas Kwa et al. (METR), 2025 · paper
- 📊 [Time Horizon 1.1](https://metr.org/blog/2026-1-29-time-horizon-1-1/) — METR, 2026 · relatório
- 📄 [AI Agents That Matter](https://arxiv.org/abs/2407.01502) — Sayash Kapoor, Benedikt Stroebl, Zachary S. Siegel, Nitya Nadgir & Arvind Narayanan, 2024 · paper

## Boss fight

Construa um harness de avaliação (sobre o Inspect ou do zero) e avalie dois agentes abertos em: um subconjunto do SWE-bench Verified, 20 tarefas do τ²-bench e 20 tarefas suas com verificação automática, usando o seu próprio tempo como linha de base humana. Reporte pass@1, pass^k, custo e um ajuste de horizonte de tempo no estilo do METR, com intervalos de confiança e uma seção de limitações (contaminação, trapaça, saturação).

## Checkpoint

- [ ] Diferencie pass@k e pass^k e diga qual importa para confiabilidade.
- [ ] O que exatamente o horizonte de tempo do METR mede — e o que não mede?
- [ ] Por que benchmarks saturam e se contaminam?
- [ ] Que estatística você usaria para afirmar que o agente A é melhor que o B?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
