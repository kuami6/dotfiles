local M = {}

local keymap = vim.api.nvim_set_keymap
local default_opts = {noremap = true, silent = true}

function M.setup()
    keymap("n", "<leader>t", "<Cmd>Trouble document_diagnostics<CR>", default_opts)
    keymap("n", "<leader>r", "<Cmd>Trouble lsp_references<CR>", default_opts)
    keymap("n", "<leader>q", "<Cmd>Trouble quickfix<CR>", default_opts)
    keymap("n", "<leader>c", "<Cmd>TroubleClose<CR>", default_opts)
end

return M
