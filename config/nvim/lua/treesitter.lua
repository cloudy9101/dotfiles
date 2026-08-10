require('nvim-treesitter').install({
  'bash',
  'css',
  'embedded_template',
  'go',
  'html',
  'javascript',
  'json',
  'python',
  'ruby',
  'sql',
  'templ',
  'toml',
  'tsx',
  'typescript',
  'yaml',
  'zig',
})

-- Start Treesitter if there's a parser
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local lang = vim.treesitter.language.get_lang(ev.match)
    if not lang then
      return
    end

    if vim.treesitter.language.add(lang) then
      pcall(vim.treesitter.start)
    end
  end
})
