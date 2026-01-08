return {
  "luckasRanarison/tailwind-tools.nvim",
  name = "tailwind-tools",
  build = ":UpdateRemotePlugins",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig", -- optional
  },
  opts = {
    custom_class_extractor = function(bufnr)
      local clsx_pattern = "clsx%((.-)%)"
      local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
      local classes = {}

      for _, line in ipairs(lines) do
        for clsx_args in line:gmatch(clsx_pattern) do
          -- Static strings
          for class in clsx_args:gmatch('"([^"]+)"') do
            for token in class:gmatch("[%w%-]+") do
              table.insert(classes, token)
            end
          end
          -- Object keys
          for key in clsx_args:gmatch('{%s*"([^"]+)"%s*:') do
            for token in key:gmatch("[%w%-]+") do
              table.insert(classes, token)
            end
          end
        end
      end

      return classes
    end,
  },
}
