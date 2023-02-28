local M = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  dependencies = {
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    'nvim-telescope/telescope-symbols.nvim',
  },
  config = function()
    require('telescope').load_extension('fzf')
  end
}

return M
