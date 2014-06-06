" disable vi compatiblity (think iMproved)
set nocompatible

" Set runtime path for vim
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Install vim plugins via vundle
filetype off
call vundle#begin()
Bundle 'Lokaltog/powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'corntrace/bufexplorer'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'

" required by vundle, enables filetype detection, plugin, and indent
call vundle#end()
filetype plugin indent on

" Sets the character encoding used inside Vim.
set encoding=utf-8

" set default working directory to workspace
cd ~/workspace 

" Excluses gui VIM toolbar
set guioptions-=T

" Ignore case in search patterns. Highlight all its matches. Enables incremental search.
set ic hls incsearch

" Shows the line number, column, and relative position in the file
set ruler

" fix backspace behavior 
set backspace=indent,eol,start

" Use visual bell instead of beeping.
set vb

" Highlight the screen line of the cursor with CursorLine
set cul cuc

" Show the line number relative to the line with the cursor in front of each line.
set rnu

" This means that all matches in a line are substituted instead of one.
set gd

" Don't show mode since it will be shown by powerline
set noshowmode

set background=light
try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

" keymap overrides
inoremap jk <esc>
nnoremap <space> za
vnoremap <space> zf
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>
"" Remap <Leader>e to NERDTreeToggle in normal mode
noremap <Leader>e :execute 'NERDTreeToggle'<CR>
noremap <Leader>s :Ag 
nnoremap j gj
nnoremap k gk
noremap <leader><space> :noh<cr>
nmap <silent> <C-n> :noh<CR>
nnoremap ; :
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" set tab width size of 2 spaces and use spaces over tabs
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set tw=0

" Set GUI font
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set noautochdir
" Always display the statusline in all windows
set laststatus=2 " Always display the statusline in all windows
set completeopt=menuone,longest,preview

" Setup code folding
set foldmethod=indent
set foldlevel=99

" ctrlp overrides
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|Trash)$|\v[\/](Library|Pictures|Movies|Applications)$',
  \ 'file': '\v\.(exe|so|dll|pyc|DS_Store|project|class|plist|pdf|jpg|swp|png|gif|db|zip|CFUserTextEncoding|xlsx|doc|docx|vmdk|ppt|tar|gz|jpeg|dmg|ics|vbox|lprof)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }
let g:ctrlp_match_window = 'bottom,order:ttb,min:5,results:5'
let g:ctrlp_mruf_max = 10
let g:ctrlp_working_path_mode = 0

" ag overrides
let g:agprg = "/opt/boxen/homebrew/bin/ag --column"

" python-mode overrides
let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_mccabe_complexity = 10
let g:pymode_lint_write = 0

au FileType python set omnifunc=pythoncomplete#Complete
