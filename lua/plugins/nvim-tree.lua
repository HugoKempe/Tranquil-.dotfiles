local plugin = { "nvim-tree/nvim-tree.lua" }

plugin.version = "*"
plugin.lazy = false
plugin.dependencies = {
    "nvim-tree/nvim-web-devicons",
}

function plugin.config()
    require("nvim-tree").setup({
        view = {
            width = 30,
        },
    })
end

return plugin
