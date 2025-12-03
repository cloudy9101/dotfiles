local M = {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-mini/mini.icons" },
  config = function()
    require("fzf-lua").setup({
      keymap = {
        builtin = {
          true,
          ["ctrl-d"] = "preview-page-down",
          ["ctrl-u"] = "preview-page-up",
        },
        fzf = {
          true,
          ["ctrl-d"] = "preview-page-down",
          ["ctrl-u"] = "preview-page-up",
        },
      },
    })
  end,
}

return M
