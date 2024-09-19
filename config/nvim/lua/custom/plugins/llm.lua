local M = {
  'huggingface/llm.nvim',
  version = '*',
  enabled = false,
  config = function()
    local llm = require 'llm'
    llm.setup {
      backend = 'ollama',
      model = 'llama3.1',
      url = 'http://localhost:11434',
      request_body = {
        -- Modelfile options for the model you use
        options = {
          temperature = 0.2,
          top_p = 0.95,
        },
      },
    }
  end,
}

return M
