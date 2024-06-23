local M = {}

require("tranquil.core.globals")
require("tranquil.core.options")

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
    

    -- Handle plugins with lazy.nvim
    local lazy = require("tranquil.core.plugin_manager")
    lazy.install()
    lazy.load()
end

return M