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

**Passos, no Terminal:**

```bash
cd "<onde está este repositório>/app"
./construir.sh
```

- O app fica em `app/build/O MAPA.app`. Arraste para a pasta Aplicativos.
- **Assinatura:** o padrão é local ("ad hoc"). Se você tiver a identidade gratuita "Apple Development" (Xcode → Settings → Accounts), use:

  ```bash
  IDENTIDADE="Apple Development: Seu Nome (XXXXXXXXXX)" ./construir.sh
  ```

  Assim o macOS não volta a pedir permissão de acesso ao disco a cada nova versão.
- **Se a construção der erro:** copie a mensagem inteira do Terminal e me mande. Este código foi escrito num ambiente sem Xcode, então o primeiro build no seu Mac é o teste final.

## Primeiro uso

1. Copie a pasta `Nous Keiros` deste repositório para o disco KEIROS: `/Volumes/KEIROS/Nous Keiros`.
2. Abra o O MAPA.
   - Se a pasta estiver nesse lugar, o app a encontra sozinho.
   - Se não estiver, ele pede para você escolher: **Arquivo → Escolher a pasta Nous Keiros…**
3. O macOS vai perguntar se o O MAPA pode acessar o disco KEIROS. Responda **Permitir**.
4. **Trazer o progresso antigo:**
   1. No mapa antigo, aba Progresso → Exportar.
   2. No app, aba Progresso → Importar arquivo (ou cole o texto).

### Atenção ao importar

**Portão de nível:** um nível só abre quando todos os assuntos do nível anterior estão dominados **e** o boss daquele nível foi vencido.

- A auditoria acrescentou assuntos novos, alguns em níveis baixos. Por exemplo, **C13 Unix shell, Git and research tooling** está no nível 0.
- Depois de importar, os níveis acima ficam fechados até você dominar esses assuntos novos.
- O que você já tinha marcado continua marcado. Nada se perde.

## O que a F0 faz

| | |
|---|---|
| Mapa | As mesmas abas do mapa original, em português: Árvore, Níveis, Agora, A linha, Fontes e Progresso. O conteúdo vem de `Nous Keiros/mapa/mapa.json`. |
| Portão de nível | Assunto bloqueado não deixa marcar e mostra o motivo: o nível anterior que falta ou os pré-requisitos que faltam. O boss do nível só abre com todos os assuntos do nível dominados. |
| Progresso | Gravado em `Nous Keiros/progresso/progresso.json` a cada marcação, com uma cópia por dia em `progresso/backups/`. |
| Notas | Cada assunto guarda as suas notas em `notas.md`, dentro da pasta do assunto. A versão substituída vai para `.versoes/` (no máximo uma a cada 10 minutos, e sempre que o texto encolhe pela metade). |
| Salvar | Botão **Salvar** no topo ou **⌘S**: grava tudo na hora. Ao fechar o app, ele também grava antes de sair. |
| KEIROS desconectado | O app avisa no topo ("guardado no Mac") e grava em `~/Library/Application Support/O MAPA/espera/`. Quando o disco volta, copia tudo para ele sozinho. O Mac guarda também um espelho do mapa, do progresso e das notas, para o app abrir mesmo sem o disco. |
| Tudo abre dentro | Qualquer link (fontes, A linha) abre numa janela de leitor do próprio app: páginas, PDFs e arXiv. Vídeos do YouTube tocam no player oficial embutido. O botão da bússola abre no navegador do Mac, se precisar. |
| Pasta do assunto | O botão **📁 Abrir a pasta do assunto** abre no Finder a pasta daquele assunto no Nous Keiros. |
| Exportar | **⇧⌘E** ou aba Progresso: salva progresso + notas num arquivo `.json` que você escolhe. |

## Teste da F0 (o boss desta fase)

1. Importe o progresso exportado do mapa antigo e confira se os mesmos assuntos aparecem dominados.
2. **Leitor → Testar vídeo do YouTube:** o vídeo precisa tocar dentro do app.
   - Se aparecer o erro 153, me avise: o YouTube mudou a regra do player embutido.
3. Abra uma fonte em PDF e uma página do arXiv a partir de um assunto.
4. Escreva uma nota num assunto, aperte ⌘S e confira se `notas.md` apareceu na pasta do assunto.
5. Desconecte o KEIROS, marque um item, reconecte e confira se `progresso/progresso.json` foi atualizado.

## Onde está cada parte do código

| Arquivo | O que faz |
|---|---|
| `Package.swift`, `construir.sh`, `Info.plist` | Construção e montagem do `.app`. |
| `Sources/OMapa/App.swift` | Janela principal, menus (Salvar, Exportar, Escolher pasta, Leitor) e salvamento ao sair. |
| `Sources/OMapa/Arquivos.swift` | Pasta Nous Keiros: gravação atômica, `.versoes`, backups do dia, espera no Mac e espelho. |
| `Sources/OMapa/Esquema.swift` | Serve a interface em `omapa://app/` e o `mapa.json` do Nous Keiros. |
| `Sources/OMapa/Ponte.swift` | Pedidos da interface: carregar e salvar progresso, notas, exportar, abrir link e abrir pasta. |
| `Sources/OMapa/PainelWeb.swift` | A WebView do mapa. Links da web nunca saem do mapa: vão para o leitor. |
| `Sources/OMapa/Leitor.swift` | Janelas do leitor, com o player do YouTube embutido. |
| `UI/` | A interface: `index.html`, `estilo.css`, `mapa.js` e as fontes embutidas (licença OFL). |

**Fora do app:** a interface também abre num navegador comum, servida junto com a pasta Nous Keiros em `nous/`. Nesse caso guarda o progresso no navegador. É assim que ela é testada.

## Próximas fases

- F1 Pastas e Salvar completos;
- F2 Alavancas;
- F3 Leitor com destaques e busca;
- F4 Fontes vivas;
- F5 Painel do item;
- F6 Revisão;
- F7 Boss com prova;
- F8 Autonomia.

O detalhe de cada fase está em `ESTRATEGIA.md`. Antes da F5 e da F8 eu paro e te chamo para você definir o modelo.
