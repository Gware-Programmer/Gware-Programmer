# L18 — Efficient adaptation: fine-tuning, LoRA, distillation and merging

*Adaptação eficiente: fine-tuning, LoRA, destilação e merging*

- **Trilha:** Machine Learning
- **Nível:** 9 — Pós-treino e primeiro paper · onda 1
- **Termos:** fine-tuning, LoRA, QLoRA, distillation, model merging
- **Projetos KEIROS:** REIXU

## Por que importa

Quase ninguém treina modelos do zero: adapta. LoRA, QLoRA, destilação e fusão de modelos permitem especializar LLMs numa única GPU — exatamente o regime da sua 3090 — e expõem uma ideia profunda: as mudanças úteis em pesos gigantes vivem em subespaços de baixa dimensão.

## Pré-requisitos

- **Depende de:** L15 (LLM pretraining)
- **Destrava:** Z03 (Post-train an open model: SFT, preferences and RLVR)

## Base

1. Ajuste completo vs. ajuste eficiente em parâmetros (PEFT).
2. LoRA: ΔW = BA de posto baixo **M19**; posto e escala α.
3. QLoRA: base quantizada em 4 bits mais adaptadores.
4. Destilação de conhecimento: logits suaves e temperatura **M26**.
5. Esquecimento ao ajustar, e como medi-lo.
6. Fusão de modelos (task arithmetic, TIES).

## Meio

- Adapters e prompt tuning.
- Pré-treino continuado num domínio (por exemplo, português técnico).
- Avaliar o que o adaptador aprendeu e o que o modelo esqueceu.

## Avançado

- Por que posto baixo funciona: a dimensão intrínseca do ajuste.
- Aritmética de tarefas como evidência de estrutura linear no espaço de pesos.
- O que vaza pela destilação, inclusive traços indesejados do modelo professor.

## Matemática necessária

**M19**: SVD e posto baixo; **M26**: KL na destilação.

## Métodos

- Implemente LoRA do zero (um invólucro de nn.Linear) e compare com a biblioteca PEFT.
- Meça o esquecimento antes e depois do ajuste num benchmark geral.
- Combine dois adaptadores por aritmética de tarefas e observe a interferência.

## Desafios

- Comparar LoRA e ajuste completo com a mesma taxa de aprendizado.
- Não medir o que foi perdido.
- Deixar dados de ajuste contaminarem a avaliação.

## Fontes

- 📄 [LoRA: Low-Rank Adaptation of Large Language Models](https://arxiv.org/abs/2106.09685) — Edward J. Hu et al., 2021 · paper
- 📄 [QLoRA: Efficient Finetuning of Quantized LLMs](https://arxiv.org/abs/2305.14314) — Tim Dettmers, Artidoro Pagnoni, Ari Holtzman & Luke Zettlemoyer, 2023 · paper
- 📄 [Distilling the Knowledge in a Neural Network](https://arxiv.org/abs/1503.02531) — Geoffrey Hinton, Oriol Vinyals & Jeff Dean, 2015 · paper
- 📄 [Editing Models with Task Arithmetic](https://arxiv.org/abs/2212.04089) — Gabriel Ilharco et al., 2022 · paper
- 🆕 [LoRA Learns Less and Forgets Less](https://arxiv.org/abs/2405.09673) — Dan Biderman et al., 2024 · recente
- 🎓 [LLM Course](https://huggingface.co/learn/llm-course) — Hugging Face · curso

## Boss fight

Especialize um LLM aberto de 7–8B para um domínio seu (por exemplo, a documentação do REIXU ou textos técnicos em português) com QLoRA na 3090. Implemente o seu próprio LoRA e confira contra o PEFT; meça o ganho no domínio e o esquecimento em tarefas gerais; varie o posto de 4 a 256 e trace a curva; e destile o modelo ajustado para um aluno de cerca de 1B.

## Checkpoint

- [ ] Por que o LoRA economiza memória do otimizador?
- [ ] O que a temperatura faz na destilação?
- [ ] Como medir esquecimento catastrófico?
- [ ] O que a aritmética de tarefas sugere sobre a geometria do espaço de pesos?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
