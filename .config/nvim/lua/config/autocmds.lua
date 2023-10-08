-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("ray_" .. name, { clear = true })
end

-- Close NeoTree when open a buffer
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = augroup("neotree"),
  callback = function()
    require("neo-tree.command").execute({ action = "close" })
  end,
})
