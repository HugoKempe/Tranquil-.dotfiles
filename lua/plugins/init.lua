local plugins = {
  { 'nvim-tree/nvim-web-devicons', lazy = true },

  { 
      'sudormrfbin/cheatsheet.nvim',
      dependencies = {
          { 'nvim-telescope/telescope.nvim' },
          { 'nvim-lua/popup.nvim' },
          { 'nvim-lua/plenary.nvim' },
      },
  },

  --colorschemes
  { 'folke/tokyonight.nvim' },
  { 'typicode/bg.nvim' },
  { 'ellisonleao/gruvbox.nvim' },
  { 'catppuccin/nvim', name = 'catppuccin' },
  { 'rose-pine/nvim', name = 'rose-pine' },
  { 'sainnhe/everforest' },
  { 'savq/melange-nvim' },
  { 'Everblush/nvim', name = 'everblush' },
  { 'dgox16/oldworld.nvim' },
  { 'Yazeed1s/minimal.nvim' },
  { 'Mofiqul/vscode.nvim' },
  { 'cpea2506/one_monokai.nvim' },
  { 'nyoom-engineering/nyoom.nvim' },
  { 'uncleTen276/dark_flat.nvim' },
  { 'nyoom-engineering/oxocarbon.nvim' },
}


return plugins
