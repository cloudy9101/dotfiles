local M = {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { 'bash', 'css', 'dockerfile', 'go', 'html', 'javascript', 'json', 'lua', 'vim', 'markdown', 'ruby', 'scss', 'sql', 'tsx', 'typescript', 'yaml', 'terraform', },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
      modules = {},
      ignore_install = {},
      auto_install = true,
    })
  end
}

return M
