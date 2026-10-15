# C13 — Unix shell, Git and research tooling

*Shell Unix, Git e ferramentas de pesquisa*

- **Trilha:** Computing for AI
- **Nível:** 0 — Fundamentos · onda 1
- **Termos:** Unix shell, bash, zsh, pipes, Git, version control, SSH, tmux, research tooling
- **Projetos KEIROS:** .kei

## Por que importa

Quase tudo o que vem depois neste mapa acontece num terminal: instalar ambientes, rodar treinos que duram horas, versionar código e dados, voltar a um experimento de meses atrás. Shell e Git são a bancada do laboratório. Sem eles, cada experimento é irreproduzível e cada erro é definitivo.

## Pré-requisitos

- **Depende de:** —
- **Destrava:** C01 (Scientific Python: the lab), C14 (C and systems programming: memory, pointers and concurrency), C16 (ML engineering: experiment tracking, configs, checkpoints and data versioning)

## Base

1. O modelo do Unix: tudo é arquivo; processos; entrada e saída padrão (stdin, stdout, stderr); códigos de saída.
2. Navegar e manipular: caminhos absolutos e relativos, `find`, permissões (`chmod`), variáveis de ambiente e o `PATH`.
3. Compor ferramentas: pipes e redirecionamento; `grep`, `sed`, `awk`, `sort`, `uniq`, `wc`, `xargs`.
4. Scripts em shell (zsh no Mac, bash nos servidores): variáveis, laços, condicionais e `set -euo pipefail`.
5. Git: o modelo de objetos (blob, tree, commit), staging, commit, log, diff, branch, merge, rebase e `.gitignore`.
6. Remotos: clone, push, pull e pull requests; chaves SSH.
7. Rodar coisas longas: `tmux`, `nohup`, logs e SSH em máquinas remotas.

## Meio

- Gerenciadores de pacotes e ambientes: Homebrew no Mac, ambientes virtuais (venv, uv, conda) — a ponte para → C01.
- Automatizar pipelines com Make ou scripts.
- Git para pesquisa: commits atômicos, uma tag por experimento, `git bisect` para achar onde algo quebrou, `git worktree`.
- Arquivos grandes: Git LFS e por que dados de treino não entram no Git (→ C16).

## Avançado

- Por dentro do Git: o histórico é um grafo acíclico dirigido endereçado por hash — a mesma ideia do log .kei; reflog e recuperação.
- Reprodutibilidade de ambiente: lockfiles, containers (Docker/OCI) e a diferença entre reproduzir código e reproduzir resultado.
- Automação: launchd e cron para tarefas agendadas; integração contínua (CI) rodando testes a cada commit.

## Matemática necessária

Nenhuma matemática prévia. O histórico do Git é um grafo acíclico dirigido (prévia de → M30).

## Métodos

- Faça o curso The Missing Semester (MIT) inteiro, com os exercícios, no Terminal do seu Mac.
- Durante uma semana, use só o terminal para tudo o que for arquivo e código.
- Jogue o Learn Git Branching até o fim.
- Crie um repositório para os seus estudos: cada assunto estudado vira um commit.

## Desafios

- Decorar comandos sem entender o modelo (processos, fluxos, o grafo do Git).
- Commitar dados grandes, senhas ou chaves.
- Medo de merge e rebase: conflitos são texto, e o reflog quase sempre salva.
- Scripts frágeis, sem `set -euo pipefail` e sem aspas nas variáveis.

## Fontes

- 🎓 [The Missing Semester of Your CS Education](https://missing.csail.mit.edu/) — Anish Athalye, Jon Gjengset & Jose Javier Gonzalez Ortiz (MIT) · curso. shell, Git, depuração e automação, com aulas em vídeo
- 📖 [Pro Git (2ª ed.)](https://git-scm.com/book/en/v2) — Scott Chacon & Ben Straub · livro. livre; o capítulo 10 explica os objetos internos
- 📖 [The Linux Command Line](https://linuxcommand.org/tlcl.php) — William Shotts · livro. livre
- 🗺️ [The Unix Shell](https://swcarpentry.github.io/shell-novice/) — Software Carpentry · guia
- 🗺️ [Version Control with Git](https://swcarpentry.github.io/git-novice/) — Software Carpentry · guia
- 🔧 [Learn Git Branching](https://learngitbranching.js.org/) — Peter Cottle · ferramenta
- 📄 [Good enough practices in scientific computing](https://doi.org/10.1371/journal.pcbi.1005510) — Greg Wilson et al., 2017 · paper

## Boss fight

Monte a sua bancada: um repositório Git com um script de shell que cria do zero o ambiente Python dos seus estudos, roda um conjunto de testes e grava um log com data, commit e código de saída de cada execução. Depois introduza um erro de propósito num commit antigo, encontre-o com `git bisect` e documente o passo a passo num README.

## Checkpoint

- [ ] Qual a diferença entre stdout e stderr, e como você redireciona cada um para um arquivo diferente?
- [ ] O que um pipe faz com dois processos, e por que `grep x arquivo | wc -l` funciona?
- [ ] Num commit do Git, o que são blob, tree e commit, e por que mudar um byte de um arquivo muda o hash do commit?
- [ ] Qual a diferença entre merge e rebase, e quando cada um reescreve o histórico?

---

Arquivo gerado a partir de `mapa/mapa.json`. Para mudar o conteúdo, edite o mapa e gere de novo.
Os seus arquivos nesta pasta (notas, resumos, trabalhos) não são tocados.
