local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	Packer_Bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
	vim.cmd([[packadd packer.nvim]])
end

local present, packer = pcall(require, "packer")

if not present then
	return
end

packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })

	-- Linter
	use({ "mfussenegger/nvim-lint" })

	-- Formatter
	use({ "mhartington/formatter.nvim" })

	-- Dap
	use({ "mfussenegger/nvim-dap" })

	-- Vim go (all in one solution for linting, formatting, lsp)
	use({
		"fatih/vim-go",
		config = function()
			require("config.vim-go").setup()
		end,
	})

	-- LSP
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" },
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lua" },

			-- Snippets Engine
			{ "L3MON4D3/LuaSnip", run = "make install_jsregexp" },

			-- Snippets
			{ "rafamadriz/friendly-snippets" },
		},
	})

	-- Gruvbox theme
	use({
		"ellisonleao/gruvbox.nvim",
		-- Setting the colorscheme her prevents some errors when boostrapping
		-- the config
		config = function()
			vim.o.background = "dark"
			vim.cmd("colorscheme gruvbox")
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		-- autoclose html tags (probably some other tags aswell)
		require("nvim-treesitter.configs").setup({
			autotag = {
				enable = true,
			},
		}),
	})

	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
		config = function()
			require("config.trouble").setup()
		end,
	})

	if Packer_Bootstrap then
		require("packer").sync()
	end
end)
