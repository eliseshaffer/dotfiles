" Encoding (important that this is set early in .vimrc)
se enc=utf8 " use UTF-8 internally
se fencs=ucs-bom,utf-8,default,latin1 " detect detectable Unicode, but fall back

let g:loaded_python3_provider = 0
let g:loaded_python_provider = 0

scriptencoding utf-8

" Install vim-plug; copied from here:
" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Include Plugins
if filereadable(expand('~/.vim/bundles.vim'))
    source ~/.vim/bundles.vim
endif

" Include Mappings
if filereadable(expand('~/.vim/mappings.vim'))
    source ~/.vim/mappings.vim
endif

" Include functions
if filereadable(expand('~/.vim/functions.vim'))
    source ~/.vim/functions.vim
endif

" ==== Presentation
" Info
filetype plugin on
syntax on
set colorcolumn=81
" Always display statusline
set laststatus=2
set autoread " load external file changes
set title

" setup relative numbering
call rnu#setup()

" Do an incremental search
set incsearch
set hlsearch
set t_Co=256
" prevent swap files
set directory=~/.vim/swap//,/tmp/vim-swap//,/tmp//

set ignorecase
set smartcase

" get rid of bells
set noeb vb t_vb=

" Save on focus loss and delete trailing whitespace
function s:format_and_save()
  lua vim.lsp.buf.formatting_sync(nil, 1000)
  :wa
endfunction

aug Filestuff
    :au CursorHold * silent! :call s:format_and_save()
    autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)
    :au InsertLeave * silent! :call s:format_and_save()
    :au CursorHold * checktime
aug END

" ==== General Settings
set tabstop=2
set softtabstop=2
set shiftwidth=4
set expandtab
set nowrap
set backspace=2
set autoindent
set smartindent
set updatetime=1000
set noshowmode
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set showtabline=2

" Special settings based on language
autocmd BufRead,BufNewFile * setlocal tabstop=2 expandtab softtabstop=2 shiftwidth=2
autocmd BufRead,BufNewFile * setlocal tabstop=2 expandtab softtabstop=2 shiftwidth=2

" ==== Meta-vim
filetype on
" reload vimrc on save

aug crontab
    au BufEnter /private/tmp/crontab.* setl backupcopy=yes
aug END

"" Colors
colorscheme one
let iterm_profile = $COLOR
if iterm_profile == "dark"
    set background=dark
else
    set background=light
endif

let g:one_allow_italics = 1
"let g:solarized_termcolors=256

if (has("termguicolors"))
  set termguicolors
endif

if !has_key(g:polyglot_is_disabled, 'brewfile')
  au BufNewFile,BufRead *.brewfile setf brewfile
endif

" ==== Plugins
" Airline (better Powerline)
if filereadable(expand('~/.vim/plugconfig/airline.vim'))
    source ~/.vim/plugconfig/airline.vim
endif

" ==== Syntastic Settings
if filereadable(expand('~/.vim/plugconfig/syntastic.vim'))
    source ~/.vim/plugconfig/syntastic.vim
endif

" ==== Rainbow Parenthesis
if filereadable(expand('~/.vim/plugconfig/rainbow.vim'))
    source ~/.vim/plugconfig/rainbow.vim
endif

" ==== NERDTree Settings
if filereadable(expand('~/.vim/plugconfig/nerdtree.vim'))
    source ~/.vim/plugconfig/nerdtree.vim
endif

" ==== Startify options
if filereadable(expand('~/.vim/plugconfig/startify.vim'))
    source ~/.vim/plugconfig/startify.vim
endif

" ==== Test options
if filereadable(expand('~/.vim/plugconfig/vim-test.vim'))
    source ~/.vim/plugconfig/vim-test.vim
endif

" ==== Fzf configuration
if filereadable(expand('~/.vim/plugconfig/fzf.vim'))
    source ~/.vim/plugconfig/fzf.vim
endif

if has('nvim')
    if filereadable(expand('~/.vim/plugconfig/nvim-lspconfig.lua'))
        source ~/.vim/plugconfig/nvim-lspconfig.lua
    endif
    if filereadable(expand('~/.vim/plugconfig/compe.lua'))
        source ~/.vim/plugconfig/compe.lua
    endif
    if filereadable(expand('~/.vim/plugconfig/blamer.vim'))
        source ~/.vim/plugconfig/blamer.vim
    endif
endif

"nnoremap <silent> <leader> :<c-u>WhichKey  ','<CR>
