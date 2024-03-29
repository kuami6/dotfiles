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
    use { 'wbthomason/packer.nvim' }

    use { 'mfussenegger/nvim-lint' }
    use { "mfussenegger/nvim-dap" }

    -- Vim go
    use { "fatih/vim-go",
        config = function()
            require("config.vim-go").setup()
        end,
    }

    -- LSP
    use { 'VonHeikemen/lsp-zero.nvim',
        branch = 'v3.x',
        requires = {
          -- LSP Support
          {'neovim/nvim-lspconfig'},
          {'williamboman/mason.nvim'},
          {'williamboman/mason-lspconfig.nvim'},

          -- Autocompletion
          {'hrsh7th/nvim-cmp'},
          {'hrsh7th/cmp-nvim-lsp'},
          {'hrsh7th/cmp-buffer'},
          {'hrsh7th/cmp-path'},
          {'saadparwaiz1/cmp_luasnip'},
          {'hrsh7th/cmp-nvim-lua'},

          -- Snippets Engine
          {'L3MON4D3/LuaSnip',
          run = "make install_jsregexp"
            },

          -- Snippets
          {'rafamadriz/friendly-snippets'},
        }
    }
    
    -- Prettier
    use { 'sbdchd/neoformat' }

    -- Gruvbox theme
    use { "ellisonleao/gruvbox.nvim" }

    use( "nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'})

    use { "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("config.trouble").setup()
		end,
    }

	use { "junegunn/fzf",
		config = function()
			require("config.fzf").setup()
		end,
 	}

    if Packer_Bootstrap then
        require('packer').sync()
    end
end)
