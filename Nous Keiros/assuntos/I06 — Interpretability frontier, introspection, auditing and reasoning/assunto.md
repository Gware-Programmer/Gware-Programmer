# I06 — Interpretability frontier: introspection, auditing and reasoning

*Fronteira da interpretabilidade: introspecção, auditoria e raciocínio*

- **Trilha:** Mechanistic Interpretability
- **Nível:** 11 — Segurança · onda 1
- **Termos:** introspection, model auditing, CoT faithfulness, parameter decomposition

## Por que importa

A interpretabilidade deixou de ser só curiosidade: hoje ela audita modelos atrás de objetivos ocultos, investiga se a chain-of-thought é fiel e testa se modelos têm acesso aos próprios estados internos (introspecção). É também onde o seu interesse por consciência encontra o lado experimental da IA.

## Pré-requisitos

- **Depende de:** I05 (Sparse dictionaries: SAEs, transcoders and attribution graphs), L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models)
- **Destrava:** S10 (AI consciousness: indicators, introspection and welfare)

## Base

1. Auditoria de modelos: jogos com objetivos ocultos.
2. Comparação de modelos (model diffing) com crosscoders.
3. Fidelidade da chain-of-thought: modelos de raciocínio nem sempre dizem o que pensam **L17**.
4. Introspecção em LLMs: injeção de conceitos nas ativações (Lindsey, 2025).
5. Decomposição no espaço de parâmetros (APD, SPD).
6. A agenda: problemas abertos e prioridades.

## Meio

- Replicações independentes da introspecção: cerca de 20% de sucesso no Llama-3.1-8B, igual ao reportado para os Claude, e a crítica de que ela é "agnóstica ao conteúdo".
- Interpretabilidade de modelos de raciocínio e de agentes.
- Agentes de interpretabilidade: automatizar a investigação.

## Avançado

- O que a introspecção mostra e não mostra: há acesso causal limitado a estados internos consenso; se isso é introspecção no sentido psicológico contestado; qualquer ligação com experiência especulação → S10
- Críticas metodológicas ao campo contestado — e saudável
- Interpretabilidade como ferramenta de alinhamento: detectar engano → AL05.

## Matemática necessária

**M38**: intervenções; **M24**: estatística; **M19**: direções e projeções.

## Métodos

- Replique o experimento de injeção de conceitos num modelo aberto na 3090, como fizeram as replicações independentes.
- Rode um mini jogo de auditoria: ajuste um modelo com um objetivo oculto e tente descobri-lo só com ferramentas de interpretabilidade.
- Leia o "Open Problems" e escolha um problema para atacar.

## Desafios

- Supervalorizar resultados únicos não replicados.
- Confundir autorrelato com acesso causal.
- Ignorar taxas de base e falsos positivos.

## Fontes

- 🆕 [Emergent Introspective Awareness in Large Language Models](https://transformer-circuits.pub/2025/introspection/index.html) — Jack Lindsey (Anthropic), 2025 · recente
- 🆕 [Detecting the Disturbance: A Nuanced View of Introspective Abilities in LLMs](https://arxiv.org/abs/2512.12411) — Ely Hahami, Ishaan Sinha, Lavik Jain, Josh Kaplan & Jon Hahami, 2025 · recente. replicação em Llama-3.1-8B
- 🆕 [Emergent Introspection in AI is Content-Agnostic](https://arxiv.org/abs/2603.05414) — Harvey Lederman & Kyle Mahowald, 2026 · recente
- 📄 [Auditing language models for hidden objectives](https://arxiv.org/abs/2503.10965) — Samuel Marks et al. (Anthropic), 2025 · paper
- 📄 [Reasoning Models Don't Always Say What They Think](https://arxiv.org/abs/2505.05410) — Yanda Chen et al. (Anthropic), 2025 · paper
- 🧭 [Open Problems in Mechanistic Interpretability](https://arxiv.org/abs/2501.16496) — Lee Sharkey et al., 2025 · review
- 🎓 [ARENA](https://www.arena.education/) — ARENA · curso. exercícios práticos de interpretabilidade, avaliações e RL
- 📰 [How To Become A Mechanistic Interpretability Researcher](https://www.alignmentforum.org/posts/jP9KDyMkchuv6tHwm/how-to-become-a-mechanistic-interpretability-researcher) — Neel Nanda, 2025 · artigo. roteiro de autodidata para pesquisa, atualizado em setembro de 2025

## Boss fight

Replique na 3090 o experimento de injeção de conceitos num modelo aberto (Llama-3.1-8B ou equivalente): meça a taxa de detecção e nomeação, controles com injeções aleatórias e a dependência da camada e da intensidade. Depois rode um mini jogo de auditoria — ajuste um modelo com um objetivo oculto e tente descobri-lo só com sondas, SAEs e patching — e escreva o que cada ferramenta revelou e o que deixou escapar.

## Checkpoint

- [ ] Como funciona o experimento de injeção de conceitos e o que ele controla?
- [ ] Por que a chain-of-thought pode não ser fiel ao cálculo do modelo?
- [ ] O que é model diffing e para que serve?
- [ ] Separe o que é consenso, o que é contestado e o que é especulação nos resultados de introspecção.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
