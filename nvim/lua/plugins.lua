local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"mhartington/formatter.nvim",
	"folke/neodev.nvim",
	"famiu/bufdelete.nvim",
	"hiphish/rainbow-delimiters.nvim",
	"norcalli/nvim-colorizer.lua",
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"barrett-ruth/import-cost.nvim",
		build = "sh install.sh pnpm",
		config = true,
	},
	{
		"theHamsta/nvim_rocks",
		event = "VeryLazy",
		build = "pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua",
	},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"tpope/vim-commentary",
	"nvim-lualine/lualine.nvim",
	"akinsho/toggleterm.nvim",
	"junegunn/fzf.vim",
	"vijaymarupudi/nvim-fzf",
	"ibhagwan/fzf-lua",
	{

		"nvim-treesitter/nvim-treesitter",
		cmd = "TSUpdate",
	},
	-- Git stuff
	"tpope/vim-fugitive",
	"airblade/vim-gitgutter",
	-- Autocomplete TSX tags
	"windwp/nvim-ts-autotag",
	-- Autocomplete brackets
	"windwp/nvim-autopairs",
	-- Completion Plugins
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
	"saadparwaiz1/cmp_luasnip", -- Snippets source for nvim-cmp
	"L3MON4D3/LuaSnip", -- Snippets plugin
	"hrsh7th/vim-vsnip",
	-- File Explorer Stuffs
	"stevearc/oil.nvim",
	"nvim-lua/plenary.nvim",
	"kyazdani42/nvim-web-devicons",
	"pmizio/typescript-tools.nvim",
}

require("lazy").setup(plugins)
