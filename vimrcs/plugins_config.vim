""""""""""""
" vim-plug "
""""""""""""
if empty(glob("~/.local/share/nvim/site/autoload/plug.vim"))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.nvim/bundle')
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'machakann/vim-sandwich'
Plug 'easymotion/vim-easymotion'
Plug 'ap/vim-buftabline'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

" Colorscheme & Display helper
Plug 'joshdick/onedark.vim'
Plug 'Yggdroot/indentLine'
Plug 'ryanoasis/vim-devicons'
Plug 'kshenoy/vim-signature'
Plug 'mhinz/vim-signify'
Plug 'sheerun/vim-polyglot', {'do': './build'}

" Utils
Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }

" Autocompletion and snippets
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'

Plug 'ncm2/ncm2-jedi', { 'for': 'python' }

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

Plug 'ncm2/ncm2-ultisnips'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()

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
let g:ale_pattern_options = {
\  '*': ['remove_trailing_lines', 'trim_whitespace'],
\  '\.py$': {
\    'ale_linters': ['flake8', 'pyls'],
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
