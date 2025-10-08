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
        "templ",

        "javascript",
        "typescript",
        "tsx",

        "python",
        "requirements",
        "jinja",

        "ruby",

        "rust",
      },
      auto_install = true,
      sync_install = false,
      ignore_install = {},
      modules = {},
      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>gnn", -- set to `false` to disable one of the mappings
          node_incremental = "<leader>grn",
          scope_incremental = "<leader>grc",
          node_decremental = "<leader>grm",
        },
      },
    })
  end
}

return M
