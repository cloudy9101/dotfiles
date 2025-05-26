local M = {
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			zsh = { "zsh" },

			css = { "stylelint" },

			go = { "golangcilint" },

			javascript = { "eslint" },
			typescript = { "eslint" },
			javascriptreact = { "eslint" },
			typescriptreact = { "eslint" },

			-- ruby = { "rubocop" },

			eruby = { "erb_lint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave", "TextChanged" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}

return M
