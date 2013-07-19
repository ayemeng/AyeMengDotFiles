" Disable compatiblity with VI
set nocompatible

set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim
set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
Bundle 'klen/python-mode'
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'nvie/vim-flake8'
Bundle 'Lokaltog/powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'davidhalter/jedi-vim'
Bundle 'ervandew/supertab'
Bundle 'kien/ctrlp.vim'
Bundle 'corntrace/bufexplorer'

" Use 256 colors in vim (useful for terminal)
set t_Co=256

" Excluses gui VIM toolbar
set guioptions-=T

" Ignore case in search patterns. Highlight all its matches. Enables incremental search.
set ic hls incsearch

" Syntax highlighting enables Vim to show parts of the text in another font or color.
syntax on 

" Copy indent from current line when starting a new line 
set autoindent

" To enable file type detection, plugin, and indent.
filetype plugin indent on

" Shows the line number, column, and relative position in the file
set ruler

" Ctrl-n turns off highlighting
nmap <silent> <C-n> :noh<CR>

" Remap ":" (akak vim command) to ` to lessen keystrokes.
nnoremap ; :

" Avoid modelines in lieu of vulnerability (http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html)
set modelines=0

" Modify backspace behavior to allow it over autoindent, line breaks, and
" start of an insert
set backspace=indent,eol,start

" Sets the character encoding used inside Vim.
set encoding=utf-8

" Minimal number of screen lines to keep above and below the cursor.
set so=3

" Show (partial) command in the last line of the screen.
set sc

" Command-line completion operates in an enhanced mode.
set wmnu

" Complete till longest common string and complete the next full match.
set wim=list:longest

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

" Maps no higlight to <leader><space>
noremap <leader><space> :noh<cr>

" This maps <TAB> to %
nnoremap <tab> %
vnoremap <tab> %

" This option changes how text is displayed.
set wrap

" 120 since that should take up half of a 24in screen
set textwidth=120

" Sequence of letters which describes how automatic formatting is to be done.
set fo=qrn1

" Remap "j" and "k" with "gj" and "gk"
nnoremap j gj
nnoremap k gk

" Remap <F1> <ESC>
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Remap <Leader>e to NERDTreeToggle in normal mode
noremap <Leader>e :execute 'NERDTreeToggle'<CR>

set background=light
try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

" Set the working directory to the nearest ancestor that contains the marker
" directory/file
let g:ctrlp_working_path_mode = 0

" Exclude files/directories from ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$|\eclipse-bin$\|\build$\|\Library$\',
  \ 'file': '\v\.(exe|so|dll|pyc|DS_Store|project|class|plist|pdf|jpg|swp|png|gif|db|zip|CFUserTextEncoding|xlsx|doc|docx|vmdk|ppt|tar|gz|jpeg|dmg)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
\ }

" Set the root marker for eclipse's metadata folder
let g:ctrlp_root_markers = ['.metadata/']

" Remap esc to 'jk' (http://learnvimscriptthehardway.stevelosh.com/chapters/10.html)
inoremap jk <esc>

" set tab width size of 2 spaces and use spaces over tabs
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2


let g:flake8_ignore="E121,E111,F403,E501"
let g:flake8_max_line_length=119
let g:flake8_builtins="_,apply"


" Run flake8 when a python file is saved
autocmd BufWritePost *.py call Flake8()
autocmd BufWritePost $MYVIMRC source $MYVIMRC
let g:flake8_cmd="/opt/boxen/homebrew/share/python/flake8"
nnoremap <space> za
vnoremap <space> zf

set guifont=Source\ Code\ Pro\ for\ Powerline:h14
" Always display the statusline in all windows
set laststatus=2 " Always display the statusline in all windows
" Hide the default mode text (e.g. -- INSERT -- below the statusline)
set noshowmode
let g:pymode_rope = 0
