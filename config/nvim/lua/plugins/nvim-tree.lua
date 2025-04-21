local M = {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}

    local api = require("nvim-tree.api")

    vim.keymap.set("n", "<leader>dd", api.tree.toggle)
    vim.keymap.set("n", "<leader>dc", api.tree.find_file)
  end,
}

return M
