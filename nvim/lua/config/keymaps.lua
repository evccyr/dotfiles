-- TODO: Map o and O to not go into insert mode
-- BUG: If on buffer A and I open buffer B and close it using the leader-c binding, then buffer C is displayed. It should display the buffer B
-- TODO: map ctrl-c in normal mode in telescope pickers to quit telescope
-- TODO: add mapping to insert white space without leaving insert mode
-- TODO: Install extend key objects for conveniences like dac(delete around condition), etc.
local map = vim.keymap.set
local helpers = require("config.helpers")
local telescope_builtin = require("telescope.builtin")

map({ "n", "i", "x" }, "<c-s>", "<cmd>update<cr>", { silent = true, desc = "Save buffer" })

-- FIX
map("n", "<leader>q", "<cmd>bp|bd#<cr>", { desc = "Close buffer; Preserve split", silent = true })
map("n", "<leader>w", helpers.toggle_wrap, { desc = "Toggle line wrap", silent = true })
map("n", "<leader>n", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neotree", noremap = true, silent = true })
map("n", "<leader>N", "<cmd>Neotree focus<cr>", { desc = "Focus file explorer", noremap = true, silent = true })
map("n", "<leader>o", "<cmd>Oil<cr>", { desc = "Oil", noremap = true, silent = true })

-- Clipboard
map("v", "<leader>y", '"+ygv', { desc = "Copy" })
map("n", "<leader>y", '"+y', { desc = "Copy" })
map("n", "<leader>Y", "<cmd>%y+<cr>", { desc = "Copy entire file" })
map("v", "<leader>p", '"+p', { desc = "Paste; Replace selection" })
map("v", "<leader>P", '"+p', { desc = "Paste; Replace selection" })
map("n", "<leader>p", '"+p', { desc = "Paste" })
map("n", "<leader>P", '"+P', { desc = "Paste before" })

-- Telescope
map("n", "<leader>x", telescope_builtin.colorscheme, { desc = "Colorschemes" })
map("n", "<leader>h", telescope_builtin.oldfiles, { desc = "File history" })
map("n", "<leader>v", telescope_builtin.vim_options, { desc = "Vim options" })
map("n", "<leader><leader>", telescope_builtin.buffers, { desc = "Buffers" })
map("n", "<leader>f", telescope_builtin.find_files, { desc = "Files" })
map("n", "<leader>t", "<cmd>TodoTelescope<cr>", { desc = "TODO comments" })
map("n", "<leader>s", telescope_builtin.live_grep, { desc = "Search cwd" })
map("n", "<leader>S", telescope_builtin.search_history, { desc = "Search history" })
map("n", "<leader>u", telescope_builtin.grep_string, { desc = "Search word under cursor" })
map("n", "<leader>m", telescope_builtin.marks, { desc = "Marks" })
map("n", "<leader>/", telescope_builtin.current_buffer_fuzzy_find, { desc = "Find in buffer" })
map("n", "<leader>?", telescope_builtin.help_tags, { desc = "Help tags" })
map("n", "<leader>c", telescope_builtin.command_history, { desc = "Command history" })
map("n", "<leader>C", telescope_builtin.commands, { desc = "Commands" })
map("n", "<leader>r", telescope_builtin.registers, { desc = "Registers" })
map("n", "<leader>gc", telescope_builtin.git_commits, { desc = "Git commits" })
map("n", "<leader>gs", telescope_builtin.git_stash, { desc = "Git stash" })
map("n", "<leader>gf", telescope_builtin.git_files, { desc = "Git files" })
map("n", "<leader>gg", telescope_builtin.git_status, { desc = "Git status" })
map("n", "<leader>gb", telescope_builtin.git_branches, { desc = "Git branches" })

-- LSP
map("n", "<leader>lR", telescope_builtin.lsp_references, { desc = "LSP refernces" })
map("n", "<leader>lS", telescope_builtin.lsp_document_symbols, { desc = "LSP symbols" })
map("n", "<leader>lI", telescope_builtin.lsp_implementations, { desc = "LSP implementations" })
map("n", "<leader>ld", telescope_builtin.lsp_definitions, { desc = "LSP definitions" })
map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename identifier", noremap = true, silent = true })
map("n", "<leader>lk", vim.lsp.buf.hover, { desc = "LSP Hover", silent = true })
map("n", "<leader>li", vim.lsp.buf.implementation, { desc = "Goto implementation", silent = true })

map("n", "<c-j>", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "<c-k>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

map(
	"n",
	"<Esc>",
	helpers.clear_search_and_continue(vim.api.nvim_replace_termcodes("<Esc>", true, false, true)),
	{ noremap = true, silent = true }
)

map(
	"n",
	"<C-c>",
	helpers.clear_search_and_continue(vim.api.nvim_replace_termcodes("<C-c>", true, false, true)),
	{ noremap = true, silent = true }
)
