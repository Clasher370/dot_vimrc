" Setup - - - - - - - - - - 

set nocompatible " Disable Vi behavior

filetype plugin on

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

" Search
set path+=**
set wildmenu
set hlsearch
set incsearch

" Look
syntax enable 

set number
set numberwidth=5
set relativenumber
set ruler "show cursor position
set showcmd "show commands in Normal mode

set cursorline
set colorcolumn=81,101

" Tabs
set tabstop=2
set expandtab
" Fix indentions in rb
set shiftwidth=2

set backspace=2

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set noswapfile
set autowrite     " Automatically :write before running commands

" End Setup - - - - - - - - - - 

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'scrooloose/syntastic'

Plug 'slim-template/vim-slim'

Plug 'keith/rspec.vim'

Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-surround'

Plug 'tpope/vim-rails'

call plug#end()

" Plugin Setup - - - - - - - - - - 

colorscheme gruvbox
set background=dark

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
nnoremap ,t :NERDTree %<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 2
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" End Plugin Setup - - - - - - - - - - 

" Bind - - - - - - - - - - 

" tags for binomo
command! MakeTags !ctags -R -f .tags --languages=Ruby .
set tags+=../.tags
set tags+=.tags

" binds
nnoremap ,w :set path+=**<CR>
nnoremap ,, :nohlsearch<CR>
nnoremap ,a :bp<CR>
nnoremap ,f :bn<CR>
nnoremap ,c :close<CR>
" search under cursor recursive in current directory in rb
nnoremap ,s :grep!<Space><C-R><C-W><Space>**/*.rb<CR>:cw<CR>
" spell
nnoremap ,z :setlocal spell! spelllang=en_us<CR>
" search
command -nargs=+ -complete=file -bar Grep silent! grep! <args>|cwindow|redraw!

" From thoughtbot dotfiles
" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" End Bind - - - - - - - - - - 
