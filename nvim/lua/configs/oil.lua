local oil = require("oil")
oil.setup({
	keymaps = {
		["t"] = "actions.select_tab",
		["<C-t>"] = '<Cmd>execute v:count . "ToggleTerm"<CR>',
		["<CR>"] = function()
			require("oil").select()
		end,
	},
	view_options = {
		show_hidden = true,
	},
})
