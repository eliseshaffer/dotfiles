" Set up vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Plugins listed here
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'tomtom/tlib_vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Townk/vim-autoclose'
"Plug 'benizi/vim-automkdir'
Plug 'wincent/terminus' " Changes cursor and enables mouse in all modes
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'eliseshaffer/vim-one'
Plug 'dracula/vim'
Plug 'ryanoasis/vim-devicons'

" Formatting
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/DeleteTrailingWhitespace'
"Plug 'godlygeek/tabular' " Makes it easy to line up tables

" Syntax Plugins
Plug 'sheerun/vim-polyglot'
Plug 'eliseshaffer/vim-rails', { 'branch': 'minitest-rails-syntax' }
Plug 'tpope/vim-endwise' " Auto-insert end in ruby
Plug 'tpope/vim-surround' " Adds changing/deleting surrounding chars
Plug 'mattn/emmet-vim'
Plug 'sunaku/vim-ruby-minitest'

" Git tools
Plug 'knsh14/vim-github-link'
Plug 'lambdalisue/gina.vim'
Plug 'airblade/vim-gitgutter'

if has('nvim')
  Plug 'neovim/nvim-lspconfig' " Language Server
  Plug 'hrsh7th/nvim-compe' " Completions
  Plug 'hrsh7th/vim-vsnip' " Snippet support
  Plug 'rafamadriz/friendly-snippets' " Some useful snippets
  Plug 'APZelos/blamer.nvim' " Blame virtual text
else
  Plug 'scrooloose/syntastic'
  Plug 'ervandew/supertab'
endif

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required
