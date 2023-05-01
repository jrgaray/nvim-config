require"mason".setup()
require"mason-lspconfig".setup({
  ensure_installed = { 
    "tsserver", 
    "cssls", 
    "dockerls", 
    "sumneko_lua", 
    "graphql", 
    "pyright", 
    "sqlls" 
  },
  automatic_installlation = true,
})
