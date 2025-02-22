-- Use `:help` to learn about these options
-- TODO: Listchars
-- TODO: tabout
-- TODO: preserve folds throught sessions
vim.cmd("cd " .. vim.fn.getcwd())
vim.cmd("colorscheme catppuccin")
vim.opt.wrap = false
vim.opt.scrolloff = 3
vim.opt.ignorecase = true
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.guifont = "Cascadia_Code:h10.5"

-- for nvim-tree
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- For avante.nvim
-- views can only be fully collapsed with the global statusline
vim.opt.laststatus = 3

-- For obsidian.nvim
vim.opt.conceallevel = 1

-- Window padding for GUI client Neovide
if vim.g.neovide then
	vim.g.neovide_padding_top = 3
	vim.g.neovide_padding_bottom = 3
	vim.g.neovide_padding_right = 3
	vim.g.neovide_padding_left = 3
end
