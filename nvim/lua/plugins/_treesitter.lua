local M = {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'bash', 'css', 'dockerfile', 'go', 'help', 'html', 'javascript', 'json', 'lua', 'vim', 'markdown', 'ruby', 'scss', 'sql', 'tsx', 'typescript', 'yaml' },
      highlight = { enable = true },
      indent = { enable = true, disable = { 'javascript', 'tsx', 'typescript' } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "gnn",
          node_incremental = "grn",
          scope_incremental = "grc",
          node_decremental = "grm",
        },
      },
    })
  end
}

return M
