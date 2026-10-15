# L29 — Data for LLMs: collection, filtering, deduplication, mixtures and synthetic data

*Dados para LLMs: coleta, filtragem, deduplicação, misturas e dados sintéticos*

- **Trilha:** Machine Learning
- **Nível:** 8 — Escala · onda 1
- **Termos:** pretraining data, Common Crawl, text extraction, quality filtering, deduplication, MinHash, data mixtures, synthetic data, data contamination, model collapse
- **Projetos KEIROS:** Rei Ichi

## Por que importa

A maior parte da qualidade de um LLM vem dos dados, não da arquitetura. Coletar, limpar, filtrar, deduplicar e misturar texto é o trabalho mais subestimado da área — e o que um pesquisador solo mais consegue controlar. Para um modelo seu com português, é a etapa que decide o que ele vai saber e o que vai repetir.

## Pré-requisitos

- **Depende de:** L28 (Tokenization: BPE, unigram and byte-level), M24 (Statistics and frequentist inference)
- **Destrava:** L15 (LLM pretraining), Z02 (Pretrain a small LLM end to end)

## Base

1. Fontes: web (Common Crawl), livros, código, artigos científicos, textos em português; licenças e consentimento (prévia de → AL09).
2. Extração: de HTML e WARC para texto limpo.
3. Filtragem de qualidade: heurísticas (tamanho, proporção de símbolos, repetição), identificação de idioma e classificadores de qualidade.
4. Deduplicação exata e aproximada: hashes, MinHash com LSH e suffix arrays.
5. Remoção de dados pessoais e de conteúdo tóxico.
6. Misturas de domínios e proporções; épocas e repetição de dados.
7. Medir o efeito dos dados: ablações em modelos pequenos **M24**.

## Meio

- Contaminação: tirar os conjuntos de teste dos dados de treino (prévia de → L30).
- Dados sintéticos: livros-texto gerados, reescrita e destilação.
- Currículo e ordem dos dados.
- Pipelines que escalam numa máquina modesta: streaming e particionamento (sharding).

## Avançado

- Leis de mistura e otimização das proporções de domínios (DoReMi).
- Colapso de modelos treinados recursivamente em dados gerados por modelos.
- O esgotamento do texto humano de qualidade e o que vem depois.

## Matemática necessária

**M24**: estatística e amostragem; **M26**: entropia (filtros por perplexidade).

## Métodos

- Leia o paper do FineWeb e reproduza o pipeline numa fatia pequena do Common Crawl com o datatrove.
- Implemente deduplicação por MinHash e meça quanto do seu corpus é quase duplicado.
- Treine dois modelos minúsculos, com e sem filtragem, e compare.

## Desafios

- Filtrar demais e jogar fora a diversidade (dialetos, registros informais).
- Esquecer licenças e dados pessoais.
- Medir o efeito dos dados em modelos grandes demais para repetir a ablação.

## Fontes

- 📄 [The FineWeb Datasets: Decanting the Web for the Finest Text Data at Scale](https://arxiv.org/abs/2406.17557) — Guilherme Penedo et al., 2024 · paper
- 📄 [Deduplicating Training Data Makes Language Models Better](https://arxiv.org/abs/2107.06499) — Katherine Lee et al., 2022 · paper
- 📄 [Dolma: an Open Corpus of Three Trillion Tokens for Language Model Pretraining Research](https://arxiv.org/abs/2402.00159) — Luca Soldaini et al., 2024 · paper
- 📄 [DataComp-LM: In search of the next generation of training sets for language models](https://arxiv.org/abs/2406.11794) — Jeffrey Li et al., 2024 · paper
- 📄 [Textbooks Are All You Need](https://arxiv.org/abs/2306.11644) — Suriya Gunasekar et al., 2023 · paper
- 📄 [AI models collapse when trained on recursively generated data](https://doi.org/10.1038/s41586-024-07566-y) — Ilia Shumailov et al., 2024 · paper
- 📄 [DoReMi: Optimizing Data Mixtures Speeds Up Language Model Pretraining](https://arxiv.org/abs/2305.10429) — Sang Michael Xie et al., 2023 · paper
- 🆕 [FineWeb2: One Pipeline to Scale Them All -- Adapting Pre-Training Data Processing to Every Language](https://arxiv.org/abs/2506.20920) — Guilherme Penedo et al., 2025 · recente
- 🔧 [datatrove](https://github.com/huggingface/datatrove) — Hugging Face · ferramenta
- 🗃️ [Common Crawl](https://commoncrawl.org/) — Common Crawl Foundation · dados
- 🎓 [CS336: Language Modeling from Scratch](https://cs336.stanford.edu/) — Percy Liang & Tatsunori Hashimoto (Stanford) · curso. aulas e tarefas implementando tudo do zero

## Boss fight

Monte o corpus do seu modelo: um pipeline reproduzível que parte de dados brutos (uma fatia do Common Crawl e fontes abertas em português escolhidas por você), extrai texto, filtra por idioma e qualidade, remove dados pessoais, deduplica com MinHash e registra a licença de cada fonte. Publique as estatísticas de cada etapa (quanto sobrou e por quê) e prove com duas ablações em modelos pequenos que a filtragem e a deduplicação melhoram a perplexidade de validação. Esse corpus alimenta → Z02.

## Checkpoint

- [ ] Por que deduplicar melhora o modelo e reduz a memorização?
- [ ] Como o MinHash estima a semelhança entre dois documentos sem compará-los inteiros?
- [ ] O que é contaminação de benchmark, e como evitá-la no pipeline?
- [ ] Por que treinar em dados gerados por modelos pode degradar as gerações seguintes?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
