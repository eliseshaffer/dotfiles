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
      \ '     ___  _                     _            _   _',
      \ '    / (_)| | o              () | |          | | | |',
      \ '    \__  | |     ,   _      /\ | |     __,  | | | |  _   ,_',
      \ '    /    |/  |  / \_|/     /  \|/ \   /  |  |/  |/  |/  /  |',
      \ '    \___/|__/|_/ \/ |__/  /(__/|   |_/\_/|_/|__/|__/|__/   |_/',
      \ '                                            |\  |\',
      \ '                                            |/  |/',
      \ ]

