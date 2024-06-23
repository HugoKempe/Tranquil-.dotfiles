local M = {}

M.colorscheme_conf = {
    catppuccin = function()
        -- available option: latte, frappe, macchiato, mocha
        vim.g.catppuccin_flavour = "frappe"
        require("catppuccin").setup()

        vim.cmd([[colorscheme catppuccin]])
    end,
    oxocarbon = function()
        vim.cmd([[colorscheme oxocarbon]])
    end,
}

M.set_colorscheme = function()
    local colorscheme = M.colorscheme_conf.oxocarbon

    colorscheme()
end

M.set_colorscheme()

return M