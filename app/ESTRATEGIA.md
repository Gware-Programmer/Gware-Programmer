# O MAPA — estratégia do app de Mac

Este documento descreve como o app vai ser construído. O conteúdo de estudo fica na pasta `Nous Keiros`.

## Decisões

- **Só Mac (M1), uso pessoal, sem App Store.** Assinatura com a identidade gratuita "Apple Development", que não pede permissões de novo a cada build. Não precisa do Developer Program de US$ 99.
- **Sem IA de nenhum tipo.** Tudo funciona por regras (as "alavancas").
- **O app é baseado no painel HTML original de O MAPA:** mesma cara, mesmas abas, mesmos dados. A interface fica em português, sem japonês; assuntos, técnicas, materiais e trilhas, em inglês.
- **Tudo abre e roda dentro do app:** links, vídeos, PDFs, arquivos, criações, builds e gráficos.
- **Uma pasta para cada coisa,** em `Nous Keiros`, no disco externo KEIROS. Tudo o que for baixado, criado, trabalhado ou detalhado fica na pasta do item.
- **Botão Salvar,** que grava na hora, para nunca perder trabalho.
- **Custo:** US$ 0.

## Ordem de trabalho

1. Auditoria do conteúdo — feita; o relatório está em `Nous Keiros/auditoria/AUDITORIA.md`.
2. Criar o app e fazê-lo funcionar (fases F0 a F4).
3. Depois: o painel de cada item (F5) e os espaços Prática, Criações e Autodidata (F8).

## Arquitetura

```
O MAPA.app — SwiftUI, só macOS, fora do App Sandbox
├─ Janela principal: WKWebView com a interface (o HTML do painel, em português)
│     └─ ponte JS↔Swift (WKScriptMessageHandlerWithReply) que só aceita o frame principal
├─ Leitor: WKWebView (páginas, arXiv HTML) · PDFKit (PDF online) · YouTube numa WebView à parte, sem a ponte ·
│     Quick Look embutido (QLPreviewView) para arquivos, builds, gráficos e código · painel Resumo/Partes/Detalhes
├─ Núcleo Swift: pastas e arquivos (Nous Keiros) · log de eventos .kei · redutor (regras do mapa) · alavancas ·
│     índice SQLite/FTS5 · rede com limites por serviço · verificadores (pytest, Lean) · notificações · Atalhos · barra de menus
└─ Disco: KEIROS/Nous Keiros (a verdade) · no Mac: índice, rascunhos e fila de espera
```

- **JS desenha** (árvore SVG, abas, painel lateral); **Swift guarda e executa**.
- A ponte tem poucos métodos: `estado`, `comando`, `buscar`, `abrir`, `porque`, `alavancas`, `exportar`, `importar`.
- O HTML original já funciona sozinho (guarda o progresso em `localStorage`). Na F0 ele roda como está, lendo `mapa/mapa.json`. Na F1 o `localStorage` é trocado pela ponte, porque o armazenamento web dentro de um app é "melhor esforço": o WebKit limita cada origem a 15% do disco e pode apagar os dados.

## Regras do mapa (redutor)

- **Dominado** = boss fight + todos os itens do checkpoint marcados.
- **Em andamento** = algum item marcado.
- **Liberado** = todas as dependências dominadas **e** o nível anterior completo (todos os assuntos dominados + boss do nível vencido).
- **Bloqueado** = o resto.
- O tempo entra só pela data de cada evento, nunca pelo relógio. Reconstruir o log dá sempre o mesmo estado.

## Pastas e o botão Salvar

- **Uma pasta por item:**
  - `assuntos/<ID> — <título>`;
  - `materiais/<ID> — <título>`, criada ao abrir o material;
  - `pratica/…`, `criacoes/…` e `autodidata/…`.
  Os textos são `.md` comuns, que abrem no Finder sem o app.
- **Salvar (⌘S)** grava na hora, com escrita atômica: escreve num arquivo temporário e troca. Cada Salvar guarda a versão anterior em `.versoes/`.
- **Rascunho de proteção:** é guardado enquanto você digita. O arquivo oficial só muda quando você aperta Salvar.
- **KEIROS desconectado:** o app avisa e grava numa fila no Mac; quando o disco volta, ele copia tudo.
- **Índice SQLite:** fica no Mac e é só cache. Ele é refeito a partir das pastas.
- **Backups:** em `progresso/backups/`. O Time Machine costuma excluir discos externos por padrão; confira nas opções e inclua o KEIROS.
- **Nomes de pasta:** sem `: / ? * < > | \`, para funcionar em APFS e exFAT.

## Tudo abre dentro do app

| O que | Como |
|---|---|
| Páginas web | WKWebView, como uma aba de navegador |
| PDF online | baixado para a memória e aberto no PDFKit; o texto da página (sem OCR) vai para a busca |
| arXiv | `arxiv.org/html/<id>`, com as fórmulas em MathML |
| YouTube | player oficial embutido, carregado com `baseURL https://<bundle-id>` (o YouTube exige identificação desde 09/07/2025; sem ela, dá erro 153). Player de no mínimo 200×200, sem baixar e sem tocar escondido. Notas guardam o segundo exato e voltam para ele. |
| Arquivos, builds, gráficos, código, planilhas | Quick Look embutido |
| Links `http` | precisam de exceção de ATS para conteúdo web no Info.plist |

O que precisa rodar (testes, provas em Lean, builds) roda pelo próprio app, e a saída aparece dentro dele.

