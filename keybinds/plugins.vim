let s:enable_whichkey = dein#tap('vim-which-key')

if s:enable_whichkey
  function! InitWhickey()
    let s:leader_key = substitute(get(g:, "mapleader", "\\"), ' ', '<Space>', '')
    let s:localleader_key = get(g:, 'maplocalleader', ';')

    execute 'nnoremap <silent> <Leader> :<c-u>WhichKey "'.s:leader_key.'"<CR>'
    execute 'vnoremap <silent> <Leader> :<c-u>WhichKeyVisual "'.s:leader_key.'"<CR>'
    execute 'nnoremap <silent> <LocalLeader> :<c-u>WhichKey "' .s:localleader_key.'"<CR>'
  endfunction

  call InitWhickey()

  let g:which_key_map.c = { 'name': '+code' }
  let g:which_key_map.f = { 'name': '+find' }
  let g:which_key_map.o = { 'name': '+open' }
  let g:which_key_map.t = { 'name': '+toggle' }
  let g:which_key_map.g = { 'name': '+versioncontrol' }
endif

function! s:load_dein() abort
  if dein#tap('dein.vim')
    nnoremap <silent> <Leader>pu  :call dein#update()<CR>
    nnoremap <silent> <Leader>pr  :call dein#recache_runtimepath()<CR>
    nnoremap <silent> <Leader>pl  :echo dein#get_updates_log()<CR>

    if s:enable_whichkey
      let g:which_key_map.p = { 'name': '+plugin'}
      let g:which_key_map.p.u = 'update all plugins'
      let g:which_key_map.p.r = 'recache runtime path'
      let g:which_key_map.p.l = 'plugins update log'
    endif
  endif
endfunction

