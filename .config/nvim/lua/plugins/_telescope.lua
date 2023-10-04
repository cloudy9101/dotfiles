local M = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-symbols.nvim',
    'LukasPietzschmann/telescope-tabs',
    'nvim-telescope/telescope-file-browser.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
  },
  config = function()
    local themes = require('telescope.themes')
    local actions = require('telescope.actions')
    local action_layout = require('telescope.actions.layout')

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('file_browser')
    require('telescope').setup {
      defaults = {
        mappings = {
          n = {
            ['<C-q>'] = actions.smart_send_to_qflist,
            ['<C-v>'] = action_layout.toggle_preview
          },
          i = {
            ['<C-q>'] = actions.smart_send_to_qflist,
            ['<C-v>'] = action_layout.toggle_preview,
            ["<C-c>"] = actions.cycle_previewers_next,
          },
        },
      },
      pickers = {
        find_files = {
          theme = 'ivy',
        }
      },
      extensions = {
        command_center = {
          prompt_title = '🚃',
          theme = themes.get_ivy,
        }
      }
    }
    require('telescope-tabs').setup({
      close_tab_shortcut_i = 'C-dt',
      close_tab_shortcut_n = 'dt',
    })
  end
}

return M
