" Disable compatiblity with VI
set nocompatible

" Set runtime path for vim
set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
set rtp+=~/.vim/bundle/vundle/

" Install vim plugins via vundle
call vundle#rc()
Bundle 'Lokaltog/powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'corntrace/bufexplorer'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'kchmck/vim-coffee-script'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'mattn/emmet-vim'
Bundle 'msanders/snipmate.vim'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

" set default working directory to workspace
cd ~/workspace 
" Sets the character encoding used inside Vim.
set encoding=utf-8

" Use 256 colors in vim (useful for terminal)
set t_Co=256

" Excluses gui VIM toolbar
set guioptions-=T

" Ignore case in search patterns. Highlight all its matches. Enables incremental search.
set ic hls incsearch

" Syntax highlighting enables Vim to show parts of the text in another font or color.
syntax on 

" To enable file type detection, plugin, and indent.
filetype on
filetype plugin indent on

" Shows the line number, column, and relative position in the file
set ruler

" fix backspace behavior 
set backspace=indent,eol,start

" Use visual bell instead of beeping.
set vb

" Highlight the screen line of the cursor with CursorLine
set cul

" Show the line number relative to the line with the cursor in front of each line.
set rnu

" The case of normal letters is ignored.
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper case characters.
set scs

" This means that all matches in a line are substituted instead of one.
set gd
" 120 since that should take up half of a 24in screen
set textwidth=120

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

" set tab width size of 2 spaces and use spaces over tabs
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

" Set GUI font
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set noautochdir
" Always display the statusline in all windows
set laststatus=2 " Always display the statusline in all windows

set completeopt=menuone,longest,preview
" supertab options override
let g:SuperTabDefaultCompletionType = "context"

" ctrlp option override
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|Trash)$|\v[\/](Library|Pictures|Movies|Applications)$',
  \ 'file': '\v\.(exe|so|dll|pyc|DS_Store|project|class|plist|pdf|jpg|swp|png|gif|db|zip|CFUserTextEncoding|xlsx|doc|docx|vmdk|ppt|tar|gz|jpeg|dmg|ics|vbox)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }

" pymode options override
let g:pymode_rope = 0
let g:pymode_virtualenv = 1
let g:pymode_lint_onfly = 1
let g:pymode_lint_ignore = "E501"
let g:pymode_lint = ''

" ag options override
let g:agprg = "/opt/boxen/homebrew/bin/ag --column"
let g:ctrlp_working_path_mode = 0
