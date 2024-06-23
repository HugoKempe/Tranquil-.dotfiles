local M = {}

-- default options for lazy.nvim
M.opts = {
  ui = {
    size = {
      width = 0.75,
      height = 0.75,
    },
    border = "rounded",
    icons = require("tranquil.ui.icons").lazy,
    title = "Plugin Manager",
    title_pos = "center",
  },
  install = {
    missing = true,     -- install missing plugins on startup.
  },
  change_detection = {
    enabled = false,    -- check for config file changes
    notify = false,     -- get a notification when changes are found
  },
}


-- Install lazy.nvim if not already installed
function M.install()
  -- Path to lazy.nvim
  local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

  -- Install lazy.nvim if not already installed
  if not vim.loop.fs_stat(lazy_path) then
    print("Installing lazy.nvim....")
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazy_path,
    })
    print("Done.")
  end

  -- Add lazy.nvim to runtimepath
  vim.opt.rtp:prepend(lazy_path)
end

-- Setup lazy.nvim with plugins
function M.setup(plugins)
  -- Use a protected call so we don"t error out on first use
  local ok, lazy = pcall(require, "lazy")
  if not ok then
    error("lazy.nvim not found.")
    return
  end

  -- Load plugins from specifications
  -- (The leader key must be set before this)
  lazy.setup(plugins, M.opts)
end

-- Import plugins from folder
M.load = function(opts)
  if opts then
    M.opts = vim.tbl_extend("force", M.opts, opts)
  end


  -- import plugins configs from nvim/lua/plugins/ folder
  M.setup("user.plugins")
end

return M
