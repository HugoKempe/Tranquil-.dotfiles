local keymap = vim.keymap
local nvim_tree = require("nvim-tree")

nvim_tree.setup {
    view = {
        width = 30,
    },
}

keymap.set("n", "<space>s", require("nvim-tree.api").tree.toggle, {
    silent = true,
    desc = "toggle nvim-tree",
  })