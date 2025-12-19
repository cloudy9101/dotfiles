-- add pyright to lspconfig
return {
  "neovim/nvim-lspconfig",
  ---@class PluginLspOpts
  opts = {
    ---@type lspconfig.options
    servers = {
      -- Golang
      gopls = {},
      templ = {},

      -- Ruby
      ruby_lsp = {},
      rubocop = {},

      -- Rust
      rust_analyzer = {},

      -- JS/TS
      ts_ls = {},

      -- Tailwindcss
      tailwindcss = {},

      -- vscode-langservers-extracted
      eslint = {},
      html = {},
      cssls = {},
      jsonls = {},

      -- misc
      yamlls = {},
    },
  },
}
