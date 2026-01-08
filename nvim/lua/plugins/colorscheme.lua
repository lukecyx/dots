return {
  -- add gruvbox
  { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "catppuccin-latte",
      colorscheme = "catppuccin-mocha",
    },
  },
}
