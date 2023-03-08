local M = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  dependencies = {
    'nvim-telescope/telescope-symbols.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    {
      'nvim-telescope/telescope-frecency.nvim',
      dependencies = {
        'kkharji/sqlite.lua',
      },
    },
  },
  config = function()
    require('telescope').load_extension('fzf')
    require('telescope').load_extension('frecency')
  end
}

return M
