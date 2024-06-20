local plugin = { 'coffebar/neovim-project' }

plugin.disabled = true
plugin.enabled = false

plugin.dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager" },
}

plugin.lazy = false
plugin.priority = 100

plugin.opts = {
    projects = { -- define project roots
        "C:/Dev/*",
        "C:/Users/HugoK/AppData/local/nvim/*",
    },
}
plugin.init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
end
return plugin

