set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" Basic config
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set expandtab     " Use spaces, not tabs

syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set mouse=a              " enable mouse for All modes

" Ignore certain files from open menues
set wildignore+=*/node_modules/*,*.swp,*.bak,*.pyc,*.class,*.o,*.obj,.git,.dSYM
set title                " change the terminal's title
set noerrorbells         " don't beep

" Don't use backup files
set nobackup
set noswapfile

syntax on

" Only autocomplete longest common
set completeopt=menu,longest
set wildmode=longest,list,full
set wildmenu

colorscheme nord

let mapleader = ","

" Ignore pyc and __pycache__ in NERDTree menues
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
nnoremap <leader>n :NERDTreeFocus<cr>

if has("gui_vimr")
  " Shortcuts for moving between tabs
  nnoremap <silent> <D-S-Right> gt
  nnoremap <silent> <D-S-Left> gT
endif

let g:ale_virtualenv_dir_names = ['.venv']

" Disable completion through ale, I use coc instead
let g:ale_completion_enabled = 0
let g:ale_sign_error = "››"
let g:ale_sign_warning = "››"
let g:ale_sign_highlight_linenrs = 1

" Enable autofixing on save using ale
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'python': ['isort', 'black'],
\   'javascript': ['prettier'],
\   'c': ['clang-format'],
\   'h': ['clang-format'],
\   'sql': ['pgformatter'],
\}
let g:ale_sql_pgformatter_options = '-w 80 -u 1'

let g:sql_type_default = 'pgsql'

"
" Coc config
"

" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Always show the sign column where git status is shown
set signcolumn=yes
autocmd FileType nerdtree setlocal signcolumn=no " Not in NERDTree

" Pytest
nmap <silent><Leader>f <Esc>:Pytest file<CR>
nmap <silent><Leader>c <Esc>:Pytest class<CR>
nmap <silent><Leader>m <Esc>:Pytest method<CR>
