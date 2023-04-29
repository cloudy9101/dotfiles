return {
  {
    'nvim-lua/plenary.nvim',
    lazy = true,
  }, -- lua functions used by many plugins
  'christoomey/vim-tmux-navigator', -- tmux & vim navigator via ctl-j,k,h,l
  -- theme
  {
    'navarasu/onedark.nvim',
    lazy = false,
    priority = 1000,
  },
  -- END theme
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically
  -- maximize vim window
  {
    'declancm/maximize.nvim',
    config = true,
  },
  -- auto surrounddings
  {
    'kylechui/nvim-surround',
    config = true,
  },
  -- Comment out via gc, gcc
  {
    'numToStr/Comment.nvim',
    config = true,
  },
  -- Git related
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',
  {
    'lewis6991/gitsigns.nvim',
    event = { "BufReadPre", "BufNewFile" },
  },
}
