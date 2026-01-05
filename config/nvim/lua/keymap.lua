vim.keymap.set('n', '<leader>o', ':source<CR>', { desc = 'Reload configuration' })
vim.keymap.set('n', '<leader>w', ':write<CR>', { desc = 'Save' })
vim.keymap.set('n', '<leader>q', ':quit<CR>', { desc = 'Quit' })

vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format, { desc = 'Code format' })

vim.keymap.set('n', '<leader><leader>', ':Pick files<CR>', { desc = 'Find files' })
vim.keymap.set('n', '<leader>h', ':Pick help<CR>', { desc = ' Find helps' })

vim.keymap.set('n', '-', ':Oil<CR>', { desc = 'File explorer' })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
