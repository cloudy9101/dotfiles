-- Register languages for treesitter
local filetypes = {
  bash = { 'sh' },
  embedded_template = { 'eruby' },
  javascript = { 'javascriptreact', 'ecma', 'ecmascript', 'jsx', 'js' },
  json = { 'jsonc' },
  python = { 'py' },
  tsx = { 'typescriptreact', 'typescript.tsx' },
  typescript = { 'ts' },
}

for lang, ft in pairs(filetypes) do
  vim.treesitter.language.register(lang, ft)
end

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
