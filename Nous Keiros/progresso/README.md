# progresso

O seu progresso no mapa. Quem escreve aqui é o app; não edite à mão.

- `progresso.json`: o estado atual — o que está marcado em cada assunto e quais bosses de nível foram vencidos. É regravado a cada marcação.
- `backups/progresso AAAA-MM-DD.json`: uma cópia por dia, feita antes da primeira gravação do dia.
- `.versoes/`: versões anteriores do progresso (no máximo uma por hora, e sempre que o app junta marcações vindas de outro Mac ou importa um progresso).
- `progresso-ilegivel ….json`: só aparece se o arquivo atual estiver estragado; ele é guardado aqui em vez de ser apagado.

Se o progresso mudar no disco por fora do app (outro Mac, edição manual), o app junta as marcações dos dois lados em vez de sobrescrever.

Para levar o progresso para outro lugar, use Exportar no app (aba Progresso ou ⇧⌘E).
