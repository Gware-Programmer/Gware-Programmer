# K02 — Soar

*Soar*

- **Trilha:** Cognitive Architectures
- **Nível:** 4 — A máquina de aprender · onda 1
- **Termos:** Soar, production systems, impasse, chunking, problem spaces
- **Projetos KEIROS:** REIXU

## Por que importa

Soar é uma das arquiteturas cognitivas mais antigas ainda em desenvolvimento ativo (desde 1983) e o exemplo mais puro de "resolução de problemas como busca em espaços de problema". Impasses, subobjetivos automáticos e aprendizado por chunking são ideias que reaparecem, com outros nomes, nos agentes de linguagem atuais.

## Pré-requisitos

- **Depende de:** K01 (What is a cognitive architecture), A02 (Search and classical planning)
- **Destrava:** K04 (LIDA, CLARION, Sigma and consciousness-inspired architectures), K06 (Cognitive architectures for language agents)

## Base

1. Espaços de problema: estados, operadores e objetivos — tudo é busca **A02**.
2. Sistema de produção: memória de trabalho como grafo, regras condição-ação, casamento de padrões (Rete) **K01**.
3. O ciclo de decisão: elaborar → propor operadores → avaliar com preferências → selecionar → aplicar.
4. Impasses: quando o conhecimento não basta para decidir, Soar cria automaticamente um subobjetivo para resolver o impasse.
5. Chunking: o resultado do subobjetivo vira uma nova regra — o mesmo raciocínio não precisa ser refeito.

## Meio

- Memórias de longo prazo adicionadas depois: semântica (SMem) e episódica (EpMem).
- Aprendizado por reforço sobre preferências de operadores (Soar-RL).
- Avaliação de estados, imagens mentais e emoção (appraisal) como extensões.
- A lei de potência da prática: o chunking prevê que o tempo cai como potência do número de repetições **M09**.

## Avançado

- Soar comparado a ACT-R: mesmas raízes, apostas diferentes → K03.
- Impasse → subobjetivo como antecessor da decomposição de tarefas em agentes com LLMs → K06.
- Por que o chunking não escalou para aprender o mundo a partir de dados brutos → K07.

## Matemática necessária

**M13**: grafos e busca combinatória; **M05**: lógica de regras; **M09**: leis de potência em escala log-log.

## Métodos

- Instale o Soar (código aberto) e faça o tutorial oficial; observe o ciclo de decisão passo a passo no depurador.
- Leia a introdução de Laird (2022) antes do livro; o livro é a referência completa.
- Para cada problema resolvido, conte ciclos de decisão antes e depois do chunking.

## Desafios

- Escrever regras demais à mão: o ponto do Soar é que impasses e chunking geram conhecimento novo.
- Confundir preferências (como escolher) com operadores (o que fazer).

## Fontes

- 📖 [The Soar Cognitive Architecture](https://doi.org/10.7551/mitpress/7688.001.0001) — John E. Laird, 2012 · livro
- 📄 [Introduction to Soar](https://arxiv.org/abs/2205.03854) — John E. Laird, 2022 · paper. a melhor porta de entrada
- 📄 [SOAR: An architecture for general intelligence](https://doi.org/10.1016/0004-3702(87)90050-6) — John E. Laird, Allen Newell & Paul S. Rosenbloom, 1987 · paper
- 🌐 [Soar — site oficial, manuais e tutoriais](https://soar.eecs.umich.edu/) — Soar Group, Universidade de Michigan · site
- 🔧 [SoarGroup/Soar](https://github.com/SoarGroup/Soar) — Soar Group · ferramenta

## Boss fight

Resolva o problema dos jarros d'água e o mundo de blocos no Soar, registre impasses e chunks e plote o número de ciclos de decisão por repetição em escala log-log para testar a lei de potência da prática. Depois implemente um mini-Soar em C ou REIXU — memória de trabalho como grafo, regras, ciclo propor-selecionar-aplicar, impasse → subobjetivo e um chunking simples — e reproduza a mesma curva com o seu motor.

## Checkpoint

- [ ] Descreva as fases do ciclo de decisão do Soar.
- [ ] O que é um impasse e o que Soar faz quando encontra um?
- [ ] O que é chunking e por que ele gera uma lei de potência da prática?
- [ ] Que memórias de longo prazo o Soar tem hoje?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
