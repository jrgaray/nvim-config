require("nvim-treesitter.configs").setup({
	ensure_installed = { "tsx", "lua", "html", "json", "css", "go", "java" },
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	autotag = {
		enable = true,
	},
})
