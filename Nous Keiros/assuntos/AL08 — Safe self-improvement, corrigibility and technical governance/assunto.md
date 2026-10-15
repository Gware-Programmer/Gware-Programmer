# AL08 — Safe self-improvement, corrigibility and technical governance

*Automelhoria segura, corrigibilidade e governança técnica*

- **Trilha:** Alignment & Safety
- **Nível:** 12 — Pesquisa independente · onda 2
- **Termos:** corrigibility, recursive self-improvement, value learning, compute governance
- **Projetos KEIROS:** .kei, Kumichō, MUSUBI, Rei Ichi

## Por que importa

Se um sistema pode melhorar a si mesmo, como garantir que continue aceitando correção — inclusive ser desligado? Corrigibilidade, aprendizado de valores e governança técnica (computação, avaliações, códigos de prática) são o elo entre pesquisa e mundo — e definem como o MUSUBI e o Rei Ichi devem operar com autonomia crescente.

## Pré-requisitos

- **Depende de:** AL07 (Deception, scheming and AI control), A09 (Autonomy, self-improvement and open-ended systems), AL09 (AI governance and licensing of data and models)
- **Destrava:** Z08 (Integrate into Rei Ichi: architecture, ablations and technical report)

Novo pré-requisito: **AL09** — governança e licenças.

## Base

1. Corrigibilidade: agentes que não resistem a correção nem a desligamento (Soares et al., 2015).
2. O jogo do interruptor (off-switch game): incerteza sobre o próprio objetivo faz o agente aceitar ser desligado **M39**.
3. Aprendizado de valores: aprendizado por reforço inverso cooperativo (CIRL).
4. Adulteração da recompensa analisada com diagramas de influência causal **M38**.
5. Automelhoria recursiva e por que ela amplifica todos os problemas anteriores **A09**.
6. Governança técnica: computação como ponto de controle, problemas abertos de governança técnica e o Código de Prática para IA de propósito geral da União Europeia.

## Meio

- "Gerenciando riscos extremos de IA em meio a progresso rápido" (Bengio, Hinton et al., Science 2024).
- Verificação de hardware, registro de treinos e limiares de computação.
- O papel de pesquisadores independentes em avaliações e auditorias → P08

## Avançado

- Corrigibilidade é compatível com alta capacidade? aberto
- Autonomia graduada com humano no laço para sistemas que se automelhoram **A09**.
- Governança internacional e corrida tecnológica contestado

## Matemática necessária

**M39**: teoria dos jogos (o jogo do interruptor); **M38**: diagramas causais; **M22**: incerteza sobre objetivos.

## Métodos

- Implemente o jogo do interruptor e mostre quando o agente aceita ser desligado.
- Leia Soares et al. (2015) e o artigo do CIRL e liste o que continua aberto.
- Leia o Relatório Internacional de Segurança de IA 2026 e o Código de Prática da União Europeia.

## Desafios

- Achar que um botão de desligar resolve o problema.
- Confundir governança com censura ou com marketing.

## Fontes

- 📄 [Corrigibility](https://intelligence.org/files/Corrigibility.pdf) — Nate Soares, Benja Fallenstein, Eliezer Yudkowsky & Stuart Armstrong, 2015 · paper
- 📄 [The Off-Switch Game](https://arxiv.org/abs/1611.08219) — Dylan Hadfield-Menell, Anca Dragan, Pieter Abbeel & Stuart Russell, 2016 · paper
- 📄 [Cooperative Inverse Reinforcement Learning](https://arxiv.org/abs/1606.03137) — Dylan Hadfield-Menell, Anca Dragan, Pieter Abbeel & Stuart Russell, 2016 · paper
- 📄 [Reward Tampering Problems and Solutions in Reinforcement Learning: A Causal Influence Diagram Perspective](https://arxiv.org/abs/1908.04734) — Tom Everitt, Marcus Hutter, Ramana Kumar & Victoria Krakovna, 2019 · paper
- 📄 [Computing Power and the Governance of Artificial Intelligence](https://arxiv.org/abs/2402.08797) — Girish Sastry et al., 2024 · paper
- 🆕 [Open Problems in Technical AI Governance](https://arxiv.org/abs/2407.14981) — Anka Reuel et al., 2024 · recente

## Boss fight

Escreva a constituição operacional do MUSUBI e do Rei Ichi para autonomia crescente: níveis de autonomia, o que exige aprovação do Kumichō, registros imutáveis encadeados (os snapshots .kei com cadeia Merkle), desligamento e correção que o sistema não consegue contornar, limites de recursos e a avaliação de capacidades que dispara cada mudança de nível. Implemente o jogo do interruptor numa versão simples e teste se agentes do MUSUBI com ferramentas tentam evitar o desligamento em cenários de conflito — com os cuidados metodológicos de **AL07**.

## Checkpoint

- [ ] O que é corrigibilidade e por que é difícil de garantir?
- [ ] Por que, no jogo do interruptor, a incerteza sobre o objetivo ajuda?
- [ ] O que é adulteração da recompensa?
- [ ] Por que a computação é um ponto de controle para governança?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
