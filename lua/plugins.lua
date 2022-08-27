local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

  -- JS/TS Formatting
  Plug('prettier/vim-prettier', { 
	['do'] = 'yarn install', ['for'] = {'javascript', 'typescript', 'typescriptreact', 'javascriptreact'} 
	})

  -- Theme
  Plug('dracula/vim', { ['as'] = 'dracula' })

  -- Language Server Protocol
  Plug 'neovim/nvim-lspconfig'

  -- Comment Code
  Plug 'tpope/vim-commentary'

  -- Plug 'frazrepo/vim-rainbow'

  Plug 'itchyny/lightline.vim'

  -- Plug 'alvan/vim-closetag'

  Plug 'akinsho/toggleterm.nvim'

  Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})

  Plug 'junegunn/fzf.vim'

  Plug 'vijaymarupudi/nvim-fzf'

  Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

  -- Git stuff
  Plug 'tpope/vim-fugitive'

  -- Rainbow brackets
  Plug 'p00f/nvim-ts-rainbow'

  -- Autocomplete TSX tags
  Plug 'windwp/nvim-ts-autotag'

  -- Autocomplete brackets
  Plug 'jiangmiao/auto-pairs'

  -- Completion Plugins
  Plug 'hrsh7th/cmp-nvim-lsp'

  Plug 'hrsh7th/cmp-buffer'

  Plug 'hrsh7th/cmp-path'

  Plug 'hrsh7th/cmp-cmdline'

  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/cmp-vsnip'

  Plug 'hrsh7th/vim-vsnip'

  -- File Explorer Stuffs
  Plug 'tamago324/lir.nvim'

  Plug 'nvim-lua/plenary.nvim'

  Plug 'kyazdani42/nvim-web-devicons'

  Plug 'tamago324/lir-bookmark.nvim'

  Plug 'tamago324/lir-git-status.nvim'



vim.call('plug#end')
