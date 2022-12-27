return function(use)
  use({
    "folke/which-key.nvim",
      config = function()
        require("which-key").setup({})
      end
  })

  use 'christoomey/vim-tmux-navigator'
end
