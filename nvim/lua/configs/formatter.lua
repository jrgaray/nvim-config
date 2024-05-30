-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup({
	-- Enable or disable logging
	logging = true,
	-- Set the log level
	log_level = vim.log.levels.WARN,
	-- All formatter configurations are opt-in
	filetype = {
		-- Formatter configurations for filetype "lua" go here
		-- and will be executed in order
		css = {
			require("formatter.filetypes.css").prettierd,
		},
		go = {
			require("formatter.filetypes.go").gofumpt,
		},
		graphql = {
			require("formatter.filetypes.graphql").prettierd,
		},
		html = {
			require("formatter.filetypes.html").prettierd,
		},
		javascript = {
			require("formatter.filetypes.javascript").prettierd,
		},
		javascriptreact = {
			require("formatter.filetypes.javascriptreact").prettierd,
		},
		json = {
			require("formatter.filetypes.json").prettierd,
		},
		lua = {
			require("formatter.filetypes.lua").stylua,
		},
		markdown = {
			require("formatter.filetypes.markdown").prettierd,
		},
		scss = {
			require("formatter.filetypes.css").prettierd,
		},
		svelte = {
			require("formatter.filetypes.typescript").prettierd,
		},
		typescript = {
			require("formatter.filetypes.typescript").prettierd,
		},
		typescriptreact = {
			require("formatter.filetypes.typescript").prettierd,
		},
		["*"] = {
			-- "formatter.filetypes.any" defines default configurations for any
			-- filetype
			require("formatter.filetypes.any").remove_trailing_whitespace,
		},
	},
})

vim.api.nvim_exec(
	[[
 augroup FormatAutogroup
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END
]],
	true
)
