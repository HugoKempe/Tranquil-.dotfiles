return {
  -- lsp
  { "williamboman/mason.nvim" },
  -- auto-completion engine
  {
    "hrsh7th/nvim-cmp",
    event = 'InsertEnter',
    -- event = "VeryLazy",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-omni",
      "hrsh7th/cmp-emoji",
      "saadparwaiz1/cmp_luasnip",
      
      -- Snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      require("user.config.nvim-cmp")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "williamboman/mason-lspconfig.nvim"
    },
    config = function()
      require("user.config.lsp")
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    enabled = function()
      if vim.g.is_mac then
        return true
      end
      return false
    end,
    event = "VeryLazy",
    build = ":TSUpdate",
    config = function()
      require("user.config.treesitter")
    end,
  },
    -- ╭─────────────╮
    -- │ Themes      │
    -- ╰─────────────╯
    { "catppuccin/nvim", name = "catppuccin", lazy = true },
    { "nyoom-engineering/oxocarbon.nvim", lazy = true },

    { "tpope/vim-surround" },

    { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },


    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      dependencies = {
        "nvim-telescope/telescope-symbols.nvim",
      },
    },
    

    -- showing keybindings
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      config = function()
        require("user.config.which-key")
      end,
    },
    -- file explorer
    {
      "nvim-tree/nvim-tree.lua",
      keys = { "<space>s" },
      dependencies = { "nvim-tree/nvim-web-devicons" },
      config = function()
        require("user.config.nvim-tree")
      end,
    },
}
