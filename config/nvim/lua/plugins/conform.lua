local M = {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				lua = { "stylua" },
				zsh = { "shellcheck" },
				yaml = { "yamlfmt" },

				css = { "stylelint" },

				go = { "goimports", "gofmt" },
				templ = { "templ" },

				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },

				ruby = { "rubocop" },
				eruby = { "erb_format" },

				rust = { "rustfmt", lsp_format = "fallback" },

				["*"] = { "codespell", "trim_whitespace", "trim_newlines" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_on_save = {
				-- I recommend these options. See :help conform.format for details.
				lsp_format = "fallback",
				timeout_ms = 500,
			},
		})

		vim.keymap.set("n", "<leader>fm", require("conform").format, {})
	end,
}

return M
