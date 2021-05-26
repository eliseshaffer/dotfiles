" Place your keybindings here
" ==== Controls
let mapleader = ","
set mouse=a

" Line movement
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" <leader>n = CtrlP from current file's directory
nm <C-p> :Files<CR>
nm <leader>s :Ag<CR>
nm <leader>f :Files<CR>
"nmap <leader>v :tabedit $MYVIMRC<CR>

"" Reset search highlighting when refreshing the screen (Ctrl+l)
nn <silent> <C-l> :nohls<CR><C-l>

map <leader>bt :NERDTreeToggle<cr>
nmap <leader>tn :TestNearest<cr>
nmap <leader>tf :TestFile<cr>
nmap <leader>ta :TestSuite<cr>
nmap <leader>ts :TestSuite<cr>
nmap <leader>t :TestSuite<cr>
nmap <leader>tl :TestLast<cr>

"ctags shortcuts
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map ‘ :vsp <CR>:exec("tag ".expand("<cword>"))<CR>"

" Find the cursor
hi CursorLine ctermbg=white ctermfg=NONE guibg=white guifg=NONE
hi CursorColumn ctermbg=white ctermfg=NONE guibg=white guifg=NONE
nnoremap <Leader>C :set cursorline! cursorcolumn!<CR>

"" Aliases
ia rpry require 'pry'; binding.pry
ia pry binding.pry

" ,c => copy to clipboard “*
vmap <leader>c "*y<CR>

" ,v => paste clipboard “*
map <leader>v "*p

" ,p will paste the last YANKED thing (register 0) instead of unnamed buffer
map <leader>p "0p""

" tab stuff
map <leader>w :bd<CR>
map <leader>wt :tabc<CR>
map <leader>wo :tabo<CR>

" Colorswitch
nmap <leader>kt :ColorSwitch<CR>

" Git maps
nmap <leader>gb :Gina blame<CR>
nmap <leader>gc :GetCurrentCommitLink<CR>
vmap <leader>gc :GetCurrentCommitLink<CR>
