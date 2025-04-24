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

	goimports = {},
}

local ensure_installed = {}
local n = 0
for k, v in pairs(lsps) do
	n = n + 1
	ensure_installed[n] = k
end

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
				ensure_installed = ensure_installed,
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
		end,
	},
}

return M
