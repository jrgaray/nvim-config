local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')

  -- JS/TS Formatting
  Plug('prettier/vim-prettier', { 
	['do'] = 'yarn install', ['for'] = {'javascript', 'typescript', 'typescriptreact', 'javascriptreact'} 
	})

  Plug('theHamsta/nvim_rocks', {['do'] = 'pip3 install --user hererocks && python3 -mhererocks . -j2.1.0-beta3 -r3.0.0 && cp nvim_rocks.lua lua'})

  Plug 'famiu/bufdelete.nvim'
  Plug 'norcalli/nvim-colorizer.lua'

  -- Theme
  Plug('dracula/vim', { ['as'] = 'dracula' })
  Plug('folke/tokyonight.nvim', { ['branch'] = 'main' })


  Plug 'williamboman/mason.nvim'

  Plug 'williamboman/mason-lspconfig.nvim'

  -- Language Server Protocol
  Plug 'neovim/nvim-lspconfig'

  -- Comment Code
  Plug 'tpope/vim-commentary'


  Plug 'nvim-lualine/lualine.nvim'

  Plug 'akinsho/toggleterm.nvim'

  Plug('junegunn/fzf', {['do'] = vim.fn['fzf#install']})

  Plug 'junegunn/fzf.vim'

  Plug 'vijaymarupudi/nvim-fzf'

  Plug 'ibhagwan/fzf-lua'

  Plug('nvim-treesitter/nvim-treesitter', {['do'] = ':TSUpdate'})

  -- Git stuff
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'

  -- Rainbow brackets
  Plug 'p00f/nvim-ts-rainbow'

  -- Autocomplete TSX tags
  Plug 'windwp/nvim-ts-autotag'

  -- Autocomplete brackets
  Plug 'windwp/nvim-autopairs'

  -- Completion Plugins
  Plug 'hrsh7th/cmp-nvim-lsp'

  Plug 'hrsh7th/cmp-buffer'

  Plug 'hrsh7th/cmp-path'

  Plug 'hrsh7th/cmp-cmdline'

  Plug 'hrsh7th/nvim-cmp'

  Plug 'hrsh7th/cmp-vsnip'

  Plug 'hrsh7th/vim-vsnip'

  -- File Explorer Stuffs
  Plug 'stevearc/oil.nvim'
  -- Plug 'tamago324/lir.nvim'

  Plug 'nvim-lua/plenary.nvim'

  Plug 'kyazdani42/nvim-web-devicons'



vim.call('plug#end')
