local M = {}

M.map = function(mode, lhs, rhs, desc)
	vim.keymap.set(mode, lhs, rhs, { silent = true, desc = desc })
end

M.lsp_map = function(lhs, rhs, bufnr, desc)
	vim.keymap.set("n", lhs, rhs, { silent = true, buffer = bufnr, desc = desc })
end

M.dap_map = function(mode, lhs, rhs, desc)
	M.map(mode, lhs, rhs, desc)
end

M.set_leader = function(leader, loacal_leader)
    local loacal_leader_key = loacal_leader or leader
    vim.api.nvim_err_writeln("loacal_leader: " .. loacal_leader_key)

	vim.g.mapleader = leader
	vim.g.maplocalleader = loacal_leader_key
	-- M.map({ "n", "v" }, key, "<nop>")
end

return M