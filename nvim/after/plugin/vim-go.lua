local M = {}
local keymap = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

function M.setup()
	-- keybinds for godebug
	keymap("n", "<leader>S", "<Cmd>GoDebugStart<CR>", default_opts)
	keymap("n", "<leader>n", "<Cmd>GoDebugNext<CR>", default_opts)
	keymap("n", "<leader>s", "<Cmd>GoDebugStep<CR>", default_opts)
	keymap("n", "<leader>o", "<Cmd>GoDebugStepOut<CR>", default_opts)
	-- keymap("n", "<leader>c", "<Cmd>GoDebugContinue<CR>", default_opts)
	keymap("n", "<leader>b", "<Cmd>GoDebugBreakpoint<CR>", default_opts)

	-- prevent godebug from spewing hundreds of lines of debug messages into the
	-- debug output console
	vim.g.go_debug_log_output = ""
end

return M
