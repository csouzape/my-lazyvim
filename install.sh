#!/usr/bin/env bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
NVIM_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
PLUGIN_DIR="$NVIM_DIR/lua/plugins"
COLORSCHEME_FILE="$SCRIPT_DIR/lua/plugins/colorscheme.lua"

echo "▶ LazyVim + Catppuccin transparent installer"

if [ -d "$NVIM_DIR" ]; then
  echo "The directory $NVIM_DIR already exists."
  echo "Creating Backup in: $BACKUP_DIR"
  mv "$NVIM_DIR" "$BACKUP_DIR"
fi

echo "Creating LazyVim starter..."
git clone https://github.com/LazyVim/starter "$NVIM_DIR"
rm -rf "$NVIM_DIR/.git"
mkdir -p "$PLUGIN_DIR"
echo "Copying colorscheme.lua from repository..."
cp "$COLORSCHEME_FILE" "$PLUGIN_DIR/colorscheme.lua"

# 6️⃣ Mensagem final
echo
echo "LazyVim has been installed with Catppuccin Mocha transparent!"
echo "▶ Open Lazyvim and wait has install all plugins:"
echo "   nvim"
echo
echo "Tip:"
echo "   You terminal depends transparency settings to show the background properly"
