if exists('g:loaded_vimnout')
  finish
endif
let g:loaded_vimnout = 1

command -nargs=* VimNOut call vimnout#FilterAndRunCommand(<q-args>)
