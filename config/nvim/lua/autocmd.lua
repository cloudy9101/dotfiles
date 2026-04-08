vim.api.nvim_create_autocmd('FileType', {
  desc = 'Wrap, linebreak, spellcheck on markdown and text files',
  group = vim.api.nvim_create_augroup('wrap-text-files', { clear = true }),
  pattern = { 'markdown', 'text', 'gitcommit' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true
    vim.opt_local.spell = true
  end,
})
