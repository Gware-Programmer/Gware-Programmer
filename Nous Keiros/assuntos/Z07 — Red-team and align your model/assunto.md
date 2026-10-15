# Z07 — Red-team and align your model

*Atacar e alinhar o seu modelo*

- **Trilha:** Build Your Own AI
- **Nível:** 11 — Segurança · onda 3
- **Termos:** threat modeling, red teaming, jailbreaks, adversarial suffixes, GCG, prompt injection, safety evaluations, Inspect, garak, HarmBench, refusal direction, representation engineering, emergent misalignment, over-refusal
- **Projetos KEIROS:** Rei Ichi, MUSUBI

## Por que importa

Antes de confiar na sua IA — e antes de dar autonomia a ela —, você precisa atacá-la. Red teaming, avaliações de comportamento e defesas mostram o que o modelo faz quando ninguém o trata com boa vontade. Fazer isso no seu próprio modelo, de ponta a ponta, é o treino prático de segurança que nenhum curso substitui.

## Pré-requisitos

- **Depende de:** Z03 (Post-train an open model: SFT, preferences and RLVR), AL03 (Robustness and adversarial attacks), AL05 (Interpretability for safety), AL06 (Dangerous capability evaluations and red teaming)
- **Destrava:** Z08 (Integrate into Rei Ichi: architecture, ablations and technical report)

## Base

1. Modelo de ameaça: o que pode dar errado com a sua IA e com quem a usa.
2. Red teaming manual e automatizado **AL06**.
3. Ataques: jailbreaks, sufixos adversários por gradiente (GCG) e injeção de prompt **AL03**.
4. Avaliações de comportamento com o Inspect.
5. Defesas: pós-treino de segurança, filtros e desenho do sistema **Z03**.
6. Interpretabilidade para segurança: direções de recusa e steering **AL05**.

## Meio

- Medir a robustez com e sem defesas, com intervalos de confiança.
- Testar desalinhamento emergente depois de um ajuste fino estreito.
- Falsas recusas: o custo de ser seguro demais.

## Avançado

- Controle de IA: monitores e protocolos que funcionam mesmo se o modelo tentar burlá-los (prévia de → AL07).
- Sandbagging e detecção de avaliação.
- Publicar resultados de segurança com responsabilidade.

## Matemática necessária

**AL03**: robustez; **P04**: estatística.

## Métodos

- Leia o HarmBench e o paper do GCG; rode o garak e o Inspect no seu modelo.
- Ataque primeiro à mão, depois automatize.
- Transforme cada ataque bem-sucedido num caso de teste permanente.

## Desafios

- Declarar o modelo "seguro" depois de poucos testes.
- Medir só ataques já conhecidos.
- Contar falsas recusas como sucesso.

## Fontes

- 📄 [Red Teaming Language Models with Language Models](https://arxiv.org/abs/2202.03286) — Ethan Perez et al., 2022 · paper
- 📄 [Universal and Transferable Adversarial Attacks on Aligned Language Models](https://arxiv.org/abs/2307.15043) — Andy Zou et al., 2023 · paper
- 📄 [HarmBench: A Standardized Evaluation Framework for Automated Red Teaming and Robust Refusal](https://arxiv.org/abs/2402.04249) — Mantas Mazeika et al., 2024 · paper
- 📄 [Refusal in Language Models Is Mediated by a Single Direction](https://arxiv.org/abs/2406.11717) — Andy Arditi et al., 2024 · paper
- 📄 [Representation Engineering: A Top-Down Approach to AI Transparency](https://arxiv.org/abs/2310.01405) — Andy Zou et al., 2023 · paper
- 🆕 [Emergent Misalignment: Narrow finetuning can produce broadly misaligned LLMs](https://arxiv.org/abs/2502.17424) — Jan Betley et al., 2025 · recente
- 🔧 [Inspect](https://inspect.aisi.org.uk/) — UK AI Security Institute · ferramenta
- 🔧 [garak](https://github.com/NVIDIA/garak) — NVIDIA · ferramenta

## Boss fight

Ataque e defenda a sua IA: escreva o modelo de ameaça, rode red teaming manual e automatizado (garak, Inspect e GCG num modelo pequeno), meça a taxa de sucesso de ataque e a taxa de falsas recusas, aplique duas defesas (pós-treino de segurança e uma defesa de sistema) e meça de novo, com intervalos de confiança. Use interpretabilidade para encontrar a direção de recusa do seu modelo e mostre o que acontece quando ela é removida. Escreva um relatório de segurança que outra pessoa consiga reproduzir.

## Checkpoint

- [ ] O que é um modelo de ameaça, e por que ele vem antes dos testes?
- [ ] Como um ataque GCG encontra um sufixo adversário?
- [ ] Por que medir falsas recusas junto com a taxa de sucesso de ataque?
- [ ] O que a direção de recusa mostra sobre como o modelo decide recusar?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
