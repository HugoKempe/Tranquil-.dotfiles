local plugin = { 'nvim-telescope/telescope.nvim' }
local is_unix = vim.fn.has('unix') == 1 or vim.fn.has('mac') == 1

plugin.branch = '0.1.x'

plugin.dependencies = {
  { 'nvim-lua/plenary.nvim' },
  { 'debugloop/telescope-undo.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    enabled = is_unix
  },
}

plugin.cmd = { 'Telescope' }

local function ext_file_browser()
  local fb_actions = require "telescope".extensions.file_browser.actions

  local fb = {
    --theme = "ivy",
    -- disables netrw and use telescope-file-browser in its place
    hijack_netrw = true,
  }

  fb.mappings = {
    ["i"] = {
      ["<C-h>"] = fb_actions.goto_home_dir,
      ["<C-x>"] = function(prompt_buffer)
        local msg = ("prompt_buffer = " .. prompt_buffer)
        vim.notify(msg, "error")
      end,
      -- your custom insert mode mappings
    },
    ["n"] = {
      -- unmap toggling `fb_actions.toggle_browser`
      f = false
      -- your custom normal mode mappings
    },
  }

  return fb
end


function plugin.config()
  require("telescope").setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_dropdown {
          -- even more opts
        }

        -- pseudo code / specification for writing custom displays, like the one
        -- for "codeactions"
        -- specific_opts = {
        --   [kind] = {
        --     make_indexed = function(items) -> indexed_items, width,
        --     make_displayer = function(widths) -> displayer
        --     make_display = function(displayer) -> function(e)
        --     make_ordinal = function(e) -> string
        --   },
        --   -- for example to disable the custom builtin "codeactions" display
        --      do the following
        --   codeactions = false,
        -- }
      },
      undo = {
        -- telescope-undo.nvim config, see below
      },
      -- other extensions:
      file_browser = ext_file_browser(),
    },

    defaults = {
      mappings = {
        i = {
          ["<C-u>"] = false,
          ["<C-d>"] = false,
        },
      },
    },
  })

  if is_unix then
    require('telescope').load_extension('fzf')
  end

  require("telescope").load_extension("file_browser")
  require("telescope").load_extension("undo")
  require("telescope").load_extension("notify")
  require("telescope").load_extension("ui-select")

  local map = require('helpers.keys').map
  --  Telescope (see :help telescope.builtin)
  map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', "Files")
  map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', "Live grep")
  map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', "Buffers")
  map('n', '<leader>fh', '<cmd>Telescope help_tags<cr>', "Help")
  map('n', '<leader>of', '<cmd>Telescope oldfiles<cr>', "Help")

  --map('n', '<leader>ff', builtin.find_files, "Files")
  --map('n', '<leader>fg', builtin.live_grep, "Live grep")
  --map('n', '<leader>fb', builtin.buffers, "Buffers")
  --map('n', '<leader>fh', builtin.help_tags, "Help")

  map('n', '<C-p>', "<cmd>Telescope keymaps<CR>", "Search keymaps")

  map('n', '<leader>fu', "<cmd>Telescope undo<cr>", "Undo tree")
  map('n', '<leader>fn', "<cmd>Telescope notify<cr>", "Notification History")

  -- TeleScope Filebrowser
  map('n', '<leader>fb', "<cmd>Telescope file_browser<CR>", "File Browser")
end

return plugin
