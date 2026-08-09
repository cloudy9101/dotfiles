vim.lsp.enable({
  'jsonls',
  'lua_ls',
  'gopls',
})

local group = vim.api.nvim_create_augroup('ray.lsp', {})

-- Enable vim.b.autoformat flag if LSP supports
vim.api.nvim_create_autocmd({ 'LspAttach' }, {
  callback = function(evt)
    local client = vim.lsp.get_client_by_id(evt.data.client_id)
    if not client then
      return
    end

    if client:supports_method('textDocument/formatting') then
      vim.b.autoformat = true
    end
  end
})

-- Format on save if vim.b.autoformat is true
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = group,
  callback = function(evt)
    if vim.b.autoformat then
      vim.lsp.buf.format({ buf = evt.buf })
    end
  end,
})

-- Save without format
vim.api.nvim_create_user_command('W', function()
  vim.b.autoformat = false
  vim.fn.execute('w')
  vim.b.autoformat = true
end, {})
