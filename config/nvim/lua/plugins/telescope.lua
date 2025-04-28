local M = {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
    },
    'nvim-telescope/telescope-ui-select.nvim',
  },
  config = function()
    require('telescope').setup({
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ['ui-select'] = {
          require('telescope.themes').get_dropdown({}),
        },
      }
    })

    require('telescope').load_extension('fzf')
    require('telescope').load_extension('ui-select')

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', '<C-p>', builtin.git_files, {})
    vim.keymap.set('n', '<leader><leader>', builtin.find_files, {})

    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    vim.keymap.set('n', '<leader>fw', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
    end)

    vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

    vim.keymap.set('n', '<C-2>', builtin.lsp_document_symbols, {})
  end,
}

return M
