local M = {}

local function notify_success(colorscheme)
	if vim.g.logging_level == "debug" then
		local msg = "Colorscheme: " .. colorscheme
		vim.notify(msg, vim.log.levels.DEBUG, { title = "nvim-config" })
	  end
end

local function notify_error(colorscheme)
	local msg = "Invalid colorscheme: " .. colorscheme
    vim.notify(msg, vim.log.levels.ERROR, { title = "nvim-config" })
end
-- Fetch and setup colorscheme if available, otherwise just return 'default'
-- This should prevent Neovim from complaining about missing colorschemes on first boot
function M.get_if_available(name, opts)
	local lua_ok, colorscheme = pcall(require, name)
	print("requireing Theme: " .. name)
  if lua_ok then
		colorscheme.config(opts)
		--notify_success(name)
		return name
	end

	local vim_ok, _ = pcall(vim.cmd.colorscheme, name)
	if vim_ok then
		----notify_success(name)
		return name
	end

	--notify_error(name)
	return 'default'
end

return M
