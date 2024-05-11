vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.relativenumber = true
vim.g.mapleader = " "
vim.wo.fillchars = "eob: "
vim.g.rust_recommended_style = false
vim.cmd("set cmdheight=0")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
vim.keymap.set("n", "<C-s>", function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set("n", "<C-n>", ":Neotree reveal toggle right<CR>", {})

local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua" },
  highlight = { enable = true },
  indent = { enable = true },
})
vim.cmd("colorscheme nightfox")
vim.keymap.set("n", "<leader>g", ":Glow<return>")
