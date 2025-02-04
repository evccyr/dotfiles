-- TODO: Map alt in tamper monkey to put focs on 'window'
-- TODO When reopening <leader>fg picker. Preserve the previous search query.
return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local keymap = vim.keymap
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				layout_strategy = "vertical",
				layout_config = {
					vertical = {
						mirror = true,
						height = 100,
						prompt_position = "top",
					},
				},
				mappings = {
					i = {},
					n = {
						["<c-c>"] = actions.close,
					},
				},
				file_ignore_patterns = { "%.doc", "%.docx", "%.xls", "%.xlsx", "%.ppt", "%.pptx" },
				sorting_strategy = "ascending", -- Ensure the results are displayed starting from the top
				prompt_prefix = "🔍 ",
				selection_caret = "▶ ",
			},
			pickers = {
				colorscheme = {
					enable_preview = true,
				},
				buffers = {
					mappings = {
						i = {
							["<c-k>"] = actions.delete_buffer + actions.move_to_top,
						},
						n = {
							["x"] = actions.delete_buffer + actions.move_to_top,
						},
					},
				},
			},
		})
	end,
}
