local lsp = require("lspconfig")
local util = require("lspconfig.util")
local configs = require("lspconfig.configs")
local vim_d = vim.diagnostic
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local settings = {
	cssVariables = {
		lookupFiles = {
			"**/*.css",
			"**/*.scss",
			"**/*.sass",
			"**/*.less",
		},
	},
}

if not configs.cssvar then
	configs.cssvar = {
		default_config = {
			cmd = { "cssvar", "--stdio" },
			filetypes = { "css", "scss", "less", "sass" },
			root_dir = lsp.util.root_pattern("package.json", ".git"),
			single_file_support = true,
			-- settings = settings,
		},
		docs = {
			default_config = {
				root_dir = [[root_pattern("", ".git") or bufdir]],
			},
		},
	}
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim_d.open_float, opts)
vim.keymap.set("n", "[d", vim_d.goto_prev, opts)
vim.keymap.set("n", "]d", vim_d.goto_next, opts)
vim.keymap.set("n", "<space>q", vim_d.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", vim.lsp.buf.formatting, bufopts)
end

-- require("typescript-tools").setup {
--   on_attach = on_attach,
-- }
local lsps = {
	"graphql",
	"tsserver",
	"cssvar",
	"cssls",
	"cssmodules_ls",
	"pyright",
	"clangd",
	"lua_ls",
	"gopls",
}

for _, value in ipairs(lsps) do
	if value == "lua_ls" then
		lsp[value].setup({
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					completion = {
						callSnippet = "Replace",
					},
				},
			},
		})
	elseif value == "cssvar" then
		lsp[value].setup({
			on_attach = on_attach,
			on_init = function(client)
				local root_dir = client.workspace_folders[1].name

				local path = util.path.join(root_dir, ".luarc.json")
				if util.path.exists(path) == false then
					return
				end
				local f = assert(io.open(path, "r")) -- assuming path is in the scope
				local content = f:read("*a")
				f:close()
				local config = vim.json.decode(content)
				if config == nil or config["cssVariables"] == nil then
					return
				end
				client.notify(
					"workspace/didChangeConfiguration",
					{ settings = {
						cssVariables = config["cssVariables"],
					} }
				)
			end,
			on_new_config = function(new_config, root_dir)
				local client = vim.lsp.get_active_clients({ name = "cssvar" })[1]
				local path = util.path.join(root_dir, ".luarc.json")
				if util.path.exists(path) == false then
					return
				end
				local f = assert(io.open(path, "r")) -- assuming path is in the scope
				local content = f:read("*a")
				f:close()
				local config = vim.json.decode(content)
				if config == nil or config["cssVariables"] == nil then
					return
				end
				if client == nil then
					return
					-- print("no client found")
					-- new_config = {
					-- 	cssVariables = config,
					-- }
					-- settings = new_config
					-- return new_config
				end
				client.notify(
					"workspace/didChangeConfiguration",
					{ settings = {
						cssVariables = config["cssVariables"],
					} }
				)
			end,
			capabilities = capabilities,
		})
	else
		lsp[value].setup({
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end
