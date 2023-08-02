filetype off

syntax on
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin on
filetype plugin indent on       " load file type plugins + indentation

"" View
set number
set relativenumber " Show line #s relative to cursor.
set ruler " Show cursor position.
set title " Set the terminal's title.
colorscheme desert

"" Highlight groups
set cursorline
highlight LineNr ctermfg=grey
highlight LineNr guifg=#050505
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

"" Font size
if has("gui_running")
  if has("gui_gtk2")
    :set guifont=Luxi\ Mono\ 11
  elseif has("x11")
" Also for GTK 1
    :set guifont=*-lucidatypewriter-medium-r-normal-*-*-180-*-*-m-*-*
  elseif has("gui_win32")
    :set guifont=Noto_Mono:h10:cANSI
  endif
endif

"" Whitespace
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
set list listchars=tab:?\ ,trail:·

"" Settings
set autoindent
set nowrap                             " don't wrap lines
set expandtab                          " change tab to space
set tabstop=2                          " change tab and indentation to 2 spaces
set shiftwidth=2                       " change indentation to 2 spaces
set backspace=indent,eol,start         " backspace through everything in insert mode
set noesckeys " Get rid of the delay when hitting esc
set ttimeout
set ttimeoutlen=1
set noswapfile
set nobackup
set nowritebackup
set directory=$HOME/.vim/tmp " Keep swap files in one location
set backupdir=$HOME/.vim/tmp

"" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"" F toggles
nnoremap <Leader>hlsearch :set hlsearch!<CR>
nnoremap <Leader>paste :set paste!<CR>
nnoremap <Leader>num :set number!<CR>

"" Searching
set hlsearch           " highlight matches
set incsearch          " incremental searching
set ignorecase         " searches are case insensitive...
set smartcase          " ... unless they contain at least one capital letter

"" Undo
set undodir=$HOME/_undofile
set undofile
"set undolevels = 1000       " max number of changes that can be undone
"set undoreload = 10000      " max number lines to save for undo on a buffer reload

"" Quick edit
nnoremap <Leader>d :e $HOME/.vimrc<CR>

"" File tree structure navigation
nnoremap <Leader>e :Explore $HOME/Documents/workspace/notes<CR>

augroup nonvim
   au!
   au BufRead *.png,*.jpg,*.pdf,*.gif,*.xls*,*.ppt*,*.doc*,*.rtf sil exe "!open " . shellescape(expand("%:p")) | bd | let &ft=&ft
augroup end
