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
			--require 'nordic'.setup {
			--transparent_bg = true,
			-- }
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
			})
		end,
	},
}
