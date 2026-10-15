# C16 — ML engineering: experiment tracking, configs, checkpoints and data versioning

*Engenharia de ML: rastreamento de experimentos, configurações, checkpoints e versionamento de dados*

- **Trilha:** Computing for AI
- **Nível:** 7 — Redes profundas · onda 1
- **Termos:** ML engineering, experiment tracking, configuration management, checkpointing, resuming training, data versioning, reproducibility, MLflow, DVC, Hydra
- **Projetos KEIROS:** .kei

## Por que importa

Treinar um modelo é uma série longa de experimentos. Sem registrar configuração, código, dados e métricas de cada execução, você não sabe o que funcionou, não consegue retomar um treino interrompido e não reproduz o próprio resultado. Engenharia de ML é o que transforma "rodou uma vez" em "roda de novo, igual, e eu sei por quê".

## Pré-requisitos

- **Depende de:** C04 (PyTorch: tensors, autograd and the training loop), P02 (Reproducing results), C13 (Unix shell, Git and research tooling)
- **Destrava:** Z01 (Train a tiny GPT from scratch)

## Base

1. Estrutura de um projeto de treino: dados, modelo, laço, avaliação e configuração separados **C04**.
2. Configuração como dado: arquivos YAML ou TOML, composição (Hydra), nada de números mágicos no código.
3. Sementes, determinismo e o que ainda varia entre execuções **P02**.
4. Rastreamento de experimentos: métricas, hiperparâmetros, commit do Git e ambiente (MLflow, TensorBoard).
5. Checkpoints: salvar e retomar o estado completo (pesos, otimizador, scheduler, gerador aleatório, passo).
6. Versionamento de dados: hashes, manifestos e DVC; dados fora do Git **C13**.
7. Testes para código de ML: shapes, overfit de um único batch, checagem de gradientes.

## Meio

- Logs que ajudam a depurar: normas de gradiente, taxa de aprendizado, perda por componente.
- Varreduras de hiperparâmetros com orçamento fixo: grade, aleatória e bayesiana.
- Perfilar o treino: onde vai o tempo (dados, processador, sincronização).
- Organizar resultados para escrever o paper depois (prévia de → P05).

## Avançado

- Treinos longos e tolerância a falhas: retomada automática e checkpoints assíncronos.
- Linhagem completa: de um número no paper até o commit, os dados e o checkpoint que o produziram.
- Avaliação contínua durante o treino e detecção precoce de divergência.

## Matemática necessária

Sem matemática nova: o rigor aqui é de processo.

## Métodos

- Leia o Deep Learning Tuning Playbook (Google Research) e "A Recipe for Training Neural Networks" (Karpathy).
- Pegue um treino seu em PyTorch e acrescente configuração em arquivo, rastreamento, checkpoints retomáveis e o teste de overfit de um batch.
- Mate o processo no meio de um treino e retome; confira se as curvas continuam idênticas.

## Desafios

- "Depois eu organizo": o resultado bom de hoje fica irreprodutível amanhã.
- Checkpoints que salvam só os pesos (sem otimizador e sem gerador aleatório) e mudam a curva ao retomar.
- Dados que mudam silenciosamente entre experimentos.

## Fontes

- 🗺️ [Deep Learning Tuning Playbook](https://github.com/google-research/tuning_playbook) — Varun Godbole, George E. Dahl, Justin Gilmer, Christopher J. Shallue & Zachary Nado (Google Research), 2023 · guia
- 🗺️ [A Recipe for Training Neural Networks](https://karpathy.github.io/2019/04/25/recipe/) — Andrej Karpathy, 2019 · guia
- 📄 [Hidden Technical Debt in Machine Learning Systems](https://papers.nips.cc/paper/2015/hash/86df7dcfd896fcaf2674f757a2463eba-Abstract.html) — D. Sculley et al., 2015 · paper
- 📄 [Improving Reproducibility in Machine Learning Research (A Report from the NeurIPS 2019 Reproducibility Program)](https://arxiv.org/abs/2003.12206) — Joelle Pineau et al., 2021 · paper
- 📖 [Designing Machine Learning Systems](https://huyenchip.com/books/) — Chip Huyen, 2022 · livro. página da autora; edição da O'Reilly
- 🗺️ [Machine Learning Engineering Open Book](https://github.com/stas00/ml-engineering) — Stas Bekman · guia
- 🔧 [MLflow](https://mlflow.org/) — Projeto MLflow · ferramenta
- 🔧 [DVC (Data Version Control)](https://dvc.org/) — Iterative · ferramenta
- 🔧 [Hydra](https://hydra.cc/) — Meta Research · ferramenta
- 🎓 [Full Stack Deep Learning (2022)](https://fullstackdeeplearning.com/course/2022/) — Charles Frye, Sergey Karayev & Josh Tobin · curso. aulas em vídeo e laboratórios

## Boss fight

Monte a infraestrutura de treino do seu modelo: um projeto com configuração em arquivo, rastreamento local de experimentos (MLflow ou equivalente), checkpoints completos com retomada automática, manifesto de dados com hashes e um teste que treina um batch até a perda zerar. Prove a reprodutibilidade: rode o mesmo experimento duas vezes, interrompa um terceiro no meio e retome, e mostre que as três curvas coincidem (ou explique cada diferença).

## Checkpoint

- [ ] O que um checkpoint precisa guardar para que a retomada seja idêntica a não ter parado?
- [ ] Por que o teste de overfit de um único batch é um dos primeiros a rodar?
- [ ] Como ligar um número de um gráfico ao commit, à configuração e aos dados que o geraram?
- [ ] Por que dados de treino não devem ficar dentro do repositório Git?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
