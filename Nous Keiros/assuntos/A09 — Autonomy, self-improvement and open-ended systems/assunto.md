# A09 — Autonomy, self-improvement and open-ended systems

*Autonomia, automelhoria e sistemas abertos*

- **Trilha:** Agents
- **Nível:** 12 — Pesquisa independente · onda 1
- **Termos:** autonomy levels, recursive self-improvement, open-endedness, AI scientist
- **Projetos KEIROS:** REIXU

## Por que importa

O fim da linha dos agentes é a autonomia: sistemas que fazem pesquisa, melhoram o próprio código e geram desafios sem fim. Já existem protótipos (AI Scientist, AlphaEvolve, Darwin Gödel Machine) — e os riscos e limites desses sistemas estão entre as perguntas mais sérias da área.

## Pré-requisitos

- **Depende de:** A08 (Long-horizon reliability), R10 (The RL frontier), X04 (Evolutionary computation and neuroevolution)
- **Destrava:** AL08 (Safe self-improvement, corrigibility and technical governance)

Novo pré-requisito: **X04** — evolução e abertura (open-endedness).

## Base

1. Níveis de autonomia (de operador a observador) e níveis de AGI.
2. Automelhoria: a máquina de Gödel (Schmidhuber) e versões empíricas (Darwin Gödel Machine).
3. Descoberta automatizada: AlphaEvolve e AI Scientist.
4. Abertura (open-endedness): POET, "Why Greatness Cannot Be Planned", e a tese de que ela é essencial para superinteligência.
5. Governança de sistemas agênticos e os argumentos contra autonomia total **A08**.

## Meio

- Avaliar automelhoria: o que melhorou de fato e o que é sobreajuste ao avaliador.
- Ciclos de pesquisa automatizados e reprodutibilidade.
- Contenção, sandboxes e registros imutáveis.

## Avançado

- Automelhoria recursiva e segurança → AL08.
- Novidade e "interessância" como objetivos (quality-diversity) **R10**.
- Até onde o MUSUBI deve ser autônomo — e quem decide.

## Matemática necessária

**M22**: probabilidade; **M24**: avaliação estatística de ganhos.

## Métodos

- Reproduza um mini-AlphaEvolve: laço evolutivo de programas guiado por LLM, com avaliador automático, num problema seu.
- Leia a Darwin Gödel Machine e mapeie os riscos (trapaça contra o avaliador).
- Escreva uma política de autonomia para o seu sistema, com níveis e pontos de aprovação humana.

## Desafios

- Avaliadores fracos que o sistema aprende a enganar.
- Confundir "fez algo novo" com "fez algo útil e correto".

## Fontes

- 📄 [Levels of Autonomy for AI Agents](https://arxiv.org/abs/2506.12469) — K. J. Kevin Feng, David W. McDonald & Amy X. Zhang, 2025 · paper
- 🆕 [AlphaEvolve: A coding agent for scientific and algorithmic discovery](https://arxiv.org/abs/2506.13131) — Alexander Novikov et al., 2025 · recente
- 🆕 [Darwin Godel Machine: Open-Ended Evolution of Self-Improving Agents](https://arxiv.org/abs/2505.22954) — Jenny Zhang, Shengran Hu, Cong Lu, Robert Lange & Jeff Clune, 2025 · recente
- 📄 [The AI Scientist: Towards Fully Automated Open-Ended Scientific Discovery](https://arxiv.org/abs/2408.06292) — Chris Lu, Cong Lu, Robert Tjarko Lange, Jakob Foerster, Jeff Clune & David Ha, 2024 · paper
- 📄 [Open-Endedness is Essential for Artificial Superhuman Intelligence](https://arxiv.org/abs/2406.04268) — Edward Hughes et al., 2024 · paper
- 📄 [Fully Autonomous AI Agents Should Not be Developed](https://arxiv.org/abs/2502.02649) — Margaret Mitchell, Avijit Ghosh, Alexandra Sasha Luccioni & Giada Pistilli, 2025 · paper

## Boss fight

Construa um mini-AlphaEvolve: um laço evolutivo de programas guiado por LLM, com avaliador automático, aplicado a um problema seu — por exemplo, otimizar um passe do compilador REIXU ou um kernel. Meça o ganho real em dados que o avaliador não viu, documente as tentativas de enganar o avaliador e escreva a política de autonomia (níveis, aprovações humanas, registros imutáveis) que você aplicaria a ele.

## Checkpoint

- [ ] Diferencie automação, autonomia e automelhoria.
- [ ] O que é uma máquina de Gödel e o que a versão "Darwin" relaxa?
- [ ] Por que abertura (open-endedness) é proposta como essencial?
- [ ] Quais são os argumentos contra agentes totalmente autônomos?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
