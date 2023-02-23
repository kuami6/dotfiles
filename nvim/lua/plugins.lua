local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    Packer_Bootstrap = fn.system({ 'git','clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
end

local present, packer = pcall(require, "packer")

if not present then
    return
end

packer.startup(function(use)
    use 'wbthomason/packer.nvim'
    use { 'mfussenegger/nvim-lint' }
    use { "mfussenegger/nvim-dap" }
    use {
        "fatih/vim-go",
        config = function()
            require("config.vim-go").setup()
        end,
    }
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
    -- NeoScroll
    use { 'karb94/neoscroll.nvim',
        require('neoscroll').setup()
    }
    -- NERDTree
    use {
        "preservim/nerdtree",
        cmd = "NERDTree",
        config = function()
            require("config.nerdtree").setup()
        end,
    }

    use {
        "towolf/vim-helm",
    }
    use {
        "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
        config = function()
            require("config.treesitter").setup()
        end,
    }
    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
        config = function()
            require("config.trouble").setup()
        end,
    }
	use {
		"junegunn/fzf",
		config = function()
			require("config.fzf").setup()
		end,
 	}
    if Packer_Bootstrap then
        require('packer').sync()
    end
end)
