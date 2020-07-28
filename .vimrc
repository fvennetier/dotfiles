set background=dark
set modeline
set tabstop=4
set shiftwidth=4
set hlsearch
set smarttab
set smartindent
set tags=tags,~/tags,/usr/src/tags,/

filetype indent plugin on

" always display status line
set laststatus=2
let g:airline_section_z = '%#__accent_bold#%4l%#__restore__#%#__accent_bold#/%L%#__restore__#:%3v'
let g:airline_skip_empty_sections = 1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#whitespace#mixed_indent_format = 'mixed[%s]'
let g:airline#extensions#whitespace#mixed_indent_file_format = 'mixed-file[%s]'
let g:airline#extensions#default#layout = [
	\	[ 'a', 'b', 'c' ],
	\	[ 'x', 'z', 'warning', 'error' ]
	\	]

let g:syntastic_check_on_wq=0

let g:syntastic_cpp_checkers=['gcc', 'cpplint']
"let g:syntastic_cpp_cpplint_args='--verbose=3 --filter=-build/header_guard,-build/c++11'
let g:syntastic_cpp_cpplint_exec='cpplint'
let g:syntastic_cpp_compiler_options='-Wall'

let g:syntastic_c_checkers=['gcc', 'splint']
let g:syntastic_c_compiler_options='-Wall -std=gnu99 -Wextra -Wparentheses -Wunused'
let g:syntastic_c_include_dirs = [
	\	'/usr/include/apr-1',
	\	'/usr/include/apache2',
	\	'/usr/include/glib-2.0',
	\	'/usr/include/json-c',
	\	'/usr/include/zookeeper'
\	]

let g:syntastic_sh_checkers=['sh', 'shellcheck', 'checkbashisms']
let g:syntastic_go_checkers=['go', 'gofmt', 'govet']

" let g:jedi#use_splits_not_buffers = "bottom"
" let g:jedi#show_call_signatures = "2"

" let g:NERDDefaultAlign = 'left'
" let g:NERDSpaceDelims = 1
" let g:NERDCompactSexyComs = 1

let c_space_errors = 1
"let OmniCpp_MayCompleteDot = 1

execute pathogen#infect()

autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType python nnoremap <buffer> <F5> :exec '!python' shellescape(@%, 1)<cr>

autocmd FileType java setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType cpp setlocal tabstop=4 shiftwidth=2 expandtab fdm=marker makeprg=make\ -C\ ${PWD/src/build}
autocmd FileType cpp nnoremap <F5> :w <cr> :make <cr>
"autocmd FileType cpp setlocal fdm=marker makeprg=make\ -C\ ${PWD/src/build}
"autocmd FileType cpp setlocal omnifunc=omni#cpp#complete#Main
autocmd FileType c setlocal noexpandtab shiftwidth=4
autocmd FileType c setlocal makeprg=make\ -C\ ${PWD/src/build}
autocmd FileType c nnoremap <F5> :w <cr> :make <cr>
autocmd FileType cmake setlocal makeprg=make\ -C\ ${PWD/src/build}
autocmd FileType json setlocal expandtab shiftwidth=4 softtabstop=4
autocmd FileType proto setlocal tabstop=2 shiftwidth=2 expandtab
autocmd FileType rst setlocal makeprg=tox
autocmd FileType rnc setlocal shiftwidth=2 expandtab
autocmd FileType sh setlocal shiftwidth=2 expandtab

"nnoremap <c-g> <c-]>
map <C-$> :exec("tjump ".expand("<cword>"))<CR>
map <C-g> :exec("tjump ".expand("<cword>"))<CR>
"map <C-g> :exec("tjump ".expand("<cword>"))<CR>

" Load local .vimrc files
set exrc
