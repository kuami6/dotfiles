-- Default config example taken from :h formatter
-- Utilities for creating configurations
local util = require("formatter.util")

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		lua = {
			-- "formatter.filetypes.lua" defines default configurations for the
			-- "lua" filetype
			require("formatter.filetypes.lua").stylua,
		},

		typescript = {
			require("formatter.filetypes.typescript").prettierd,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettierd,
		},
		html = {
			require("formatter.filetypes.html").prettierd,
		},

		-- Use the special "*" filetype for defining formatter configurations on
		-- any filetype
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

-- autocmd to get autoformatting on angular projects
local fos = vim.api.nvim_create_augroup("FormatterOnSave", {
	clear = false,
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	pattern = { "*.ts", "*.js", "*.html", "*.css", "*.lua" },
	callback = function()
		vim.cmd("FormatWrite")
	end,
})
