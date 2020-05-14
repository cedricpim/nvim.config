" Plugin Manager

" Set custom augroup
augroup user_events
	autocmd!
augroup END

" Initializes options
let s:package_manager = 'dein'

" Set main configuration directory as parent directory
let $VIM_PATH =
	\ get(g:, 'etc_vim_path',
	\   exists('*stdpath') ? stdpath('config') :
	\   ! empty($MYVIMRC) ? fnamemodify(expand($MYVIMRC), ':h') :
	\   ! empty($VIMCONFIG) ? expand($VIMCONFIG) :
	\   ! empty($VIM_PATH) ? expand($VIM_PATH) :
	\   fnamemodify(resolve(expand('<sfile>:p')), ':h:h')
	\ )

" Set data/cache directory as $XDG_CACHE_HOME/vim
let $DATA_PATH = expand(($XDG_CACHE_HOME ? $XDG_CACHE_HOME : '~/.cache') . '/vim')

" Collection of user plugin list config file-paths
let s:plugins = expand($VIM_PATH . '/plugins.json')

function! s:main()
	if has('vim_starting')
		" When using VIMINIT trick for exotic MYVIMRC locations, add path now.
		if &runtimepath !~# $VIM_PATH
			set runtimepath^=$VIM_PATH
		endif

		" Ensure data directories
		for s:path in [
				\ $DATA_PATH,
				\ $DATA_PATH . '/undo',
				\ $DATA_PATH . '/backup',
				\ $DATA_PATH . '/session',
				\ $VIM_PATH . '/spell' ]
			if ! isdirectory(s:path)
				call mkdir(s:path, 'p')
			endif
		endfor
	endif

	" Initializes chosen package manager
	call s:use_{s:package_manager}()
endfunction

function! s:use_dein()
	let l:cache_path = $DATA_PATH . '/dein'

	if has('vim_starting')
		" Use dein as a plugin manager
		let g:dein#auto_recache = 1
		let g:dein#install_max_processes = 12
		let g:dein#install_progress_type = 'title'
		let g:dein#enable_notification = 1
		let g:dein#install_log_filename = $DATA_PATH . '/dein.log'

		" Add dein to vim's runtimepath
		if &runtimepath !~# '/dein.vim'
			let s:dein_dir = l:cache_path . '/repos/github.com/Shougo/dein.vim'
			" Clone dein if first-time setup
			if ! isdirectory(s:dein_dir)
				execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
				if v:shell_error
					call utils#error('dein installation has failed! is git installed?')
					finish
				endif
			endif

			execute 'set runtimepath+='.substitute(fnamemodify(s:dein_dir, ':p') , '/$', '', '')
		endif
	endif

	" Initialize dein.vim (package manager)
	if dein#load_state(l:cache_path)
		let l:rc = s:parse_plugins()
		if empty(l:rc)
			call utils#error('Empty plugin list')
			return
		endif

		" Start propagating file paths and plugin presets
		call dein#begin(l:cache_path, extend([expand('<sfile>')], [s:plugins]))
		for plugin in l:rc
			call dein#add(plugin['repo'], extend(plugin, {}, 'keep'))
		endfor
		call dein#end()

		" Save cached state for faster startups
		if ! g:dein#_is_sudo
			call dein#save_state()
		endif

		" Update or install plugins if a change detected
		if dein#check_install()
			if ! has('nvim')
				set nomore
			endif
			call dein#install()
		endif
	endif

	filetype plugin indent on

	" Only enable syntax when vim is starting
	if has('vim_starting')
		syntax enable
	endif

	" Trigger source event hooks
	call dein#call_hook('source')
	call dein#call_hook('post_source')
endfunction

function! s:parse_plugins()
	let l:json = readfile(s:plugins)
	return has('nvim') ? json_decode(l:json) : json_decode(join(l:json))
endfunction

call s:main()
