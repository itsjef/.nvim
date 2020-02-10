""""""""""""
" vim-plug "
""""""""""""
call plug#begin('~/.nvim/bundle')
" Linting
Plug 'w0rp/ale'

" Autocompletion & snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'mattn/emmet-vim'

" Colorscheme & Display helper
Plug 'joshdick/onedark.vim'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'luochen1990/rainbow'

" Utils & Helpers
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-sandwich'
Plug 'easymotion/vim-easymotion'
Plug 'junegunn/vim-easy-align'

" Fonts & Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'

" Navigation
Plug 'easymotion/vim-easymotion'
if has('nvim-0.4.2')
  if executable('cargo')
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
  else
    Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
  endif
endif
call plug#end()

" DISABLED
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 5
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'markdown', 'defx']
let g:polyglot_disabled = ['markdown']

""""""""""""""""
" => UltiSnips "
""""""""""""""""
let g:UltiSnipsExpandTrigger="<c-j>"

""""""""""""""""""""""""""""""
" => NeoYank
""""""""""""""""""""""""""""""
if has("clipboard")
  try
    let g:neoyank#file = $HOME.'/.nvim/temp_dir/neoyank.txt'
  catch
  endtry
endif

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

nnoremap <silent> <leader>nn :<C-u>Defx -auto-cd -toggle -resume<CR>

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

""""""""""""""""""""""""""""""
" => Lightline
""""""""""""""""""""""""""""""
let g:lightline = {
  \ 'colorscheme': 'onedark',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
  \ },
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name',
  \ },
  \ }

command! LightlineReload call LightlineReload()

function! LightlineReload()
  call lightline#init()
  call lightline#colorscheme()
  call lightline#update()
endfunction

""""""""""""""""""""
" => NERDCommenter
""""""""""""""""""""
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

"""""""""""
" => ALE  "
"""""""""""
" Linting and auto-formatting code
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_maximum_file_size = 500000  " Don't lint large files (> 500KB), it can slow things down
let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_pattern_options = {
\  '\.py$': {
\    'ale_linters': ['flake8'],
\    'ale_fixers': ['black', 'isort', 'add_blank_lines_for_python_control_statements']
\  },
\  '\.go$': {
\    'ale_linters': ['golint'],
\    'ale_fixers': ['goimports']
\  },
\  '\.rs$': {
\    'ale_linters': ['rls'],
\    'ale_fixers': ['rustfmt']
\  },
\  '.*\.md$': {'ale_enabled': 0},
\  '.*\.rst$': {'ale_enabled': 0},
\  '.*\.txt$': {'ale_enabled': 0},
\  '.*\.tex$': {'ale_enabled': 0},
\}

let g:ale_linters_ignore = ['pyls'] " Prevent overlapping flake8
let g:ale_python_flake8_options = "--max-line-length=88" " Comply with Black formatter
" let g:ale_fix_on_save = 1

" Navigation
nmap <silent> ]s <Plug>(ale_next_wrap)
nmap <silent> [s <Plug>(ale_previous_wrap)
nmap <silent> <leader>= <Plug>(ale_fix)

""""""""""""""
" => vim-go  "
""""""""""""""
let g:go_fmt_autosave = 0
let g:go_mod_fmt_autosave = 0

"""""""""""""
" => EasyAlign
"""""""""""""
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

""""""""""""
" => rainbow
""""""""""""
let g:rainbow_active = 1

" ----------------------------------------------------------------------------
" coc.nvim
" ----------------------------------------------------------------------------
if has_key(g:plugs, 'coc.nvim')
  function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
  endfunction

  inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
  inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
  " Use <c-space> to trigger completion.
  inoremap <silent><expr> <c-space> coc#refresh()

  " Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
  " Coc only does snippet and additional edit on confirm.
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

  function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
      execute 'h' expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  nnoremap <silent> K :call <SID>show_documentation()<CR>

  let g:coc_global_extensions = ['coc-python', 'coc-snippets', 'coc-json', 'coc-yaml']

  augroup coc-config
    autocmd!
    autocmd VimEnter * nmap <silent> gd <Plug>(coc-definition)
    autocmd VimEnter * nmap <silent> gy <Plug>(coc-type-definition)
    autocmd VimEnter * nmap <silent> gi <Plug>(coc-implementation)
    autocmd VimEnter * nmap <silent> gr <Plug>(coc-references)
  augroup END
endif

" --------------------------
" vim-clap
" --------------------------
nnoremap <silent> <C-p> :<C-u>Clap files<CR>	
nnoremap <silent> <leader>/ :<C-u>Clap grep<CR>	
