local plugin = { 'rcarriga/nvim-notify' }

function plugin.config()
    vim.notify = require("notify")
end

return plugin

