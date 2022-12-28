return {
  'nvim-lua/plenary.nvim', -- lua functions used by many plugins
  'christoomey/vim-tmux-navigator', -- tmux & vim navigator via ctl-j,k,h,l
  'navarasu/onedark.nvim', -- theme
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
  {
    'lewis6991/gitsigns.nvim',
    config = true,
  },
}
