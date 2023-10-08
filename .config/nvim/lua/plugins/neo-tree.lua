local M = {
  {
    "nvim-neo-tree/neo-tree.nvim",
    event_handlers = {
      {
        event = "file_opened",
        handler = function()
          -- auto close
          -- vimc.cmd("Neotree close")
          -- OR
          print("CLOSED")
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
}

return M
