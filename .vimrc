set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'takac/vim-hardtime'
Plugin 'preservim/nerdtree'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ycm-core/YouCompleteMe'

call vundle#end()
filetype plugin indent on

""" From Default Config

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

set history=200         " keep 200 lines of command line history
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set wildmenu            " display completion matches in a status line

set ttimeout            " time out for key codes
set ttimeoutlen=100     " wait up to 100ms after Esc for special key

" Show @@@ in the last line if it is truncated.
set display=truncate

" Show a few lines of context around the cursor.  Note that this makes the
" text scroll if you mouse-click near the start or end of the window.
set scrolloff=5

" Do incremental searching when it's possible to timeout.
if has('reltime')
  set incsearch
endif

" Do not recognize octal numbers for Ctrl-A and Ctrl-X, most users find it
" confusing.
set nrformats-=octal

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries.
if has('win32')
  set guioptions-=t
endif

" Don't use Ex mode, use Q for formatting.
" Revert with ":unmap Q".
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on when the terminal has colors or when using the
" GUI (which always has colors).
if &t_Co > 2 || has("gui_running")
  " Revert with ":syntax off".
  syntax on

  " I like highlighting strings inside C comments.
  " Revert with ":unlet c_comment_strings".
  let c_comment_strings=1
endif

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
\ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
\ |   exe "normal! g`\""
\ | endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
" Revert with: ":delcommand DiffOrig".
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
  \ | wincmd p | diffthis
endif

""" Personal

set noerrorbells
set vb t_vb=
set number relativenumber
set numberwidth=5
set smarttab
set ignorecase
set smartcase
if &modifiable
  setlocal cursorline
  setlocal cursorcolumn
  setlocal colorcolumn=80
  highlight ColorColumn ctermbg=7
endif
set splitbelow
set splitright
set wildmode=list:longest,list:full
set diffopt+=vertical
set ttyfast
set lazyredraw
set hidden
set hlsearch
set autoread
set pyxversion=3

set t_Co=256
set background=dark

" set noswapfile
set undodir=~/.vim/undodir
set undofile

set list
set listchars=eol:$,tab:├─,trail:·,nbsp:⎵

" Removes trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

 autocmd FileType python
     \ setlocal tabstop=4
     \ softtabstop=4
     \ shiftwidth=4
     \ textwidth=79
     \ expandtab
     \ autoindent
     \ fileformat=unix
set encoding=utf-8

if $USER == "dan"
  let g:airline_powerline_fonts = 1
  let g:tmuxline_powerline_separators = 1
else
  let g:airline_powerline_fonts = 0
  let g:tmuxline_powerline_separators = 0
endif

let mapleader = ","

nnoremap <leader>vc :e $MYVIMRC<CR>
nnoremap <leader>vv :source $MYVIMRC<CR>
nnoremap <leader><leader> <C-^>
nnoremap <leader>s :mksession<CR>
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>h <C-w>h
nnoremap <leader>l <C-w>l

nnoremap <leader>gs :G<CR>
nnoremap <leader>gh :diffget //3<CR>
nnoremap <leader>gu :diffget //2<CR>

nnoremap <leader>y "+y
nnoremap <leader>p "+p

" let g:hardtime_default_on = 1

nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

inoremap <silent> <Up> <ESC><Up>
inoremap <silent> <Down> <ESC><Down>

inoremap jj <esc>`^

nnoremap <silent> <F2> :set list!<Bar>set list?<CR>
nnoremap <silent> <CR> :nohlsearch<CR><CR>

" Allows switching of cursor style in mintty
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

map <leader>n :NERDTreeToggle<CR>
let NERDTreeShowBookmarks = 1

let g:python3_host_prog="/bin/python3"
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
