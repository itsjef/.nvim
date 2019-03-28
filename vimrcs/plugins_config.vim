""""""""""""
" vim-plug "
""""""""""""
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.nvim/bundle')
" Linting
Plug 'w0rp/ale'

" Autocompletion & snippets
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'

Plug 'ncm2/ncm2-jedi', { 'for': 'python' }
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'mattn/emmet-vim'

" Colorscheme & Display helper
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Utils & Helpers
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'machakann/vim-sandwich'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }

" Fonts & Icons
Plug 'ryanoasis/vim-devicons'
Plug 'kristijanhusak/defx-icons'
Plug 'kristijanhusak/defx-git'
call plug#end()

" DISABLED
let g:indentLine_fileTypeExclude = ['markdown']
let g:polyglot_disabled = ['markdown']

"""""""""""""""""""""
" => Autocompletion "
"""""""""""""""""""""
set completeopt=menuone,noselect,noinsert
" Deoplete
" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('max_list', 15)
"
" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap K <Plug>(rust-doc)
" ALE
" let g:ale_completion_enabled = 1
" let g:ale_completion_max_suggestions=10
" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()

"""""""""""""
" => Denite "
"""""""""""""
nnoremap <silent> <C-p> :<C-u>Denite file/rec<CR>
nnoremap <silent> <leader>/ :<C-u>Denite grep:. -mode=normal -no-empty<CR>
nnoremap <silent> <leader><space>/ :<C-u>DeniteBufferDir grep:. -mode=normal -no-empty<CR>
nnoremap <silent> <leader>fw :<C-u>DeniteCursorWord grep:. -mode=normal -highlight-matched-char=None<CR>

if executable('ag')
  " Grep
  call denite#custom#var('grep', 'command', ['ag'])
  call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
  call denite#custom#var('grep', 'pattern_opt', [])

  " File/rec
  call denite#custom#var('file/rec', 'command',
    \ ['ag' , '--hidden', '--follow', '--vimgrep', '-S', '-g', ''])
endif

""""""""""""""""
" => SuperTab
""""""""""""""""
let g:SuperTabDefaultCompletionType = "<tab>"

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
  \ 'columns': 'git:icons:filename:type',
  \ 'winwidth': 35,
  \ 'split': 'vertical',
  \ 'direction': 'botright',
  \ })

call defx#custom#column('filename', {
  \ 'min_width': 20,
  \ 'max_width': 30,
  \ })

nnoremap <silent> <leader>nn :<C-u>Defx -auto-cd -toggle<CR>

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
        \ defx#is_directory() ? defx#do_action('open') : defx#do_action('multi', ['drop', 'quit'])
  nnoremap <silent><buffer><expr> <Space>
        \ defx#do_action('toggle_select') . 'j'
  nnoremap <silent><buffer><expr> C
        \ defx#do_action('toggle_columns', 'git:mark:filename:type:size:time')
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
  \   'gitbranch': 'gitbranch#name'
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
let g:ale_python_flake8_options = "--max-line-length=120"
" let g:ale_fix_on_save = 1

" Action mapping
nnoremap <silent> K :ALEHover<CR>
nnoremap <silent> gd :ALEGoToDefinition<CR>

" Navigation
nmap <silent> ]s <Plug>(ale_next_wrap)
nmap <silent> [s <Plug>(ale_previous_wrap)
nmap <silent> <leader>= <Plug>(ale_fix)
