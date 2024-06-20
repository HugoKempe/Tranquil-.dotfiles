local M = {}

require("core.globals")
M.options = require("config.options")

M.opts = {
    keybinds = {
        leader = " "
    }
}

M.setup = function (opts)
    local vim = vim
    if opts then
        M.opts = vim.tbl_extend("force", M.opts, opts)
    end

    M.options.configure()
    -- We have to set the leader key here for lazy.nvim to work
    require('helpers.keys').set_leader(" ")

    -- Handle plugins with lazy.nvim
    local lazy = require("core.lazy")
    lazy.install()
    lazy.load()
end

return M
