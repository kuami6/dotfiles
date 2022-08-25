-- Settings
vim.opt.encoding="utf-8"
vim.opt.number=true

--- Indentation
vim.opt.shiftwidth=4
vim.opt.softtabstop=4
vim.opt.tabstop=4
vim.opt.expandtab=true
vim.opt.smartindent=true


vim.opt.wrapscan=true
vim.opt.ignorecase=true
vim.opt.textwidth=80

--vim.opt.wildmenu=true
--vim.cmd("wildmode=longest:full,full")

-- Plugins
require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Themes
  use { "ellisonleao/gruvbox.nvim" }
  -- LSP
  use {
    'VonHeikemen/lsp-zero.nvim',
    requires = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},

      -- Autocompletion
      {'hrsh7th/nvim-cmp'},
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'saadparwaiz1/cmp_luasnip'},
      {'hrsh7th/cmp-nvim-lsp'},
      {'hrsh7th/cmp-nvim-lua'},

      -- Snippets
      {'L3MON4D3/LuaSnip'},
      {'rafamadriz/friendly-snippets'},
    }
  }
    use { "fatih/vim-go"}
end)

-- Colorshceme
vim.o.background = "dark" -- or "light" for light mode
--vim.cmd("colorscheme gruvbox")
vim.cmd("hi MatchParen cterm=bold ctermbg=none ctermfg=red")

-- init lsp-zero
local lsp = require('lsp-zero')

lsp.preset('recommended')
lsp.setup()

-- vim-go

vim.g.go_gopls_enabled = "0"

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
nmap("<SPACE>", "<Nop>")
vim.g.mapleader = "<SPACE>"

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

