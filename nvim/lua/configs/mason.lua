require("mason").setup()

require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"cssls",
		"dockerls",
		"graphql",
		"pyright",
		"sqlls",
		"clangd",
		"lua_ls",
	},
	automatic_installlation = true,
})
