-- Start Treesitter if there's a parser
vim.api.nvim_create_autocmd('FileType', {
    callback = function(ev)
      if vim.treesitter.language.add(ev.match) then
        pcall(vim.treesitter.start)
      end
    end
})

