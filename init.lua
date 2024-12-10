vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.wo.relativenumber = true
vim.g.mapleader = " "
vim.wo.fillchars = "eob: "
vim.g.rust_recommended_style = 0
vim.g.markdown_recommended_style = 0
vim.keymap.set("n", "<leader>e", ":noh<CR>", {})
vim.opt.termguicolors = true
vim.opt.guicursor = ""
--
--
--
--
-- LazyVim
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
--
--
--
-- netrw
vim.keymap.set("n", "<leader>n", ":Ex<CR>", {})
--
--
--
-- Treesitter
local config = require("nvim-treesitter.configs")
config.setup({
  ensure_installed = { "lua", "markdown", "markdown_inline" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" }
  },
  indent = { enable = true },
})
--
--
--
-- Theme
vim.cmd[[colorscheme rose-pine-moon]]
--
--
--
-- Markdown
vim.keymap.set("n", "<leader>g", ":Glow<return>")
--
--
--
-- Harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>m", mark.add_file)
vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-t>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-n>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-m>", function() ui.nav_file(3) end)
--vim.keymap.set("n", "<C-m-->", function() ui.nav_file(4) end)


-- Lsp --
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { noremap = true })
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap = true })
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { noremap = true })
vim.keymap.set('n', 'gr', vim.lsp.buf.references, { noremap = true })
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, { noremap = true })
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, { noremap = true })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { noremap = true })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { noremap = true })
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, { noremap = true })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, { noremap = true })
