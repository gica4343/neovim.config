return {
	"m4xshen/autoclose.nvim",
	config = function()
		require("autoclose").setup({
			keys = {
				["("] = { escape = false, close = true, pair = "()" },
				["["] = { escape = false, close = true, pair = "[]" },
				["{"] = { escape = false, close = true, pair = "{}" },

				[">"] = { escape = true, close = false, pair = "<>" },
				[")"] = { escape = true, close = false, pair = "()" },
				["]"] = { escape = true, close = false, pair = "[]" },
				["}"] = { escape = true, close = false, pair = "{}" },

				['"'] = { escape = true, close = true, pair = '""' },
				["'"] = { escape = true, close = true, pair = "''" },
				["`"] = { escape = true, close = true, pair = "``" },

				[" "] = { escape = false, close = true, pair = "  " },

				["<BS>"] = {},
				["<C-H>"] = {},
				["<C-W>"] = {},
				["<CR>"] = { disable_command_mode = true },
				["<S-CR>"] = { disable_command_mode = true },
			},
		})
	end,
}
