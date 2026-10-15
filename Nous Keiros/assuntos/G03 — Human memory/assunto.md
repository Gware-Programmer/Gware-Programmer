# G03 — Human memory

*Memória humana*

- **Trilha:** Cognitive Science
- **Nível:** 2 — O motor · onda 2
- **Termos:** working memory, episodic memory, semantic memory, forgetting curve
- **Projetos KEIROS:** Rei Ichi

## Por que importa

A memória humana não é um disco: é reconstrutiva, dividida em sistemas diferentes e esquece de forma regular. Memória de trabalho, episódica e semântica — e as leis do esquecimento — são a base para projetar a memória do Rei Ichi e dos agentes do MUSUBI.

## Pré-requisitos

- **Depende de:** G01 (Cognitive science: Marr's levels and the method), M09 (Exponentials and logarithms)
- **Destrava:** N07 (Hippocampus, memory and cognitive maps)

## Base

1. O modelo modal (sensorial → curto prazo → longo prazo) e por que ele foi superado.
2. Memória de trabalho (Baddeley): alça fonológica, esboço visuoespacial, executivo central e buffer episódico; capacidade em torno de 4 itens (Cowan).
3. Memória episódica vs. semântica (Tulving); memória procedural e implícita.
4. A curva do esquecimento de Ebbinghaus e sua replicação moderna **M09**.
5. Efeito de espaçamento e efeito de teste (prática de recuperação).
6. Codificação, consolidação e recuperação; memória reconstrutiva e falsas memórias.

## Meio

- Modelos de contexto temporal: por que lembramos em sequência.
- Primazia e recência na recordação de listas.
- Interferência proativa e retroativa.

## Avançado

- Sistemas de aprendizagem complementares: hipocampo rápido e neocórtex lento → N07.
- Memória episódica inspirada em humanos para LLMs → A04.
- Esquecimento como adaptação às estatísticas do ambiente — a análise racional que inspirou o ACT-R → K03.

## Matemática necessária

**M09**: exponenciais, logaritmos e leis de potência (curvas de esquecimento).

## Métodos

- Repita em você o método de Ebbinghaus (sílabas sem sentido, método da economia) com intervalos de retenção crescentes.
- Use repetição espaçada para algo que esteja estudando e registre os dados de revisão.
- Ajuste exponencial e lei de potência aos seus dados e compare os erros.

## Desafios

- Tratar memória como gravação fiel.
- Confundir memória de trabalho (manipulação ativa) com armazenamento passivo de curto prazo.

## Fontes

- 📖 [Memory (3rd ed.)](https://doi.org/10.4324/9780429449642) — Alan Baddeley, Michael W. Eysenck & Michael C. Anderson, 2020 · livro
- 📖 [Memory: A Contribution to Experimental Psychology (Classics in the History of Psychology)](https://psychclassics.yorku.ca/Ebbinghaus/index.htm) — Hermann Ebbinghaus, 1885 · livro
- 🧭 [Working Memory: Theories, Models, and Controversies](https://doi.org/10.1146/annurev-psych-120710-100422) — Alan Baddeley, 2012 · review
- 🧭 [Episodic Memory: From Mind to Brain](https://doi.org/10.1146/annurev.psych.53.100901.135114) — Endel Tulving, 2002 · review
- 📄 [The magical number 4 in short-term memory: A reconsideration of mental storage capacity](https://doi.org/10.1017/S0140525X01003922) — Nelson Cowan, 2001 · paper
- 📄 [Replication and Analysis of Ebbinghaus' Forgetting Curve](https://doi.org/10.1371/journal.pone.0120644) — Jaap M. J. Murre & Joeri Dros, 2015 · paper
- 🎓 [9.00SC Introduction to Psychology](https://ocw.mit.edu/courses/9-00sc-introduction-to-psychology-fall-2011/) — John Gabrieli (MIT OpenCourseWare) · curso. aulas em vídeo

## Boss fight

Faça o experimento de Ebbinghaus em você: listas de sílabas sem sentido, intervalos de retenção crescentes e o método da economia. Ajuste exponencial e lei de potência e compare. Depois implemente para o Rei Ichi uma memória com decaimento em lei de potência que reproduza três fenômenos — curva do esquecimento, efeito de espaçamento e efeito de teste — e mostre os três nos seus gráficos.

## Checkpoint

- [ ] Quais são os componentes da memória de trabalho de Baddeley?
- [ ] Diferencie memória episódica e semântica com exemplos seus.
- [ ] Por que espaçar as revisões melhora a retenção?
- [ ] A curva de esquecimento é exponencial ou lei de potência? Que evidência decide?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
