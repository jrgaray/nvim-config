local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g      -- a table to access global variables
local opt = vim.opt  -- to set options

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end



opt.termguicolors = true
opt.relativenumber = true
opt.tabstop = 2 
opt.shiftwidth = 2
opt.expandtab = true
opt.completeopt = "menu,menuone,noselect"

cmd 'colorscheme dracula'
cmd 'noswapfile'

g['rainbow_active'] =  1
g['prettier#autoformat'] = 1
g['prettier#autoformat_require_pragma'] = 0
g['dirvish_git_show_ignored'] = 1

-- Ripgrep to search files
cmd 'autocmd BufEnter * silent! lcd %:p:h'
map('n', '<C-f>', ':Rg<Enter>')
map('n', 'j', 'gj')
map('n', 'k', 'gk')
