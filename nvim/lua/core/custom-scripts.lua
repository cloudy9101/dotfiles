local M = {}

M.find_dotfiles = function ()
  local status, builtin = pcall(require, "telescope.builtin")
  if not status then
    return
  end

  builtin.find_files({
    cwd = "$HOME/dotfiles",
  })
end

return M
