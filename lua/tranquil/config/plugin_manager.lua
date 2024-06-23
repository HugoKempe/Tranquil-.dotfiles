local utils = require("tranquil.utils")

-- Path to lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Install lazy.nvim if not already installed
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim....")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
  print("Done.")
end
-- Add lazy.nvim to runtimepath
vim.opt.rtp:prepend(lazypath)

local lazy_opts = {
    defaults = { lazy = true },
    install = { colorscheme = Tranquil.colorscheme },
    ui = {
        border = Tranquil.ui.float.border,
        --icons = require("tranquil.ui.icons").lazy,
        title = "Plugin Manager",
        title_pos = "center",
    },
}

-- Load plugins from specifications
-- (The leader key must be set before this)
require("lazy").setup("user.plugins", lazy_opts)