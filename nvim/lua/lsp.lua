-- Init lsp-zero from the old config file that works
local lsp = require('lsp-zero')
vim.cmd("let g:lsp_diagnostics_echo_cursor = 1") -- what does this do?

lsp.preset('recommended')
lsp.setup()

require("mason").setup()
require("mason-lspconfig").setup()
require("lspconfig").gopls.setup {}
