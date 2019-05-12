set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
" source ~/.vimrc

" let g:python_host_prog = '/Users/sigurd/.pyenv/shims/python2.7'
" let g:python3_host_prog = '/Users/sigurd/.pyenv/shims/python3.6'

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

if has("gui_vimr")
  colorscheme flatlandia

  " Shortcuts for moving between tabs
  nnoremap <silent> <D-S-Right> gt
  nnoremap <silent> <D-S-Left> gT
endif

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

let g:ale_virtualenv_dir_names = ['.venv']

" Set up python virtualenvs
" let g:python_host_prog = "/Users/sigurd/.pyenv/versions/neovim2/bin/python"
" let g:python3_host_prog = "/Users/sigurd/.pyenv/versions/neovim3/bin/python"

" Enable ALE completion where available.
let g:ale_completion_enabled = 1

" Paths to python linters
" let g:ale_python_flake8_executable = "/Users/sigurd/.pyenv/versions/neovim3/bin/flake8"
" let g:ale_python_mypy_executable = "/Users/sigurd/.pyenv/versions/neovim3/bin/mypy"
" let g:ale_python_pylint_executable = "/Users/sigurd/.pyenv/versions/neovim3/bin/pylint"

" Paths to python fixers
" let g:ale_python_isort_executable = "/Users/sigurd/.pyenv/versions/neovim3/bin/isort"
" let g:ale_python_black_executable = "/Users/sigurd/.pyenv/versions/neovim3/bin/black"

let g:ale_fixers = {
\   'python': ['isort', 'black'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1
