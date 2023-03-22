local M = {
  'nvim-tree/nvim-tree.lua',
  dependencies = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
  config = function()
    require('nvim-tree').setup({
      actions = {
        open_file = {
          quit_on_open = true,
        }
      }
    })
  end,
}

return M
