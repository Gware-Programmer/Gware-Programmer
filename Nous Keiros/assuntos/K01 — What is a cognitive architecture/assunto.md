# K01 — What is a cognitive architecture

*O que é uma arquitetura cognitiva*

- **Trilha:** Cognitive Architectures
- **Nível:** 2 — O motor · onda 1
- **Termos:** cognitive architecture, unified theories of cognition, physical symbol system, common model of cognition
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Uma arquitetura cognitiva é uma hipótese sobre as estruturas fixas da mente — memórias, ciclo de decisão, mecanismos de aprendizado — sobre as quais todo conhecimento roda. É o campo que tenta modelar a mente inteira de uma vez, exatamente o que você faz com o Rei Ichi: conhecer 40+ anos de tentativas evita reinventar as mesmas falhas.

## Pré-requisitos

- **Depende de:** A01 (What is an agent: classical architectures), G01 (Cognitive science: Marr's levels and the method)
- **Destrava:** K02 (Soar), K03 (ACT-R), K05 (Neurosymbolic systems)

## Base

1. Arquitetura vs. modelo vs. conhecimento: o que é fixo (memórias, ciclo, aprendizado) e o que é conteúdo aprendido.
2. A hipótese do sistema físico de símbolos (physical symbol system hypothesis), de Newell & Simon: manipular símbolos é necessário e suficiente para inteligência geral — a aposta fundadora, hoje contestada.
3. Teorias unificadas da cognição (Newell, 1990) e o diagnóstico de 1973: "não dá para jogar 20 perguntas com a natureza e vencer" — estudar fenômenos isolados não converge numa teoria da mente.
4. As faixas de tempo de Newell: biológica (~10⁻⁴–10⁻² s), cognitiva (~10⁻¹–10¹ s), racional (~10²–10⁴ s) e social (~10⁵–10⁷ s); cada faixa pede um nível de explicação diferente **G01**.
5. Três famílias: simbólicas, emergentes (conexionistas) e híbridas.
6. O Modelo Comum da Cognição (Common Model of Cognition): percepção e ação, memória de trabalho como interface, memória declarativa, memória procedural de regras condição-ação, um ciclo cognitivo serial de ~50 ms em humanos e aprendizado incremental contínuo.

## Meio

- Critérios de avaliação de Langley, Laird & Rogers: generalidade, versatilidade, racionalidade, eficiência, escalabilidade, reatividade e persistência, capacidade de melhorar, autonomia em operação prolongada.
- Arquitetura como teoria científica: o que ela prevê sobre tempos de reação, erros e curvas de aprendizado.
- O agente como laço percepção → decisão → ação **A01** visto por dentro: o que acontece em cada ciclo.

## Avançado

- Um LLM tem arquitetura cognitiva? Ou é só um componente dela → K06.
- O Modelo Comum confrontado com dados de conectoma humano → K07.
- O problema da integração: módulos que funcionam isolados raramente formam uma mente → K07.

## Matemática necessária

**M05**: lógica e representação simbólica (regras, crenças, objetivos).

## Métodos

- Leia Newell & Simon (1976), Newell (1973) e Laird, Lebiere & Rosenbloom (2017), nessa ordem — são curtos e fundadores.
- Use o levantamento de Kotseruba & Tsotsos (84 arquiteturas, 49 ainda ativas na época) como mapa do território.
- Para cada arquitetura que estudar, preencha a mesma ficha: memórias, ciclo de decisão, aprendizado, percepção e ação, o que prevê.

## Desafios

- Confundir diagrama de caixas com arquitetura: sem um ciclo de decisão definido e mecanismos de aprendizado, é só um desenho.
- Avaliar uma arquitetura por demos em vez de previsões testáveis.

## Fontes

- 🧭 [40 years of cognitive architectures: core cognitive abilities and practical applications](https://doi.org/10.1007/s10462-018-9646-y) — Iuliia Kotseruba & John K. Tsotsos, 2020 · review. o mapa do território
- 📄 [Computer science as empirical inquiry: symbols and search](https://doi.org/10.1145/360018.360022) — Allen Newell & Herbert A. Simon, 1976 · paper. a hipótese do sistema físico de símbolos
- 📄 [You can't play 20 questions with nature and win: Projective comments on the papers of this symposium](https://doi.org/10.1016/b978-0-12-170150-5.50012-3) — Allen Newell, 1973 · paper
- 📄 [A Standard Model of the Mind: Toward a Common Computational Framework across Artificial Intelligence, Cognitive Science, Neuroscience, and Robotics](https://doi.org/10.1609/aimag.v38i4.2744) — John E. Laird, Christian Lebiere & Paul S. Rosenbloom, 2017 · paper
- 📄 [Cognitive architectures: Research issues and challenges](https://doi.org/10.1016/j.cogsys.2006.07.004) — Pat Langley, John E. Laird & Seth Rogers, 2009 · paper. capacidades e critérios de avaliação
- 📖 [Unified Theories of Cognition](https://www.hup.harvard.edu/books/9780674921016) — Allen Newell, 1990 · livro. o manifesto do campo ⚠ não verificado — a página bloqueia leitura automática (desafio anti-bot)

## Boss fight

Escreva a ficha técnica do Rei Ichi como arquitetura cognitiva: o que é fixo e o que é aprendido, quais são as memórias, qual é o "tique" do ciclo de decisão e quais mecanismos de aprendizado existem. Mapeie os 22 subsistemas nos módulos do Modelo Comum, liste o que sobra sem correspondente e o que falta, e escreva para cada subsistema uma predição comportamental testável. Subsistema sem predição vira pergunta aberta, não feature.

## Checkpoint

- [ ] O que diferencia uma arquitetura cognitiva de um modelo de uma tarefa?
- [ ] Enuncie a hipótese do sistema físico de símbolos e uma objeção forte a ela.
- [ ] Quais são os componentes do Modelo Comum da Cognição?
- [ ] O que Newell quis dizer com "20 perguntas"?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
