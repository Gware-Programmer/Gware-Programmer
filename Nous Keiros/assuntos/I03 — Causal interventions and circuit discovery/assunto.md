# I03 — Causal interventions and circuit discovery

*Intervenções causais e descoberta de circuitos*

- **Trilha:** Mechanistic Interpretability
- **Nível:** 10 — Circuitos e agentes · onda 1
- **Termos:** activation patching, causal tracing, path patching, circuit discovery, causal abstraction

## Por que importa

Interpretar de verdade exige intervir: trocar ativações, desligar componentes, medir o efeito. Activation patching e a teoria da abstração causal transformam histórias sobre redes em hipóteses testáveis — exatamente como experimentos de lesão e estimulação na neurociência.

## Pré-requisitos

- **Depende de:** I02 (Attribution, probing and lenses), M38 (Causal inference)
- **Destrava:** I05 (Sparse dictionaries: SAEs, transcoders and attribution graphs), Z06 (Open your model: probes, SAEs and circuits)

## Base

1. Ablação por zero, média e reamostragem — e por que a escolha importa.
2. Activation patching: corromper a entrada, restaurar ativações, medir o efeito causal **M38**.
3. Causal tracing e edição de fatos (ROME).
4. Path patching: efeitos ao longo de caminhos específicos.
5. O circuito de identificação de objeto indireto (IOI) no GPT-2 como estudo de caso completo.
6. Descoberta automática de circuitos (ACDC) e attribution patching.

## Meio

- Métricas e armadilhas do patching.
- Abstração causal e intervenções intercambiáveis (interchange interventions, DAS).
- Edição de modelos e efeitos colaterais.

## Avançado

- A abstração causal como teoria formal da interpretabilidade: quando um algoritmo de alto nível "é" o que a rede faz.
- Circuitos em modelos maiores e o autorreparo (cabeças de reserva que compensam ablações).
- Aritmética modular resolvida com representações de Fourier do grupo cíclico → M40.

## Matemática necessária

**M38**: inferência causal; **M19**: álgebra linear.

## Métodos

- Reproduza o circuito IOI no GPT-2 small com TransformerLens.
- Implemente activation patching, path patching e attribution patching e compare.
- Faça uma intervenção de abstração causal numa tarefa sintética simples.

## Desafios

- Ablação por zero tira o modelo da distribuição: prefira média ou reamostragem.
- Métricas de logit e de probabilidade levam a conclusões diferentes.
- Circuitos que não sobrevivem a outra distribuição de prompts.

## Fontes

- 📄 [Interpretability in the Wild: a Circuit for Indirect Object Identification in GPT-2 small](https://arxiv.org/abs/2211.00593) — Kevin Wang, Alexandre Variengien, Arthur Conmy, Buck Shlegeris & Jacob Steinhardt, 2022 · paper
- 📄 [Locating and Editing Factual Associations in GPT](https://arxiv.org/abs/2202.05262) — Kevin Meng, David Bau, Alex Andonian & Yonatan Belinkov, 2022 · paper. o ROME
- 📄 [Towards Automated Circuit Discovery for Mechanistic Interpretability](https://arxiv.org/abs/2304.14997) — Arthur Conmy et al., 2023 · paper. o ACDC
- 🗺️ [How to use and interpret activation patching](https://arxiv.org/abs/2404.15255) — Stefan Heimersheim & Neel Nanda, 2024 · guia
- 📄 [Causal Abstraction: A Theoretical Foundation for Mechanistic Interpretability](https://arxiv.org/abs/2301.04709) — Atticus Geiger et al., 2023 · paper
- 📄 [Localizing Model Behavior with Path Patching](https://arxiv.org/abs/2304.05969) — Nicholas Goldowsky-Dill, Chris MacLeod, Lucas Sato & Aryaman Arora, 2023 · paper

## Boss fight

Reproduza integralmente o circuito IOI no GPT-2 small com activation e path patching, e depois redescubra-o automaticamente com ACDC e com attribution patching, comparando os resultados. Em seguida escolha um comportamento novo — por exemplo, concordância de gênero em português num modelo multilíngue pequeno — e encontre e valide o seu circuito.

## Checkpoint

- [ ] Por que ablação por média ou reamostragem é preferível à ablação por zero?
- [ ] O que o activation patching mede e o que é a "restauração"?
- [ ] O que é path patching e quando ele é necessário?
- [ ] O que significa, formalmente, um algoritmo de alto nível ser uma abstração causal de uma rede?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
