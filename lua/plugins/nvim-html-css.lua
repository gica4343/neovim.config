return {
  "Jezda1337/nvim-html-css",
  require("lazy").setup({
    {
      "hrsh7th/nvim-cmp",
      opts = {
        sources = {
          -- other sources
          {
            name = "html-css",
            option = {
              max_count = {}, -- not ready yet
              enable_on = {
                "html",
                "css"
              },
              file_extensions = { "css", "sass", "less" },
              style_sheets = {

                "https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css",
                "https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css",
              }
            },
          },
        },
      },
    },
    {
      "Jezda1337/nvim-html-css",
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-lua/plenary.nvim"
      },
      config = function()
        require("html-css"):setup()
      end
    }
  })
}
