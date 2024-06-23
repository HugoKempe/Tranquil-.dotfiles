return {
    -- ╭─────────────╮
    -- │ Themes      │
    -- ╰─────────────╯
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("[[colorscheme catppuccino]]")
            require("user.config.theme.catppuccino")
        end,
    }
}