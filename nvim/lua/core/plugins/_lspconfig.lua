local get_keys = function(servers)
  local insert = table.insert
  local keys = {}
  for k, _ in pairs(servers) do
    insert(keys, k)
  end
  return keys
end

local servers = {
  bashls = {},
  cssls = {},
  dockerls = {},
  eslint = {},
  gopls = {},
  html = {},
  jsonls = {},
  lua_ls = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file("", true),
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  solargraph = {},
  sqlls = {},
  tailwindcss = {},
  tsserver = {
    preferences = {
      quotePreference = "double",
      jsxAttributeCompletionStyle = "braces",
    },
  },
  vimls = {},
  yamlls = {},
}

local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end
  local buf = vim.lsp.buf
  local _, telescope = pcall(require, 'telescope.builtin')

  nmap('<leader>rn', buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', buf.code_action, '[C]ode [A]ction')

  nmap('gd', buf.definition, '[G]oto [D]efinition')
  nmap('gr', telescope.lsp_references, '[G]oto [R]eferences')
  nmap('gI', buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', telescope.lsp_document_symbols, '[D]ocument [S]ymbols')
  nmap('<leader>ws', telescope.lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', buf.hover, 'Hover Documentation')
  nmap('<leader>sd', buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
local status, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if status then
  capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
end

local M = {
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    {
      'j-hui/fidget.nvim',
      config = true,
    },

    -- Additional lua configuration, makes nvim stuff amazing
    {
      'folke/neodev.nvim',
      config = true,
    },
  },
  config = function()
    require('mason').setup()
    local lspconfig = require('mason-lspconfig')
    lspconfig.setup({
      ensure_installed = get_keys(servers),
    })
    lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          on_attach = on_attach,
          settings = servers[server_name],
          capabilities = capabilities,
        }
      end,
    }
  end
}

return M
