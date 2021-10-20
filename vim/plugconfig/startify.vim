" ==== Startify options
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1
let g:startify_session_before_save = [
    \ 'silent! :tabdo NERDTreeClose',
    \ ]
let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']                     },
      \ { 'type': 'files',     'header': ['   Files']                        },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
      \ ]
let g:startify_custom_header = [
      \ "     ,dPYb,              ,dPYb, ,dPYb,                           ,dPYb,",
      \ "     IP'`Yb              IP'`Yb IP'`Yb                           IP'`Yb",
      \ "     I8  8I              I8  8I I8  8I                           I8  8I  gg",
      \ "     I8  8'              I8  8' I8  8'                           I8  8'  \"\"",
      \ "     I8 dPgg,    ,ggg,   I8 dP  I8 dP    ,ggggg,         ,ggg,   I8 dP   gg     ,g,      ,ggg,",
      \ "     I8dP\" \"8I  i8\" \"8i  I8dP   I8dP    dP\"  \"Y8ggg     i8\" \"8i  I8dP    88    ,8'8,    i8\" \"8i",
      \ "     I8P    I8  I8, ,8I  I8P    I8P    i8'    ,8I       I8, ,8I  I8P     88   ,8'  Yb   I8, ,8I",
      \ "    ,d8     I8, `YbadP' ,d8b,_ ,d8b,_ ,d8,   ,d8'       `YbadP' ,d8b,_ _,88,_,8'_   8)  `YbadP'",
      \ "    88P     `Y8888P\"Y8888P'\"Y888P'\"Y88P\"Y8888P\"        888P\"Y8888P'\"Y888P\"\"Y8P' \"YY8P8P888P\"Y888",
      \ ]

" Color the header. PreCondit comes from the colorscheme.
" In this case, it's yellow
hi! link StartifyHeader PreCondit
