--- This module will load a random colorscheme on nvim startup process.

local utils = require("utils")
--local colorscheme = require("helpers.colorscheme")

local M = {}
-- Uncomment the colorscheme to use
-- local colorscheme = get_if_available('catppuccin')
-- local colorscheme = get_if_available('gruvbox')
-- local colorscheme = get_if_available('rose-pine')
-- local colorscheme = get_if_available('everforest')
-- local colorscheme = get_if_available('melange')


-- Colorscheme to its directory name mapping, because colorscheme repo name is not necessarily
-- the same as the colorscheme name itself.



--- Use a random colorscheme from the pre-defined list of colorschemes.
M.rand_colorscheme = function()
    local colorscheme = utils.rand_element(vim.tbl_keys(M.colorscheme_conf))

    if not vim.tbl_contains(vim.tbl_keys(M.colorscheme_conf), colorscheme) then
      
    end

    -- Load the colorscheme and its settings
    M.colorscheme_conf[colorscheme]()

    
  end

-- Load a random colorscheme
M.rand_colorscheme()