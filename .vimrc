set nocompatible

" append paths to runtime
set rtp+=~/.vim/bundle/vundle/
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" install plugins via vundle
filetype off
call vundle#begin()
Bundle 'Lokaltog/powerline'
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

call vundle#end()
filetype plugin indent on
syntax on


" vim overrides
set ruler
set visualbell
set encoding=utf-8
set relativenumber
set background=light
set tw=0
set guifont=Source\ Code\ Pro\ for\ Powerline:h14
set noautochdir
set laststatus=2 
set completeopt=menu,longest,preview
set pumheight=5
set splitbelow

" excludes toolbar in gui vim
set guioptions-=T

" enables ignorecase, highlight and incremental search
set ic hls incsearch

" enable backspace key
set backspace=indent,eol,start

" enable screen line of cursor
set cul cuc

" enable noshow for powerline
set noshowmode

" attepmpt to use solarized
try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry

" vim keymap overrides
inoremap jk <esc>
nnoremap j gj
nnoremap k gk
nnoremap ; :
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" plugin specific overrides
nnoremap <space> za
vnoremap <space> zf
noremap <Leader>e :execute 'NERDTreeToggle'<CR>
noremap <Leader>s :Ag 
noremap <leader><space> :noh<cr>

" ctrlp overrides
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|Trash)$|\v[\/](Library|Pictures|Movies|Applications)$',
  \ 'file': '\v\.(exe|so|dll|pyc|DS_Store|project|class|plist|pdf|jpg|swp|png|gif|db|zip|CFUserTextEncoding|xlsx|doc|docx|vmdk|ppt|tar|gz|jpeg|dmg|ics|vbox|lprof)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }
let g:ctrlp_match_window = 'bottom,order:ttb,min:5,results:5'
let g:ctrlp_mruf_max = 5
let g:ctrlp_working_path_mode = 0

" ag overrides
let g:aghighlight = 1
let g:agprg = '/opt/boxen/homebrew/bin/ag --column'

" synastic overrides
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_rcfile = '~/.pylintrc'
let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1

" python-mode overrides
let g:pymode_lint = 0
let g:pymode_syntax_print_as_function = 1

" supertab overrides
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'
let g:SuperTabClosePreviewOnPopupClose = 1

" set working directory
cd ~/workspace 
