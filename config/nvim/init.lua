local opt = vim.opt

-- show line numbers
opt.number = true
opt.relativenumber = true
opt.signcolumn = 'yes'
opt.cursorline = true

-- 1 tab = 2 space
opt.tabstop = 2
opt.shiftwidth = 2

-- replace tab with space
opt.expandtab = true

-- smart indent
opt.autoindent = true
opt.smartindent = true

-- show border for floating window
opt.winborder = 'rounded'

-- smartcase for searching
opt.ignorecase = true
opt.smartcase = true

-- list characters
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Wrap
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- MISC
opt.showmode = false

-- use whitespace as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- plugins
vim.pack.add({
	'https://github.com/folke/tokyonight.nvim',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/nvim-mini/mini.nvim',
	'https://github.com/stevearc/oil.nvim',
})
require('mini.ai').setup()
require('mini.pairs').setup()
require('mini.pick').setup()
require('mini.extra').setup()
require('mini.clue').setup()
require('mini.git').setup()
require('mini.diff').setup()
require('mini.indentscope').setup()
require('mini.icons').setup()
require('mini.statusline').setup()
require('mini.tabline').setup()
require('mini.trailspace').setup()
require('oil').setup()

-- colorscheme
vim.cmd.colorscheme 'tokyonight'

require('treesitter')
require('lsp')
require('keymap')