function! s:load_buffet() abort
  if dein#tap('vim-buffet')
    nnoremap  ]b :<C-u>bp<CR>
    nnoremap  [b :<C-u>bn<CR>
    "delete buffer
    nmap <C-x>b :<C-u>bd<CR>
    nnoremap <silent> <Leader>bc :Bonly<CR>
    nnoremap <silent> <Leader>bx :Bw<CR>
    nmap <leader>1 <Plug>BuffetSwitch(1)
    nmap <leader>2 <Plug>BuffetSwitch(2)
    nmap <leader>3 <Plug>BuffetSwitch(3)
    nmap <leader>4 <Plug>BuffetSwitch(4)
    nmap <leader>5 <Plug>BuffetSwitch(5)
    nmap <leader>6 <Plug>BuffetSwitch(6)
    nmap <leader>7 <Plug>BuffetSwitch(7)
    nmap <leader>8 <Plug>BuffetSwitch(8)
    nmap <leader>9 <Plug>BuffetSwitch(9)
    nmap <leader>0 <Plug>BuffetSwitch(10)

    if s:enable_whichkey
      let g:which_key_map.b = { 'name': '+buffer' }
      let g:which_key_map.b.c = 'keep current buffer'
      let g:which_key_map.b.x = 'remove all buffers'
      let g:which_key_map.1 = 'select window-1'
      let g:which_key_map.2 = 'select window-2'
      let g:which_key_map.3 = 'select window-3'
      let g:which_key_map.4 = 'select window-4'
      let g:which_key_map.5 = 'select window-5'
      let g:which_key_map.6 = 'select window-6'
      let g:which_key_map.7 = 'select window-7'
      let g:which_key_map.8 = 'select window-8'
      let g:which_key_map.9 = 'select window-9'
      let g:which_key_map.0 = 'select window-10'
    endif
  endif
endfunction

function! s:load_any_jump() abort
  if dein#tap('any-jump.vim')
    nnoremap <silent> <Leader>fj :AnyJump<CR>
    xnoremap <silent> <Leader>fj :AnyJump<CR>

    if s:enable_whichkey
      let g:which_key_map.f.j ='Show definition references'
    endif
  endif
endfunction

function! s:load_floaterm() abort
  if dein#tap('vim-floaterm')
    nnoremap <silent> <Leader>tt :<C-u>FloatermToggle<CR>
    nnoremap <silent> <Leader>tg :<C-u>FloatermNew height=0.7 width=0.8 lazygit<CR>

    if s:enable_whichkey
      let g:which_key_map.t.t = 'open terminal'
      let g:which_key_map.t.g = 'lazygit'
    endif
  endif
endfunction

function! s:load_coc_clap() abort
  if dein#tap('coc-clap')
    " Show all diagnostics
    nnoremap <silent> <Leader>ce  :Clap coc_diagnostics<cr>
    " Manage extensions
    nnoremap <silent> <Leader>;  :Clap coc_extensions<cr>
    " Show commands
    nnoremap <silent> <Leader>,   :Clap coc_commands<cr>
    " Search workspace symbols
    nnoremap <silent> <Leader>cs  :Clap coc_symbols<cr>
    nnoremap <silent> <Leader>cS  :Clap coc_services<CR>
    nnoremap <silent> <leader>ct  :Clap coc_outline<CR>

    if s:enable_whichkey
      let g:which_key_map[';'] = 'coc extensions'
      let g:which_key_map[','] = 'coc commands'
      let g:which_key_map.c.e = 'Lsp Show Diagnostics'
      let g:which_key_map.c.S = 'Lsp Show Services'
      let g:which_key_map.c.s = 'Lsp Show Symbols'
      let g:which_key_map.c.t = 'Lsp Show Outline'
    endif
  endif
endfunction

function! s:load_coc() abort
  if dein#tap('coc.nvim')
    if s:enable_whichkey
      let g:which_key_map.c.a = 'Lsp CodeActionSelected'
      let g:which_key_map["'"] = 'coc resume'
      let g:which_key_map.c.n = 'Lsp Rename'
      let g:which_key_map.c.i = 'Lsp Find implementation'
      let g:which_key_map.c.f = 'Lsp Format'
      let g:which_key_map.c.F = 'Lsp auto fix'
      let g:which_key_map.c.d = 'Lsp Show Document'
      let g:which_key_map.c.o = 'Lsp Organize Import'
      let g:which_key_map.g.i = 'Show chunk diff at point'
      let g:which_key_map.g.m = 'Show commit contains at point'
      let g:which_key_map.j = 'open coc-exoplorer'
      let g:which_key_map.f.z = 'find word on multipe files'
    endif

    " Remap for do codeAction of selected region
    function! s:cocActionsOpenFromSelected(type) abort
        execute 'CocCommand actions.open ' . a:type
    endfunction

    xmap <silent> <Leader>ca :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
    nmap <silent> <Leader>ca :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@
    " Do default action for next item.
    nmap <silent> [a  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nmap <silent> ]a  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent> <Leader>'  :<C-u>CocListResume<CR>
    " Use `[e` and `]e` for navigate diagnostics
    nmap <silent> ]e <Plug>(coc-diagnostic-prev)
    nmap <silent> [e <Plug>(coc-diagnostic-next)
    " Remap for rename current word
    nmap <Leader>cn <Plug>(coc-rename)
    " Remap for format selected region
    vmap <Leader>cf  <Plug>(coc-format-selected)
    nmap <Leader>cf  <Plug>(coc-format-selected)
    " Fix autofix problem of current line
    nmap <Leader>cF  <Plug>(coc-fix-current)
    " Remap keys for gotos
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> <Leader>ci <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)
    " Use K for show documentation in float window
    nnoremap <silent> K :call CocActionAsync('doHover')<CR>
    nnoremap <silent> <Leader>cd :call CocActionAsync('doHover')<CR>
    " use <c-space> for trigger completion.
    inoremap <silent><expr> <c-space> coc#refresh()
    nmap ]g <Plug>(coc-git-prevchunk)
    nmap [g <Plug>(coc-git-nextchunk)
    " show chunk diff at current position
    nmap <Leader>gi <Plug>(coc-git-chunkinfo)
    " show commit contains current position
    nmap <Leader>gm <Plug>(coc-git-commit)
    " float window scroll
    nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
    nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
    " Use <TAB> for selections ranges.
    " NOTE: Requires 'textDocument/selectionRange' support from the language server.
    " coc-tsserver, coc-python are the examples of servers that support it.
    nmap <silent> <TAB> <Plug>(coc-range-select)
    xmap <silent> <TAB> <Plug>(coc-range-select)
    " Add `:OR` command for organize imports of the current buffer.
    command! -nargs=0 OR  :call CocAction('runCommand', 'editor.action.organizeImport')
    nnoremap <silent> <Leader>co :<C-u>OR<CR>
    " multiple cursors
    nmap <silent><M-s> <Plug>(coc-cursors-position)
    nmap <expr> <silent><M-d> <SID>select_current_word()
    xmap <silent><M-d> <Plug>(coc-cursors-range)
    " use normal command like `<Leader>xi(`
    nmap <silent><M-c>  <Plug>(coc-cursors-operator)

    function! s:select_current_word()
        if !get(g:, 'coc_cursors_activated', 0)
            return "\<Plug>(coc-cursors-word)"
        endif
        return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
    endfunc
    " Use `:Format` for format current buffer
    command! -nargs=0 Format :call CocAction('format')

    nnoremap  <Leader>fz :<C-u>CocSearch -w<Space>
    " coc-explorer
    noremap <silent> <Leader>j :execute 'CocCommand explorer' .
        \ ' --toggle' .
        \ ' --position=floating' .
        \ ' --sources=file+'<CR>
    " Introduce function text object
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server.
    xmap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap if <Plug>(coc-funcobj-i)
    omap af <Plug>(coc-funcobj-a)
  endif
endfunction

function! s:load_clap() abort
  if dein#tap('vim-clap')
    nnoremap <silent> <Leader>tc :<C-u>Clap colors<CR>
    nnoremap <silent> <Leader>bb :<C-u>Clap buffers<CR>
    nnoremap <silent> <Leader>fc :<C-u>Clap grep2<CR>
    "like emacs counsel-find-file
    nnoremap <silent> <C-x><C-f> :<C-u>Clap filer<CR>
    nnoremap <silent> <Leader>ff :<C-u>Clap files ++finder=rg --no-ignore --hidden --files<CR>
    nnoremap <silent> <Leader>fg :<C-u>Clap gfiles<CR>
    nnoremap <silent> <Leader>fw :<C-u>Clap grep ++query=<cword><CR>
    nnoremap <silent> <Leader>fh :<C-u>Clap history<CR>
    nnoremap <silent> <Leader>fW :<C-u>Clap windows<CR>
    nnoremap <silent> <Leader>fl :<C-u>Clap loclist<CR>
    nnoremap <silent> <Leader>fu :<C-u>Clap git_diff_files<CR>
    nnoremap <silent> <Leader>fv :<C-u>Clap grep ++query=@visual<CR>
    nnoremap <silent> <Leader>fq :<C-u>Clap quickfix<CR>
    nnoremap <silent> <Leader>fr :<C-u>Clap registers<CR>
    nnoremap <silent> <Leader>fm :<C-u>Clap marks<CR>
    nnoremap <silent> <Leader>ft :<C-u>Clap tags<CR>

    if s:enable_whichkey
      let g:which_key_map.t.c = 'Change Colorscheme'
      let g:which_key_map.b.b = 'Buffer List'
      let g:which_key_map.f.c = 'Find Word'
      let g:which_key_map.f.f = 'Find File'
      let g:which_key_map.f.g = 'Find files with git'
      let g:which_key_map.f.w = 'Find current word'
      let g:which_key_map.f.h = 'Find history'
      let g:which_key_map.f.W = 'Find windows'
      let g:which_key_map.f.l = 'Find locallist'
      let g:which_key_map.f.u = 'Find uncommitted files'
      let g:which_key_map.f.v = 'Find visual text'
      let g:which_key_map.f.q = 'Find quickfix'
      let g:which_key_map.f.r = 'Find registers'
      let g:which_key_map.f.m = 'Find marks'
      let g:which_key_map.f.t = 'Find tags'
    endif
  endif
endfunction

function! s:load_vimagit() abort
  if dein#tap('vimagit')
    nnoremap <silent> <Leader>gg :Magit<CR>

    if s:enable_whichkey
      let g:which_key_map.g.g = 'Magit'
    endif

    autocmd User VimagitEnterCommit startinsert
    autocmd User VimagitEnterCommit setlocal spell textwidth=71
    autocmd User VimagitLeaveCommit setlocal textwidth=0
  endif
endfunction

function! s:load_fugitive() abort
  if dein#tap('vim-fugitive')
    nnoremap <silent> <Leader>ga :Git add %:p<CR>
    nnoremap <silent> <Leader>gd :Gdiffsplit<CR>
    nnoremap <silent> <Leader>gc :Git commit -S<CR>
    nnoremap <silent> <Leader>gb :Git blame<CR>
    nnoremap <silent> <Leader>gf :Gfetch<CR>
    nnoremap <silent> <Leader>gs :Git<CR>
    nnoremap <silent> <Leader>gp :Gpush --force-with-lease<CR>
    nnoremap <silent> <Leader>gr :Gread<CR>
    nnoremap <silent> <Leader>gk :Gcommit -S %<CR>
    nnoremap <Leader>go :!git<space>

    if s:enable_whichkey
      let g:which_key_map.g.a = 'git add'
      let g:which_key_map.g.d = 'git diff split'
      let g:which_key_map.g.b = 'git blame'
      let g:which_key_map.g.f = 'git fetch'
      let g:which_key_map.g.c = 'git commit'
      let g:which_key_map.g.s = 'git status'
      let g:which_key_map.g.p = 'git push --force-with-lease'
      let g:which_key_map.g.r = 'git read'
      let g:which_key_map.g.k = 'git commit --current'
      let g:which_key_map.g.o = 'Git Custom Command'
    endif
  endif
endfunction

function! s:load_mundo()abort
  if dein#tap('vim-mundo')
    nnoremap <silent> <Leader>m :MundoToggle<CR>

    if s:enable_whichkey
      let g:which_key_map.m = 'MundoToggle'
    endif
  endif
endfunction

function! s:load_choosewin() abort
  if dein#tap('vim-choosewin')
    nmap -         <Plug>(choosewin)
    nmap <Leader>- :<C-u>ChooseWinSwapStay<CR>

    if s:enable_whichkey
      let g:which_key_map['-'] = 'Choose window'
    endif
  endif
endfunction

function! InitCaw() abort
  if ! &l:modifiable
    silent! nunmap <buffer> gc
    silent! xunmap <buffer> gc
    silent! nunmap <buffer> gcc
    silent! xunmap <buffer> gcc
  else
    nmap <buffer> gc <Plug>(caw:prefix)
    xmap <buffer> gc <Plug>(caw:prefix)
    nmap <buffer> gcc <Plug>(caw:hatpos:toggle)
    xmap <buffer> gcc <Plug>(caw:hatpos:toggle)
  endif
endfunction

function! s:load_caw() abort
  if dein#tap('caw.vim')
    autocmd FileType * call InitCaw()
    call InitCaw()
  endif
endfunction

function! s:load_smoothie() abort
  if dein#tap('vim-smoothie')
    nnoremap <silent> <C-u> :<C-U>call smoothie#backwards()<CR>
    nnoremap <silent> <C-j> :<C-U>call smoothie#downwards()<CR>
    nnoremap <silent> <C-k> :<C-U>call smoothie#upwards()<CR>
    nnoremap <silent> <C-n> :<C-U>call smoothie#forwards()<CR>
  endif
endfunction

function! s:load_goyo() abort
  if dein#tap('goyo.vim')
    nnoremap <Leader>G :Goyo<CR>

    if s:enable_whichkey
      let g:which_key_map.G = 'Goyo'
    endif
  endif
endfunction

function! s:load_defx() abort
  if dein#tap('defx.nvim')
    nnoremap <silent> <Leader>e
      \ :<C-u>Defx -resume -toggle -buffer-name=tab`tabpagenr()`<CR>
    nnoremap <silent> <C-e>
      \ :<C-u>Defx -resume -buffer-name=tab`tabpagenr()` -search-recursive=`expand('%:p')`<CR>

    if s:enable_whichkey
      let g:which_key_map.e = 'Open defx'
      let g:which_key_map.c.e = 'Open current file on defx'
    endif
  endif
endfunction

function! s:load_committia() abort
  if dein#tap('committia.vim')
    let g:committia_hooks = {}

    function! g:committia_hooks.edit_open(info)
      imap <buffer><C-d> <Plug>(committia-scroll-diff-down-half)
      imap <buffer><C-u> <Plug>(committia-scroll-diff-up-half)

      setlocal winminheight=1 winheight=1
      resize 10
      startinsert
    endfunction
  endif
endfunction

function! s:load_vista() abort
  if dein#tap('vista.vim')
    nnoremap <silent> <Leader>i :<C-u>Vista!!<CR>

    if s:enable_whichkey
      let g:which_key_map.i = 'Vista'
    endif
  endif
endfunction

function! s:load_easymotion() abort
  if dein#tap('vim-easymotion')
    nmap gsj <Plug>(easymotion-w)
    nmap gsk <Plug>(easymotion-b)
    nmap gsf <Plug>(easymotion-overwin-f)
    nmap gss <Plug>(easymotion-overwin-f2)
  endif
endfunction

function! s:load_sandwich() abort
  if dein#tap('vim-sandwich')
    nmap <silent> sa <Plug>(operator-sandwich-add)
    xmap <silent> sa <Plug>(operator-sandwich-add)
    omap <silent> sa <Plug>(operator-sandwich-g@)
    nmap <silent> sd <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
    xmap <silent> sd <Plug>(operator-sandwich-delete)
    nmap <silent> sr <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-query-a)
    xmap <silent> sr <Plug>(operator-sandwich-replace)
    nmap <silent> sdb <Plug>(operator-sandwich-delete)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
    nmap <silent> srb <Plug>(operator-sandwich-replace)<Plug>(operator-sandwich-release-count)<Plug>(textobj-sandwich-auto-a)
  endif
