local keymap = vim.keymap -- for conciseness
local cc_status, cc = pcall(require, 'commander')

local keymap_set = function(mappings, cc_category)
  local cc_cmds = {}
  for _, mapping in ipairs(mappings) do
    if not mapping.unavailable then
      keymap.set(mapping.mode, mapping.keys, mapping.cmd, mapping.options)
    end
    -- Add to command center
    if cc_status and mapping.add_to_cc then
      table.insert(cc_cmds, {
        desc = mapping.desc,
        cmd = mapping.cmd,
        keys = { mapping.mode, mapping.keys, mapping.options },
        category = cc_category,
      })
    end
  end
  cc.add(cc_cmds, {})
end

local mappings = {
  { desc = 'Clear search highlights', cmd = ":nohl<CR>", keys = "<leader>nh", mode = "n", options = {}, },
  -- delete single character without copying into register
  { desc = '', cmd = '"_x', keys = "x", mode = "n", options = {}, },
  { desc = 'Leave insert mode', cmd = '<ESC>', keys = "jj", mode = "i", options = { noremap = true }, },
  { desc = 'Open new tab', cmd = ":tabnew %<CR>", keys = "<leader>t", mode = "n", options = {}, add_to_cc = true, },
  { desc = 'Close current tab', cmd = ":tabclose<CR>", keys = "<leader>tx", mode = "n", options = {}, },
  { desc = 'Goto next tab', cmd = ":tabn<CR>", keys = "<tab><tab>", mode = "n", options = {}, },
  { desc = 'Goto prev tab', cmd = ":tabp<CR>", keys = "<s-tab><s-tab>", mode = "n", options = {}, },
  { desc = 'Toggle window maximize', cmd = "<Cmd>lua require('maximize').toggle()<CR>", keys = '<Leader>m', mode = 'n', options = {}, add_to_cc = true, },
  -- { desc = 'Toggle files tree', cmd = ":NvimTreeFindFileToggle<CR>", keys = "<leader>e", mode = "n", options = {}, },
  { desc = 'Toggle folding', cmd = "za", keys = "fo", mode = "n", options = {}, add_to_cc = true, },
  { desc = 'Enter Terminal Mode', cmd = ":split term://zsh | :startinsert<CR>", keys = "<leader>st", mode = "n", options = {}, },
  { desc = 'Exit Terminal Mode', cmd = '<C-\\><C-n>', keys = "<ESC>", mode = "t", options = {}, },
}
keymap_set(mappings, 'Common')

-- telescope
local ts_status, builtin = pcall(require, 'telescope.builtin')
local scripts_status, scripts = pcall(require, 'core.custom-scripts')
local tabs_status, tabs = pcall(require, 'telescope-tabs')

if not ts_status then
  return
end

local telescope_mappings = {
  { desc = 'Find files', cmd = builtin.find_files, keys = '<leader><space>', mode = 'n', options = {}, add_to_cc = true, },
  { desc = 'Grep files', cmd = builtin.live_grep, keys = '<leader>fg', mode = 'n', options = {}, add_to_cc = true, },
  { desc = 'Buffers', cmd = builtin.buffers, keys = '<leader>fb', mode = 'n', options = {}, add_to_cc = true, },
  { desc = 'Help tags', cmd = builtin.help_tags, keys = '<leader>fh', mode = 'n', options = {}, },
  { desc = 'Grep files by string on cursor', cmd = builtin.grep_string, keys = '<leader>fs', mode = 'n', options = {}, add_to_cc = true, },
  { desc = 'Telescope buildins', cmd = builtin.builtin, keys = '<leader>fi', mode = 'n', options = {}, },
  { desc = 'Git branches', cmd = builtin.git_branches, keys = '<leader>gb', mode = 'n', options = {}, },
  { desc = 'Git status', cmd = builtin.git_status, keys = '<leader>gs', mode = 'n', options = {}, },
  { desc = 'Git commits', cmd = builtin.git_commits, keys = '<leader>gc', mode = 'n', options = {}, add_to_cc = true, },
  { desc = 'Tabs', cmd = tabs.list_tabs, keys = '<leader>ft', mode = 'n', options = {}, unavailable = not tabs_status },
  { desc = 'Dot files', cmd = scripts.find_dotfiles, keys = '<leader>f.', mode = 'n', options = {}, unavailable = not scripts_status },
  { desc = 'Projects', cmd = scripts.find_projects, keys = '<leader>fp', mode = 'n', options = {}, unavailable = not scripts_status },
  { desc = 'Command Center', cmd = ':Telescope commander<CR>', keys = '<leader>i', mode = 'n', options = {} },
  { desc = 'Files tree', cmd = ':Telescope file_browser select_buffer=true<CR>', keys = '<leader>e', mode = 'n', options = {}, },
  { desc = 'Current buffer fuzzy find', cmd = ':Telescope current_buffer_fuzzy_find<CR>', keys = '<leader>bf', mode = 'n', options = {}, add_to_cc = true },
}

keymap_set(telescope_mappings, 'Telescope')

local lsp_mappings = {
  { desc = 'Diagnostics', cmd = ':Telescope diagnostics theme=ivy<CR>', keys = '<leader>ld', mode = 'n', options = {}, add_to_cc = true },
}

keymap_set(lsp_mappings, 'LSP')
