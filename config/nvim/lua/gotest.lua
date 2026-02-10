vim.api.nvim_create_user_command('Gotest', function()
  -- Get current file path
  local file = vim.fn.expand('%:p:h')

  -- Create a new buffer for the output
  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, {})
  vim.api.nvim_set_option_value('modifiable', true, { buf = buf, })
  vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buf, })

  -- Calculate window size (80% of editor)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)

  -- Calculate position (centered)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  -- Create floating window
  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded'
  })

  -- Run go test and capture output
  local lastLine = 0
  local appendBuf = function(d)
    vim.api.nvim_buf_set_lines(buf, lastLine, -1, false, d)
    lastLine = lastLine + #d
    vim.api.nvim_win_set_cursor(0, { lastLine, 0 })
  end

  local writeBuf = function(err, data)
    vim.schedule(function()
      if data then
        local d = vim.split(data, '\n')
        appendBuf(d)
      end
      if err then
        local e = vim.split(err, '\n')
        appendBuf(e)
      end
    end)
  end
  local onExit = function(out)
    vim.schedule(function()
      if out.code == 0 then
        appendBuf({ '', 'Test succeed' })
      else
        appendBuf({ '', 'Test failed' })
      end
    end)
  end

  local cmd = 'go test -v ' .. vim.fn.shellescape(file .. '/.')
  appendBuf({ 'Running test: ' .. cmd, '' })
  vim.system({ 'zsh', '-c', cmd }, { stdout = writeBuf, stderr = writeBuf, text = true }, onExit)

  -- Set keymap to close window with 'q'
  vim.api.nvim_buf_set_keymap(buf, 'n', 'q', ':q<CR>', { noremap = true, silent = true })
end, { desc = "Run go test for the current buffer" })
