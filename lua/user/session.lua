local M = {}

M.sessions = {
  -- folder to look for sessions, must be a valid existing path
  sessions_path = vim.fn.stdpath("data") .. "/sessions/",
  -- defines vim.g[sessions_variable] when a session is loaded
  --sessions_variable = ...
  -- string: shows icon both in the prompt and in the statusline
  --sessions_icon = ...           
  --sessions_prompt = ...         -- fzf prompt string
}

-- whether to autoload sessions in the cwd at startup
M.autoload = false

-- whether to autosave loaded sessions before quitting
M.autosave = false

M.autoswitch = {
  -- whether to enable autoswitch
  enable = false,
  -- list of filetypes to exclude from autoswitch
  exclude_ft = {},
}

--[[ 
  callback, function to execute before saving a session
  useful to update or cleanup global variables for example 
--]]
M.save_hook = nil
--[[
  callback, function to execute after loading a session
  useful to restore file trees, file managers or terminals
  function()
      require('FTerm').open()
      require('nvim-tree').toggle(false, true)
  end
--]]
M.post_hook = nil

M.fzf_winopts = {
  -- any valid fzf-lua winopts options, for instance
  width = 0.5,
  preview = {
    vertical = "right:30%"
  }
}

return M
