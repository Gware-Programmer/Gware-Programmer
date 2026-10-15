#!/bin/bash
# Constrói o O MAPA.app a partir deste pacote.
# Precisa do Xcode ou das ferramentas de linha de comando (instale com: xcode-select --install).
#
# Uso:
#   ./construir.sh                       assinatura local ("ad hoc")
#   IDENTIDADE="Apple Development: Seu Nome (XXXXXXXXXX)" ./construir.sh
#                                        assinatura com a sua identidade gratuita da Apple:
#                                        o macOS não volta a pedir permissão a cada nova versão
set -euo pipefail
cd "$(dirname "$0")"

swift build -c release
BIN="$(swift build -c release --show-bin-path)/OMapa"

APP="build/O MAPA.app"
rm -rf "$APP"
mkdir -p "$APP/Contents/MacOS" "$APP/Contents/Resources"
cp "$BIN" "$APP/Contents/MacOS/OMapa"
cp Info.plist "$APP/Contents/Info.plist"
cp -R UI "$APP/Contents/Resources/UI"

codesign --force --sign "${IDENTIDADE:--}" "$APP"
codesign --verify "$APP"

echo
echo "Pronto: $(pwd)/$APP"
echo "Para instalar, arraste para Aplicativos ou rode:"
echo "  ditto \"$(pwd)/$APP\" \"/Applications/O MAPA.app\""
