return {
	"stevearc/conform.nvim",
	opts = {},
	config = function()
		local conform = require("conform")
		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				-- Conform will run the first available formatter
				javascript = { "dprint", "prettierd", "prettier", stop_after_first = true },
				typescript = { "dprint", "prettierd", "prettier", stop_after_first = true },
				html = { "prettierd", "dprint", stop_after_first = true },
				css = { "dprint", "prettier", stop_after_first = true },
				scss = { "dprint", "prettier", stop_after_first = true },
				json = { "dprint" },
				toml = { "dprint" },
				yaml = { "dprint" },
				svelte = { "dprint" },
				markdown = { "dprint" },
			},
		})
	end,
}
