" disable vi compatiblity (think iMproved)
set nocompatible
" required by vundle
filetype off

" Set runtime path for vim
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" Install vim plugins via vundle
call vundle#begin()
Bundle 'Lokaltog/powerline'
Bundle 'SirVer/ultisnips'
Bundle 'altercation/vim-colors-solarized'
Bundle 'corntrace/bufexplorer'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'

" required by vundle, enables filetype detection, plugin, and indent
call vundle#end()
filetype plugin indent on

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

" supertab options override
let g:SuperTabDefaultCompletionType = "context"

" ctrlp option override
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|Trash)$|\v[\/](Library|Pictures|Movies|Applications)$',
  \ 'file': '\v\.(exe|so|dll|pyc|DS_Store|project|class|plist|pdf|jpg|swp|png|gif|db|zip|CFUserTextEncoding|xlsx|doc|docx|vmdk|ppt|tar|gz|jpeg|dmg|ics|vbox|lprof)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }

" pymode options override

" ag options override
let g:agprg = "/opt/boxen/homebrew/bin/ag --column"
let g:ctrlp_working_path_mode = 0
let g:ctrlp_by_filename = 1

" vim-coffee-script override
let coffee_compiler = '/opt/boxen/nodenv/shims/coffee'
let coffee_linter = '/opt/boxen/nodenv/shims/coffeelint'

" NERDTree override
let NERDTreeIgnore = ['\.pyc$']

"  python-mode override
let g:pymode_lint_checker = "pyflakes"
let g:pymode_lint_mccabe_complexity = 10
let g:pymode_lint_write = 0

let g:UltiSnipsUsePythonVersion = 2

" key mapping overrides
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

autocmd Filetype python setlocal expandtab tabstop=2 shiftwidth=2
au FileType python set omnifunc=pythoncomplete#Complete
