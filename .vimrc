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
Plugin 'tpope/vim-fugitive'
"Ruby
Plugin 'vim-ruby/vim-ruby'
"Javascript
Plugin 'pangloss/vim-javascript'
"Meteor
Plugin 'Slava/tern-meteor'
"Erlang
Plugin 'jimenezrick/vimerl'
"C
Plugin 'vim-scripts/c.vim'
"Python
"R
"Plugin 'jcfaria/Vim-R-plugin'
"Bash
"Latex
"Easy surround
Plugin 'tpope/vim-surround'
"Multiple cursors
Plugin 'terryma/vim-multiple-cursors'
"fuzzy finder
Plugin 'kien/ctrlp.vim'
"Buffer explorer simplified
Plugin 'jlanzarotta/bufexplorer'
"Syntax checker
Plugin 'scrooloose/syntastic'
"Nerdtree
Plugin 'scrooloose/nerdtree'
"Autocomplete, requires python to work
Plugin 'Valloric/YouCompleteMe'
"
call vundle#end()

syntax on
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin on
filetype plugin indent on       " load file type plugins + indentation


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" GUI configuration
"""
if has("gui_running")				" GUI Vim settings
    set guioptions=agimtTr                      " Show 'Menu' + 'Toolbar' + 'Right Scrollbar'
    ":source ~/.vim/bundle/vim-colorschemes/Chasing_Logic.vim
    colorscheme Chasing_Logic		        " Set the color scheme
    set background=dark
    "set guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 9  " Set the nice Powerline font so Airline could make use of it
    set lines=999 columns=999
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"call pathogen#infect()

"set runtimepath^=~/.vim/bundle/ctrlp.vim
runtime macros/matchit.vim

"" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

"" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" Buffer
set hidden 			" change buffers without saving them
"
map <C-Tab> 		:bnext<CR>
map <C-S-Tab> 		:bprevious<CR>
map n<C-Tab> 		:sbnext<CR>
map n<C-S-Tab> 		:sbprevious<CR>
map <C>x		:bdelete<CR>
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>


"" Settings
set noesckeys " Get rid of the delay when hitting esc
set ttimeout " Same as above
set ttimeoutlen=1
set noswapfile " I dont like backups nor swap files
set nobackup " Don't make a backup before overwriting a file.
set nowritebackup " And again.
set directory=$HOME/.vim/tmp " Keep swap files in one location
set backupdir=$HOME/.vim/tmp
set hlsearch!

nnoremap <F4> :set hlsearch!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Look
"""
set number " Show line #s.
set ruler " Show cursor position.
set title " Set the terminal's title.
colorscheme desert
:highlight LineNr ctermfg=grey
:highlight LineNr guifg=#050505
:set cursorline
"" Highlight groups
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
"" Whitespace
set autoindent
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
nnoremap + maO<esc>`a
nnoremap - mao<esc>`a
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Clipboard
"""
"copy
vmap <F7> "+ygv"zy`>
"paste (Shift-F7 to paste after normal cursor, Ctrl-F7 to paste over visual selection)
nmap <F7> "zgP
nmap <S-F7> "zgp
imap <F7> <C-r><C-o>z
vmap <C-F7> "zp`]
cmap <F7> <C-r><C-o>z
"copy register

autocmd FocusGained * let @z=@+
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

let mapleader = "_"

nmap J jjjjj
nmap K kkkkk
nmap QQ :q<CR>
nmap WQ :wq<CR>
nmap WW :w<CR>
nmap <Tab> %
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline configuration
"""
set laststatus=2
"let g:airline_powerline_fonts = 1			" Use Powerline fonts to show beautiful symbols
let g:airline_inactive_collapse = 0			" Do not collapse the status line while having multiple windows
let g:airline#extensions#whitespace#enabled = 0         " Do not check for whitespaces
let g:airline#extensions#tabline#enabled = 1		" Display tab bar with buffers
let g:airline#extensions#branch#enabled = 1		" Enable Git client integration
let g:airline#extensions#tagbar#enabled = 1		" Enable Tagbar integration
let g:airline#extensions#hunks#enabled = 1		" Enable Git hunks integration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree Configuration
"""
map <F3> :NERDTreeToggle<CR>
if has("gui_running")				" GUI Vim settings
    autocmd vimenter * NERDTree
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Cvim Configuration
"""
"" compilation
nmap cb :! ./script
"" comments
nmap cc \cc
	"code to comment
nmap co \co
	"comment to code
"" statements
map cw \swh
	"while block
map cif \sif
	"if block
map cel \sel
	"else block
map csw \ss
	"switch
map cscs \sc
	"case
"" idioms
map cf \i0
	"for starting at 0
map cfn \in
	"for starting at n
map cpr \ipr
	"printf
map csc \isc
	"scanf
map cm \im
	"main
map cfu \if
	"function
"" preprocessor
map ci \pg
	"include global (#include<...>)
map cil \pl
	"include local (#include"...")
"" c++
map cstd \+uns
map class \+c
	"class
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rails Configuration
"""
"" Econtroller
nmap Renv :Eenvironment<CR>
nmap Renv :Econtroller
nmap Rjsc :Ejavascript
nmap Rmod :Emodel
nmap Rsch :Eschema<CR>
"" Rake
nmap Rak :Rake
"" Script
nmap Rser :Rserver<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BufExplorer Configuration
"""
"" Access
nmap be :BufExplorer<CR>
nmap bes :BufExplorerHorizontalSplit<CR>
nmap bev :BufExplorerVerticalSplit<CR>jj
"" Configuration
let g:bufExplorerDefaultHelp=0		" Do not show default help
let g:bufExplorerFindActive=1		" Go to active window when selecting
let g:bufExplorerSplitRight=1 		" Split right
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
