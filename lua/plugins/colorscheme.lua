return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "mocha",
        transparent_background = true,
      })

      vim.cmd.colorscheme("catppuccin-mocha")

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
