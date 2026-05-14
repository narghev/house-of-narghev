#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

mkdir -p "$HOME/.config"

link() {
  local src="$1"
  local dst="$2"
  if [ -L "$dst" ] || [ -e "$dst" ]; then
    echo "skip: $dst already exists"
    return
  fi
  ln -s "$src" "$dst"
  echo "linked: $dst -> $src"
}

link "$CONFIG_DIR/karabiner" "$HOME/.config/karabiner"
link "$CONFIG_DIR/ohmyposh"  "$HOME/.config/ohmyposh"
link "$CONFIG_DIR/ghostty"   "$HOME/.config/ghostty"
link "$CONFIG_DIR/zshrc"     "$HOME/.zshrc"
link "$CONFIG_DIR/tmux.conf" "$HOME/.tmux.conf"
