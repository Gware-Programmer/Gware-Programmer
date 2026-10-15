# Nous Keiros

Tudo o que você precisa para estudar, praticar e chegar a criar a sua própria IA, do zero à fronteira. Esta pasta fica no disco externo **KEIROS**. Copie a pasta inteira para lá.

## O que tem em cada pasta

| Pasta | O que guarda |
|---|---|
| `mapa/` | O conteúdo do mapa. É o que o app lê. `mapa.json` tem níveis, trilhas, assuntos e fontes; `fontes.bib` tem todas as fontes em BibTeX. |
| `assuntos/` | Uma pasta por assunto (`M01 — …`, `L14 — …`, `Z01 — …`). Cada uma já traz `assunto.md` com o conteúdo completo: por que importa, pré-requisitos, base, meio, avançado, matemática, métodos, desafios, fontes, boss fight e checkpoint. Tudo o que você escrever ou produzir sobre o assunto fica dentro da pasta dele. |
| `materiais/` | Uma pasta por material que você abrir no app (paper, livro, vídeo, página). O app cria a pasta na primeira vez que você abre o material. |
| `pratica/` | Os seus estudos de prática, uma pasta para cada. |
| `criacoes/` | As suas criações (Rei Ichi, REIXU, MUSUBI…), uma pasta para cada, com builds e gráficos dentro. |
| `autodidata/` | Assuntos que você estudar por conta própria, fora do mapa, uma pasta para cada. |
| `progresso/` | O registro do seu progresso e os backups. Quem escreve aqui é o app. |
| `auditoria/` | O relatório da auditoria do conteúdo: alinhamento com o objetivo, o que faltava e o que entrou. |

## Regras do mapa

- **Dominado:** o boss fight e todos os itens do checkpoint estão marcados.
- **Liberado:** todas as dependências estão dominadas **e** o nível anterior está completo (todos os assuntos dominados e o boss do nível vencido). Não se passa de nível sem o conhecimento do nível.
- Dentro de cada nível, a teoria vem antes e os projetos práticos (trilha Build Your Own AI) ficam na última onda.
- Nenhuma estimativa de tempo: só dependências.
- Fontes marcadas como não verificadas trazem o motivo.

## Idioma

A interface e as explicações estão em português. Nomes de assuntos, técnicas, materiais e trilhas ficam em inglês.

## Regenerar os arquivos dos assuntos

Se `mapa/mapa.json` mudar, rode na pasta do repositório:

```
python3 ferramentas/validar.py
python3 ferramentas/gerar.py
```

O gerador só reescreve `assunto.md` e `mapa/fontes.bib`. Os seus arquivos nas pastas não são tocados.
