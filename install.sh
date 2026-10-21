#!/usr/bin/env bash
# Instala (ou remove, com --uninstall) o app para o usuário atual.
set -euo pipefail
cd "$(dirname "$0")"

BINDIR="$HOME/.local/bin"
APPDIR="$HOME/.local/share/applications"
DESKTOP="io.github.ribasdo.CursorSwitcher.desktop"

if [[ "${1:-}" == "--uninstall" ]]; then
    rm -f "$BINDIR/cosmic-cursor-switcher" "$APPDIR/$DESKTOP"
    echo "Removido."
    exit 0
fi

install -Dm755 cosmic-cursor-switcher "$BINDIR/cosmic-cursor-switcher"
mkdir -p "$APPDIR"
sed "s|@BINDIR@|$BINDIR|" "$DESKTOP" > "$APPDIR/$DESKTOP"
update-desktop-database "$APPDIR" 2>/dev/null || true
echo "Instalado. Procure por \"Temas de Cursor\" no menu de aplicativos."
