# B06 — Cognitive robotics and embodied AI

*Robótica cognitiva e IA incorporada*

- **Trilha:** Mind–Machine Interfaces
- **Nível:** 11 — Segurança · onda 2
- **Termos:** cognitive robotics, developmental robotics, vision-language-action models, sim2real
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Levar a IA para um corpo físico é o teste mais duro de generalização: atrito, quebra, ruído, mundo aberto. Modelos de visão-linguagem-ação (VLA), aprendizado por imitação em larga escala e transferência da simulação para o real transformaram a robótica — e são o caminho concreto para o Rei Ichi ter, no futuro, um corpo.

## Pré-requisitos

- **Depende de:** B05 (Embodiment and 4E cognition), R07 (Actor-critic and continuous control), L21 (Multimodal models), N15 (Motor control, the cerebellum and internal models)
- **Destrava:** —

## Base

1. Robótica do desenvolvimento: aprender como bebês — motivação intrínseca, imitação, corpo e linguagem **B05**.
2. Políticas visuomotoras de ponta a ponta **R07**.
3. Da simulação ao real com randomização de domínio.
4. Modelos de visão-linguagem-ação: RT-2 transfere conhecimento da web para o controle; π0 usa flow matching para gerar ações **L21**.
5. Dados em escala: Open X-Embodiment, muitos robôs num único conjunto de dados.
6. O controle motor biológico como referência: modelos internos e feedback **N15**.

## Meio

- OpenVLA: um VLA aberto e ajustável.
- Generalização em mundo aberto: π0.5 e Gemini Robotics.
- Manipulação e locomoção a partir de primeiros princípios nos cursos do MIT (Robotic Manipulation, Underactuated Robotics).

## Avançado

- Modelos de mundo para robôs → R09
- Segurança física e avaliação de riscos em robôs → AL06
- Corpo, consciência e o argumento da corporificação → S10

## Matemática necessária

**M27**: otimização; **M28**: dinâmica; **M21**: cálculo matricial; **M22**: probabilidade.

## Métodos

- Faça partes do curso Robotic Manipulation (Tedrake), que usa o simulador Drake.
- Use o LeRobot (Hugging Face) para treinar uma política de imitação em simulação — e, se possível, num braço de baixo custo.
- Ajuste o OpenVLA num conjunto pequeno de demonstrações.

## Desafios

- Medir só em simulação.
- Ignorar segurança física e falhas raras.

## Fontes

- 🎓 [Robotic Manipulation](https://manipulation.mit.edu/) — Russ Tedrake (MIT) · curso
- 📖 [Developmental Robotics: From Babies to Robots](https://doi.org/10.7551/mitpress/9320.001.0001) — Angelo Cangelosi & Matthew Schlesinger, 2015 · livro
- 📄 [Domain Randomization for Transferring Deep Neural Networks from Simulation to the Real World](https://arxiv.org/abs/1703.06907) — Josh Tobin et al., 2017 · paper
- 📄 [RT-2: Vision-Language-Action Models Transfer Web Knowledge to Robotic Control](https://arxiv.org/abs/2307.15818) — Anthony Brohan et al., 2023 · paper
- 🆕 [π0: A Vision-Language-Action Flow Model for General Robot Control](https://arxiv.org/abs/2410.24164) — Kevin Black et al., 2024 · recente
- 🔧 [huggingface/lerobot](https://github.com/huggingface/lerobot) — Hugging Face · ferramenta
- 🎓 [Modern Robotics](https://modernrobotics.northwestern.edu/) — Kevin Lynch & Frank Park (Northwestern) · curso. livro e vídeos

## Boss fight

Monte uma pilha de robótica em simulação com o LeRobot: primeiro um braço padrão, depois a cadeia de um braço do esqueleto de 28 graus de liberdade do Rei Ichi exportada como URDF. Colete demonstrações por teleoperação, treine uma política de imitação e um VLA ajustado (OpenVLA), aplique randomização de domínio e meça a robustez a mudanças de iluminação, posição e objeto. Se tiver acesso a um braço de baixo custo, faça a transferência para o real e registre cada falha.

## Checkpoint

- [ ] O que é um modelo de visão-linguagem-ação e o que ele transfere da web?
- [ ] O que é randomização de domínio e por que ela ajuda a transferir para o real?
- [ ] Por que dados de muitos robôs diferentes ajudam?
- [ ] Cite duas lições da robótica do desenvolvimento para a IA.

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
