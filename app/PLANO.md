# O MAPA: plano de construção do app (F0 a F9)

O plano aprovado e o ponto em que a construção está. Cada fase atualiza a seção "Andamento".

## Andamento

- **Fase 0:** feita, no commit `01560da` (PR #1).
  - camada de arquivos e ponte: 88/88 testes;
  - interface no Chromium: 58/58 testes;
  - Swift checado contra os stubs: 0 erros, 0 avisos.
- **Revisão adversarial da Fase 0:** ainda não feita (os revisores caíram no limite de uso). Fazer junto com a da F1.
- **F1, em andamento.** Já feitos:
  - `app/UI/nucleo/base.js`: impressão FNV-1a igual à do Swift, JSON canônico e ULID monotônico;
  - `app/UI/nucleo/estado.js`: eventos encadeados por dispositivo, redutor, repasse, conferência e fotografia com `log`/`est`;
  - testes Node em `app/testes/nucleo/` (15/15);
  - checagem do Swift dentro do repositório: `app/testes/checar_swift.sh` e os stubs em `app/testes/stubs/`.

### Decisões de desenho da F1 (já tomadas)

- **Fotografia:** `progresso.json` ganha `log` (id do último evento aplicado) e `est` (carimbo de `s` e `L`). Se o `est` não confere, a fotografia foi editada por fora e vira um evento `juntar`. Sem `log`, é progresso antigo e vira um evento `importar`.
- **Swift:** não faz a junção de fotografia quando a fotografia do disco tem a chave `log`. A verdade passa a ser o registro.
- **Dispositivo:** o id do dispositivo vem do Swift (UserDefaults), na resposta de `carregar`. No modo navegador, vem do `localStorage`.
- **Acréscimo de eventos:**
  1. garantir que o arquivo termine em quebra de linha;
  2. acrescentar;
  3. sincronizar.
- **Leitura de eventos:** quem lê remove repetidos pelo id e ignora (contando) as linhas malformadas.
- **Sem o disco:** os acréscimos vão para `espera/progresso/eventos.kei` e são juntados quando o disco volta. O espelho `espelho/eventos.kei` é atualizado a cada leitura do disco e a cada acréscimo.
- **API genérica de arquivos:** `listar`, `ler`, `gravar`, `criarPasta`, `revelar`. Só funciona dentro destas pastas:
  - assuntos, materiais, pratica, criacoes, autodidata, diario, progresso/relatorios e regras;
  - `mapa/` só para leitura.
- **Pasta do material:** `materiais/F<8 hex da impressão da URL> — <título>/item.json`, criada ao abrir uma fonte.
- **Rascunho de proteção:** ações `rascunho`, `lerRascunho` e `apagarRascunho`, em `apoio/raizes/<chave>/rascunhos`, a cada 2 s.
- **Eventos `visita`:** no máximo um por assunto por hora.
- **Página:** `index.html` carrega `nucleo/*.js` antes de `mapa.js`.

### Próximos passos da F1, nesta ordem

1. **Swift:**
   - `lerEventos` e `anexarEventos`, com fila e espelho do registro;
   - a API genérica de arquivos com a lista de pastas permitidas;
   - a pasta por material;
   - o rascunho de proteção.
2. **Despacho:** as ações novas, com testes no Linux em `app/testes/arquivos/main.swift`. Incluir o boss da F1: desligar o KEIROS no meio do trabalho sem perder nada.
3. **`mapa.js`:** o estado vem do registro.
   - migração do `progresso.json` como evento `importar`;
   - fotografia editada por fora vira `juntar`;
   - um evento por ação;
   - eventos de visita;
   - pasta de material ao abrir uma fonte.
4. **Índice em memória:** `app/UI/nucleo/indice.js`.
5. **Fechamento:**
   - testes da interface (`testar_ui.js`, com a ponte simulada ganhando as ações novas) e do Swift;
   - `checar_swift.sh`;
   - commit e push;
   - revisão adversarial da Fase 0 e da F1;
   - correções.
6. Depois, o resto do plano segue sem mudança: F2 → Sábio → F3 … F9 → melhorias → por último.

### Como testar fora do Mac (Linux)

```bash
node --test app/testes/nucleo/*.test.js     # núcleo (Node 22: passar os arquivos, não a pasta)
node app/testes/testar_ui.js                # interface no Chromium (playwright)
python3 ferramentas/validar.py              # conteúdo do Nous Keiros
# Swift 6.0.3 para Linux:
#   https://download.swift.org/swift-6.0.3-release/ubuntu2404/swift-6.0.3-RELEASE/swift-6.0.3-RELEASE-ubuntu24.04.tar.gz
swiftc -o /tmp/teste-arquivos app/testes/arquivos/main.swift app/Sources/OMapa/Arquivos.swift app/Sources/OMapa/Despacho.swift \
  && /tmp/teste-arquivos "Nous Keiros" /tmp/area-de-teste
app/testes/checar_swift.sh                  # tipos de todo o Swift do app contra os stubs
```

## Contexto

A auditoria (Nous Keiros) e a F0 do app estão no PR Gware-Programmer/Gware-Programmer#1. O código Swift nunca foi compilado num Mac: este ambiente é Linux. Três revisões independentes leram o app inteiro.
- **Compilação:** nenhum erro confirmado. Os dois pontos suspeitos compilaram no Swift 6.0.3 aqui; mesmo assim, viram renomes de garantia.
- **Contrato interface ↔ Swift:** correto.
- **Problemas reais:**
  - ⌘W sumiu;
  - fechar a janela perde gravações pendentes;
  - existem caminhos de sobrescrita de dados: uso em dois Macs, espelho velho, troca de pasta, arquivo ilegível, importação, falha de escrita e desmarcar em nível fechado.

**Decisões suas (15/10):**
- **Escopo:** construir **tudo, de F1 a F8**, sem esperar uma fase estar em uso para começar a outra.
- **F5:** o pré-preenchimento usa só dados oficiais. Os campos seguem o que um mestre deixaria para o aluno; os cartões de revisão são do app **e** seus, liberados só ao terminar a sessão ou o assunto. O material e a configuração visual de cada assunto ficam para o fim.
- **F8:** fichas diferentes, e cada sessão de cada ficha tem os seus próprios exercícios. A ligação com assuntos é automática; se o assunto não existir, ele é criado. O assunto autodidata entra na árvore com portão, com liberdade para ficar fora dele ou ganhar um portão próprio.
- **O que for muito detalhado:** te peço ajuda ou deixo por último.

## Princípio de arquitetura (para dar certo sem compilar aqui)

- **Regras em JavaScript testável; o Swift faz só o que só o Mac faz.**
  - Tudo o que é lógica fica em `app/UI/nucleo/*.js`, como módulos puros, testados com Node e Chromium aqui:
    - portão e estado;
    - log de eventos;
    - alavancas;
    - FSRS;
    - busca;
    - ligações automáticas;
    - cartões;
    - correção de exercícios;
    - posicionamento na árvore.
  - O Swift cuida de: arquivos, rede com lista de sites permitidos, processos (pytest e Lean), janelas nativas, Quick Look, notificações, barra de menus e endereço `omapa-app://`.
- **Duas mudanças em relação a `ESTRATEGIA.md`, com o motivo:**
  - **PDF:** sai o PDFKit e entra o **pdf.js** embutido (licença Apache-2.0). Com ele, destaques com âncora de página e busca no texto ficam testáveis aqui.
  - **Índice de busca:** sai o SQLite e entra um índice **em memória no JS**, refeito das pastas a cada abertura. Há poucos dados, e isso tira uma dependência nativa.
- **Swift:** a cada fase, checagem de tipos no Linux contra módulos falsos (stubs) de AppKit, WebKit e SwiftUI, para pegar erros de linguagem. A camada de arquivos tem testes reais em Foundation. O build final continua sendo no seu Mac.

## Fase 0 · F0 reforçada (corrige o que as revisões acharam)

**A · Funcionamento**
- **⌘W:** `CommandGroup(after: .saveItem)` em `App.swift`.
- **Janela principal:**
  - o `EstadoDoApp` passa a ser dono de uma única WebView do mapa e do seu `Coordenador`, `Esquema` e `Ponte`;
  - `PainelWeb.makeNSView` devolve essa WebView;
  - `dismantleNSView` chama `salvar(silencioso:)`;
  - o JS grava na hora em `visibilitychange`.
- **Leitor:**
  - `ultimoVideo` corrige o Voltar no YouTube;
  - só a página principal abre arquivo fora do app, e só `http/https`;
  - `sizingOptions = [.minSize]`.
- **Renomes de garantia:** `Esquema.swift` (`dados` → `lido`) e `NavegadorWeb.makeNSView`.
- **Montagem:**
  - `swift-tools-version:5.7`;
  - `isInspectable` dentro de `#if compiler(>=5.8)`;
  - `xattr -cr` antes do `codesign`;
  - `rm -rf` do app antigo antes do `ditto`.

**B · Dados ("nada se perde")**, conforme o desenho verificado:
- **Ficha de versão:** cada página guarda a impressão FNV-1a do último progresso que leu ou gravou. Se o disco mudou por fora, o Swift **junta** as marcações em vez de sobrescrever, guarda a versão do disco em `.versoes` e devolve o resultado junto. O mesmo vale para a fila no Mac.
- **Espelho:** guarda só o que veio do disco.
- **Ao voltar para o app ou remontar o disco:** a tela recarrega se o progresso mudou.
- **⌘S:** grava só o que está pendente.
- **Uma área de apoio por pasta Nous Keiros:** `apoio/raizes/<chave>`, com migração da fila e do espelho atuais. A ficha `raiz` recusa gravações vindas da página antiga depois de uma troca de pasta.
- **Restauração:** se a pasta voltar sem `progresso.json` ou sem um `notas.md`, o app restaura do espelho e avisa.
- **Arquivo ilegível:** dá erro em vez de ser tratado como vazio. Nada é gravado por cima, e a nota fica só para leitura.
- **Falha de escrita com o disco conectado:** vai para a fila no Mac, com aviso. Ao sair, se algo não foi gravado, aparece o aviso "Sair mesmo assim / Cancelar".
- **Notas:**
  - caixas da mesma nota ficam sincronizadas;
  - a importação **acrescenta** em vez de substituir;
  - a mesma regra vale para pastas duplicadas com o mesmo ID.
- **Portão:** desmarcar o que trancaria o assunto ou o boss pede confirmação.

**C · Guia:**
- licença do Xcode;
- identidade de assinatura;
- devolver o acesso ao disco;
- ejetar o disco antes de desconectar;
- atualizar o conteúdo copiando só `mapa/` e rodando `gerar.py` no disco.

**Testes:**
- **Swift (`main.swift`):** 29 atuais + 11 seções novas:
  - impressão e união;
  - outro Mac;
  - fila velha;
  - página velha;
  - nota mudada fora;
  - arquivo ilegível;
  - disco recusando escrita;
  - restauração;
  - duas pastas;
  - migração;
  - duplicadas.
- **Interface (`testar_ui.js`):** 27 atuais + casos B5, B6, B8 e de conflito, com a ponte simulada mais fiel.

## F1 · Pastas e Salvar completos
- **Log de eventos:** `progresso/eventos.kei` em JSON Lines, só de acréscimo, com ULID e corrente de hash. O estado sai de repassar o log com as regras de `nucleo/estado.js`.
  - `progresso.json` continua como fotografia, para abrir rápido e exportar.
  - O progresso atual entra no log como eventos de importação.
- **Uma pasta por item:** `materiais/<ID-fonte> — <título>/`, criada ao abrir o material, com `item.json` (metadados) e os arquivos baixados.
- **Rascunho de proteção:** gravado a cada 2 s em `apoio/rascunhos`. O arquivo oficial muda no Salvar ou na gravação automática, com `.versoes`.
- **Índice em memória** de assuntos, fontes e notas.
- **Ponte nova:**
  - `listar`, `ler`, `gravar` (genéricos, só dentro da pasta);
  - `anexarEvento`;
  - `revelar`.
- **Boss da fase:** desligar o KEIROS no meio do trabalho e não perder nada (teste automatizado na camada Swift).

## F2 · Alavancas
- **Motor** `nucleo/alavancas.js`, com regras em JSON `quando → se → então`:
  - disparo na transição;
  - nenhum efeito duplicado;
  - teto de cascata e recusa de ciclo;
  - modo ensaio;
  - registro com o botão "por que isso aconteceu?".
- **Conjunto mínimo:**
  - D01–D05: estado, destravar, níveis completos, recusar ciclo, posição;
  - R01–R08: conquistas em âmbar, AGORA com motivo, "falta só o boss";
  - R27–R30: integridade, backup, importação silenciosa.
- **Tela "Alavancas":** liga e desliga cada regra e mostra o histórico.
- **Notificações locais:** só quando você ativar.
- **Boss:** dominar M01 acende M02/M05, com o motivo.

## F3 · Tudo abre dentro, com destaques e busca
- **Leitor:** web, PDF (pdf.js, com destaques e âncora de página) e `arxiv.org/html`.
  - YouTube pela IFrame API: marcar o segundo exato e voltar a ele.
  - Quick Look (`QLPreviewView`) para arquivos, builds e gráficos.
- **Destaques** vão para `partes-importantes.md` do item, com o link de volta.
- **Busca global (/):** assuntos, fontes, notas e destaques.
- **Boss:** abrir um vídeo e um PDF dentro do app e voltar ao ponto marcado.

## F4 · Fontes vivas
- **Verificação por regra:** DOI no Crossref, arXiv no DataCite, ISBN no Open Library e YouTube no oEmbed, comparando título, autor e ano.
- **Checagem de links:** duas falhas para contar como morto. Se morto, cópia no Wayback.
- **Rede pelo Swift:** só sites permitidos, com limites por serviço (1 pedido a cada 3 s no arXiv) e cache.
- **Colar um DOI ou link** cria uma fonte nova, com [✔] ou o motivo.
- **Boss:** DOI → [✔]; link morto → Wayback.

## F5 · Painel do item (o que o mestre deixa para o aluno)

Cada item aberto (material, assunto, prática, criação, arquivo, build, gráfico) ganha um painel ao lado. As seções são arquivos `.md` na pasta do item, e você escreve por cima:
1. **Antes de começar** (guia gerado, só leitura):
   - por que este item está no seu caminho;
   - o que procurar enquanto estuda: os itens do checkpoint viram perguntas;
   - o que revisar antes: os pré-requisitos ainda não dominados.
2. **Resumo:** o abstract ou a descrição oficial.
3. **Partes importantes:** os seus destaques, com o link para a página ou o segundo exato.
4. **Detalhes:** autores, ano, DOI, duração, capítulos, tamanho e data.
5. **Explique com suas palavras:** em branco. Você explica sem olhar, como se fosse para um iniciante.
6. **Dúvidas:** cada dúvida pode ser marcada como resolvida, com o link de onde se resolveu.
7. **Aplicar:** como isso entra no Rei Ichi ou no seu projeto, mais um mini-exercício sugerido pelo boss do assunto.
8. **Ligações:** assuntos e criações. As sugestões são por regra, e você confirma.
9. **Status de leitura:** para ler · lendo · lido · revisar, com a data.
10. **Cartões de revisão:**
    - **do app:** gerados dos dados do assunto — itens do checkpoint, termos-chave, boss, matemática;
    - **seus:** escritos em "Explique" e "Partes", com lacunas `{{c1::…}}` ou linhas `P: … / R: …`;
    - **liberação:** os do app abrem quando o assunto é dominado; os seus abrem quando o item fica "lido" **e** "Explique com suas palavras" não está vazio.
11. **Sessões:** registro do que foi feito em cada estudo (só registro, nada de estimativa).

- **Boss:** abrir qualquer item, escrever por cima e encontrar tudo na pasta dele.

## F6 · Revisão
- **FSRS-6:** os parâmetros padrão publicados viram fórmula fixa (sem IA), conferida contra os valores da implementação de referência.
- **Aba Revisão:**
  - só cartões liberados;
  - notas 1–4;
  - aviso diário opcional.
- **Esmaecer:** um cartão errado esmaece o nó na árvore até ser revisado.
- **Boss:** errar um cartão esmaece o nó.

## F7 · Boss com prova e integração com o Mac
- **Boss que exige prova:**
  - pytest: os testes passam;
  - Lean: `#print axioms` sem `sorryAx`;
  - roda pelo app, com tempo-limite, e a saída fica na pasta do item.
- **Barra de menus** (`MenuBarExtra`): "o que agora?", Salvar, próxima revisão.
- **Atalhos:** endereço `omapa-app://agora` e o arquivo `progresso/agora.txt`.
- **Por último, com a sua ajuda:** widget e ações nativas do Atalhos, porque precisam de um projeto Xcode.
- **Boss:** um `sorry` escondido reprova o boss.

## F8 · Autonomia (fichas diferentes, cada sessão com exercícios próprios)
- **Prática** (`pratica/<nome>/`):
  - a ficha tem várias **sessões**, e cada sessão tem a sua lista de **exercícios**;
  - cada exercício tem enunciado, a sua resposta ou código, a correção por regra (número com tolerância, regex, pytest ou Lean), as tentativas e o resultado;
  - o erro vira cartão de revisão.
- **Criação** (`criacoes/<nome>/`): objetivo, partes ou módulos (cada um com tarefas e exercícios), versões e builds (`builds/` no Quick Look), gráficos, diário de sessões, decisões e ligações.
- **Autodidata** (`autodidata/<ID — título>/`): um assunto seu com os 11 blocos, fontes, checkpoint, boss e exercícios.
- **Ligação automática, sem IA:**
  - título, tags e cabeçalhos da ficha são comparados com títulos e termos dos assuntos e com uma tabela editável de sinônimos (`mapa/sinonimos.json`);
  - o que passa do limiar é ligado, com o "por quê?" dos termos que casaram;
  - se uma tag não casa com nada, o app **cria um assunto autodidata em rascunho** com ela.
- **Na árvore (pensado para o futuro):** os assuntos seus ficam numa camada própria (`autodidata/*/assunto.json`), separada do `mapa.json` gerado, para que uma atualização de conteúdo nunca os apague. Cada um escolhe o seu portão:
  - **principal:** o nível é calculado pelas dependências e segue o portão;
  - **livre:** fica na árvore, sem trancar nem destravar;
  - **próprio:** um portão seu, com níveis e boss próprios, que pode depender de assuntos do mapa principal; você decide se ele vira pré-requisito de algo do principal.
- **Editor de assuntos:** os 11 blocos; o nível e a onda são calculados; a posição na faixa "Pessoal" é automática.
- **Boss:** criar um assunto seu que se posiciona sozinho e se liga às suas criações.

## Avaliação do Sábio (entra logo depois da F2 e vale para todo desafio)

Todo pequeno desafio é avaliado em tempo real por regras rígidas e numeradas, sem IA: item do checkpoint, boss, exercício, cartão e missão. O motor fica em `app/UI/nucleo/avaliador.js`, com as regras em `Nous Keiros/regras/avaliacao.json` (versionadas) e a explicação em `Nous Keiros/regras/AVALIACAO.md`.

**Entradas, todas medidas e nada estimado:**
- **Acerto `a` ∈ [0,1]:** sai do corretor de cada tipo — exato; número com tolerância graduada; partes certas ÷ total; pytest aprovados ÷ total (pulados não contam); Lean provado sem `sorryAx`; texto pela rubrica de termos obrigatórios. A autoavaliação tem teto.
- **Tempo ativo `t`:** relógio monotônico, que pausa com a janela oculta ou após 120 s sem interação.
- **Comportamento:** tentativas `k`, dicas `h` e colagem detectada.
- **Dificuldade `D`:** calculada pelos dados do mapa — nível, onda, número de ancestrais, peso do boss.
- **Referências:** o seu histórico (mediana do seu próprio tempo por tipo e dificuldade) e o tempo mínimo de leitura do enunciado.

**Saídas:**
- **Desempenho `P` ∈ [0, 10.000]:** `P = 10.000 · a · fT(t) · fK(k) · fH(h) · fI`, com cada fator definido por faixas na tabela de regras.
- **Classificação F → S por faixa de `P`:**

  | F | E | D | C | B | A | S |
  |---|---|---|---|---|---|---|
  | < 1.500 | < 3.000 | < 4.500 | < 6.000 | < 7.500 | < 9.000 | ≥ 9.000 |

- **Pontos, sem teto e sem valor fixo por lição:** `XP = arred(D · P/100 · novidade · sequência)`. Nenhuma lição, assunto ou boss tem pontos pré-definidos; tudo sai da resposta.
- **Seu nível de 0 a 10.000:** rating no estilo Elo. `E = 1/(1+10^((R_desafio − R_você)/2000))`; `R_você += K·(P/10.000 − E)`, limitado a [0, 10.000].
- **Botão "por quê?":** mostra a conta inteira com os números.

**Casuística numerada (sem brechas):**
- Cada tentativa cai em exatamente **um caso principal** (`AV-001…`), mais **modificadores** (`MOD-…`). Exemplos:
  - correta no tempo; correta rápida demais (abaixo do tempo de leitura); correta após dica; parcial; errada; vazia; repetição do enunciado;
  - colada; tempo esgotado; abandonada; enviada duas vezes (idempotente pelo ID da tentativa);
  - relógio do sistema voltou (tempo impossível); valor fora do domínio (NaN, infinito, unidade errada); código que não compila;
  - teste pulado ou `xfail`; arquivo de teste alterado (o hash difere do original e a tentativa é anulada);
  - resposta idêntica a uma errada anterior; força bruta (k acima do limite); desafio já dominado refeito; autoavaliação sem evidência.
- **`AV-999`:** qualquer coisa não prevista é registrada com P = 0 provisório e sinalizada.
- **Teste de propriedade:** milhares de entradas aleatórias, inclusive impossíveis, provam que a função é total, determinística e que cada tentativa cai num caso só.

**Registro:** cada avaliação vira um evento no log (F1) e alimenta a Revisão (F6) e as Missões (F9).

## F9 · Missões ocultas (como nos jogos)
- **Tarefas que aparecem do nada:** gatilhos escondidos no motor de alavancas, que dependem do nível, assunto, ficha e sessão. A missão surge quando você entra numa área peculiar ou desconhecida para você. Exemplos:
  - primeira visita a uma trilha;
  - abrir a prévia (→) de um assunto ainda trancado;
  - um tipo de fonte que você nunca usou;
  - revisitar um assunto dominado há muito tempo;
  - ligar uma criação a uma pergunta de "A linha";
  - criar um assunto que une duas trilhas.
- **Geração determinística:** a missão sai de uma semente que é o hash do contexto, então o mesmo contexto gera a mesma missão.
- **Recompensa:** calculada pelo Sábio quando a missão é cumprida.
- **Catálogo:** fica em `Nous Keiros/regras/missoes.json`. O que estiver complexo demais fica por último.

## Melhorias além do pedido (entram nas fases em que cabem)
- **Comandos:** paleta de comandos ⌘K, atalhos de teclado em tudo, desfazer e refazer (o log permite).
- **Tela "Ajustes":**
  - pasta;
  - notificações;
  - alavancas;
  - regras do Sábio (só leitura, com a versão);
  - aparência (tamanho de fonte e alto contraste);
  - atalhos.
- **Acompanhamento:**
  - painel de estatísticas sem estimativas: dominados por nível e trilha, ritmo real, retenção FSRS, distribuição de F→S, curva do seu nível;
  - linha do tempo do estudo;
  - relatório semanal em `progresso/relatorios/AAAA-Snn.md`;
  - diário em `diario/AAAA-MM-DD.md`.
- **Leitura e escrita:**
  - modo foco;
  - KaTeX embutido para fórmulas nas notas;
  - editor de código com realce nos exercícios (CodeMirror embutido);
  - busca com filtros (`trilha:`, `nivel:`, `tipo:`, `rank:`).
- **Segurança dos dados:**
  - conferência da corrente de hash do log a cada abertura, com reparo;
  - backups em rodízio (dias, semanas e meses);
  - exportação completa em `.zip`.
- **Fuso:** horários com fuso IANA, pronto para uma mudança de país.

## Por último (com você)
- **Material e configuração por assunto,** inclusive visuais (como você pediu). Antes de começar, te chamo para definirmos o modelo.
- **Widget e ações nativas do Atalhos** (projeto Xcode).

## Ordem de execução
Fase 0 → F1 → F2 → **Sábio** → F3 → F4 → F5 → F6 → F7 → F8 → F9 → melhorias restantes → "Por último".

Ao fim de cada fase:
- revisão adversarial por vários agentes (compilação, funcionamento, dados e regras);
- correções;
- commit e push.

## Verificação (a cada fase)
1. `node --test app/testes/nucleo/*.test.js`: os módulos puros (estado, eventos, alavancas, FSRS com vetores de referência, ligações, correção, posicionamento).
2. `node app/testes/testar_ui.js`: interface no Chromium com a ponte simulada (casos novos por fase).
3. Swift:
   - camada de arquivos e rede com testes reais em Foundation no Linux;
   - checagem de tipos de todos os arquivos contra os stubs (fora do repositório);
   - `swiftc -parse`.
4. `python3 ferramentas/validar.py`; nenhuma assinatura de ferramenta nos arquivos; commit em português sem assinatura e push por fase; PR #1 atualizado (ou um PR novo, se o #1 for mesclado).
5. **No seu Mac:**
   - `./construir.sh`;
   - o "Teste da F0" e o boss de cada fase no `LEIA-ME.md`;
   - se o build der erro, você me manda a mensagem e eu corrijo.
