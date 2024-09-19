local M = {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  config = function()
    require('avante').setup {
      provider = 'openai',
      openai = {
        endpoint = 'https://api.openai.com',
        model = 'gpt-4o',
        temperature = 0,
        max_tokens = 4096,
      },
    }
  end,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    {
      'grapp-dev/nui-components.nvim',
      dependencies = {
        'MunifTanjim/nui.nvim',
      },
    },
    'nvim-lua/plenary.nvim',
    'MeanderingProgrammer/render-markdown.nvim',
  },
}

return M