endfunction

if dein#tap('vim-expand-region')
  xmap v <Plug>(expand_region_expand)
  xmap V <Plug>(expand_region_shrink)
endif

if dein#tap('dsf.vim')
  nmap dsf <Plug>DsfDelete
  nmap csf <Plug>DsfChange
endif

if dein#tap('splitjoin.vim')
  let g:splitjoin_join_mapping = ''
  let g:splitjoin_split_mapping = ''

  nmap sj :SplitjoinJoin<CR>
  nmap sk :SplitjoinSplit<CR>
endif

if dein#tap('vim-textobj-function')
  omap <silent> af <Plug>(textobj-function-a)
  omap <silent> if <Plug>(textobj-function-i)
  xmap <silent> af <Plug>(textobj-function-a)
  xmap <silent> if <Plug>(textobj-function-i)
endif

function! s:load_rails() abort
  if dein#tap('vim-rails')
    nnoremap <leader>tf :Rails<CR>
    nnoremap <leader>ts :.Rails<CR>

    if s:enable_whichkey
      let g:which_key_map.t.f = 'Rails'
      let g:which_key_map.t.s = '.Rails (focused)'
    endif
  endif
endfunction

function! s:load_test() abort
  if dein#tap('vim-test')
    let test#strategy = "dispatch"

    nmap <silent> t<C-n> :TestNearest<CR>
    nmap <silent> t<C-f> :TestFile<CR>
    nmap <silent> t<C-s> :TestSuite<CR>
    nmap <silent> t<C-l> :TestLast<CR>
    nmap <silent> t<C-g> :TestVisit<CR>
  endif
endfunction

let s:plugins = {
  \ 'dein': 'dein.vim',
  \ 'buffet': 'vim-buffet',
  \ 'coc': 'coc.nvim',
  \ 'any_jump': 'any-jump.vim',
  \ 'clap': 'vim-clap',
  \ 'coc_clap': 'coc-clap',
  \ 'choosewin': 'vim-choosewin',
  \ 'smoothie': 'vim-smoothie',
  \ 'mundo': 'vim-mundo',
  \ 'easymotion': 'vim-easymotion',
  \ 'defx': 'defx.nvim',
  \ 'floaterm': 'vim-floaterm',
  \ 'vimagit': 'vimagit',
  \ 'committia': 'committia',
  \ 'fugitive': 'vim-fugitive',
  \ 'caw': 'caw.vim',
  \ 'vista': 'vista.vim',
  \ 'goyo': 'goyo.vim',
  \ 'sandwich': 'vim-sandwich',
  \ 'rails': 'vim-rails',
  \ 'test': 'vim-test'
\ }

call utils#load_keybinds(s:plugins, utils#GetSID(expand('<sfile>:p')))
