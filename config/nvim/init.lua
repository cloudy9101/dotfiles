local opt = vim.opt

-- line numbers
opt.number = true -- line number
opt.relativenumber = true -- relative line number
opt.signcolumn = 'yes' -- always show sign column, avoid layout jump w/o sign column
opt.cursorline = true -- highlight current line the cursor at

-- indent/tabs
opt.tabstop = 2 -- tabwidth for displaying
opt.shiftwidth = 0 -- indent width, set to 0 so it uses tabstop value
opt.softtabstop = -1 -- 1 tab = 2 columns, set to negative so it use shiftwidth -> tabstop value
opt.expandtab = true -- replace tab with space in insert mode
opt.smartindent = true -- smart auto indent

-- window deco
opt.winborder = 'rounded' -- show border for floating window
opt.pumheight = 10 -- popup menu height
opt.pumblend = 5 -- popup menu transparency
opt.winblend = 5 -- popup menu transparency

-- window split
opt.splitbelow = true -- new h split window goes below
opt.splitright = true -- new v split window goes right

-- searching
opt.ignorecase = true -- case insensitive in search
opt.smartcase = true -- case sensitive if has uppercase in search pattern

-- list characters
opt.list = true -- show tabs, trailing spaces, non-breakable space chars
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- chars to display

-- Wrap
opt.colorcolumn = '100' -- show a colored column at column 100
opt.breakindent = true -- wrapped lines keep the same indent

-- Save undo history
opt.undofile = true

-- Fold
opt.foldmethod = 'expr' -- use expr below to do fold/unfold
opt.foldexpr = 'v:lua.vim.treesitter.foldexpr()' -- use treesitter to do fold/unfold
opt.foldlevel = 999 -- open all fold blocks by default

-- MISC
opt.showmode = false -- disable built-in bottom line Insert, Replace, Visual mode display
opt.showmatch = true -- cursor briefly jump to the matching open bracket after enter a close bracket
opt.backupcopy = 'yes'
-- opt.wildmenu = true -- tab completion for cmd line

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
  'https://github.com/wakatime/vim-wakatime.git',
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
})
-- colorscheme
vim.cmd.colorscheme 'tokyonight'

require('filetype')
require('mini')
require('treesitter')
require('lsp')
require('keymap')
require('gotest')
