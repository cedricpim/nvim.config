let s:enable_whichkey = dein#tap('vim-which-key')

function! s:load_visualmap() abort
  " Disable arrow keys
  vnoremap <Up>    <Nop>
  vnoremap <Down>  <Nop>
  vnoremap <Left>  <Nop>
  vnoremap <Right> <Nop>

  " On visual mode, use tab and shift tab to indent the current selected text
  vnoremap <Tab> >gv
  vnoremap <S-Tab> <gv
endfunction

function! s:load_normalmap() abort
  " Disable arrow keys
  nnoremap <Up>    <Nop>
  nnoremap <Down>  <Nop>
  nnoremap <Left>  <Nop>
  nnoremap <Right> <Nop>

  " Write buffer (save)
  nnoremap <C-s> :<C-u>write<CR>
  " Smart move
  nnoremap j gj
  nnoremap k gk
  vnoremap j gj
  vnoremap k gk

  " Yank to end
  nnoremap Y y$
  " Yank full file path (also with current line)
  nnoremap <leader>pf :let @+=expand("%:p")<CR>
  nnoremap <leader>ps :let @+=expand("%")<CR>
  nnoremap <leader>pF :let @+=expand("%:p") . ":" . line(".")<CR>
  nnoremap <leader>pS :let @+=expand("%") . ":" . line(".")<CR>

  if s:enable_whichkey
    let g:which_key_map.p.f = 'yank full path'
    let g:which_key_map.p.s = 'yank relative path'
    let g:which_key_map.p.F = 'yank full path with line'
    let g:which_key_map.p.S = 'yank relative path with line'
  endif

  " Buffers movement and control
  nnoremap gp :bp<CR>
  nnoremap gn :bn<CR>
  nnoremap <leader>x :bdelete<CR>
  nnoremap <leader>n :enew<CR>
  nnoremap <leader>X :%bd<CR>

  if s:enable_whichkey
    let g:which_key_map.x = 'delete current buffer'
    let g:which_key_map.n = 'create new buffer'
    let g:which_key_map.X = 'delete all open buffers'
  endif

  " Fold current block
  nnoremap <S-Tab> za

  " Navigate through issues
  nnoremap <Up> :cp<CR>
  nnoremap <Down> :cn<CR>
  nnoremap <Left> :cpf<CR>
  nnoremap <Right> :cnf<CR>

  " Jump back to last edited buffer
  nnoremap <C-b> <C-^>

  " Clear search highlights
  nmap <silent> <leader>/ :nohlsearch<CR>
endfunction

function! s:load_insertmap() abort
  " insert a newline
  inoremap <C-O> <Esc>o
  " Save from insert
  imap <C-S> <esc>:w<CR>
  " On insert mode, Shift-Tab to remove indentation
  inoremap <S-Tab> <C-D>
  " Jump back to last edited buffer
  inoremap <C-b> <ESC><C-^>
endfunction

function! s:load_commandmap() abort
  " Map moving out of insert mode in terminal
  :tnoremap <ESC> <C-\><C-n>

  " command line alias
  cnoremap <C-k> <Up>
  cnoremap <C-j> <Down>
  cnoremap <C-h> <Left>
  cnoremap <C-l> <Right>
  cnoremap <C-h> <Home>
  cnoremap <C-e> <End>
  cnoremap <C-d> <Del>
  cnoremap <C-b> <BS>
  cnoremap <C-t> <C-R>=expand("%:p:h") . "/" <CR>
endfunction

function! s:load_quietmap() abort
  function! s:QuiteVim() abort
    if empty(expand('%:t'))
      execute ":q"
    else
      execute ":wq!"
    endif
  endfunction

  " Quiet
  nnoremap <leader>qq :call <SID>QuiteVim()<CR>
  nnoremap <leader>qr <esc>:q!<CR>

  if s:enable_whichkey
    let g:which_key_map.q = { 'name': '+quiet'}
    let g:which_key_map.q.q = 'Quiet with save'
    let g:which_key_map.q.r = 'Quiet without save (rage)'
  endif
endfunction

function! s:load_windowmap() abort
  "switch window
  nnoremap <S-h> <C-w>h
  nnoremap <S-j> <C-w>j
  nnoremap <S-k> <C-w>k
  nnoremap <S-l> <C-w>l
  " window
  nnoremap <Leader><TAB> <C-O><CR>
  nnoremap <leader>wS :<C-u>sp<CR>
  nnoremap <leader>wV :<C-u>vs<CR>
  nnoremap <leader>wh <C-w>h
  nnoremap <leader>wj <C-w>j
  nnoremap <leader>wk <C-w>k
  nnoremap <leader>wl <C-w>l
  nnoremap <leader>wH <C-w>H
  nnoremap <leader>wJ <C-w>J
  nnoremap <leader>wK <C-w>K
  nnoremap <leader>wL <C-w>L
  nnoremap <leader>wx <C-w>x
  nnoremap <leader>wc <C-w>c
  nnoremap <leader>wo <C-w>o
  nnoremap <leader>wR <C-w>R

  " settings for resize splitted window
  nmap <C-w>- :vertical resize -5<CR>
  nmap <C-w>= :vertical resize +5<CR>
  nmap <C-w>[ :vertical -5<CR>
  nmap <C-w>] :vertical +5<CR>

  if s:enable_whichkey
    let g:which_key_map.w = { 'name': '+window'}
    let g:which_key_map['<Tab>'] = 'switch to last buffer'
    let g:which_key_map.w.S = 'horizontally split'
    let g:which_key_map.w.V = 'vertical split'
    let g:which_key_map.w.h = 'jump left window'
    let g:which_key_map.w.j = 'jump bottom window'
    let g:which_key_map.w.k = 'jump top window'
    let g:which_key_map.w.l = 'jump right window'
    let g:which_key_map.w.H = 'move window to left'
    let g:which_key_map.w.J = 'move window to bottom'
    let g:which_key_map.w.K = 'move window to top'
    let g:which_key_map.w.L = 'move window to right'
    let g:which_key_map.w.x = 'swap window'
    let g:which_key_map.w.c = 'close window'
    let g:which_key_map.w.o = 'close other window'
    let g:which_key_map.w.R = 'spin window'
  endif
endfunction

let s:modes = {
  \ 'insertmap': 'insert',
  \ 'commandmap': 'command',
  \ 'quietmap': 'quiet',
  \ 'windowmap': 'window',
  \ 'normalmap': 'normal',
  \ 'visualmap': 'visual'
\ }

call utils#load_keybinds(s:modes, utils#GetSID(expand('<sfile>:p')))
