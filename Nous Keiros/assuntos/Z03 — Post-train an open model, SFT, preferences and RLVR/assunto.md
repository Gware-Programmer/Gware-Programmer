# Z03 — Post-train an open model: SFT, preferences and RLVR

*Pós-treinar um modelo aberto: SFT, preferências e RLVR*

- **Trilha:** Build Your Own AI
- **Nível:** 9 — Pós-treino e primeiro paper · onda 3
- **Termos:** post-training, supervised fine-tuning, instruction tuning, chat templates, LoRA, QLoRA, direct preference optimization, RL with verifiable rewards, GRPO, reward hacking, TRL, mlx-lm
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Um modelo base completa texto; um assistente segue instruções, raciocina e recusa o que deve recusar. O pós-treino é onde isso acontece — e é a etapa mais acessível para um pesquisador solo, porque cabe em modelos abertos de alguns bilhões de parâmetros com técnicas eficientes. Aqui a sua IA ganha comportamento.

## Pré-requisitos

- **Depende de:** Z02 (Pretrain a small LLM end to end), L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models), L18 (Efficient adaptation: fine-tuning, LoRA, distillation and merging)
- **Destrava:** Z04 (Run your model on the M1: quantization and local serving), Z05 (Build an agent on your model: tools, memory and retrieval), Z07 (Red-team and align your model)

## Base

1. Escolher a base: o seu modelo **Z02** e um modelo aberto maior, com licença compatível.
2. SFT: dados de instrução, templates de conversa e perda só nos tokens da resposta **L17**.
3. Ajuste eficiente: LoRA e QLoRA para caber na memória **L18**.
4. Preferências: DPO com pares escolhido/rejeitado.
5. RL com recompensas verificáveis (RLVR) em matemática ou código.
6. Avaliar antes e depois, em capacidade e em comportamento.
7. Registrar tudo para reproduzir.

## Meio

- Criar os seus próprios dados de instrução em português.
- Comparar SFT, DPO e RLVR com o mesmo orçamento.
- Ajuste fino no M1 com o mlx-lm.

## Avançado

- Raciocínio longo (cadeias de pensamento) e o custo de inferência que ele traz.
- Destilar um modelo maior no seu.
- Medir o "imposto do alinhamento": o que se perde em capacidade.

## Matemática necessária

**L17**: pós-treino; **R06**: gradiente de política.

## Métodos

- Siga as receitas abertas do Tülu 3 e o RLHF Book de Nathan Lambert.
- Use a biblioteca TRL para SFT, DPO e GRPO; no M1, o mlx-lm.
- Comece pelo SFT e só depois acrescente preferências e RL.

## Desafios

- Dados de instrução ruins estragam mais do que ajudam.
- Reward hacking no RL: o modelo aprende a enganar o verificador.
- Avaliar só na distribuição dos dados de treino.

## Fontes

- 📄 [Training language models to follow instructions with human feedback](https://arxiv.org/abs/2203.02155) — Long Ouyang et al., 2022 · paper
- 📄 [Direct Preference Optimization: Your Language Model is Secretly a Reward Model](https://arxiv.org/abs/2305.18290) — Rafael Rafailov et al., 2023 · paper
- 📄 [LoRA: Low-Rank Adaptation of Large Language Models](https://arxiv.org/abs/2106.09685) — Edward J. Hu et al., 2021 · paper
- 📄 [QLoRA: Efficient Finetuning of Quantized LLMs](https://arxiv.org/abs/2305.14314) — Tim Dettmers et al., 2023 · paper
- 📄 [Tulu 3: Pushing Frontiers in Open Language Model Post-Training](https://arxiv.org/abs/2411.15124) — Nathan Lambert et al., 2024 · paper
- 🆕 [DeepSeek-R1: Incentivizing Reasoning Capability in LLMs via Reinforcement Learning](https://arxiv.org/abs/2501.12948) — DeepSeek-AI, 2025 · recente
- 📖 [Reinforcement Learning from Human Feedback](https://rlhfbook.com/) — Nathan Lambert · livro. livre
- 🔧 [TRL](https://github.com/huggingface/trl) — Hugging Face · ferramenta
- 🔧 [mlx-lm](https://github.com/ml-explore/mlx-lm) — Apple Machine Learning Research · ferramenta

## Boss fight

Faça o pós-treino da sua IA em duas versões: o seu modelo base de Z02 e um modelo aberto maior. Para cada um, aplique SFT com dados de instrução em português (parte deles escrita por você), depois DPO e, num domínio verificável (matemática ou código), RL com recompensas verificáveis. Meça com a sua bancada o ganho de cada etapa, procure ativamente sinais de reward hacking e escreva o que cada técnica mudou no comportamento.

## Checkpoint

- [ ] Por que a perda do SFT costuma ser calculada só nos tokens da resposta?
- [ ] O que o DPO otimiza sem precisar de um modelo de recompensa separado?
- [ ] O que torna uma recompensa "verificável", e por que isso ajuda no RL?
- [ ] Como o LoRA reduz a memória necessária para o ajuste fino?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
