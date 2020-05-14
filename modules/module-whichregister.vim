function! s:register_whichkey()
  let s:leader_key = substitute(get(g:, "mapleader", "\\"), ' ', '<Space>', '')
  let s:localleader_key = get(g:,'maplocalleader', ';')

  call which_key#register(s:leader_key, 'g:which_key_map')
  call which_key#register(s:localleader_key, 'g:which_key_localmap')
endfunction

call s:register_whichkey()
