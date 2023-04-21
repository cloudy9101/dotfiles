local M = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.0',
  dependencies = {
    'nvim-telescope/telescope-symbols.nvim',
    'LukasPietzschmann/telescope-tabs',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
  },
  config = function()
    require('telescope').load_extension('fzf')
    require('telescope-tabs').setup({
      close_tab_shortcut_i = 'C-dt',
      close_tab_shortcut_n = 'dt',
    })
  end
}

return M
