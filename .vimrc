call pathogen#infect()

" Disable compatiblity with VI
set nocompatible

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

" Show the line number relative to the line with the cursor in front of	each line.
set rnu

" The case of normal letters is ignored.
set ignorecase

" Override the 'ignorecase' option if the search pattern contains upper	case characters.
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

colorscheme wombat256mod

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

" Unmap ctrl-z from undo to nothing
unmap <C-z>

" Set tab width to be 4 spaces
set tabstop=4

" Convert tabs into spaces
set expandtab

" Use 256 colors in vim (useful for terminal)
set t_Co=256
