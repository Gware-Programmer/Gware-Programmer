# N01 — The brain for engineers

*O cérebro para engenheiros*

- **Trilha:** Computational Neuroscience
- **Nível:** 1 — Provas e código · onda 1
- **Termos:** neuroanatomy, neuron, action potential, synapse, neuromodulators
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Para construir IA inspirada no cérebro — e para não se enganar com analogias — você precisa saber o que o cérebro é de fato: cerca de 86 bilhões de neurônios, sinapses químicas, neuromoduladores e uma anatomia com funções distintas. Este é o vocabulário mínimo de toda a trilha de neurociência.

## Pré-requisitos

- **Depende de:** G01 (Cognitive science: Marr's levels and the method), M04 (Elementary algebra: expressions, equations and inequalities)
- **Destrava:** N02 (Neuron models), N04 (Neural coding), S02 (The science of consciousness: methods and measures), B01 (Neural recording and signals)

## Base

1. Escala: cerca de 86 bilhões de neurônios e um número parecido de células não neuronais no cérebro humano, contados pelo método do fracionador isotrópico (Azevedo et al., UFRJ).
2. O neurônio: dendritos, corpo celular, axônio; potencial de repouso (~−70 mV) e potencial de ação, um pulso "tudo ou nada" **M03**.
3. Sinapses químicas: neurotransmissores excitatórios (glutamato) e inibitórios (GABA); sinapses elétricas.
4. Neuromoduladores — dopamina, serotonina, noradrenalina, acetilcolina: sistemas difusos que mudam o "modo" de circuitos inteiros.
5. Grande anatomia: córtex (lobos), tálamo, hipocampo, núcleos da base, cerebelo e tronco encefálico; substâncias branca e cinzenta.
6. Organização do córtex: camadas, colunas e hierarquias sensoriais.

## Meio

- Glia: astrócitos, oligodendrócitos (mielina) e micróglia.
- Métodos e o que cada um mede: lesões, eletrofisiologia, EEG, fMRI, optogenética → B01.
- Energia: o cérebro inteiro consome cerca de 20 W; sua RTX 3090 tem TDP de 350 W.

## Avançado

- O que "inspirado no cérebro" significa de fato numa arquitetura de IA → N12.
- Conectomas completos e o que eles não explicam → N13.
- Por que cada neuromodulador do Rei Ichi precisa de um papel computacional definido → N14.

## Matemática necessária

**M03**: potências de dez e notação científica (de milivolts a 10¹¹ neurônios); **M04**: álgebra elementar (a lei de Ohm, V = R·I, aplicada à membrana).

## Métodos

- Use o livro aberto Foundations of Neuroscience ou o Neuroscience Online como texto-base.
- Acompanhe as aulas do MIT 9.01 com um atlas aberto ao lado.
- Desenhe de memória o cérebro com as estruturas principais e uma frase de função para cada.

## Desafios

- Frenologia moderna: atribuir uma função a uma região sem nuance.
- O mito dos "10% do cérebro".
- Confundir neurônio biológico com neurônio artificial — que é uma caricatura: soma ponderada mais não linearidade.

## Fontes

- 📖 [Foundations of Neuroscience](https://openbooks.lib.msu.edu/neuroscience/) — Casey Henley (Michigan State University) · livro. livro aberto
- 📖 [Neuroscience Online: An Electronic Textbook for the Neurosciences](https://nba.uth.tmc.edu/neuroscience/) — McGovern Medical School, UTHealth Houston · livro
- 🎓 [9.01 Introduction to Neuroscience](https://ocw.mit.edu/courses/9-01-introduction-to-neuroscience-fall-2007/) — MIT OpenCourseWare, 2007 · curso
- 📖 [Principles of Neurobiology (2ª ed.)](https://doi.org/10.1201/9781003053972) — Liqun Luo, 2020 · livro. o melhor livro-texto moderno para quem vem da computação
- 📄 [Equal numbers of neuronal and nonneuronal cells make the human brain an isometrically scaled-up primate brain](https://doi.org/10.1002/cne.21974) — Frederico A. C. Azevedo et al., 2009 · paper. a contagem de ~86 bilhões, feita no Brasil

## Boss fight

Construa o seu atlas funcional do cérebro: para cada estrutura, a função, os neurotransmissores principais, as conexões, o tipo de evidência (lesão, imagem, registro) e a analogia — se existir — com um subsistema do Rei Ichi; marque cada analogia que for só metáfora. Feche com uma tabela de ordens de grandeza com fonte para cada número: neurônios, sinapses, energia, velocidade de condução — e compare com os ~125 milhões de parâmetros do transformer do Rei Ichi.

## Checkpoint

- [ ] Descreva o potencial de ação e por que ele é "tudo ou nada".
- [ ] Diferencie neurotransmissor e neuromodulador com exemplos.
- [ ] Cite cinco estruturas cerebrais e uma função de cada.
- [ ] Quantos neurônios tem o cérebro humano e como isso foi medido?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
