local catppuccin_opts = {
  flavour = "mocha",
  transparent_background = true,
  show_end_of_buffer = false,
  integrations = {
    cmp = true,
    telescope = { enabled = true },
    which_key = true,
    native_lsp = { enabled = true },
    snacks = false,
  },
}

return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = function()
        require("catppuccin").setup(catppuccin_opts)
        vim.cmd.colorscheme("catppuccin-mocha")
      end,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
}