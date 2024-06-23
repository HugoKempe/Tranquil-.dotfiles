local fn = vim.fn
local api = vim.api
local utils = require('tranquil.utils')

-- Inspect something
function _G.inspect(item)
  vim.print(item)
end

-- ╭────────────────────────────────────────────────────────────────╮ --
-- │                        custom variables                        │ --
-- ╰────────────────────────────────────────────────────────────────╯ --
vim.g.is_win                    = (utils.has("win32") or utils.has("win64")) and true or false
vim.g.is_linux                  = (utils.has("unix") and (not utils.has("macunix"))) and true or false
vim.g.is_mac                    = utils.has("macunix") and true or false

vim.g.logging_level             = "info"


-- ╭────────────────────────────────────────────────────────────────╮ --
-- │                        builtin variables                       │ --
-- ╰────────────────────────────────────────────────────────────────╯ --

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Custom mapping <leader> (see `:h mapleader` for more info)
vim.g.mapleader = " "
vim.g.maplocalleader = ";"