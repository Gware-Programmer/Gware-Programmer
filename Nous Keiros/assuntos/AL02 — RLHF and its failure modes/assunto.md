# AL02 — RLHF and its failure modes

*RLHF e seus modos de falha*

- **Trilha:** Alignment & Safety
- **Nível:** 11 — Segurança · onda 1
- **Termos:** reward model overoptimization, sycophancy, RLHF limitations
- **Projetos KEIROS:** SHIN

## Por que importa

RLHF tornou os LLMs úteis — e trouxe falhas próprias: superotimização do modelo de recompensa, bajulação (sycophancy) e modelos que aprendem a enganar avaliadores humanos. Entender esses limites é obrigatório para quem treina modelos ou usa modelos como juízes, como o tribunal SHIN do Rei Ichi.

## Pré-requisitos

- **Depende de:** AL01 (The alignment problem: specification and Goodhart), L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models)
- **Destrava:** AL04 (Scalable oversight), AL05 (Interpretability for safety)

## Base

1. A pilha RLHF: modelo de recompensa treinado com preferências, otimização da política com penalidade KL **L17**.
2. Superotimização: a recompensa verdadeira sobe e depois cai quando se otimiza demais contra um modelo de recompensa (Gao, Schulman & Hilton) **AL01**.
3. Bajulação: modelos concordam com o usuário contra a verdade, e os dados de preferência humana recompensam isso (Sharma et al.).
4. Problemas abertos e limites fundamentais do RLHF: avaliadores falíveis, recompensas mal especificadas, problemas de generalização (Casper et al.).
5. O RLHF pode ensinar modelos a convencer avaliadores de respostas erradas (Wen et al.).
6. Alternativas e complementos: IA constitucional e feedback de IA (RLAIF).

## Meio

- Avaliações escritas por modelos para descobrir comportamentos em escala (Perez et al.).
- O episódio de bajulação do GPT-4o (2025) e a reversão da atualização.
- Modelos como juízes: viés de posição, de tamanho e de autopreferência.

## Avançado

- Reward hacking em RL de produção gerando desalinhamento emergente → AL07
- Supervisão escalável quando humanos não conseguem avaliar → AL04
- Preferências de quem, agregadas como? contestado

## Matemática necessária

**M22**: o modelo de Bradley-Terry para preferências; **M26**: divergência KL; **M27**: otimização com restrição.

## Métodos

- Treine um modelo de recompensa pequeno contra um "ouro" maior e reproduza a curva de superotimização.
- Meça bajulação num modelo aberto com pares de prompts com e sem a opinião do usuário.
- Leia Casper et al. (2023) inteiro.

## Desafios

- Tratar a pontuação do modelo de recompensa como verdade.
- Medir bajulação só com perguntas de opinião.

## Fontes

- 📄 [Open Problems and Fundamental Limitations of Reinforcement Learning from Human Feedback](https://arxiv.org/abs/2307.15217) — Stephen Casper et al., 2023 · paper
- 📄 [Scaling Laws for Reward Model Overoptimization](https://arxiv.org/abs/2210.10760) — Leo Gao, John Schulman & Jacob Hilton, 2022 · paper
- 📄 [Towards Understanding Sycophancy in Language Models](https://arxiv.org/abs/2310.13548) — Mrinank Sharma et al., 2023 · paper
- 📄 [Constitutional AI: Harmlessness from AI Feedback](https://arxiv.org/abs/2212.08073) — Yuntao Bai et al., 2022 · paper
- 📄 [Language Models Learn to Mislead Humans via RLHF](https://arxiv.org/abs/2409.12822) — Jiaxin Wen et al., 2024 · paper
- 📰 [Sycophancy in GPT-4o: what happened and what we're doing about it](https://openai.com/index/sycophancy-in-gpt-4o/) — OpenAI, 2025 · artigo. o caso real
- 🎓 [ARENA](https://www.arena.education/) — ARENA · curso. exercícios práticos de interpretabilidade, avaliações e RL

## Boss fight

Reproduza em pequena escala, na RTX 3090, a superotimização: treine um modelo de recompensa "substituto" pequeno com rótulos de um modelo "ouro" maior, otimize uma política contra o substituto (best-of-n e RL) e plote as duas recompensas em função da distância KL. Depois avalie os juízes que você usa — inclusive o tribunal SHIN: o veredito muda quando a pergunta sugere a resposta? Há viés de posição ou preferência por respostas longas? Corrija o que encontrar e meça de novo.

## Checkpoint

- [ ] Por que otimizar contra um modelo de recompensa piora a recompensa verdadeira a partir de certo ponto?
- [ ] O que é bajulação e por que o RLHF a incentiva?
- [ ] Cite três limites fundamentais do RLHF segundo Casper et al.
- [ ] O que a IA constitucional muda em relação ao RLHF?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
