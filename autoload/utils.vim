function! utils#source_file(root_path,path, ...)
  " Source user configuration files with set/global sensitivity
  let use_global = get(a:000, 0, ! has('vim_starting'))
  let abspath = resolve(a:root_path . '/' . a:path)
  if ! use_global
    execute 'source' fnameescape(abspath)
    return
  endif

  let tempfile = tempname()
  let content = map(readfile(abspath),
    \ "substitute(v:val, '^\\W*\\zsset\\ze\\W', 'setglobal', '')")
  try
    call writefile(content, tempfile)
    execute printf('source %s', fnameescape(tempfile))
  finally
    if filereadable(tempfile)
      call delete(tempfile)
    endif
  endtry
endfunction

function! utils#load_keybinds(list, sid) abort
  let pmap = copy(a:list)
  call s:load_keybinds(pmap, a:sid)
endfunction

function! s:load_keybinds(pmap, sid) abort
  for key in keys(a:pmap)
    try
      exec 'call <SNR>'.a:sid.'_load_'.key.'()'
    catch /.*/
      echo 'Load plugins keybinds error:' . v:exception
    finally
    endtry
  endfor
endfunction

function! utils#GetSID(fullpath)
  redir => out | silent! scriptnames | redir END
  let path = substitute(a:fullpath, $HOME, '~', '')
  return index(map(split(out, "\n"), "substitute(v:val, '^[^:]*:\\s*\\(.*\\)$', '\\1', '')"), path) + 1
endfunction

function! utils#error(msg)
  for l:mes in s:str2list(a:msg)
    echohl WarningMsg | echomsg '[config/init] ' . l:mes | echohl None
  endfor
endfunction

function! s:str2list(expr)
  " Convert string to list
  return type(a:expr) ==# v:t_list ? a:expr : split(a:expr, '\n')
endfunction
