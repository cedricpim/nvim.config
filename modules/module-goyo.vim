" Disable visual candy in Goyo mode
function! s:goyo_enter()
  if has('gui_running')
    " Gui fullscreen
    set fullscreen
    set background=light
    set linespace=7
  elseif exists('$TMUX')
    " Hide tmux status
    silent !tmux set status off
  endif

  " Activate Limelight
  let g:loaded_spaceline=0
  Limelight
endfunction

" Enable visuals when leaving Goyo mode
function! s:goyo_leave()
  if has('gui_running')
    " Gui exit fullscreen
    set nofullscreen
    set background=dark
    set linespace=0
  elseif exists('$TMUX')
    " Show tmux status
    silent !tmux set status on
  endif

  " De-activate Limelight
  let g:loaded_spaceline =1
  Limelight!
endfunction

augroup user_plugin_goyo
  autocmd!
  autocmd! User GoyoEnter
  autocmd! User GoyoLeave
  autocmd  User GoyoEnter nested call <SID>goyo_enter()
  autocmd  User GoyoLeave nested call <SID>goyo_leave()
augroup END
