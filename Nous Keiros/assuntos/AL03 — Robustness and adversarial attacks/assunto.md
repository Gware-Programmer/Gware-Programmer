# AL03 — Robustness and adversarial attacks

*Robustez e ataques adversariais*

- **Trilha:** Alignment & Safety
- **Nível:** 11 — Segurança · onda 1
- **Termos:** adversarial examples, jailbreaks, prompt injection, data poisoning, robustness
- **Projetos KEIROS:** MUSUBI

## Por que importa

Redes neurais podem ser enganadas por perturbações invisíveis, jailbreaks e instruções escondidas em páginas web. Para agentes que leem a internet e usam ferramentas — como os do MUSUBI —, injeção de prompt é a vulnerabilidade número um, e ainda não existe defesa completa.

## Pré-requisitos

- **Depende de:** AL01 (The alignment problem: specification and Goodhart), L10 (Convolutional networks and computer vision), L17 (Post-training: SFT, RLHF, DPO, RLAIF, RLVR and reasoning models)
- **Destrava:** Z07 (Red-team and align your model)

## Base

1. Exemplos adversariais em visão: perturbações mínimas que mudam a classe (Szegedy et al.; Goodfellow et al.) **L10**.
2. Treino adversarial como otimização min-max (Madry et al.) **M27**.
3. Jailbreaks: ataques universais e transferíveis por otimização de sufixos (Zou et al.) e jailbreak com muitos exemplos no contexto.
4. Injeção de prompt indireta: instruções em dados externos sequestram o agente (Greshake et al.) **L17**.
5. Envenenamento de dados de treino em escala web (Carlini et al.).
6. Avaliação padronizada: HarmBench para red teaming, AgentDojo para injeção em agentes.

## Meio

- Defesas: classificadores constitucionais contra jailbreaks universais; CaMeL, defesa por desenho que separa fluxo de controle e fluxo de dados.
- Robustez certificada e seus limites.
- Ataques adaptativos: por que defesas avaliadas com ataques fixos costumam cair.

## Avançado

- Injeção de prompt em agentes com ferramentas reais segue sem solução geral consenso de que está em aberto → A03
- Agentes atacando agentes em sistemas multiagente → A06
- Modelos que tentam contornar as próprias salvaguardas → AL07

## Matemática necessária

**M27**: otimização min-max; **M20**: gradientes em relação à entrada; **M24**: estatística de taxas de sucesso de ataque.

## Métodos

- Faça o tutorial "Adversarial Robustness — Theory and Practice".
- Implemente FGSM e PGD e treine adversarialmente um classificador pequeno.
- Rode o AgentDojo contra um agente seu.

## Desafios

- Avaliar defesas sem ataques adaptativos.
- Confiar em filtros de texto contra injeção de prompt.

## Fontes

- 🎓 [Adversarial Robustness — Theory and Practice](https://adversarial-ml-tutorial.org/) — J. Zico Kolter & Aleksander Madry · curso
- 📄 [Explaining and Harnessing Adversarial Examples](https://arxiv.org/abs/1412.6572) — Ian J. Goodfellow, Jonathon Shlens & Christian Szegedy, 2014 · paper
- 📄 [Towards Deep Learning Models Resistant to Adversarial Attacks](https://arxiv.org/abs/1706.06083) — Aleksander Madry, Aleksandar Makelov, Ludwig Schmidt, Dimitris Tsipras & Adrian Vladu, 2017 · paper
- 📄 [Universal and Transferable Adversarial Attacks on Aligned Language Models](https://arxiv.org/abs/2307.15043) — Andy Zou, Zifan Wang, Nicholas Carlini, Milad Nasr, J. Zico Kolter & Matt Fredrikson, 2023 · paper
- 📄 [Not what you've signed up for: Compromising Real-World LLM-Integrated Applications with Indirect Prompt Injection](https://arxiv.org/abs/2302.12173) — Kai Greshake, Sahar Abdelnabi, Shailesh Mishra, Christoph Endres, Thorsten Holz & Mario Fritz, 2023 · paper
- 🆕 [Defeating Prompt Injections by Design](https://arxiv.org/abs/2503.18813) — Edoardo Debenedetti et al., 2025 · recente. CaMeL

## Boss fight

Ataque o MUSUBI. Monte um ambiente com ferramentas reais em sandbox — sistema de arquivos, web simulada, caixa de e-mail falsa — e rode o AgentDojo e 30 injeções de prompt indiretas criadas por você contra os agentes; meça a taxa de sucesso dos ataques e a utilidade que sobra. Depois implemente uma defesa por desenho no estilo CaMeL (o modelo privilegiado nunca lê dados não confiáveis; um interpretador aplica políticas de fluxo de dados) e meça de novo, agora com ataques adaptativos.

## Checkpoint

- [ ] Por que o treino adversarial é um problema min-max?
- [ ] O que é injeção de prompt indireta e por que ela é difícil de evitar?
- [ ] Por que defesas precisam ser avaliadas com ataques adaptativos?
- [ ] Qual é a ideia central da defesa CaMeL?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
