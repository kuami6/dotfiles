require("trouble").setup({
	mode = "document_diagnostics",
})

--local keymap = vim.api.nvim_set_keymap
--local default_opts = { noremap = true, silent = true }

-- old keymaps
--keymap("n", "<leader>t", "<Cmd>Trouble document_diagnostics<CR>", default_opts)
--keymap("n", "<leader>r", "<Cmd>Trouble lsp_references<CR>", default_opts)
--keymap("n", "<leader>q", "<Cmd>Trouble quickfix<CR>", default_opts)
--keymap("n", "<leader>c", "<Cmd>TroubleClose<CR>", default_opts)

-- Keymaps
vim.keymap.set("n", "<leader>xx", function()
	require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>xw", function()
	require("trouble").toggle("workspace_diagnostics")
end)
vim.keymap.set("n", "<leader>xd", function()
	require("trouble").toggle("document_diagnostics")
end)
vim.keymap.set("n", "<leader>xq", function()
	require("trouble").toggle("quickfix")
end)
vim.keymap.set("n", "<leader>xl", function()
	require("trouble").toggle("loclist")
end)
-- I have replaced the standard quickfix window with trouble
vim.keymap.set("n", "gr", function()
	require("trouble").toggle("lsp_references")
end)
