local lsps = {
	lua_ls = {},
	vimls = {},
	bashls = {},
	jsonls = {},
	yamlls = {},

	cssls = {},
	html = {},

	dockerls = {},
	docker_compose_language_service = {},

	sqls = {},

	gopls = {
    filetypes = { "go", "templ" },
  },

	ts_ls = {},

	pyright = {},

	ruby_lsp = {},

	rust_analyzer = {},

  zls = {},

  templ = {},
}

local M = {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup({
				ensure_installed = {},
				automatic_installation = true,
			})

			for k, v in pairs(lsps) do
        if (k == "html") then
          local capabilities = vim.lsp.protocol.make_client_capabilities()
          capabilities.textDocument.completion.completionItem.snippetSupport = true
          v["capabilities"] = capabilities
				  vim.lsp.config(k, v)
        else
				  vim.lsp.config(k, v)
        end

				vim.lsp.enable(k)
			end

			vim.diagnostic.config({
				-- update_in_insert = true,
				float = {
					focusable = false,
					style = "minimal",
					border = "rounded",
					source = "if_many",
					header = "",
					prefix = "",
				},
			})

			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)
		end,
	},
}

return M
