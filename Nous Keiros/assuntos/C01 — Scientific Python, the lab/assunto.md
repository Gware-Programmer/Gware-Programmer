# C01 — Scientific Python: the lab

*Python científico: o laboratório*

- **Trilha:** Computing for AI
- **Nível:** 0 — Fundamentos · onda 2
- **Termos:** scientific Python, Jupyter, environments, testing, profiling

## Por que importa

Python é a língua franca da pesquisa em IA: todo paper, código de referência e ferramenta (PyTorch, JAX, NumPy) passa por ele. Você já programa em nível de sistema; o objetivo aqui é dominar Python como laboratório de experimentos rápidos, não como linguagem de produto.

## Pré-requisitos

- **Depende de:** C13 (Unix shell, Git and research tooling)
- **Destrava:** C02 (NumPy: vectorization, broadcasting and memory layout), C15 (Algorithms and data structures), A01 (What is an agent: classical architectures), P09 (Machine-checked proofs: Lean 4)

Novo pré-requisito: **C13** — o ambiente Python é montado e versionado no terminal.

## Base

1. Ambiente reprodutível: uv (ou venv + pip), versões fixadas, projeto com pyproject.toml.
2. Tipos e estruturas: listas, dicionários, conjuntos, tuplas, compreensões; mutabilidade e referências — para quem vem de C, tudo é referência a objeto.
3. Funções, closures, geradores, decorators, dataclasses e type hints.
4. Módulos e pacotes; script vs. notebook (Jupyter) e quando usar cada um.
5. Testes com pytest, inclusive asserções numéricas com tolerância.
6. Entrada e saída de dados (CSV, JSON, Parquet) e configuração por linha de comando.
7. Gráficos com matplotlib.

## Meio

- Profiling (cProfile, line_profiler) e o custo do interpretador: por que laços em Python são lentos e vetorizar importa → C02.
- Extensões em C (ctypes, cffi, a C API): a ponte natural entre o seu C/REIXU e o Python.
- Concorrência: GIL, multiprocessing, asyncio, e o Python sem GIL (free-threaded).
- Registro de experimentos em JSONL simples antes de qualquer ferramenta pronta.

## Avançado

- Por dentro do CPython: bytecode, frames, contagem de referências, interpretador adaptativo especializado e o JIT experimental — para um autor de compilador, é engenharia de interpretadores de verdade para estudar.
- Reprodutibilidade de pesquisa: sementes, ambientes congelados, hash dos dados.
- Ferramental de experimentos: arquivos de configuração, varreduras (sweeps), versionamento de dados.

## Matemática necessária

Nenhuma matemática: só lógica de programação.

## Métodos

- Reescreva em Python cinco ferramentas que você já escreveu em C (tokenizer, parser…) para sentir onde Python ganha e onde perde.
- Faça as Scientific Python Lectures em ordem: rascunho em notebook, versão final em script testado.
- Leia o código de bibliotecas bem escritas como modelo de estilo.

## Desafios

- Programar em "C com sintaxe de Python": laços onde cabe vetorização, classes onde bastam funções.
- Tratar o notebook como fonte da verdade: estado oculto e execução fora de ordem destroem a reprodutibilidade.
- Argumentos padrão mutáveis e outros compartilhamentos silenciosos de estado.

## Fontes

- 🎓 [The Python Tutorial](https://docs.python.org/3/tutorial/) — Python Software Foundation · curso. oficial e direto
- 🗺️ [Scientific Python Lectures](https://lectures.scientific-python.org/) — Gaël Varoquaux, Emmanuelle Gouillart, Olaf Vahtras et al. · guia. a ponte para o ecossistema científico
- 📖 [Python Data Science Handbook](https://jakevdp.github.io/PythonDataScienceHandbook/) — Jake VanderPlas · livro. gratuito: NumPy, pandas, matplotlib
- 🔧 [uv — package and project manager](https://docs.astral.sh/uv/) — Astral · ferramenta. ambientes rápidos e reprodutíveis
- 🎓 [Programming with Python (Software Carpentry)](https://swcarpentry.github.io/python-novice-inflammation/) — The Carpentries · curso. ritmo de laboratório

## Boss fight

Monte o seu kit de laboratório: um template de projeto (uv, pyproject, pytest, registro em JSONL, gráficos) e use-o num experimento real — um benchmark que compara laço Python puro, list comprehension e uma extensão em C chamada por ctypes para o mesmo cálculo numérico, com relatório (tabela e gráfico) gerado automaticamente e reproduzível em outra máquina com um único comando.

## Checkpoint

- [ ] Por que `def f(x=[]):` é perigoso?
- [ ] O que é o GIL e quando ele limita o seu código?
- [ ] Como você garante que um experimento rode igual daqui a muito tempo, em outra máquina?
- [ ] Quando usar notebook e quando usar script?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
