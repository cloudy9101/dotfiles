local M = {
  'lukas-reineke/indent-blankline.nvim',
  main = "ibl",
  config = function()
    require('ibl').setup({})
  end
}

return M
