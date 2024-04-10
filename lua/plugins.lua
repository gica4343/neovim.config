return {
   {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
        require 'nordic' .load()
    end
   },
   {
      'nvim-telescope/telescope.nvim', tag = '0.1.6',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function ()
         local config = require("nvim-treesitter.configs")
         config.setup({
            auto_install = true,
            highlight = { enable = true },
            indent = {enable = true},
         })
      end
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
         "MunifTanjim/nui.nvim",
         -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      },
   },
   {
      'xiyaowong/transparent.nvim',
      lazy = false,
      config = function()
         require("transparent").setup({ -- Optional, you don't have to run setup.
  groups = { -- table: default groups
    'Normal', 'NormalNC', 'Comment', 'Constant', 'Special', 'Identifier',
    'Statement', 'PreProc', 'Type', 'Underlined', 'Todo', 'String', 'Function',
    'Conditional', 'Repeat', 'Operator', 'Structure', 'LineNr', 'NonText',
    'SignColumn', 'CursorLine', 'CursorLineNr', 'StatusLine', 'StatusLineNC',
    'EndOfBuffer',
  },
  extra_groups = {
   'NeoTreeNormal',
   'NeoTreeNormalNC'
            }, -- table: additional groups that should be cleared
  exclude_groups = {}, -- table: groups you don't want to clear
})
      end
   }
}
