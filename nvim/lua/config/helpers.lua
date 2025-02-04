return {
	toggle_background = function()
		if vim.o.background == "dark" then
			vim.o.background = "light"
		else
			vim.o.background = "dark"
		end
	end,
	toggle_wrap = function()
		vim.wo.wrap = not vim.wo.wrap
	end,
	clear_search_and_continue = function(action)
		return function()
			vim.cmd("nohlsearch") -- Clear search highlight
			vim.api.nvim_feedkeys(action, "n", true) -- Perform the original action
		end
	end,
	buffers = function()
		local telescope_builtin = require("telescope.builtin")
		-- Launch Telescope buffer list
		telescope_builtin.buffers({
			attach_mappings = function(prompt_bufnr, map)
				local function check_results_and_fallback()
					local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
					local results = picker:get_results()

					-- If no results, switch to find_files
					if #results == 0 then
						vim.schedule(function()
							require("telescope.actions").close(prompt_bufnr)
							telescope_builtin.find_files()
						end)
					end
				end

				-- Check results whenever the input changes
				vim.api.nvim_create_autocmd("User", {
					pattern = "TelescopeKeymapRefresh",
					callback = check_results_and_fallback,
				})

				-- Check results initially
				check_results_and_fallback()

				-- Default keybindings for the buffer list
				local mappings = {
					n = {
						["<C-c>"] = require("telescope.actions").close,
					},
				}

				-- Apply mappings
				for mode, keymaps in pairs(mappings) do
					for key, action in pairs(keymaps) do
						map(mode, key, action)
					end
				end

				return true
			end,
		})
	end,
}
