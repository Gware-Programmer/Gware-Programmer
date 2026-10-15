# O MAPA — app de Mac (fase F0)

O app tem um objetivo: estudar e praticar até criar a sua própria IA. Esta é a fase **F0 · O mapa vira app**:
- o mapa roda numa janela própria;
- lê o conteúdo da pasta Nous Keiros;
- guarda o seu progresso e as suas notas no disco KEIROS;
- abre os materiais dentro do app.

Nada aqui usa IA: tudo é regra.

## Construir (uma vez, e a cada atualização)

**Precisa de:** macOS 13 ou mais novo e as ferramentas da Apple.
- Se ainda não tiver o Xcode, rode no Terminal: `xcode-select --install`.
- Se você instalou o Xcode completo e nunca o abriu, aceite a licença antes: `sudo xcodebuild -license accept`.

**Passos, no Terminal:**

```bash
cd "<onde está este repositório>/app"
./construir.sh
```

- O app fica em `app/build/O MAPA.app`.
- **Instalar ou atualizar:** apague a versão anterior antes de copiar a nova (o script mostra o comando no fim):

  ```bash
  rm -rf "/Applications/O MAPA.app" && ditto "app/build/O MAPA.app" "/Applications/O MAPA.app"
  ```

- **Assinatura:** o padrão é local ("ad hoc"). Com ela, o macOS volta a pedir acesso ao disco a cada nova versão. Para evitar isso, use a identidade gratuita "Apple Development":
  1. Crie a identidade (precisa do Xcode completo): Xcode → Settings → Accounts → entre com o seu Apple ID → Manage Certificates → + → Apple Development.
  2. Descubra o nome exato:

     ```bash
     security find-identity -v -p codesigning
     ```

  3. Construa com ela:

     ```bash
     IDENTIDADE="Apple Development: Seu Nome (XXXXXXXXXX)" ./construir.sh
     ```
- **Se a construção der erro:** copie a mensagem inteira do Terminal e me mande. Este código foi escrito num ambiente sem Xcode, então o primeiro build no seu Mac é o teste final.

## Primeiro uso

1. Copie a pasta `Nous Keiros` deste repositório para o disco KEIROS: `/Volumes/KEIROS/Nous Keiros`.
2. Abra o O MAPA.
   - Se a pasta estiver nesse lugar, o app a encontra sozinho.
   - Se não estiver, ele pede para você escolher: **Arquivo → Escolher a pasta Nous Keiros…**
3. O macOS vai perguntar se o O MAPA pode acessar o disco KEIROS. Responda **Permitir**.
   - **Se clicou em "Não permitir":** o app se comporta como se o KEIROS estivesse desconectado e guarda tudo no Mac. Para devolver o acesso, abra Ajustes do Sistema → Privacidade e Segurança → Arquivos e Pastas → O MAPA e ligue "Volumes Removíveis". Ou rode no Terminal e abra o app de novo:

     ```bash
     tccutil reset SystemPolicyRemovableVolumes br.keiros.omapa
     ```
4. **Trazer o progresso antigo:**
   1. No mapa antigo, aba Progresso → Exportar.
   2. No app, aba Progresso → Importar arquivo (ou cole o texto).

### Atenção ao importar

**Portão de nível:** um nível só abre quando todos os assuntos do nível anterior estão dominados **e** o boss daquele nível foi vencido.

- A auditoria acrescentou assuntos novos, alguns em níveis baixos. Por exemplo, **C13 Unix shell, Git and research tooling** está no nível 0.
- Depois de importar, os níveis acima ficam fechados até você dominar esses assuntos novos.
- O que você já tinha marcado continua marcado. Nada se perde.
- A importação **não apaga notas**:
  - nota vazia recebe o texto importado;
  - nota diferente recebe o importado no fim, depois de uma linha "importado em …";
  - o progresso que existia antes fica guardado em `progresso/.versoes/`.

### Atualizar o conteúdo do mapa com segurança

Quando este repositório trouxer uma versão nova do conteúdo, **não substitua a pasta inteira no disco**: isso apagaria `progresso/` e as suas `notas.md`. Faça assim:
1. Copie só a pasta `Nous Keiros/mapa` do repositório para `/Volumes/KEIROS/Nous Keiros/mapa` (substituindo).
2. Na pasta do repositório, rode:

   ```bash
   python3 ferramentas/gerar.py "/Volumes/KEIROS/Nous Keiros"
   ```

   O gerador só reescreve `assunto.md` de cada assunto e `mapa/fontes.bib`. Se um título mudar, ele renomeia a pasta do assunto e mantém o que está dentro.

Se mesmo assim a pasta for substituída, o app restaura o progresso e as notas a partir da cópia que guarda no Mac e avisa.

## O que a F0 faz