## Painel Resumo · Partes importantes · Detalhes (F5)

- Tudo o que for aberto ganha esse painel ao lado. As três seções são arquivos na pasta do item (`resumo.md`, `partes-importantes.md`, `detalhes.md`), e você escreve por cima.
- Sem IA, o pré-preenchimento vem só de dados:
  - **Resumo:** o abstract oficial;
  - **Partes importantes:** os seus destaques, com link para a página ou o segundo exato;
  - **Detalhes:** metadados.
- **🖐 Mãos na massa:** antes de construir este painel, o modelo dele (campos, ordem, o que vem preenchido) é definido por você.

## Alavancas (regras, sem IA)

- **Formato:** JSON `quando → se → então`.
- **Garantias:**
  - disparo na transição;
  - nenhum efeito duplicado;
  - laços recusados (grafo estático e teto de cascata);
  - efeitos externos numa fila de saída;
  - botão "por que isso aconteceu?";
  - modo ensaio;
  - zero estimativas de tempo.
- **Conjunto mínimo:**
  - estado do assunto e portão de nível;
  - dominar acende o que destrava;
  - níveis e trilhas completos;
  - recusa de ciclo;
  - posição automática;
  - conquistas em âmbar;
  - AGORA com motivo e "falta só o boss";
  - integridade, backup e importação silenciosa.
- **Depois:**
  - revisão FSRS-6 com parâmetros fixos (fórmula, não IA);
  - destaques como evidência (`→S04.3`, `{{c1::…}}`);
  - fontes vivas (DOI, arXiv, ISBN, YouTube) e Wayback para links mortos;
  - boss com prova (pytest; Lean com `#print axioms` sem `sorryAx`);
  - "O que agora?" pelo app Atalhos.
- **Substitutos da IA:**

  | Função | Substituto por regra |
  |---|---|
  | Perguntas | lacunas `{{c1::}}` e itens do checkpoint |
  | Correção | regex, tolerância numérica, pytest e Lean |
  | Verificação de fontes | Crossref, DataCite, Open Library e oEmbed, com comparação de título, autor e ano |
  | Busca | FTS5 com sinônimos |
  | Vídeo | notas com tempo |
  | PDF | camada de texto |

## Telas

- **Abas:** Árvore, Níveis, Agora, A Linha, Fontes, Progresso, Revisão.
- **Janela Leitor** com o painel lateral.
- **Depois:** Prática, Criações, Autodidata.
- **Visual:** a mesma paleta (void, carmim, âmbar só para conquistas). Fontes embutidas: Chakra Petch, IBM Plex Mono e IBM Plex Math (para Φ, ℝ, ∀, ∈ e ✔, que a Plex Mono não tem).

## Fases (por dependência, sem prazos; cada uma só começa com a anterior em uso)

| Fase | Entrega | Boss |
|---|---|---|
| F0 · O mapa vira app | SwiftUI + WKWebView lendo `mapa.json`; importar/exportar; fontes embutidas; teste do YouTube | importar o progresso exportado e ver os mesmos estados |
| F1 · Pastas e Salvar | pastas por item, Salvar atômico + versões + rascunho, fila quando o KEIROS sai, log de eventos, índice | desligar o KEIROS no meio do trabalho e não perder nada |
| F2 · Alavancas mínimas | motor + regras mínimas; tela Alavancas; notificações locais | dominar M01 acende M02 e M05, com motivo e "por quê?" |
| F3 · Tudo abre dentro | Leitor: web, PDF, arXiv, YouTube, Quick Look; destaques; busca | abrir um vídeo e um PDF dentro do app e voltar ao ponto marcado |
| F4 · Fontes vivas | DOI/arXiv/ISBN/YouTube, verificação, checagem de links, Wayback | colar um DOI → [✔]; link morto → cópia Wayback |
| F5 · Painel do item 🖐 | Resumo · Partes importantes · Detalhes, definido por você antes | abrir qualquer item e escrever por cima, salvo na pasta dele |
| F6 · Revisão | cartões FSRS-6, aviso diário, esmaecer | errar um cartão esmaece o nó |
| F7 · Boss com prova + Mac | pytest e Lean; Atalhos; widget; barra de menus | um `sorry` escondido reprova o boss |
| F8 · Autonomia 🖐 | Prática, Criações, Autodidata, editor de assuntos | criar um assunto seu que se posiciona sozinho e se liga às suas criações |

## Riscos

1. **O app engolir o estudo.** Defesas: portão entre fases e o conjunto mínimo de alavancas.
2. **KEIROS desconectado ou com defeito.** Defesas: escrita atômica, fila no Mac, backups, Time Machine incluindo o KEIROS.
3. **Perder progresso na F0** (localStorage). Defesa: exportar com frequência.
4. **O YouTube mudar a regra do player embutido.** Defesa: o teste da F0.
5. **O conteúdo mudar e o progresso herdar a marca errada.** Defesa: identificar itens pelo hash do texto.
6. **Laços de alavancas.** Defesa: tetos.
7. **Falso "provado" no Lean.** Defesa: `#print axioms`.
8. **Mudança para o Japão.** Defesas: horários com fuso IANA; busca `trigram` para japonês.

## Pontos de mãos na massa

- **F5:** o modelo do painel Resumo · Partes importantes · Detalhes.
- **F8:** como você quer os espaços Prática, Criações e Autodidata, e o editor de assuntos.
