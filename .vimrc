call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'stevearc/vim-arduino'
Plug 'pbrisbin/vim-mkdir'
call plug#end()

set history=500 " sets how many lines of history VIM has to remember
set number
set relativenumber
set ruler " always show current position
set cmdheight=1 " height of command bar
set hid " a buffer becomes hidden when it is abandoned
set ignorecase " ignore case when searching
set smartcase " when searching try to be smart about cases
set hlsearch " highlight search results
set incsearch " makes search act like search in modern browser
set lazyredraw " don't redraw while executing macros
set showmatch " show matching brackets
set mat=2 " how many tenths of a second to blink when matching brackets
set foldcolumn=1 " add a bit extra margin to left
set background=dark
set encoding=utf8 " set utf-8 as standard encoding
set expandtab " use spaces instead of tabs
set smarttab " be smart when using tabs
set shiftwidth=4 " tab width
set tabstop=4 " tab width
set ai " auto indent
set si " smart indent
set wrap " wrap lines
set laststatus=2 " Always show the status line

" configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap=<,>,h,l

" turn of backup
set nobackup
set nowb
set noswapfile

" Disable scrollbars (real hackers don't use scrollbars for navigation!)
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>

" search file
map <C-f> :Files<cr>

map <C-\> :Explore<cr>

syntax enable " enable syntax highlighting
filetype plugin on
filetype indent on

set autoread
au FocusGained,BufEnter * checktime

colorscheme onedark

let g:user_emmet_mode='i'
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='<C-p>'
autocmd FileType html,blade EmmetInstall

let g:onedark_hide_endofbuffer=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256

let g:lightline = { 'colorscheme': 'onedark' }

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

let mapleader=","

" Fast saving
nmap <leader>w :w<cr>
" quit
nmap <leader>q :q<cr>
" quit
nmap <leader>x :x<cr>
" remove search highlighting
nmap <leader>/ :set nohls<cr>
nmap <leader><SPACE> :set nohls<cr>

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
	let save_cursor = getpos(".")
	let old_query = getreg('/')
	silent! %s/\s\+$//e
	call setpos('.', save_cursor)
	call setreg('/', old_query)
endfun

if has("autocmd")
	autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()

    augroup templates
        autocmd BufNewFile *.vue 0r ~/.vim/templates/skeleton.vue
        autocmd BufNewFile *.php 0r ~/.vim/templates/skeleton.php
    augroup END
endif
