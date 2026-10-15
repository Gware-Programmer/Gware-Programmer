# L17 — Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models

*Pós-treino: SFT, RLHF, DPO, RLAIF, RLVR e modelos de raciocínio*

- **Trilha:** Machine Learning
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** post-training, instruction tuning, RLHF, DPO, constitutional AI, RLVR, GRPO, reasoning models

## Por que importa

O pós-treino transforma um preditor de texto num assistente — e, desde 2024–2025, num "raciocinador": aprendizado por reforço com recompensas verificáveis (RLVR) produziu modelos que pensam passo a passo. Aqui estão as técnicas que mais mudaram a IA recente e os seus modos de falha.

## Pré-requisitos

- **Depende de:** L15 (LLM pretraining), R06 (Policy gradients: REINFORCE, TRPO and PPO), AL01 (The alignment problem: specification and Goodhart)
- **Destrava:** L25 (Reasoning, search and compositional generalization), I06 (Interpretability frontier: introspection, auditing and reasoning), R10 (The RL frontier), A03 (LLM agents: the agentic loop and tool use), AL02 (RLHF and its failure modes), AL03 (Robustness and adversarial attacks), Z03 (Post-train an open model: SFT, preferences and RLVR)

Novo pré-requisito: **AL01** — reward hacking e especificação de recompensas aparecem direto no RLHF.

## Base

1. Ajuste fino supervisionado (SFT) com instruções e formatos de conversa.
2. RLHF: modelo de recompensa a partir de preferências (Bradley–Terry) e otimização com PPO sob penalidade de KL **R06****M26**.
3. DPO: otimizar preferências sem modelo de recompensa explícito.
4. RLAIF e Constitutional AI: feedback de IA guiado por princípios escritos.
5. Chain-of-thought; supervisão de processo vs. de resultado.
6. RLVR: recompensas verificáveis (matemática, código), GRPO e DeepSeek-R1.
7. Escala em tempo de inferência.

## Meio

- Variantes do GRPO (DAPO, Dr. GRPO), reward hacking em RLVR, entropia e exploração.
- Tülu 3 como receita aberta completa (SFT + DPO + RLVR).
- Destilação de raciocínio para modelos menores.

## Avançado

- O debate aberto: o RL cria capacidades novas ou só repondera o que o modelo base já sabia? Há evidência dos dois lados (por exemplo, Yue et al., 2025, e críticas ao treino estilo R1-Zero).
- Fidelidade da chain-of-thought e monitoração → I06→ AL05.
- RL em ambientes agênticos de longa duração → R10.

## Matemática necessária

**M26**: KL; **M24**: máxima verossimilhança (Bradley–Terry); **M27**: otimização.

## Métodos

- Leia o livro de RLHF de Nathan Lambert e implemente DPO e GRPO do zero em modelos de 0,5B a 1,5B na 3090.
- Reproduza um "R1-Zero" minúsculo (aritmética, contagem) e observe o comprimento das respostas crescer.
- Compare SFT, DPO e GRPO sobre o mesmo modelo base, com avaliação honesta.

## Desafios

- Recompensa mal especificada: o modelo aprende o atalho.
- Avaliar raciocínio só pela resposta final.
- Confundir alinhamento de estilo com aumento de capacidade.

## Fontes

- 📖 [Reinforcement Learning from Human Feedback](https://rlhfbook.com/) — Nathan Lambert · livro. livro aberto e atualizado
- 📄 [Training language models to follow instructions with human feedback](https://arxiv.org/abs/2203.02155) — Long Ouyang et al., 2022 · paper. o InstructGPT
- 📄 [Direct Preference Optimization: Your Language Model is Secretly a Reward Model](https://arxiv.org/abs/2305.18290) — Rafael Rafailov et al., 2023 · paper
- 📄 [Constitutional AI: Harmlessness from AI Feedback](https://arxiv.org/abs/2212.08073) — Yuntao Bai et al., 2022 · paper
- 📄 [DeepSeekMath: Pushing the Limits of Mathematical Reasoning in Open Language Models](https://arxiv.org/abs/2402.03300) — Zhihong Shao et al., 2024 · paper. origem do GRPO
- 🆕 [DeepSeek-R1 incentivizes reasoning in LLMs through reinforcement learning](https://doi.org/10.1038/s41586-025-09422-z) — Daya Guo et al. (DeepSeek-AI), 2025 · recente. publicado na Nature
- 🎓 [CS336: Language Modeling from Scratch](https://cs336.stanford.edu/) — Percy Liang & Tatsunori Hashimoto (Stanford) · curso. aulas e tarefas implementando tudo do zero

## Boss fight

Com um modelo base aberto de 0,5B a 1,5B na 3090: (1) faça SFT com um conjunto de instruções; (2) treine com DPO sobre preferências; (3) implemente GRPO do zero com recompensa verificável (problemas de aritmética e contagem com resposta checável). Compare as três versões num conjunto de avaliação seu, com intervalos de confiança, e documente um caso de reward hacking que você induziu e depois corrigiu.

## Checkpoint

- [ ] Escreva o objetivo do RLHF com penalidade de KL e explique o papel da KL.
- [ ] Como o DPO dispensa o modelo de recompensa explícito?
- [ ] O que distingue o GRPO do PPO?
- [ ] Quais são os argumentos de cada lado no debate "o RL cria ou repondera capacidades"?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
