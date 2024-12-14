" Show line numbers with relative numbering
set number relativenumber

" General tab settings
set tabstop=4               " number of visual spaces per TAB
set softtabstop=4           " number of spaces in tab when editing
set shiftwidth=4            " number of spaces to use for autoindent
set expandtab               " expand tab to spaces so that tabs are spaces

" Search settings
set incsearch               " search incrementally as you type
set hlsearch                " highlight search matches
set ignorecase smartcase    " ignore case in general, but become case-sensitive when uppercase is present

" File format and encoding settings
set fileformats=unix,dos    " fileformats to use for new files 
set fileencoding=utf-8      " encoding to use when writing files
set encoding=utf-8          " encoding to use for display

"
set backspace=indent,eol,start

"
set autoread

"
set laststatus=2

"
set ruler

"
set wildmenu

" Scroll settings
set scrolloff=3             " minimum lines to keep above and below cursor when scrolling
set sidescroll=1
set sidescrolloff=2

set display+=lastline

set display+=truncate

set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

" Turn off vi compatibility
set nocompatible

" Show current line where the cursor is
set cursorline

" Use CTRL-L to clear the highlighting of 'hlsearch' (off by default) and call
" :diffupdate.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Delete comment character when joining commented lines.
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
endif

" Install vim-plug if not already installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
    set encoding=UTF-8

    Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
    Plug 'https://github.com/vim-airline/vim-airline' " Status Bar
    Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' } " NerdTree
    Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
    Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
call plug#end()

"colorscheme default
colorscheme catppuccin-mocha " catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha

" NERDTree
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-.> :NERDTreeCWD<CR>
nnoremap <C-c> :NERDTreeClose<CR>
nnoremap <C-n> :NERDTree<CR>
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="-"


" air-line
let g:airline_powerline_fonts = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" Install plugins system-wide
let g:nvim_system_wide = 1

" Airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" Open config file for editing
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<cr>
nnoremap <silent> <Leader>v :e $MYVIMRC<cr>
