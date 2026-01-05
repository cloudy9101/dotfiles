-- Neovim pre-installed treesitter parsers
-- C
-- Lua
-- Markdown
-- Vimscript
-- Vimdoc
-- Treesitter query files |ft-query-plugin|

require('nvim-treesitter').install({
	-- Ruby
	'ruby',
	'embedded_template',

	-- Golang
	'go',
	'gomod',
	'gosum',
	'gowork',
	'gotmpl',
	'templ',

	-- Rust
	'rust',

	-- Zig
	'zig',

	-- Javascript/Typescript
	'javascript',
	'typescript',
	'jsx',

	-- HTML/CSS
	'html',
	'css',

	-- Git
	'git_config',
	'git_rebase',
	'gitattributes',
	'gitcommit',
	'gitignore',

	-- MISC
	'bash',
	'comment',
	'dockerfile',
	'helm',
	'json',
	'make',
	'mermaid',
	'sql',
	'ssh_config',
	'toml',
	'yaml',
	'zsh',
})

vim.api.nvim_create_autocmd('FileType', {
  callback = function(args)
    pcall(vim.treesitter.start)
    vim.bo[args.buf].indentexpr = 'v:lua.require"nvim-treesitter".indentexpr()'
  end,
})
