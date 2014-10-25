set nocompatible

" append paths to runtime
set rtp+=~/.vim/bundle/vundle/

" install plugins via vundle
filetype off
call vundle#begin()
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'corntrace/bufexplorer'
Bundle 'ervandew/supertab'
Bundle 'gmarik/vundle'
Bundle 'jmcantrell/vim-virtualenv'
Bundle 'rking/ag.vim'
Bundle 'kien/ctrlp.vim'
Bundle 'klen/python-mode'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'majutsushi/tagbar'
call vundle#end()
filetype plugin indent on
syntax on


" vim overrides
set background=light
set completeopt=menu,longest,preview
set encoding=utf-8
set laststatus=2 
set noautochdir
set pumheight=5
set relativenumber
set ruler
set splitbelow
set t_Co=256
set termencoding=utf-8
set tw=0
set visualbell
set expandtab 
set shiftwidth=2 
set softtabstop=2 
set tabstop=2

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
noremap <Leader>r :execute 'source $MYVIMRC'<CR>
noremap <leader><space> :noh<CR>
nmap <Leader>t :TagbarToggle<CR>


" ctrlp overrides
let g:ctrlp_by_filename = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|Trash)$|\v[\/](Library|Pictures|Movies|Applications)$',
  \ 'file': '\v\.(exe|so|dll|pyc|DS_Store|project|class|plist|pdf|jpg|swp|png|gif|db|zip|CFUserTextEncoding|xlsx|doc|docx|vmdk|ppt|tar|gz|jpeg|dmg|ics|vbox|lprof|otf|swp)$',
  \ 'link': 'SOME_BAD_SYMBOLIC_LINKS'
\ }
let g:ctrlp_match_window = 'bottom,order:ttb,min:5,results:5'
let g:ctrlp_mruf_max = 5
let g:ctrlp_working_path_mode = 0
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_max_depth = 10
let g:ctrlp_open_new_file = 't'

" ag overrides
let g:aghighlight = 1
let g:agprg = 'ag --color-match --column --python' 
let g:agformat="%f:%l:%m"


" synastic overrides
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_python_pylint_rcfile = '~/.pylintrc'
let g:syntastic_loc_list_height = 5
let g:syntastic_always_populate_loc_list = 1

" python-mode overrides
let g:pymode_indent = 0
let g:pymode_lint = 0
let g:pymode_syntax_print_as_function = 1

" supertab overrides
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = '<c-n>'
let g:SuperTabClosePreviewOnPopupClose = 1

" fix indentation for python files
autocmd FileType python setlocal expandtab shiftwidth=2 softtabstop=2 tabstop=2

" vim-virtualenv overrides
let g:virtualenv_auto_activate = 1

" vim-airline overrides
let g:airline_powerline_fonts = 1

" gui overrides
if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

" set tags=/Users/ayemeng/workspace/tags
" set working directory
cd ~/workspace 
