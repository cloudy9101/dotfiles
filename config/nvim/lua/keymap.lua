vim.keymap.set('n', '<leader><leader>', ':Pick files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>fh', ':Pick help<CR>', { desc = ' Find helps' })
vim.keymap.set('n', '<leader>fb', ':Pick buffers<CR>', { desc = 'Find buffers' })
vim.keymap.set('n', '<leader>ss', ':Pick grep_live<CR>', { desc = 'Live grep' })
vim.keymap.set('n', '<leader>sw', ':Pick grep pattern="<cword>"<CR>', { desc = 'Grep current word' })

vim.keymap.set('n', ']t', ':tabnext<CR>', { desc = 'Next tab' })
vim.keymap.set('n', '[t', ':tabprevious<CR>', { desc = 'Previous tab' })

vim.keymap.set('n', '-', ':Oil --float<CR>', { desc = 'File explorer' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set({"n", "v"}, "<leader>y", '"+y', { desc = "Yank to system clipboard" })
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Setup mini.clue
local miniclue = require('mini.clue')
miniclue.setup({
  triggers = {
    -- Leader triggers
    { mode = { 'n', 'x' }, keys = '<leader>' },

    -- `[` and `]` keys
    { mode = 'n',          keys = '[' },
    { mode = 'n',          keys = ']' },

    -- Built-in completion
    { mode = 'i',          keys = '<C-x>' },

    -- `g` key
    { mode = { 'n', 'x' }, keys = 'g' },

    -- Marks
    { mode = { 'n', 'x' }, keys = "'" },
    { mode = { 'n', 'x' }, keys = '`' },

    -- Registers
    { mode = { 'n', 'x' }, keys = '"' },
    { mode = { 'i', 'c' }, keys = '<C-r>' },

    -- Window commands
    { mode = 'n',          keys = '<C-w>' },

    -- `z` key
    { mode = { 'n', 'x' }, keys = 'z' },
  },
  clues = {
    -- Enhance this by adding descriptions for <Leader> mapping groups
    miniclue.gen_clues.square_brackets(),
    miniclue.gen_clues.builtin_completion(),
    miniclue.gen_clues.g(),
    miniclue.gen_clues.marks(),
    miniclue.gen_clues.registers(),
    miniclue.gen_clues.windows(),
    miniclue.gen_clues.z(),
  }
})
