return {
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        transparent = true
      }
    }
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require 'nordic'.setup {
        transparent_bg = true,
      }
      require 'nordic'.load()
    end
  }
}
