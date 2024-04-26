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
	-- Most plugins have their config in after/plugin/{pluginname}.lua
	use({ "wbthomason/packer.nvim" })

	-- Linter
	use({ "mfussenegger/nvim-lint" })

	-- Formatter
	use({ "mhartington/formatter.nvim" })

	-- Dap
	use({ "mfussenegger/nvim-dap" })
	use({ "rcarriga/nvim-dap-ui" })

	-- Better syntax highlighting, and some other features like autoclose html
	-- tags
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})

	-- Fuzzy finder
	use({ "nvim-telescope/telescope.nvim", requires = {
		{ "nvim-lua/plenary.nvim" },
	} })

	-- profiler
	use({ "dstein64/vim-startuptime" })

	-- Vim go (all in one solution for linting, formatting, lsp, and dap i think)
	-- this is a vim plugin and needs to be setup a bit differently
	-- should see if I can just drop it and implement the features with lsp zero
	-- and the rest of the plugins
	use({
		"fatih/vim-go",
		config = function()
			-- this might do nothing
			require("after.pluging.vim-go").setup()
		end,
	})

	-- Error-viewing, and more?
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
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
	use({ "ellisonleao/gruvbox.nvim" })

	if Packer_Bootstrap then
		require("packer").sync()
	end
end)
