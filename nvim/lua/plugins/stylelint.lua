return {
  "bmatcuk/stylelint-lsp",
  ft = { "css", "scss", "less", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  config = function()
    local lspconfig = require("lspconfig")
    local util = require("lspconfig.util")

    lspconfig.stylelint_lsp.setup({
      cmd = { "stylelint-lsp", "--stdio" },
      filetypes = { "css", "scss", "less", "javascript", "javascriptreact", "typescript", "typescriptreact" },
      root_dir = util.root_pattern("package.json", ".git"),
      settings = {
        stylelintplus = {
          autoFixOnSave = true,
        },
      },
      flags = {
        debounce_text_changes = 150,
      },
    })
  end,
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
  },
}
