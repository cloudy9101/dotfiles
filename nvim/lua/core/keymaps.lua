local keymap = vim.keymap -- for conciseness

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>")

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- tab management
keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") --  go to previous tab

-- toggle window maximize
keymap.set('n', '<Leader>m', "<Cmd>lua require('maximize').toggle()<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeFindFileToggle<CR>") -- toggle file explorer

-- telescope
local ts_status, builtin = pcall(require, 'telescope.builtin')
local scripts_status, scripts = pcall(require, 'core.custom-scripts')

if ts_status then
  keymap.set('n', '<leader>ff', builtin.find_files, {})
  keymap.set('n', '<leader>fg', builtin.live_grep, {})
  keymap.set('n', '<leader>fb', builtin.buffers, {})
  keymap.set('n', '<leader>fh', builtin.help_tags, {})
  keymap.set('n', '<leader>fs', builtin.grep_string, {})
  keymap.set('n', '<leader>fi', builtin.builtin, {})
  keymap.set('n', '<leader>fd', builtin.diagnostics, {})
  keymap.set('n', '<leader>gb', builtin.git_branches, {})
  keymap.set('n', '<leader>gs', builtin.git_status, {})

  if scripts_status then
    keymap.set('n', '<leader>f.', scripts.find_dotfiles, {})
    keymap.set('n', '<leader>fp', scripts.find_projects, {})
  end
end

