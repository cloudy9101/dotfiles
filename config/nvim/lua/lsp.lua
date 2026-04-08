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
  'docker_language_server',
  'jsonls',
  'sqlls',
  'yamlls',
  'helm_ls',
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

    -- Format
    map('<leader>cf', vim.lsp.buf.format, '[C]ode [f]ormat')

    -- Rename the variable under your cursor.
    --  Most Language Servers support renaming across files, etc.
    map('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')

    -- Execute a code action, usually your cursor needs to be on top of an error
    -- or a suggestion from your LSP for this to activate.
    map('<leader>ga', vim.lsp.buf.code_action, '[G]oto Code [A]ction', { 'n', 'x' })

    local lsp = require('mini.extra').pickers.lsp
    -- Find references for the word under your cursor.
    map('<leader>gr', function() lsp({ scope = 'references' }) end, '[G]oto [R]eferences')

    -- Jump to the implementation of the word under your cursor.
    --  Useful when your language has ways of declaring types without an actual implementation.
    map('<leader>gi', function() lsp({ scope = 'implementation' }) end, '[G]oto [I]mplementation')

    -- Jump to the definition of the word under your cursor.
    --  This is where a variable was first declared, or where a function is defined, etc.
    --  To jump back, press <C-t>.
    map('<leader>gd', function() lsp({ scope = 'definition' }) end, '[G]oto [D]efinition')

    -- WARN: This is not Goto Definition, this is Goto Declaration.
    --  For example, in C this would take you to the header.
    map('<leader>gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

    -- Fuzzy find all the symbols in your current document.
    --  Symbols are things like variables, functions, types, etc.
    map('<leader>os', function() lsp({ scope = 'document_symbol' }) end, '[O]pen Document [S]ymbols')

    -- Fuzzy find all the symbols in your current workspace.
    --  Similar to document symbols, except searches over your entire project.
    map('<leader>oS', function() lsp({ scope = 'workspace_symbol' }) end, '[O]pen Workspace [S]ymbols')

    -- Jump to the type of the word under your cursor.
    --  Useful when you're not sure what type a variable is and you want to see
    --  the definition of its *type*, not where it was *defined*.
    map('<leader>gt', function() lsp({ scope = 'type_definition' }) end, '[G]oto [T]ype Definition')

    map('<leader>od', MiniExtra.pickers.diagnostic, '[O]pen [D]iagnostic')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client ~= nil and client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
    end

    -- Auto import
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        -- buf_request_sync defaults to a 1000ms timeout. Depending on your
        -- machine and codebase, you may want longer. Add an additional
        -- argument after params if you find that you have to write the file
        -- twice for changes to be saved.
        -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
          for _, r in pairs(res.result or {}) do
            if r.edit then
              local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
              vim.lsp.util.apply_workspace_edit(r.edit, enc)
            end
          end
        end
        vim.lsp.buf.format({ async = false })
      end
    })
  end,
})

-- Do not auto select first element from auto complete list
vim.cmd.set('completeopt+=noselect')
