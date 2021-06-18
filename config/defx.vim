""""""""""""""""""""""""""""""
" => Defx
""""""""""""""""""""""""""""""
call defx#custom#option('default', {
  \ 'columns': 'git:indent:icons:filename:type',
  \ 'winwidth': 35,
  \ 'split': 'vertical',
  \ 'direction': 'botright',
  \ })

call defx#custom#column('filename', {
  \ 'min_width': 20,
  \ 'max_width': 30,
  \ })

nnoremap <silent> <leader>nn :<C-u>Defx -auto-cd -toggle -resume -ignored-files='*.pyd'<CR>

" Close Vim if defx is the only buffer left
autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | q | endif

" Move focus to the next window if current buffer is defx
autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

" Define mappings
autocmd FileType defx do WinEnter | call s:defx_settings()
function! s:defx_settings() abort
  " Define mappings
  nnoremap <silent><buffer><expr> !
        \ defx#do_action('execute_command')
  nnoremap <silent><buffer><expr> *
        \ defx#do_action('toggle_select_all')
  nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
  nnoremap <silent><buffer><expr> ;
        \ defx#do_action('repeat')
  nnoremap <silent><buffer><expr> <C-g>
        \ defx#do_action('print')
  nnoremap <silent><buffer><expr> <C-l>
        \ defx#do_action('redraw')
  nnoremap <silent><buffer><expr> <CR>
        \ defx#is_directory() ? defx#do_action('open_directory') : defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns', 'git:mark:indent:icon:filename:type:size:time')
  nnoremap <silent><buffer><expr> K
        \ defx#do_action('new_directory')
  nnoremap <silent><buffer><expr> M
        \ defx#do_action('new_multiple_files')
  nnoremap <silent><buffer><expr> N
        \ defx#do_action('new_file')
  nnoremap <silent><buffer><expr> P
        \ defx#do_action('open', 'pedit')
  nnoremap <silent><buffer><expr> S
        \ defx#do_action('toggle_sort', 'time')
  nnoremap <silent><buffer><expr> c
        \ defx#do_action('copy')
  nnoremap <silent><buffer><expr> cd
        \ defx#do_action('change_vim_cwd')
  nnoremap <silent><buffer><expr> d
        \ defx#do_action('remove')
  nnoremap <silent><buffer><expr> h
        \ defx#do_action('cd', ['..'])
  nnoremap <silent><buffer><expr> i
        \ defx#do_action('multi', [['drop', 'split'], 'quit'])
  nnoremap <silent><buffer><expr> j
        \ line('.') == line('$') ? 'gg' : 'j'
  nnoremap <silent><buffer><expr> k
        \ line('.') == 1 ? 'G' : 'k'
  nnoremap <silent><buffer><expr> m
        \ defx#do_action('move')
  nnoremap <silent><buffer><expr> p
        \ defx#do_action('paste')
  nnoremap <silent><buffer><expr> q
        \ defx#do_action('quit')
  nnoremap <silent><buffer><expr> r
        \ defx#do_action('rename')
  nnoremap <silent><buffer><expr> s
        \ defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
  nnoremap <silent><buffer><expr> x
        \ defx#do_action('execute_system')
  nnoremap <silent><buffer><expr> yy
        \ defx#do_action('yank_path')
  nnoremap <silent><buffer><expr> ~
        \ defx#do_action('cd')
  nnoremap <silent><buffer><expr> o
        \ defx#do_action('open_or_close_tree')
endfunction
