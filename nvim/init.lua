
-- Settings
vim.opt.encoding="utf-8"
vim.opt.number=true

--- Indentation
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.tabstop=4
vim.opt.expandtab=true
vim.opt.smartindent=true

--- Splitting
vim.opt.splitbelow=true
vim.opt.splitright=true

vim.opt.wrapscan=false
vim.opt.ignorecase=true
vim.opt.textwidth=80
vim.opt.signcolumn="yes"

-- Scroll earlier
vim.o.scrolloff = 8;


-- Keybinds
function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map('n', shortcut, command)
end

function imap(shortcut, command)
  map('i', shortcut, command)
end

--Set spacebar as leader key
nmap(" ", "<Nop>")
vim.g.mapleader = " "

-- Exit insert mode with ii
imap("ii", "<ESC>")

-- Arrowkeys are for scrubs
nmap("<Up>", "<NOP>")
nmap("<Down>", "<NOP>")
nmap("<Left>", "<NOP>")
nmap("<Right>", "<NOP>")

imap("<Up>", "<NOP>")
imap("<Down>", "<NOP>")
imap("<Left>", "<NOP>")
imap("<Right>", "<NOP>")

-- Keep cursor in center of screen when tabbing
nmap("<C-u>", "<C-u>zz");
nmap("<C-d>", "<C-d>zz");

-- Load Plugins
require("plugins")

-- Colorshceme
vim.o.background = "dark" -- or "light" for light mode
vim.cmd("colorscheme gruvbox")
vim.cmd("hi MatchParen cterm=bold ctermbg=none ctermfg=red")

-- This does not work for some reason, no compleation
--local lsp = require('lsp-zero').preset({
--    name = 'recomended',
--    set_lsp_keymaps = true,
--    manage_nvim_cpm = true,
--    suggest_lsp_servers = true,
--})

--lsp.setup()

require('neoscroll').setup()

-- Init lsp-zero from the old config file that works
local lsp = require('lsp-zero')
vim.cmd("let g:lsp_diagnostics_echo_cursor = 1") -- what does this do?

lsp.preset('recommended')
lsp.setup()

-- NERDTree
-- since nerdtree is lazy loaded we need to add a keybind here instead of in its
-- config
vim.api.nvim_set_keymap("n", "<leader>t", "<Cmd>NERDTree<CR>", {noremap = true, silent = true})

-- vim-go
vim.g.go_gopls_enabled = "0"

-- DAP Keybinds, what is this?
--map({ "n", "<F4>", ":lua require('dapui').toggle()<CR>" })
--map({ "n", "<F5>", ":lua require('dap').toggle_breakpoint()<CR>" })
--map({ "n", "<F9>", ":lua require('dap').continue()<CR>" })
--
--map({ "n", "<F1>", ":lua require('dap').step_over()<CR>" })
--map({ "n", "<F2>", ":lua require('dap').step_into()<CR>" })
--map({ "n", "<F3>", ":lua require('dap').step_out()<CR>" })
--
--map({ "n", "<Leader>dsc", ":lua require('dap').continue()<CR>" })
--map({ "n", "<Leader>dsv", ":lua require('dap').step_over()<CR>" })
--map({ "n", "<Leader>dsi", ":lua require('dap').step_into()<CR>" })
--map({ "n", "<Leader>dso", ":lua require('dap').step_out()<CR>" })
--
--map({ "n", "<Leader>dhh", ":lua require('dap.ui.variables').hover()<CR>" })
--map({ "v", "<Leader>dhv", ":lua require('dap.ui.variables').visual_hover()<CR>" })
--
--map({ "n", "<Leader>duh", ":lua require('dap.ui.widgets').hover()<CR>" })
--map({ "n", "<Leader>duf", ":lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>" })
--
--map({ "n", "<Leader>dro", ":lua require('dap').repl.open()<CR>" })
--map({ "n", "<Leader>drl", ":lua require('dap').repl.run_last()<CR>" })
--
--map({ "n", "<Leader>dbc", ":lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>" })
--map({ "n", "<Leader>dbm", ":lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>" })
--map({ "n", "<Leader>dbt", ":lua require('dap').toggle_breakpoint()<CR>" })
--
--map({ "n", "<Leader>dc", ":lua require('dap.ui.variables').scopes()<CR>" })
--map({ "n", "<Leader>di", ":lua require('dapui').toggle()<CR>" })

