return {
  "nvim-neotest/neotest",
  dependencies = {
    "marilari88/neotest-vitest",
  },
  opts = {
    adapters = {
      -- configure the vitest adapter with any options you need
      ["neotest-vitest"] = {
        -- Example: filter out node_modules directory
        filter_dir = function(name, rel_path, root)
          return name ~= "node_modules"
        end,
        -- Example: stricter test file detection
        is_test_file = function(file_path)
          -- you can customize this logic
          return file_path:match("_test%.ts$") or file_path:match("%.spec%.ts$")
        end,
        -- You can optionally pass custom vitest command
        vitestCommand = "vitest --passWithNoTests --reporter verbose",
      },
    },
    -- you can set other neotest opts here
    -- e.g., default strategy, quickfix flags, etc.
  },
  config = function(_, opts)
    require("neotest").setup(opts)
    -- Optionally: keymaps for watch mode
    vim.api.nvim_set_keymap(
      "n",
      "<leader>twr",
      "<cmd>lua require('neotest').run.run({ vitestCommand = 'vitest --watch' })<cr>",
      { noremap = true, silent = true, desc = "Neotest: Vitest watch all" }
    )
    vim.api.nvim_set_keymap(
      "n",
      "<leader>twf",
      "<cmd>lua require('neotest').run.run({ vim.fn.expand('%'), vitestCommand = 'vitest --watch' })<cr>",
      { noremap = true, silent = true, desc = "Neotest: Vitest watch file" }
    )
  end,
}
