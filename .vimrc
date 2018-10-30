" Setup - - - - - - - - - -

set nocompatible " Disable Vi behavior
let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

filetype plugin on

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:gitgutter_grep = 'ag'
endif

" Search
set path+=**
set wildmenu
set hlsearch
set incsearch

" Look
syntax enable

" set numberwidth=5
set ruler "show cursor position
set showcmd "show commands in Normal mode

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
set updatetime=100
set signcolumn=no
set mouse=""

" Gitcommit
autocmd Filetype gitcommit setlocal spell textwidth=72

" Buffer setup
set hidden

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
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

Plug 'tpope/vim-rails'

" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'thoughtbot/vim-rspec'

Plug 'leafgarland/typescript-vim'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

call plug#end()

" Plugin Setup - - - - - - - - - -

set background=light
let g:gruvbox_italic=1
colorscheme gruvbox

map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1
nnoremap ;t :NERDTree %<CR>

nnoremap ;gb :Gblame<CR>
nnoremap ;gs :Gstatus<CR>
nnoremap ;gd :Gdiff<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_loc_list_height = 2
let g:syntastic_check_on_wq = 0
let g:syntastic_ruby_checkers = ['mri', 'rubocop']

" let g:airline_theme='gruvbox'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#formatter = 'unique_tail'

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" FZF fuzzy filesystem search
nnoremap ;f :FZF<CR>
nnoremap ;b :Buffers<CR>

let g:fzf_colors =
      \ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" End Plugin Setup - - - - - - - - - -

" Bind - - - - - - - - - -

" tags for binomo
command! MakeTags !ctags -R -f .tags --languages=Ruby .
set tags+=../.tags
set tags+=.tags

" binds
nnoremap ;p :set path+=**<CR>
nnoremap ;h :nohlsearch<CR>
nnoremap ;c :close<CR>
nnoremap ;o <C-W>o<CR>
" insert_m new line
nnoremap ;<CR> o<Esc>
" insert_m space
nnoremap ;<Space> i<Space><Esc>l
" buffer moves
nnoremap ;j :bp<CR>
nnoremap ;; :bn<CR>
nnoremap ;d :bd<CR>
" search under cursor recursive in current directory in rb
nnoremap ;s :grep!<Space><C-R><C-W><Space>**/*.rb<CR>:cw<CR>
" search manualy
command -nargs=+ -complete=file -bar Grep silent! grep! <args>|cwindow|redraw!
" togging
nnoremap ,c :set cursorcolumn!<CR>
nnoremap ,l :set cursorline!<CR>
nnoremap ,r :set relativenumber!<CR>
nnoremap ,n :set number!<CR>
"column hl
nnoremap ,sc :set colorcolumn=81,101<CR>
nnoremap ,uc :set colorcolumn=<CR>
" rspec
nnoremap ;r :!bin/rspec % -fd --order rand<CR>

" From thoughtbot dotfiles
" Get off my lawn
nnoremap <Left> :echoe "Use key 'h'"<CR>
nnoremap <Right> :echoe "Use key 'l'"<CR>
nnoremap <Up> :echoe "Use key 'k'"<CR>
nnoremap <Down> :echoe "Use key 'j'"<CR>

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Switch between the last two files
nnoremap <Leader><Leader> <C-^>

" End Bind - - - - - - - - - -
