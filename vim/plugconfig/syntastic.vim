let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'passive_filetypes': ['eruby', 'erb', 'ruby'] }
let g:syntastic_puppet_puppetlint_args = '--no-only_variable_string-check'
let g:syntastic_vim_checkers = ['vint']
let g:syntastic_ruby_checkers = ['']
let g:syntastic_sh_shellcheck_args = '-e SC2154,SC1090,SC1091,SC2129,SC1003,SC2034'
let g:instant_markdown_autostart = 0

