local lsps = {
	lua_ls = {},
	vimls = {},
	bashls = {},
	jsonls = {},
	yamlls = {},

	cssls = {},
	html = {
    filetype = { "html", "tmpl" },
  },

	dockerls = {},
	docker_compose_language_service = {},

	sqls = {},

	gopls = {
    filetype = { "go", "tmpl" },
  },

	ts_ls = {},

	pyright = {},

	ruby_lsp = {},

	rust_analyzer = {},

  zls = {}
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
				vim.lsp.enable(k)
				vim.lsp.config(k, v)
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
