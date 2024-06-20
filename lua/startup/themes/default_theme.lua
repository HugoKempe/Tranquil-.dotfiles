local settings = {
    -- every line should be same width without escaped \
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = require("startup.headers").heisenberg,
        highlight = "Statement",
        default_color = "",
        oldfiles_amount = 0,
    },
    header_2 = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Quote",
        margin = 5,
        content = require("startup.functions").quote(),
        highlight = "Constant",
        default_color = "",
        oldfiles_amount = 0,
    },
    -- name which will be displayed and command
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
            -- { " Load Session", "SessionManager load_session", "<leader>sl" },
            { " Find File", "Telescope find_files", "<leader>ff" },
            { " Recent Files", "Telescope oldfiles", "<leader>of" },
            { " File Browser", "Telescope file_browser", "<leader>fe" },
            { " Colorschemes", "Telescope colorscheme", "<leader>cs" },
            { " New File", "lua require'startup'.new_file()", "<leader>nf" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },
    footer = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 5,
        content = function()
            local version       = vim.version()
            local print_version = string.format(" v%d.%d.%d", version.major, version.minor, version.patch)
            local print_stats   = string.format("󰚥 %s", require('lazy').stats().count)
            local print_date    = string.format(" %s", os.date("%d/%m/%y"))
            local print_time    = string.format(" %s", os.date("%H:%M:%S"))

            return { string.format("%s %s %s %s", print_stats, print_version, print_date, print_time) }
        end,
        highlight = "Number",
        default_color = "",
        oldfiles_amount = 0,
    },
    clock = {
        type = "text",
        content = function()
            local clock = " " .. os.date("%H:%M::%S")
            local date = " " .. os.date("%d/%m/%y")
            return { clock .. ' - ' .. date }
        end,
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "",
        margin = 5,
        highlight = "TSString",
        default_color = "#FFFFFF",
        oldfiles_amount = 10,
    },

    footer_2 = {
        type = "text",
        content = function()
            local stats = require('lazy').stats()
            return { string.format("Total plugins (lazy.nvim): %d (%d loaded)", stats.count, stats.loaded) }
        end,
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "",
        margin = 5,
        highlight = "TSString",
        default_color = "#FFFFFF",
        oldfiles_amount = 10,
    },

    options = {
        after = function()
            require("startup.utils").oldfiles_mappings()
        end,
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 2, 2, 2, 2, 2, 2, 2 },
    },
    colors = {
        background = "#1f2227",
        folded_section = "#56b6c2",
    },
    parts = {
        "header",
        --"header_2",
        "body",
        "footer",
        "clock",
    },
}
return settings
