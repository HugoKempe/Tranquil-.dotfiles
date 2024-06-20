local Menu = require("nui.menu")
local event = require("nui.utils.autocmd").event

local plugin = "My Awesome Plugin"

local function handleError()
vim.notify("This is an error message.\nSomething went wrong!", "error", {
  title = plugin,
  on_open = function()
    vim.notify("Attempting recovery.", vim.log.levels.WARN, {
      title = plugin,
    })
    local timer = vim.loop.new_timer()
    timer:start(2000, 0, function()
      vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
        title = plugin,
        timeout = 3000,
        on_close = function()
          vim.notify("Problem solved", nil, { title = plugin })
          vim.notify("Error code 0x0395AF", 1, { title = plugin })
        end,
      })
    end)
  end,
})
end

local menu = Menu({
  position = "50%",
  size = {
    width = 80,
    height = 40,
  },
  border = {
    padding = {
      top = 2,
      bottom = 2,
      left = 3,
      right = 3,
    },
    style = "rounded",
    text = {
      top = "[Choose-an-Element]",
      top_align = "center",
    },
  },
  win_options = {
    winhighlight = "Normal:Normal,FloatBorder:Normal",
  },
}, {
  lines = {
    Menu.item("Hydrogen (H)"),
    Menu.item("Carbon (C)"),
    Menu.item("Nitrogen (N)"),
    Menu.separator("Noble-Gases", {
      char = "-",
      text_align = "right",
    }),
    Menu.item("Helium (He)"),
    Menu.item("Neon (Ne)"),
    Menu.item("Argon (Ar)"),
  },
  max_width = 120,
  keymap = {
    focus_next = { "j", "<Down>", "<Tab>" },
    focus_prev = { "k", "<Up>", "<S-Tab>" },
    close = { "<Esc>", "<C-c>" },
    submit = { "<CR>", "<Space>" },
  },
  on_close = function()
      vim.notify("Menu Closed!", "error")
  end,
  on_submit = function(item)
      vim.notify(string.format("Menu Submitted: %s", item.text), "info")
    --print("Menu Submitted: ", item.text)
  end,
})

-- mount the component
menu:mount()

-- unmount component when cursor leaves buffer
menu:on(event.BufLeave, function()
  menu:unmount()
end)
