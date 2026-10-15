# L15 — LLM pretraining

*Pré-treino de LLMs*

- **Trilha:** Machine Learning
- **Nível:** 8 — Escala · onda 2
- **Termos:** LLM pretraining, tokenization, BPE, data curation, mixture of experts

## Por que importa

O pré-treino é onde nasce quase toda a capacidade de um LLM: prever o próximo token em trilhões de tokens obriga o modelo a comprimir gramática, fatos, padrões de raciocínio e cultura. Entender dados, tokenização, arquitetura e estabilidade é entender de onde vem o "conhecimento" desses sistemas — e por que ele tem lacunas.

## Pré-requisitos

- **Depende de:** L14 (Transformers), L28 (Tokenization: BPE, unigram and byte-level), L29 (Data for LLMs: collection, filtering, deduplication, mixtures and synthetic data)
- **Destrava:** C11 (Efficient inference), L16 (Scaling laws), L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models), L18 (Efficient adaptation: fine-tuning, LoRA, distillation and merging), L21 (Multimodal models), L24 (Continual learning, meta-learning and in-context learning), L30 (LLM evaluation: benchmarks, contamination and harnesses), L31 (Mixture of Experts and conditional computation), B03 (Speech and language BCIs), Z02 (Pretrain a small LLM end to end)

Novos pré-requisitos: **L28** (tokenização) e **L29** (dados), que antes eram só parágrafos deste assunto.

## Base

1. Objetivo de modelagem de linguagem: entropia cruzada do próximo token e perplexidade **M26**.
2. Tokenização: BPE, nível de byte, tamanho do vocabulário e seus efeitos (aritmética, português) **L28**.
3. Dados: coleta da web, filtros de qualidade, deduplicação, mistura de domínios **L29**.
4. Arquitetura moderna: RoPE, GQA, SwiGLU, RMSNorm; contexto longo **L14**.
5. Mixture of Experts (MoE): roteamento, balanceamento, parâmetros ativos vs. totais → L31.
6. Amostragem na geração: temperatura, top-k, top-p.
7. Estabilidade em escala: picos de perda, z-loss, normalização de Q e K.

## Meio

- Treino e extensão de contexto longo.
- Contaminação de benchmarks pelos dados de treino.
- Modelos realmente abertos (dados, código e checkpoints, como o OLMo) vs. apenas pesos abertos.
- Ler relatórios técnicos (Llama 3, DeepSeek-V3, Qwen3, OLMo 2) e comparar decisões.

## Avançado

- Dados sintéticos, "colapso de modelo" e destilação já no pré-treino.
- Memorização vs. generalização; extração de dados de treino.
- O esgotamento de texto humano de alta qualidade e o que vem depois.

## Matemática necessária

**M26**: entropia e perplexidade; **M24**: estatística; **M13**: combinatória (BPE).

## Métodos

- Faça o CS336 de Stanford: tokenizador, modelo, treino, kernels e dados, tudo do zero.
- Treine um tokenizador BPE seu e meça a fertilidade (tokens por palavra) em português vs. inglês.
- Leia três relatórios técnicos e compare as escolhas numa tabela própria.

## Desafios

- Subestimar os dados: boa parte do ganho vem deles, não da arquitetura.
- Avaliar em benchmarks contaminados.
- Achar que perplexidade baixa equivale a capacidade útil.

## Fontes

- 🎓 [CS336: Language Modeling from Scratch (Spring 2026)](https://cs336.stanford.edu/) — Percy Liang & Tatsunori Hashimoto (Stanford) · curso. o curso mais completo de LLMs do zero
- 🗺️ [The Smol Training Playbook](https://huggingface.co/spaces/HuggingFaceTB/smol-training-playbook) — Hugging Face (equipe HuggingFaceTB), 2025 · guia
- 📄 [Language Models are Few-Shot Learners](https://arxiv.org/abs/2005.14165) — Tom B. Brown et al., 2020 · paper
- 📄 [Neural Machine Translation of Rare Words with Subword Units](https://arxiv.org/abs/1508.07909) — Rico Sennrich, Barry Haddow & Alexandra Birch, 2016 · paper. o BPE em NLP
- 📄 [The FineWeb Datasets: Decanting the Web for the Finest Text Data at Scale](https://arxiv.org/abs/2406.17557) — Guilherme Penedo et al., 2024 · paper
- 🆕 [2 OLMo 2 Furious](https://arxiv.org/abs/2501.00656) — Team OLMo, 2025 · recente. tudo aberto: dados, código e checkpoints

## Boss fight

Pré-treine do zero, na 3090, um LLM de cerca de 100M de parâmetros num corpus em português que você mesmo curou (coleta, filtragem, deduplicação), com tokenizador BPE próprio. Documente a curva de perda e a perplexidade de validação, faça ablações do efeito da deduplicação e do tamanho do vocabulário, e escreva uma análise honesta do que o modelo aprendeu e não aprendeu.

## Checkpoint

- [ ] O que é perplexidade e qual a sua relação com a entropia cruzada?
- [ ] Por que a tokenização afeta a aritmética e línguas como o português?
- [ ] Num MoE, o que são parâmetros ativos e totais?
- [ ] Por que a deduplicação melhora o modelo?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
