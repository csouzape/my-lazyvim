#!/usr/bin/env bash
set -e

NVIM_DIR="$HOME/.config/nvim"
BACKUP_DIR="$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
PLUGIN_DIR="$NVIM_DIR/lua/plugins"

echo "▶ Lzyvim + Gruvbox Material transparent installer"

if [ -d "$NVIM_DIR" ]; then
  echo "The directory $NVIM_DIR already exists."
  echo "Creating Backup in: $BACKUP_DIR"
  mv "$NVIM_DIR" "$BACKUP_DIR"
fi

echo "Creating LazyVim starter..."
git clone https://github.com/LazyVim/starter "$NVIM_DIR"
rm -rf "$NVIM_DIR/.git"
mkdir -p "$PLUGIN_DIR"
echo "Creating colorscheme.lua..."

cat << 'EOF' > "$PLUGIN_DIR/colorscheme.lua"
return {
  {
    "sainnhe/gruvbox-material",
    priority = 1000, 
    config = function()
      -- Estilo base
      vim.g.gruvbox_material_background = "hard" -- mais escuro
      vim.g.gruvbox_material_foreground = "material"
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_enable_bold = true

      vim.g.gruvbox_material_palette = "mix"

      vim.cmd.colorscheme("gruvbox-material")

      local highlights = {
        "Normal",
        "NormalNC",
        "SignColumn",
        "EndOfBuffer",
        "MsgArea",
        "FloatBorder",
        "NormalFloat",
        "StatusLine",
        "StatusLineNC",
        "LineNr",
        "Folded",
        "WinSeparator",
      }

      for _, hl in ipairs(highlights) do
        vim.api.nvim_set_hl(0, hl, { bg = "none" })
      end
    end,
  },
}
EOF

# 6️⃣ Mensagem final
echo
echo "LazyVim Has installed with Gruvbox Material Transparent!"
echo "▶ Open Lazyvim and wait has install all plugins:"
echo "   nvim"
echo
echo "Tip:"
echo "   You terminal depends transparency settings to show the background properly"
