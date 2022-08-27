local actions = require'lir.actions'
local mark_actions = require 'lir.mark.actions'
local clipboard_actions = require'lir.clipboard.actions'
local b_actions = require'lir.bookmark.actions'

require'lir'.setup {
  show_hidden_files = true,
  devicons_enable = true,
  mappings = {
    ['i']  = actions.edit,
    ['<Enter>']  = actions.edit,
    ['<C-s>'] = actions.split,
    ['<C-g>'] = actions.vsplit,
    ['t'] = actions.tabedit,

    ['-']     = actions.up,
    ['q']     = actions.quit,

    ['K']     = actions.mkdir,
    ['N']     = actions.newfile,
    ['R']     = actions.rename,
    ['@']     = actions.cd,
    ['Y']     = actions.yank_path,
    ['.']     = actions.toggle_show_hidden,
    ['D']     = actions.delete,
    ['B']     = b_actions.list,
    ['ba']    = b_actions.add,

    ['J'] = function()
      mark_actions.toggle_mark()
      vim.cmd('normal! j')
    end,
    ['C'] = clipboard_actions.copy,
    ['X'] = clipboard_actions.cut,
    ['P'] = clipboard_actions.paste,
  },
  float = {
    winblend = 0,
    curdir_window = {
      enable = false,
      highlight_dirname = false
    },
  },
  hide_cursor = true,
  on_init = function()
    -- use visual mode
    vim.api.nvim_buf_set_keymap(
      0,
      "x",
      "J",
      ':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
      { noremap = true, silent = true }
    )

    -- echo cwd
    vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
  end,
}


require'lir.bookmark'.setup {
  bookmark_path = '~/.lir_bookmark',
  mappings = {
    ['l']     = b_actions.edit,
    ['<C-s>'] = b_actions.split,
    ['<C-v>'] = b_actions.vsplit,
    ['<C-t>'] = b_actions.tabedit,
    ['<C-e>'] = b_actions.open_lir,
    ['B']     = b_actions.open_lir,
    ['q']     = b_actions.open_lir,
  }
}

-- go back from file
vim.api.nvim_set_keymap(
      'n',
      '-',
      [[<Cmd>execute 'e ' .. expand('%:p:h')<CR>]],
      { noremap = true }
    )
require'lir.git_status'.setup({
  show_ignored = false
})

