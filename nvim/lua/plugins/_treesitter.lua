local M = {
  'nvim-treesitter/nvim-treesitter',
  build = function()
    require('nvim-treesitter.install').update({ with_sync = true })
  end,
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'bash', 'css', 'dockerfile', 'go', 'help', 'html', 'javascript', 'json', 'lua', 'markdown', 'ruby', 'scss', 'sql', 'tsx', 'typescript', 'yaml' },
      highlight = { enable = true },
      indent = { enable = true, disable = { 'javascript', 'tsx', 'typescript' } },
    })
  end
}

return M
