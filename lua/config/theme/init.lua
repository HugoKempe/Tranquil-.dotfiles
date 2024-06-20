local utils = require("core.utils")

local M = {}

M.enabled = {
  "catppuccino",
  "gruvbox",
  "rose-pine",
  "everforest",
  "melange"
}

--- Use a random colorscheme from the pre-defined list of colorschemes.
M.rand_colorscheme = function()
  local colorscheme = utils.rand_element(vim.tbl_keys(M.enabled))

  local msg = "Colorscheme: " .. colorscheme
  vim.notify(msg, vim.log.levels.DEBUG, { title = "nvim-config" })
  -- Load the colorscheme and its settings
  --M.colorscheme_conf[colorscheme]()
end

-- Load a random colorscheme
--M.rand_colorscheme()

return M

