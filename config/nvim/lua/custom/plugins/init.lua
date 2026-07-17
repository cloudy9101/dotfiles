-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

-- Iterate over all Lua files in the plugins directory and load them
local plugins_dir = vim.fs.joinpath(vim.fn.stdpath 'config', 'lua', 'custom', 'plugins')
for file_name, type in vim.fs.dir(plugins_dir, { follow = true }) do
  if (type == 'file' or type == 'link') and file_name:match '%.lua$' and file_name ~= 'init.lua' then
    local module = file_name:gsub('%.lua$', '')
    require('custom.plugins.' .. module)
  end
end

-- Oil file explorer
local oil_detail = false
vim.pack.add { "https://github.com/stevearc/oil.nvim" }
require("oil").setup({
  columns = {
    "icon",
  },
  keymaps = {
    ["gd"] = {
      desc = "Toggle file detail view",
      callback = function()
        oil_detail = not oil_detail
        if oil_detail then
          require("oil").set_columns({"permissions", "size", "mtime", "icon" })
        else
          require("oil").set_columns({ "icon" })
        end
      end,
    },
  },
})
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
