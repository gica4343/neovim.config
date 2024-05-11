return {
  "ellisonleao/glow.nvim",
  config = function()
  require("glow").setup({
    border = "shadow",           -- floating window border config
    pager = false,
    width = 200,
    height = 200,
    width_ratio = 1.0, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
    height_ratio = 1.0,
  })
  end,
}
