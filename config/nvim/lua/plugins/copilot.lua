local M = {
  "CopilotC-Nvim/CopilotChat.nvim",
  dependencies = {
    { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
    { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
  },
  -- build = "make tiktoken", -- Only on MacOS or Linux
  opts = {
    model = "gtp-4o-mini",
  },
  -- See Commands section for default commands if you want to lazy load on them
  config = function()
    require('CopilotChat').setup({
      vim.keymap.set('n', '<leader>cc', function()
        require('CopilotChat').toggle()
      end, { desc = 'Toggle Copilot Chat' }),
    })
  end
}

return M
