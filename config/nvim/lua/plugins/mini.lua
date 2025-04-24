local M = {
  'echasnovski/mini.nvim',
  version = false,
  config = function()
    -- comment by `gc` `gcc`
    require('mini.comment').setup({})

    require('mini.pairs').setup({})
    require('mini.surround').setup({})

    require('mini.cursorword').setup({})
    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
      highlighters = {
        -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
        fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
        hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

        -- Highlight hex color strings (`#rrggbb`) using that color
        hex_color = hipatterns.gen_highlighter.hex_color(),
      }
    })

    require('mini.indentscope').setup({})

    require('mini.diff').setup({})
    require('mini.git').setup({})
    require('mini.statusline').setup({})

    require('mini.trailspace').setup({})
  end
}
return M
