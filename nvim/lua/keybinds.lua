-- general Keybinds
function map(mode, shortcut, command)
	vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
	map("n", shortcut, command)
end

function imap(shortcut, command)
	map("i", shortcut, command)
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

-- I use trouble for quick fix menu
nmap("<gr>", "<NOP>")

imap("<Up>", "<NOP>")
imap("<Down>", "<NOP>")
imap("<Left>", "<NOP>")
imap("<Right>", "<NOP>")

-- Keep cursor in center of screen when tabbing
nmap("<C-u>", "<C-u>zz")
nmap("<C-d>", "<C-d>zz")
