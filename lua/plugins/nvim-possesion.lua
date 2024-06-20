local plugin = { "gennaro-tedesco/nvim-possession" }

plugin.enabled = false

plugin.config = true

function plugin.init()
  local possession = require("nvim-possession")
  local map = require("helpers.keys").map

  map("n", "<leader>sl", function() possession.list() end, "List all the existing sessions with fzf-lua; preview shows files in session")
  map("n", "<leader>sn", function() possession.new() end, "Prompt for name to create new session")
  map("n", "<leader>su", function() possession.update() end, "Update current session (if new buffers are open)")
  map("n", "<leader>sd", function() possession.delete() end, "Delete current session (without prompt)")
end

return plugin
