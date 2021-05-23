function! ColorSwitch()
  if (&background ==# 'light')
    set background=dark
  else
    set background=light
  endif
  :RainbowToggleOn
endfunction

command! -nargs=* ColorSwitch call ColorSwitch()
