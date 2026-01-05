-- lsp list
vim.lsp.enable({
  -- C
  'clangd',

  -- Lua
  'lua_ls',

  -- Ruby
  'ruby_lsp',
  'herb_ls',
  'turbo_ls',
  'stimulus_ls',

  -- Golang
  'gopls',
  'templ',
  'golangci_lint_ls',

  -- Rust
  'rust_analyzer',

  -- Zig
  'zls',

  -- Javascript/Typescript
  'ts_ls',
  'eslint',

  -- HTML/CSS
  'html',
  'cssls',
  'tailwindcss',

  -- MISC
  'bashls',
  'docker_language_sevrer',
  'jsonls',
  'sqlls',
  'yamlls',
})

-- add vim api support for lua lsp
vim.lsp.config('lua_ls', {
  settings = {
    Lua = {
      workspace = {
        library = vim.api.nvim_get_runtime_file('', true),
      },
    },
  },
})

-- Auto complete based on lsp
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(event)
    -- Create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map('grn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('gra', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    -- Find references for the word under your cursor.
    map('grr', function() require('mini.pick').lsp({ scope = 'references' }) end, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    map('gri', function() require('mini.pick').lsp({ scope = 'implementation' }) end, '[G]oto [I]mplementation')

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map('grd', function() require('mini.pick').lsp({ scope = 'definition' }) end, '[G]oto [D]efinition')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('grD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map('gO', function() require('mini.pick').lsp({ scope = 'document_symbol' }) end, 'Open Document Symbols')

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    map('gW', function() require('mini.pick').lsp({ scope = 'workspace_symbol' }) end, 'Open Workspace Symbols')

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map('grt', function() require('mini.pick').lsp({ scope = 'type_definition' }) end, '[G]oto [T]ype Definition')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end
  end,
})

-- Do not auto select first element from auto complete list
vim.cmd.set('completeopt+=noselect')
