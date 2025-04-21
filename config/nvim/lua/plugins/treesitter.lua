local M = {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "cmake",
        "json",
        "yaml",

        "git_config",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "ssh_config",

        "html",
        "css",

        "dockerfile",

        "graphql",
        "mermaid",
        "comment",
        "diff",

        "sql",

        "go",
        "gomod",
        "gosum",
        "gotmpl",
        "gowork",

        "javascript",
        "typescript",
        "tsx",

        "python",
        "requirements",
        "jinja",

        "ruby",

        "rust",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}

return M
