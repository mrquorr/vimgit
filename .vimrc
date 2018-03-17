"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible                " choose no compatibility with legacy vi
" Required Vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"
"Vundle
Plugin 'VundleVim/Vundle.vim'
"Pretty status line
Plugin 'bling/vim-airline'
"Git plugin
"Plugin 'tpope/vim-fugitive'
"Ruby
"Plugin 'vim-ruby/vim-ruby'
"Javascript
"Plugin 'pangloss/vim-javascript'
"Meteor
"Plugin 'Slava/tern-meteor'
"Erlang
"Plugin 'jimenezrick/vimerl'
"C
"Plugin 'vim-scripts/c.vim'
"Python
"R
"Plugin 'jcfaria/Vim-R-plugin'
"Bash
"Latex
"Easy surround
"Plugin 'tpope/vim-surround'
"Multiple cursors
"Plugin 'terryma/vim-multiple-cursors'
"fuzzy finder
Plugin 'kien/ctrlp.vim'
"Buffer explorer simplified
Plugin 'mildred/vim-bufmru'
"Syntax checker
Plugin 'scrooloose/syntastic'
"Nerdtree
Plugin 'scrooloose/nerdtree'
"Autocomplete, requires python to work
"Plugin 'Valloric/YouCompleteMe'
"Acountability
"Plugin 'wakatime/vim-wakatime'
"mapping pairs
"Plugin 'tpope/vim-unimpaired'
"
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"syntax on
"syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin on
filetype plugin indent on       " load file type plugins + indentation
runtime macros/matchit.vim

"" View
set number " Show line #s.
set ruler " Show cursor position.
set title " Set the terminal's title.
"colorscheme desert

"" Highlight groups
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
set cursorline
highlight LineNr ctermfg=grey
highlight LineNr guifg=#050505
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

"" Whitespace
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
set list listchars=tab:→\ ,trail:·

"" Settings
set autoindent
set nowrap                             " don't wrap lines
set expandtab                          " change tab to space
set tabstop=2                          " change tab and indentation to 2 spaces
set shiftwidth=2                       " change indentation to 2 spaces
set backspace=indent,eol,start         " backspace through everything in insert mode
set noesckeys " Get rid of the delay when hitting esc
set ttimeout " Same as above
set ttimeoutlen=1
set noswapfile " I dont like backups nor swap files
set nobackup " Don't make a backup before overwriting a file.
set nowritebackup " And again.
set directory=$HOME/.vim/tmp " Keep swap files in one location
set backupdir=$HOME/.vim/tmp

"" Mappings
nnoremap <F4> :set hlsearch!<CR>
"nnoremap + maO<esc>`a
"nnoremap - mao<esc>`a
nmap J jjjjj
nmap K kkkkk
nmap QQ :q<CR>
nmap WQ :wq<CR>
nmap WW :w<CR>
"nmap <Tabl> %

"" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Undo
set undodir=~/.vim/undodir
set undofile
"set undolevels = 1000       " max number of changes that can be undone
"set undoreload = 10000      " max number lines to save for undo on a buffer reload

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic configuration
"""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline configuration
"""
set laststatus=2
"let g:airline_powerline_fonts = 1       " Use Powerline fonts to show beautiful symbols
let g:airline_inactive_collapse = 0                     " Do not collapse the status line while having multiple windows
let g:airline#extensions#whitespace#enabled = 0         " Do not check for whitespaces
let g:airline#extensions#tabline#enabled = 1  " Display tab bar with buffers
"let g:airline#extensions#branch#enabled = 1   " Enable Git client integration
let g:airline#extensions#tagbar#enabled = 1   " Enable Tagbar integration
"let g:airline#extensions#hunks#enabled = 1  " Enable Git hunks integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree Configuration
"""
map <F3> :NERDTreeToggle<CR>
if has("gui_running")                           " GUI Vim settings
    autocmd vimenter * NERDTree
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufMRU Configuration
"""
" Alt-B or Alt-Shift-B to navigate buffers in insert mode and normal mode
imap <A-B> <C-O>:BufMRUPrev<CR>
imap <A-b> <C-O>:BufMRUNext<CR>
map <A-B> :BufMRUPrev<CR>
map <A-b> :BufMRUNext<CR>
nmap <Esc>B :BufMRUPrev<CR>
nmap <Esc>b :BufMRUNext<CR>

" Tab and Shift-Tab in normal mode to navigate buffers
map <Tab> :BufMRUNext<CR>
map <S-Tab> :BufMRUPrev<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