| | |
|---|---|
| Mapa | As mesmas abas do mapa original, em português: Árvore, Níveis, Agora, A linha, Fontes e Progresso. O conteúdo vem de `Nous Keiros/mapa/mapa.json`. |
| Portão de nível | Assunto bloqueado não deixa marcar e mostra o motivo: o nível anterior que falta ou os pré-requisitos que faltam. O boss do nível só abre com todos os assuntos do nível dominados. |
| Progresso | Gravado em `Nous Keiros/progresso/progresso.json` a cada marcação, com uma cópia por dia em `progresso/backups/` e versões em `progresso/.versoes/` (no máximo uma por hora, e sempre que algo de fora é juntado). |
| Dois Macs ou disco mexido por fora | Se o progresso no disco mudou desde a última vez que o app o leu (por exemplo, você estudou em outro Mac), o app **junta** as marcações dos dois em vez de sobrescrever e avisa. Uma nota mudada por fora tem a versão de fora guardada em `.versoes/`. Ao voltar para o app, ele relê o disco. |
| Notas | Cada assunto guarda as suas notas em `notas.md`, dentro da pasta do assunto. A versão substituída vai para `.versoes/` (no máximo uma a cada 10 minutos, e sempre que o texto encolhe pela metade). |
| Salvar | Botão **Salvar** no topo ou **⌘S**: grava na hora o que estiver pendente. Ao fechar a janela, esconder ou sair do app, ele também grava. Se algo não pôde ser gravado, a saída pergunta "Sair mesmo assim / Cancelar". |
| KEIROS desconectado ou recusando escrita | O app avisa no topo ("guardado no Mac", com o motivo) e grava em `~/Library/Application Support/O MAPA/raizes/<pasta>/espera/`. Quando o disco volta, copia tudo para ele sozinho. O Mac guarda também um espelho do que veio do disco (mapa, progresso e notas), para o app abrir mesmo sem o disco. Cada pasta Nous Keiros tem a sua área: trocar de pasta não mistura nada. **Ejete o KEIROS no Finder (⏏) antes de desconectar o cabo.** |
| Arquivo que não abre | Se `progresso.json` ou uma `notas.md` existir mas não abrir (erro de disco ou de permissão), o app não trata como vazio: avisa, não grava nada por cima e deixa a nota só para leitura. |
| Portão ao desmarcar | Desmarcar algo que deixaria um assunto (ou o boss de um nível) trancado pede confirmação. |
| Tudo abre dentro | Qualquer link (fontes, A linha) abre numa janela de leitor do próprio app: páginas, PDFs e arXiv. Vídeos do YouTube tocam no player oficial embutido. O botão da bússola abre no navegador do Mac, se precisar. |
| Pasta do assunto | O botão **📁 Abrir a pasta do assunto** abre no Finder a pasta daquele assunto no Nous Keiros. |
| Exportar | **⇧⌘E** ou aba Progresso: salva progresso + notas num arquivo `.json` que você escolhe. |

## Teste da F0 (o boss desta fase)

1. Importe o progresso exportado do mapa antigo e confira se os mesmos assuntos aparecem dominados.
2. **Leitor → Testar vídeo do YouTube:** o vídeo precisa tocar dentro do app.
   - Se aparecer o erro 153, me avise: o YouTube mudou a regra do player embutido.
3. Abra uma fonte em PDF e uma página do arXiv a partir de um assunto.
4. Escreva uma nota num assunto, aperte ⌘S e confira se `notas.md` apareceu na pasta do assunto.
5. Ejete o KEIROS, marque um item, conecte de novo e confira se `progresso/progresso.json` foi atualizado.
6. Feche a janela com ⌘W logo depois de marcar um item e saia com ⌘Q: a marcação precisa estar no disco.
7. Com o app aberto, edite `progresso/progresso.json` num editor de texto (por exemplo, marque o boss de um assunto), salve e volte para o app: ele relê o disco e mostra a mudança.

## Onde está cada parte do código

| Arquivo | O que faz |
|---|---|
| `Package.swift`, `construir.sh`, `Info.plist` | Construção e montagem do `.app`. |
| `Sources/OMapa/App.swift` | Janela principal, menus (Salvar, Exportar, Escolher pasta, Leitor), a WebView única do mapa, releitura ao voltar para o app e salvamento ao sair. |
| `Sources/OMapa/Arquivos.swift` | Pasta Nous Keiros: gravação atômica, `.versoes`, backups do dia, junção de progresso, espera e espelho por pasta, restauração. |
| `Sources/OMapa/Despacho.swift` | O contrato da ponte: cada pedido da interface e a resposta (só Foundation, testado fora do Mac). |
| `Sources/OMapa/Esquema.swift` | Serve a interface em `omapa://app/` e o `mapa.json` do Nous Keiros. |
| `Sources/OMapa/Ponte.swift` | Recebe os pedidos da página principal e entrega ao Despacho. |
| `Sources/OMapa/PainelWeb.swift` | A janela do mapa. Links da web nunca saem do mapa: vão para o leitor. |
| `Sources/OMapa/Leitor.swift` | Janelas do leitor, com o player do YouTube embutido. |
| `UI/` | A interface: `index.html`, `estilo.css`, `mapa.js` e as fontes embutidas (licença OFL). |

**Fora do app:** a interface também abre num navegador comum, servida junto com a pasta Nous Keiros em `nous/`. Nesse caso guarda o progresso no navegador. É assim que ela é testada.

**Testes** (rodam aqui e em qualquer Mac):
- `node app/testes/testar_ui.js`: a interface no Chromium, em modo navegador e com uma ponte simulada.
- `swiftc -o /tmp/teste-arquivos app/testes/arquivos/main.swift app/Sources/OMapa/Arquivos.swift app/Sources/OMapa/Despacho.swift && /tmp/teste-arquivos "Nous Keiros" /tmp/area-de-teste`: a camada de arquivos e o contrato da ponte.

## Próximas fases

- F1 Pastas e Salvar completos;
- F2 Alavancas;
- F3 Leitor com destaques e busca;
- F4 Fontes vivas;
- F5 Painel do item;
- F6 Revisão;
- F7 Boss com prova;
- F8 Autonomia.

Todas estão sendo construídas em sequência, cada uma com os seus testes; o modelo da F5 e da F8 já foi definido por você. O detalhe de cada fase está em `ESTRATEGIA.md`. A configuração visual por assunto fica para o fim, com você.
