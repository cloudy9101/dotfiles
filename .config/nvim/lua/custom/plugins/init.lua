-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
local M = {}

local pickers = require 'telescope.pickers'
local finders = require 'telescope.finders'
local conf = require('telescope.config').values
local actions = require 'telescope.actions'
local action_state = require 'telescope.actions.state'

local gtbranches = function(opts)
  opts = opts or {}

  local cmd = { 'git', 'branch', '-v' }
  local term_previewer = require 'telescope.previewers.term_previewer'
  pickers
    .new(opts, {
      prompt_title = 'git branch',
      finder = finders.new_oneshot_job(cmd, {
        entry_maker = function(entry)
          local value = string.match(entry, '^[%s%*]+(.-)%s')
          return {
            value = value,
            display = entry,
            ordinal = entry,
          }
        end,
      }),
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          vim.system { 'git', 'checkout', selection.value }
        end)
        return true
      end,
      previewer = term_previewer.new_termopen_previewer {
        get_command = function(entry, status)
          return { 'git', 'log', '--pretty=[%C(yellow)%h%C(reset)] %C(auto)%s%d %C(green)(%cr)%Creset %C(magenta)<%an>%Creset', entry.value }
        end,
      },
    })
    :find()
end

vim.keymap.set('n', '<leader>gb', gtbranches, { desc = '[ ] Git branch' })

local gitCommits = function(opts)
  opts = opts or {}

  local cmd = { 'git', 'log', '--pretty=[%C(yellow)%h%C(reset)] %C(auto)%s%d %C(green)(%cr)%Creset %C(magenta)<%an>%Creset' }
  local previewers = require 'telescope.previewers'
  local finder = finders.new_oneshot_job(cmd, {
    entry_maker = function(entry)
      local value = string.match(entry, '^%[(%w+)%]')
      return {
        value = value,
        display = entry,
        ordinal = entry,
      }
    end,
  })
  table.insert(finder.results, {
    value = 'unstaged_changes',
    display = '[0000000]' .. ' Unstaged changes',
    ordinal = '[0000000]' .. ' Unstaged changes',
  })
  table.insert(finder.results, {
    value = 'staged_changes',
    display = '[0000000]' .. ' Staged changes',
    ordinal = '[0000000]' .. ' Staged changes',
  })
  pickers
    .new(opts, {
      prompt_title = 'git log',
      finder = finder,
      sorter = conf.generic_sorter(opts),
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          print(vim.inspect(selection))
          vim.system { 'pbcopy', selection.value }
        end)
        return true
      end,
      previewer = previewers.new_termopen_previewer {
        get_command = function(entry, status)
          if entry.value == 'staged_changes' then
            return { 'git', 'diff', '--cached', '--patch-with-stat' }
          end
          if entry.value == 'unstaged_changes' then
            return { 'git', 'diff', 'head', '--patch-with-stat' }
          end
          return { 'git', 'show', entry.value, '--pretty=fuller' }
        end,
      },
    })
    :find()
end

vim.keymap.set('n', '<leader>gl', gitCommits, { desc = '[ ] Git log' })

return M
