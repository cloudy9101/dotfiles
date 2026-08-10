-- Set <space> as the leader key
-- See `:h mapleader`
-- NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '

-- OPTIONS
--
-- See `:h vim.o`
-- NOTE: You can change these options as you wish!
-- For more options, you can see `:h option-list`
-- To see documentation for an option, you can use `:h 'optionname'`, for example `:h 'number'`
-- (Note the single quotes)

vim.o.number = true -- Show line numbers in a column.

-- Show line numbers relative to where the cursor is.
-- Affects the 'number' option above, see `:h number_relativenumber`.
vim.o.relativenumber = true

-- Always show sign column to avoid layout shift
vim.o.signcolumn = 'yes'

-- Sync clipboard between OS and Neovim. Schedule the setting after `UIEnter` because it can
-- increase startup-time. Remove this option if you want your OS clipboard to remain independent.
-- See `:h 'clipboard'`
vim.api.nvim_create_autocmd('UIEnter', {
  callback = function()
    vim.o.clipboard = 'unnamedplus'
  end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cursorline = true -- Highlight the line where the cursor is on.
vim.o.scrolloff = 10    -- Keep this many screen lines above/below the cursor.
vim.o.list = true       -- Show <tab> and trailing spaces.

-- If performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s). See `:h 'confirm'`
vim.o.confirm = true

-- Per project .nvim.lua config
vim.o.exrc = true

-- KEYMAPS
--
-- See `:h vim.keymap.set()`, `:h mapping`, `:h keycodes`

-- Use <Esc> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- AUTOCOMMANDS (EVENT HANDLERS)
--
-- See `:h lua-guide-autocommands`, `:h autocmd`, `:h nvim_create_autocmd()`

-- Highlight when yanking (copying) text.
-- Try it with `yap` in normal mode. See `:h vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  callback = function()
    vim.hl.on_yank()
  end,
})

-- PLUGINS
--
-- See `:h :packadd`, `:h vim.pack`

-- Add the "nohlsearch" package to automatically disable search highlighting after
-- 'updatetime' and when going to insert mode.
vim.cmd('packadd! nohlsearch')

-- Install third-party plugins via "vim.pack.add()".
local gh = function(x) return 'https://github.com/' .. x end
vim.pack.add({
  -- Quickstart configs for LSP
  gh 'neovim/nvim-lspconfig',
  -- Treesitter
  gh 'nvim-treesitter/nvim-treesitter',
  -- Fuzzy picker
  gh 'ibhagwan/fzf-lua',
  -- Oil file explorer
  gh 'stevearc/oil.nvim',
  -- Icons (fzf-lua optional dep)
  gh 'nvim-mini/mini.icons',
  -- Diff
  gh 'nvim-mini/mini.diff',
  -- Git
  gh 'nvim-mini/mini-git',
  -- Snippets
  gh 'rafamadriz/friendly-snippets',
  gh 'nvim-mini/mini.snippets',
  -- Autocompletion
  gh 'nvim-mini/mini.completion',
  -- Statusline
  gh 'nvim-mini/mini.statusline',
  -- Zk note taking
  gh 'zk-org/zk-nvim',
  -- Colorscheme
  gh 'catppuccin/nvim',
})

-- Colorscheme
vim.cmd.colorscheme 'catppuccin-macchiato'

-- Setup plugins
require('nvim-treesitter').setup()
require('fzf-lua').setup {
  fzf_colors = true,
}
require('fzf-lua').register_ui_select()
require('oil').setup({
  columns = {
    'size',
    'icon',
  },
})
require('mini.icons').setup()
require('mini.diff').setup({
  view = {
    style = 'sign',
    signs = { add = '+', change = '~', delete = '-' }
  }
})
require('mini.git').setup()
local gen_loader = require('mini.snippets').gen_loader
require('mini.snippets').setup({
  snippets = {
    gen_loader.from_file(vim.fs.dirname(vim.env.MYVIMRC) .. '/snippets/global.json'),
    gen_loader.from_lang(),
  }
})
require('mini.completion').setup()
require('mini.statusline').setup()
require('zk').setup({
  picker = 'fzf_lua',
})

-- Include custom modules
require('treesitter')
require('lsp')
require('keymap')
