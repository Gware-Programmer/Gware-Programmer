# AL05 — Interpretability for safety

*Interpretabilidade aplicada à segurança*

- **Trilha:** Alignment & Safety
- **Nível:** 11 — Segurança · onda 2
- **Termos:** probes, representation engineering, steering, auditing, CoT monitoring
- **Projetos KEIROS:** MUSUBI, Rei Ichi

## Por que importa

Se não dá para confiar no que o modelo diz, dá para olhar o que ele computa? Sondas, engenharia de representações, steering, auditorias de objetivos ocultos e monitoramento de cadeias de pensamento são as ferramentas de hoje — e cadeias de pensamento legíveis podem ser uma oportunidade frágil e temporária.

## Pré-requisitos

- **Depende de:** AL02 (RLHF and its failure modes), I05 (Sparse dictionaries: SAEs, transcoders and attribution graphs)
- **Destrava:** AL07 (Deception, scheming and AI control), Z07 (Red-team and align your model)

## Base

1. Sondas lineares para detectar estados como engano estratégico (Goldowsky-Dill et al.) **I05**.
2. Engenharia de representações (Zou et al.) e steering por adição de ativações (Turner et al.).
3. Vetores de persona: monitorar e controlar traços de caráter nas ativações (Chen et al., 2025).
4. Auditoria de objetivos ocultos: um jogo cego em que equipes tentam descobrir o objetivo implantado num modelo (Marks et al.).
5. Monitoramento da cadeia de pensamento (chain of thought, CoT): detectar mau comportamento lendo o raciocínio — e a ofuscação que surge quando se otimiza contra o monitor (Baker et al.).
6. Fidelidade: modelos de raciocínio nem sempre dizem o que de fato os levou à resposta.

## Meio

- "Monitorabilidade da CoT: uma oportunidade nova e frágil" — posição conjunta de pesquisadores de vários laboratórios.
- Interpretabilidade como etapa de auditoria antes do lançamento.
- Limites: sondas encontram correlações; é preciso validação causal **I03**.

## Avançado

- A interpretabilidade detecta engano em modelos que sabem estar sendo observados? aberto → AL07
- Introspecção e auto-relato como canal de segurança → I06
- Quando não treinar contra o monitor contestado

## Matemática necessária

**M17**, **M19**: direções e projeções em espaços de ativação; **M24**: estatística de detectores (ROC); **M38**: causalidade e intervenções.

## Métodos

- Treine sondas lineares de "mentira" num modelo aberto com dados contrastivos e teste fora da distribuição.
- Implemente steering por adição de ativações e meça efeitos colaterais.
- Monte um monitor de CoT com outro LLM e meça falsos positivos e falsos negativos.

## Desafios

- Confundir detectar um conceito com detectar um comportamento.
- Otimizar o modelo contra o monitor e depois confiar no monitor.

## Fontes

- 📄 [Representation Engineering: A Top-Down Approach to AI Transparency](https://arxiv.org/abs/2310.01405) — Andy Zou et al., 2023 · paper
- 📄 [Steering Language Models With Activation Engineering](https://arxiv.org/abs/2308.10248) — Alexander Matt Turner et al., 2023 · paper
- 🆕 [Auditing language models for hidden objectives](https://arxiv.org/abs/2503.10965) — Samuel Marks et al., 2025 · recente
- 🆕 [Detecting Strategic Deception Using Linear Probes](https://arxiv.org/abs/2502.03407) — Nicholas Goldowsky-Dill, Bilal Chughtai, Stefan Heimersheim & Marius Hobbhahn, 2025 · recente
- 🆕 [Monitoring Reasoning Models for Misbehavior and the Risks of Promoting Obfuscation](https://arxiv.org/abs/2503.11926) — Bowen Baker et al., 2025 · recente
- 🆕 [Chain of Thought Monitorability: A New and Fragile Opportunity for AI Safety](https://arxiv.org/abs/2507.11473) — Tomek Korbak et al., 2025 · recente
- 🎓 [ARENA](https://www.arena.education/) — ARENA · curso. exercícios práticos de interpretabilidade, avaliações e RL

## Boss fight

Monte uma bancada de detecção de engano: num modelo aberto, crie dados contrastivos (respostas honestas vs. instruídas a enganar), treine sondas lineares por camada, valide em cenários fora da distribuição e teste se o steering na direção encontrada muda o comportamento. Aplique a mesma bancada ao transformer do Rei Ichi e escreva, para os agentes do MUSUBI, um protocolo de monitoramento de CoT que nunca treine contra o próprio monitor.

## Checkpoint

- [ ] O que uma sonda linear detecta e o que ela não garante?
- [ ] O que é steering por adição de ativações?
- [ ] Por que otimizar contra um monitor de CoT pode gerar ofuscação?
- [ ] Como funcionou o jogo de auditoria de objetivos ocultos?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
