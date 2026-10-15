#!/bin/bash
# Checa os tipos de todo o Swift do app fora do Mac (por exemplo, no Linux), contra módulos falsos
# de AppKit, WebKit, SwiftUI, Combine e UniformTypeIdentifiers (app/testes/stubs).
# Pega erros de linguagem; não substitui o build no Mac.
# Uso: app/testes/checar_swift.sh   (precisa do swiftc no PATH, ou SWIFTC=/caminho/para/swiftc)
set -euo pipefail
AQUI="$(cd "$(dirname "$0")" && pwd)"
SWIFTC="${SWIFTC:-swiftc}"
MOD="$(mktemp -d)"
trap 'rm -rf "$MOD"' EXIT
for m in Combine UniformTypeIdentifiers AppKit WebKit SwiftUI; do
  "$SWIFTC" -swift-version 5 -parse-as-library -emit-module -module-name "$m" -I "$MOD" \
    "$AQUI/stubs/$m.swift" -emit-module-path "$MOD/$m.swiftmodule"
done
"$SWIFTC" -swift-version 5 -typecheck -I "$MOD" "$AQUI"/../Sources/OMapa/*.swift
echo "Swift do app: tipos conferidos."
