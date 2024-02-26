set number
set relativenumber
set expandtab
set tabstop=4
set shiftwidth=4
set incsearch
set hlsearch
set backspace=indent,eol,start
set autoread
set scrolloff=1
set laststatus=2
set ruler
set wildmenu
set scrolloff=3
set sidescroll=1
set sidescrolloff=2
set display+=lastline
set display+=truncate
set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
set complete-=i
set nocompatible

" Use CTRL-L to clear the highlighting of 'hlsearch' (off by default) and call
" :diffupdate.
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

" Delete comment character when joining commented lines.
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
endif


call plug#begin()
    set encoding=UTF-8

    Plug 'https://github.com/vim-airline/vim-airline' " Status Bar
    Plug 'https://github.com/preservim/nerdtree', { 'on': 'NERDTreeToggle' } " NerdTree
    Plug 'https://github.com/tomasr/molokai' " Molokai color scheme
    Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
    Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
call plug#end()

colorscheme default

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

" airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''

" Config File
nnoremap <silent> <Leader><Leader> :source $MYVIMRC<cr>
nnoremap <silent> <Leader>v :e $MYVIMRC<cr>
