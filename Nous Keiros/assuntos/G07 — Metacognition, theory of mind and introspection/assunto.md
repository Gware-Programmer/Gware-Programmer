# G07 — Metacognition, theory of mind and introspection

*Metacognição, teoria da mente e introspecção*

- **Trilha:** Cognitive Science
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** metacognition, confidence, theory of mind, introspection

## Por que importa

Saber o que se sabe, atribuir crenças aos outros e relatar os próprios estados internos: metacognição, teoria da mente e introspecção são as capacidades que a pesquisa sobre consciência e sobre LLMs mais disputa. E humanos são bem menos confiáveis nelas do que parecem.

## Pré-requisitos

- **Depende de:** G02 (Perception, attention and signal detection), G04 (Learning, decision-making and bounded rationality)
- **Destrava:** S05 (Higher-order theories)

## Base

1. Metacognição: confiança, monitoramento e controle; sensibilidade vs. viés metacognitivo **G02**.
2. Medir metacognição com detecção de sinal: meta-d′ e eficiência metacognitiva (meta-d′/d′).
3. Teoria da mente (theory of mind): a tarefa de crença falsa (Wimmer & Perner) e seu desenvolvimento em crianças.
4. Introspecção e seus limites: dizemos mais do que podemos saber (Nisbett & Wilson); a introspecção ingênua é pouco confiável (Schwitzgebel).
5. Confiança como probabilidade subjetiva de acerto **G04**.

## Meio

- Bases neurais da metacognição no córtex pré-frontal e dissociações entre desempenho e confiança.
- Teoria da mente em LLMs: resultados positivos e falhas diante de alterações triviais contestado
- Calibração de modelos de ML comparada com metacognição humana.

## Avançado

- Teorias de ordem superior: consciência como representação metacognitiva → S05.
- Introspecção em LLMs: os modelos relatam estados internos verdadeiros? → I06, → S10
- Modelos de si (self-models) e agência → F07.

## Matemática necessária

**M23**: detecção de sinal com distribuições normais; **M22**: probabilidade condicional.

## Métodos

- Meça a sua metacognição: tarefa de discriminação com relato de confiança, cálculo de meta-d′ com implementações abertas.
- Aplique tarefas de crença falsa clássicas e alteradas a LLMs.
- Leia Fleming (2024) como revisão de entrada.

## Desafios

- Medir metacognição pela correlação entre confiança e acerto (contaminada pelo desempenho e pelo viés).
- Tomar relatos introspectivos como acesso direto aos processos.

## Fontes

- 🧭 [Metacognition and Confidence: A Review and Synthesis](https://doi.org/10.1146/annurev-psych-022423-032425) — Stephen M. Fleming, 2024 · review
- 📄 [How to measure metacognition](https://doi.org/10.3389/fnhum.2014.00443) — Stephen M. Fleming & Hakwan C. Lau, 2014 · paper
- 📄 [Telling more than we can know: Verbal reports on mental processes](https://doi.org/10.1037/0033-295X.84.3.231) — Richard E. Nisbett & Timothy D. Wilson, 1977 · paper
- 📄 [Beliefs about beliefs: Representation and constraining function of wrong beliefs in young children's understanding of deception](https://doi.org/10.1016/0010-0277(83)90004-5) — Heinz Wimmer & Josef Perner, 1983 · paper
- 📄 [Large Language Models Fail on Trivial Alterations to Theory-of-Mind Tasks](https://arxiv.org/abs/2302.08399) — Tomer Ullman, 2023 · paper
- 🆕 [Testing theory of mind in large language models and humans](https://doi.org/10.1038/s41562-024-01882-z) — James W. A. Strachan et al., 2024 · recente

## Boss fight

Meça meta-d′ em você (pelo menos 200 tentativas) e em dois LLMs numa tarefa de perguntas com confiança verbal e com a probabilidade dos tokens, e compare as eficiências metacognitivas. Depois construa uma bateria de teoria da mente com 40 itens originais e 40 alterações mínimas no estilo de Ullman e mostre onde e como os modelos falham.

## Checkpoint

- [ ] Por que meta-d′ é melhor do que correlacionar confiança e acerto?
- [ ] Descreva a tarefa de crença falsa.
- [ ] O que Nisbett & Wilson mostraram sobre introspecção?
- [ ] O que precisaria ser verdade para dizer que um LLM tem metacognição?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
