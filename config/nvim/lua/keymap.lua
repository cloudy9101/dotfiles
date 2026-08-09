-- Fzf
-- Fzf Builtin Pickers
vim.keymap.set('n', '<leader>t', ':FzfLua builtin<CR>', { desc = 'Fzf Pickers' })

-- Fzf files / grep
vim.keymap.set('n', '<leader><space>', ':FzfLua global<CR>', { desc = 'Global Picker' })
local fzf_keymap = function(suffix, picker, desc)
  vim.keymap.set('n', '<leader>s' .. suffix, ':FzfLua ' .. picker .. '<CR>', { desc = desc })
end
fzf_keymap('s', 'live_grep', 'Live grep current project')
fzf_keymap('w', 'grep_cword', 'Search word under cursor')
fzf_keymap('g', 'git_files', 'Search git indexed files')

-- Fzf LSP
local fzf_lsp_keymap = function(suffix, picker, desc)
  vim.keymap.set('n', 'gr' .. suffix, ':FzfLua ' .. picker .. '<CR>', { desc = desc })
end
vim.keymap.set('n', 'gO', ':FzfLua lsp_document_symbols<CR>', { desc = 'LSP Document Symbols' })
fzf_lsp_keymap('i', 'lsp_implementations', 'LSP Implementations')
fzf_lsp_keymap('r', 'lsp_references', 'LSP References')
fzf_lsp_keymap('s', 'diagnostics_document', 'LSP Document Diagnostics')
fzf_lsp_keymap('S', 'diagnostics_workspace', 'LSP Workspace Diagnostics')
