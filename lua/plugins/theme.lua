return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true,
      },
    },
  },
  {
    "AlexvZyl/nordic.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.setup {
      }
      require("nordic").load()
    end,
  },
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      vim.cmd.colorscheme("lackluster")
      -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
  },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "warmer",
        transparent = true
      })
    end,
  },
  {
    "rose-pine/neovim",
    config = function()
      require("rose-pine").setup({
        variant = "main",
        dark_variant = "main",

        styles = {
          bold = true,
          italic = false,
          transparency = true,
        },
      })
    end
  },
  {
    'tanvirtin/monokai.nvim',
    config = function()
      require("monokai").setup {}
    end,
  },
  {
    'blazkowolf/gruber-darker.nvim',
    opts = {
      bold = false,
      italic = {
        strings = false,
      },
    }
  },
  {
    'olivercederborg/poimandres.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require('poimandres').setup {
        disable_background = true,
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end,
  }
}
