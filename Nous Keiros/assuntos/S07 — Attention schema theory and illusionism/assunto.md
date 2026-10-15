# S07 — Attention schema theory and illusionism

*Attention Schema Theory e ilusionismo*

- **Trilha:** Consciousness
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** attention schema theory, illusionism, meta-problem of consciousness
- **Projetos KEIROS:** Rei Ichi

## Por que importa

E se a sensação de ter uma experiência interior for o modelo simplificado que o cérebro faz da própria atenção? A teoria do esquema de atenção (attention schema theory, AST) e o ilusionismo atacam o problema difícil pelo outro lado: explicar por que acreditamos ter qualia. É a teoria mais diretamente implementável — e já foi implementada em agentes.

## Pré-requisitos

- **Depende de:** S02 (The science of consciousness: methods and measures), F04 (The hard problem, qualia and illusionism)
- **Destrava:** S09 (Adversarial collaborations and the empirical state of the field)

## Base

1. O esquema de atenção: o cérebro constrói um modelo simplificado e esquemático da própria atenção, e esse modelo descreve a si mesmo como "experiência" (Graziano & Webb, 2015).
2. A analogia com o esquema corporal: um modelo útil e impreciso do corpo, usado para controlá-lo.
3. Ilusionismo: a consciência fenomenal, no sentido forte, é uma ilusão introspectiva; o que existe são representações que nos fazem crer nela **F04**.
4. O metaproblema (Chalmers, 2018): explicar por que dizemos e acreditamos que existe um problema difícil — uma tarefa que toda teoria deveria cumprir.
5. AST em agentes: um esquema de atenção melhora o controle da atenção em redes neurais (Wilterson & Graziano, 2021; Liu et al., 2023).

## Meio

- Esquema de atenção e teoria da mente: modelar a atenção dos outros → G07.
- Predições testáveis: dissociações entre atenção e relato de consciência.
- Ilusionismo vs. eliminativismo: o que exatamente é negado.

## Avançado

- Se a AST estiver certa, um agente com esquema de atenção que relata "experiência" estaria na mesma situação que nós? contestado → S10
- O ilusionismo é uma posição minoritária e influente na filosofia da mente contestado.
- Modelos de si para controle → F07.

## Matemática necessária

**M22**: um esquema como modelo preditivo simplificado de um processo interno.

## Métodos

- Leia Graziano & Webb (2015), depois Chalmers (2018) e Kammerer sobre a ilusão.
- Reimplemente o agente de Wilterson & Graziano: controle de atenção com e sem esquema.
- Escreva a resposta de cada teoria (GWT, IIT, ordem superior, AST) ao metaproblema.

## Desafios

- Ler "ilusão" como "não existe nada": o ilusionismo nega uma propriedade, não a mente.
- Achar que a AST resolveu o problema difícil — ela o redireciona.

## Fontes

- 📄 [The attention schema theory: a mechanistic account of subjective awareness](https://doi.org/10.3389/fpsyg.2015.00500) — Michael S. A. Graziano & Taylor W. Webb, 2015 · paper
- 📄 [The Meta-Problem of Consciousness](https://consc.net/papers/metaproblem.pdf) — David J. Chalmers, 2018 · paper
- 📄 [Illusionism as a Theory of Consciousness](https://www.ingentaconnect.com/content/imp/jcs/2016/00000023/F0020011/art00002) — Keith Frankish, 2016 · paper. o texto-manifesto do ilusionismo ⚠ não verificado — a página bloqueia leitura automática (desafio anti-bot)
- 📄 [The illusion of conscious experience](https://doi.org/10.1007/s11229-018-02071-y) — François Kammerer, 2021 · paper. o ilusionismo defendido com rigor
- 📄 [The attention schema theory in a neural network agent: Controlling visuospatial attention using a descriptive model of attention](https://doi.org/10.1073/pnas.2102421118) — Andrew I. Wilterson & Michael S. A. Graziano, 2021 · paper
- 📄 [Attention Schema in Neural Agents](https://arxiv.org/abs/2305.17375) — Dianbo Liu, Samuele Bolotta, He Zhu, Yoshua Bengio & Guillaume Dumas, 2023 · paper

## Boss fight

Implemente no Rei Ichi um esquema de atenção: um modelo simplificado e aprendido do próprio mecanismo de atenção, usado para controlá-la. Replique o resultado de Wilterson & Graziano (controle melhor com esquema do que sem). Depois faça o experimento do metaproblema: pergunte ao Rei Ichi, pelo transformer ligado ao esquema, o que ele "percebe" da própria atenção, e rastreie mecanicamente de onde vem cada afirmação. O que isso diz — e o que não diz — sobre experiência?

## Checkpoint

- [ ] O que é o esquema de atenção e por que ele seria impreciso?
- [ ] O que o ilusionismo nega e o que ele não nega?
- [ ] O que é o metaproblema da consciência?
- [ ] Que vantagem funcional um esquema de atenção dá a um agente?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
