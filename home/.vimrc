" We're running Vim, not Vi!
set nocompatible

" Use pathogen
execute pathogen#infect()

" Set the leader key
let mapleader=","

" Tag list setup
map t :TagbarToggle<CR>

" Nerd tree setup
map f :NERDTreeToggle<CR>

" Use correct shell
set shell=/bin/sh

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

" Ignore certain files from open menues
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.obj,.git,.dSYM
set title                " change the terminal's title
set noerrorbells         " don't beep

" Don't use backup files
set nobackup
set noswapfile

filetype plugin indent on

" Spesific settings for file types
autocmd filetype python set expandtab

if &t_Co >= 256 || has("gui_running")
    colorscheme jellybeans
endif

if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
endif

" Highlight spaces
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.

" Hide tab highlighting in make, html and xml files
autocmd filetype html,xml,make,java set list!

" Only autocomplete longest common
set completeopt=menu,longest

" Highlighting for cuda files
au BufNewFile,BufRead *.cu set ft=cu

" Remove toolbar
set guioptions-=T

" Sets the font and size
if has("gui_macvim")
    set guifont=Menlo\ Regular:h10
endif

" Quit vim if only nerd tree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Word wrap?
set linebreak

if has("gui_macvim")
    let macvim_hig_shift_movement = 1
    set fullscreen
endif

let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

"autocmd FileType *
"    \ if &completefunc != '' |
"    \   call SuperTabChain(&completefunc, "<c-x><x-u>") |
"    \   call SuperTabSetDefaultCompletionType("<c-x><c-o>") |
"    \ endif

"ruby
autocmd FileType ruby,eruby set completefunc=rubycomplete#Complete
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1

" JQuery syntax
let g:used_javascript_libs = 'jquery,backbone'

" Color scheme
if has("gui_macvim") || has('gui_running')
    set background=dark
    colorscheme solarized
endif

" Tab completion on open
set wildmenu
set wildmode=list:longest

