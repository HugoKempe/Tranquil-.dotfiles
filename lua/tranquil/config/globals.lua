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
local globals = {
  mapleader                   = ' ',        --- Map leader key to SPC
  maplocalleader              = ';',        --- Map local leader key to comma
}

for k, v in pairs(globals) do
  vim.g[k] = v
end