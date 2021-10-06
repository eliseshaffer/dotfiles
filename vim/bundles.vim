" Set up vundle
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Plugins listed here
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'eliseshaffer/vim-rails', { 'branch': 'minitest-rails-syntax' }
Plug 'tpope/vim-haml'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'mhinz/vim-startify'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Townk/vim-autoclose'
Plug 'benizi/vim-automkdir'
Plug 'wincent/terminus'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" Colorschemes
Plug 'jpo/vim-railscasts-theme'
Plug 'eliseshaffer/vim-one'
Plug 'ryanoasis/vim-devicons'

" Formatting
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/DeleteTrailingWhitespace'
Plug 'godlygeek/tabular'

" Syntax Plugins
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'mustache/vim-mustache-handlebars'
Plug 'scrooloose/syntastic'
Plug 'mattn/emmet-vim'
Plug 'sunaku/vim-ruby-minitest'

" Git tools
Plug 'knsh14/vim-github-link'
Plug 'lambdalisue/gina.vim'
Plug 'airblade/vim-gitgutter'

if has('nvim')
  Plug 'neovim/nvim-lspconfig' " Language Server
  Plug 'hrsh7th/nvim-compe' " Completions
  Plug 'hrsh7th/vim-vsnip'
  Plug 'rafamadriz/friendly-snippets'
else
  Plug 'ervandew/supertab'
endif

" All of your Plugins must be added before the following line
call plug#end()
filetype plugin indent on    " required
