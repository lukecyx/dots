-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local last_line = vim.api.nvim_buf_get_lines(0, -2, -1, false)[1]
    if last_line == "" then
      vim.api.nvim_buf_set_lines(0, -2, -1, false, {})
    end
  end,
})

-- Format on save with Prettier (includes CSS in styled-components and GraphQL in gql template literals)
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.js", "*.jsx", "*.ts", "*.tsx", "*.json", "*.css", "*.scss", "*.html", "*.md", "*.yaml", "*.yml" },
  callback = function(args)
    local conform = require("conform")
    if conform then
      conform.format({ async = false, lsp_fallback = true, bufnr = args.buf })
    end
  end,
})
