local M = {}

-- local nsid = vim.api.nvim_create_namespace('test')
-- vim.api.nvim_buf_set_extmark(0, nsid, 118, 0, {
-- 	number_hl_group = 'Added',
-- })

M.git_cache = {}

M.setup = function()
	vim.api.nvim_create_autocmd({ 'BufEnter' }, {
		callback = function(buf)
		end
	})

	local path = vim.api.nvim_buf_get_name(0)
	local cwd, basename = vim.fn.fnamemodify(path, ':h'), vim.fn.fnamemodify(path, ':t')
	vim.print(cwd, basename)

	local stdout = vim.uv.new_pipe()
	local handle, pid = vim.uv.spawn(
		'git',
		{
			args = {
				'show', ':0:./' .. basename
			},
			cwd = cwd,
			stdio = { nil, stdout, nil },
		},
		function(code, signal) -- on exit
			print("exit code", code)
			print("exit signal", signal)
		end
	)

	print("process opened", handle, pid)

	vim.uv.read_start(stdout, function(err, data)
		assert(not err, err)
		if data then
			print("stdout chunk", stdout, data)
		else
			print("stdout end", stdout)
		end
	end)
end

return M
