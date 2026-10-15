# M39 — Game theory

*Teoria dos jogos*

- **Trilha:** Mathematics
- **Nível:** 8 — Escala · onda 1
- **Termos:** game theory, Nash equilibrium, mechanism design

## Por que importa

Sistemas multiagente, debate entre IAs, GANs, RLHF com modelos de recompensa e mercados de agentes são jogos. Equilíbrios, mecanismos e jogos repetidos dizem o que agentes racionais — ou otimizadores — acabam fazendo quando interagem.

## Pré-requisitos

- **Depende de:** M22 (Probability: events, conditioning and Bayes), M27 (Convex and non-convex optimization)
- **Destrava:** A06 (Multi-agent systems), AL04 (Scalable oversight)

## Base

1. Jogos em forma normal; estratégias e payoffs; dominância.
2. Equilíbrio de Nash puro e misto; existência (Nash, 1950).
3. Jogos de soma zero e o teorema minimax de von Neumann; ligação com dualidade **M27**.
4. Jogos em forma extensiva; indução retroativa; equilíbrio perfeito em subjogos.
5. Informação incompleta e jogos bayesianos **M22**.
6. Jogos repetidos e cooperação (dilema do prisioneiro iterado).

## Meio

- Desenho de mecanismos: leilões, Vickrey, compatibilidade de incentivos.
- Aprendizado em jogos: fictitious play, algoritmos sem arrependimento (no-regret), equilíbrios correlacionados.
- Jogos evolutivos e dinâmica do replicador → M28.
- Escolha social e o teorema da impossibilidade de Arrow (noção).

## Avançado

- Jogos e IA: debate como jogo de soma zero para supervisão → AL04; GANs como min-max → L19; RL multiagente → R10.
- Complexidade de calcular equilíbrios de Nash (PPAD).
- IA cooperativa: como fazer agentes de IA cooperarem entre si e com humanos.

## Matemática necessária

**M27**: otimização e dualidade; **M22**: probabilidade.

## Métodos

- Ben Polak (Yale) em vídeo para a intuição; Shoham & Leyton-Brown para o lado computacional.
- Implemente busca de Nash por enumeração de suportes, fictitious play e regret matching; aplique CFR a jogos pequenos.

## Desafios

- Achar que o equilíbrio de Nash é "o que acontece": há múltiplos equilíbrios e racionalidade limitada.
- Confundir soma zero com qualquer competição.

## Fontes

- 🎓 [Game Theory (ECON 159)](https://oyc.yale.edu/economics/econ-159) — Ben Polak (Open Yale Courses) · curso
- 📖 [Multiagent Systems: Algorithmic, Game-Theoretic, and Logical Foundations](http://www.masfoundations.org/) — Yoav Shoham & Kevin Leyton-Brown, 2009 · livro. PDF gratuito dos autores
- 📖 [Algorithmic Game Theory](https://www.cs.cmu.edu/~sandholm/cs15-892F13/algorithmic-game-theory.pdf) — Noam Nisan, Tim Roughgarden, Éva Tardos & Vijay V. Vazirani (eds.), 2007 · livro
- 📄 [Equilibrium points in n-person games](https://doi.org/10.1073/pnas.36.1.48) — John F. Nash, 1950 · paper. uma página que mudou a economia
- 📄 [Open Problems in Cooperative AI](https://arxiv.org/abs/2012.08630) — Allan Dafoe et al., 2020 · paper

## Boss fight

Implemente enumeração de suportes para Nash em jogos bimatriciais, fictitious play, regret matching e CFR (counterfactual regret minimization) para o pôquer de Kuhn, verificando a convergência para a estratégia ótima conhecida. Depois rode um torneio de dilema do prisioneiro iterado com estratégias suas e explique quais cooperam, quais exploram e por quê.

## Checkpoint

- [ ] Ache o equilíbrio misto de pedra, papel e tesoura.
- [ ] Enuncie o teorema minimax e sua relação com dualidade.
- [ ] O que é um equilíbrio perfeito em subjogos?
- [ ] Por que o leilão de Vickrey incentiva lances verdadeiros?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
