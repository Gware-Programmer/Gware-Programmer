# L30 — LLM evaluation: benchmarks, contamination and harnesses

*Avaliação de LLMs: benchmarks, contaminação e harnesses*

- **Trilha:** Machine Learning
- **Nível:** 8 — Escala · onda 3
- **Termos:** LLM evaluation, benchmarks, MMLU, benchmark saturation, prompt sensitivity, confidence intervals, data contamination, LLM-as-a-judge, evaluation harness, lm-evaluation-harness, Inspect
- **Projetos KEIROS:** Rei Ichi

## Por que importa

Sem avaliação confiável, você não sabe se a sua IA melhorou. Avaliar LLMs é difícil: benchmarks saturam, vazam para os dados de treino, dependem do formato do prompt e trazem barras de erro que quase ninguém reporta. Saber medir separa resultado real de ilusão de progresso — e é exatamente onde um pesquisador solo pode ser mais rigoroso que um laboratório com pressa.

## Pré-requisitos

- **Depende de:** L15 (LLM pretraining), P04 (Statistics so you don't fool yourself)
- **Destrava:** A07 (Agent evaluation), Z02 (Pretrain a small LLM end to end)

## Base

1. O que medir: capacidade, comportamento, segurança e custo; avaliação intrínseca (perplexidade) vs. em tarefas **L15**.
2. Benchmarks de referência (MMLU, GSM8K, HumanEval) e por que saturam.
3. Formatos: múltipla escolha, geração livre com verificador, comparação par a par.
4. Sensibilidade ao prompt e ao formato; zero-shot vs. few-shot.
5. Barras de erro: intervalos de confiança, testes pareados e tamanho da amostra **P04**.
6. Contaminação: detectar e prevenir.
7. Harnesses: lm-evaluation-harness e Inspect; reprodutibilidade das avaliações.

## Meio

- Modelo como juiz: vieses de posição, de tamanho e de autopreferência.
- Avaliação humana e acordo entre avaliadores.
- Avaliações com perturbações (variações simbólicas dos mesmos problemas).
- Avaliar em português.

## Avançado

- Benchmarks de fronteira e a saturação cada vez mais rápida.
- Avaliação de agentes e de horizontes longos (prévia de → A07).
- Avaliações de capacidades perigosas (prévia de → AL06).

## Matemática necessária

**P04**: estatística para não se enganar; **M24**: inferência frequentista.

## Métodos

- Rode o lm-evaluation-harness num modelo aberto pequeno e reproduza os números do relatório dele.
- Acrescente barras de erro aos seus resultados seguindo "Adding Error Bars to Evals".
- Crie uma avaliação própria de 100 itens em português, com verificador automático.

## Desafios

- Reportar um número sem intervalo de confiança.
- Mudar o prompt até o resultado ficar bom — isso é sobreajuste ao teste.
- Confiar num juiz automático sem medir o acordo dele com pessoas.

## Fontes

- 📄 [Holistic Evaluation of Language Models](https://arxiv.org/abs/2211.09110) — Percy Liang et al., 2022 · paper
- 📄 [Measuring Massive Multitask Language Understanding](https://arxiv.org/abs/2009.03300) — Dan Hendrycks et al., 2021 · paper
- 📄 [Adding Error Bars to Evals: A Statistical Approach to Language Model Evaluations](https://arxiv.org/abs/2411.00640) — Evan Miller, 2024 · paper
- 📄 [Lessons from the Trenches on Reproducible Evaluation of Language Models](https://arxiv.org/abs/2405.14782) — Stella Biderman et al., 2024 · paper
- 📄 [Judging LLM-as-a-Judge with MT-Bench and Chatbot Arena](https://arxiv.org/abs/2306.05685) — Lianmin Zheng et al., 2023 · paper
- 📄 [Proving Test Set Contamination in Black Box Language Models](https://arxiv.org/abs/2310.17623) — Yonatan Oren et al., 2023 · paper
- 📄 [GSM-Symbolic: Understanding the Limitations of Mathematical Reasoning in Large Language Models](https://arxiv.org/abs/2410.05229) — Iman Mirzadeh et al., 2024 · paper
- 🆕 [Humanity's Last Exam](https://arxiv.org/abs/2501.14249) — Long Phan et al., 2025 · recente
- 🔧 [lm-evaluation-harness](https://github.com/EleutherAI/lm-evaluation-harness) — EleutherAI · ferramenta
- 🔧 [Inspect](https://inspect.aisi.org.uk/) — UK AI Security Institute · ferramenta
- 🎓 [CS336: Language Modeling from Scratch](https://cs336.stanford.edu/) — Percy Liang & Tatsunori Hashimoto (Stanford) · curso. aulas e tarefas implementando tudo do zero

## Boss fight

Construa a bancada de avaliação da sua IA: perplexidade de validação, três benchmarks públicos rodados pelo harness e uma avaliação própria em português com 200 itens e verificador automático, todos com intervalos de confiança e testes pareados, mais uma checagem de contaminação contra o seu corpus de treino. Compare dois checkpoints do seu modelo e decida, com estatística, se a diferença é real.

## Checkpoint

- [ ] Por que um benchmark satura, e o que isso significa para comparar modelos?
- [ ] Como calcular um intervalo de confiança para a acurácia num benchmark de n questões?
- [ ] O que é contaminação, e como detectá-la?
- [ ] Que vieses um modelo usado como juiz pode ter?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
