require("oil").setup({
  keymaps = {
    ["t"] = "actions.select_tab",
    ["<C-t>"] ='<Cmd>execute v:count . "ToggleTerm"<CR>' 
  },
  view_options = {
    show_hidden = true
  },
})
