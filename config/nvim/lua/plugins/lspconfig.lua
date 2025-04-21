local lsps = {
  lua_ls = {},
  vimls = {},
  bashls = {},
  cmake = {},
  jsonls = {},
  yamlls = {},

  cssls = {},
  html = {},

  dockerls = {},
  docker_compose_language_service = {},

  sqls = {},

  gopls = {},
  templ = {},

  ts_ls = {},

  pyright = {},

  ruby_lsp = {},

  rust_analyzer = {},
}

local ensure_installed = {}
local n = 0
for k, v in pairs(lsps) do
  n = n + 1
  ensure_installed[n] = k
end

local M = {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = ensure_installed,
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      for k, v in pairs(lsps) do
        vim.lsp.enable(k)
      end
    end
  }

}

return M
