" Custom vimrc file made for wahab14131211
" Maintainer: Wahab

" {{{ DEFAULTS
set nocompatible "enable vim specific features (breaks comptaibility with vi)
set bs=2 "let backspace remove start and end of line characters
set hlsearch "enable search highlighting
set incsearch "enable incremental search highlighting
set backupdir=~/vimtmp/vim/backups// "Double slash to build file name from the complete path to the file with all path separators changed to percent '%' signs
set backup "enable automatic backup files (*~ files)
set viminfo='20,\"50 "Read/write a .viminfo file, don't store more than 50 lines of registers for 20 files
set history=100 "store 100 commands in history
set number "show absolute line numbers in a file on cursor line
set relativenumber "show relative line numbers on non-cursor lines to allow for faster motions
set scrolloff=10 "keep a minimum of 10 lines in view below cursor
set nowrap "disable test wrapping
set showmode "show vim mode
set foldmethod=marker "enable folds in vim
syntax on "enable syntax based colors
set wildmenu " Enable auto completion menu after pressing TAB.
set wildmode=list:longest " Make wildmenu behave like similar to Bash completion.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " Wildmenu will ignore files with these extensions.(files which vim should not edit)

"{{{ Indenting
set autoindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
" {{{ Makefiles ensure that we don't expand tabs since tabs are special
if has("autocmd")
    autocmd BufNewFile,BufRead Makefile set noexpandtab
endif
" }}}
"}}}    

" }}}

" PLUGINS {{{
call plug#begin('~/.config/vim/plugged')
    Plug 'sainnhe/everforest'
	Plug 'tpope/vim-surround'
	Plug 'preservim/nerdtree'
	Plug 'vim-airline/vim-airline'
call plug#end()
" }}}

" {{{ Colors
" Enable full bit color if terminal supports it
if has('termguicolors')
    set termguicolors
endif
set colorcolumn=120
set background=dark
let g:everforst_background = 'soft'
let g:everforest_better_performance = 1
colorscheme everforest
" }}}

" MAPPINGS {{{
let mapleader=" "
nnoremap <leader>pv :Explore<CR>
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
xnoremap <leader>p "_dP
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y
nnoremap <leader>d "_d
vnoremap <leader>d "_d
inoremap <C-c> <Esc>
nnoremap Q <nop>
nnoremap <leader>s :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>
nnoremap <silent> <leader>x <cmd>!chmod +x %<CR>
" }}}

" VIMSCRIPT {{{
" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=~/vimtmp/vim/undodir
    set undofile
    set undoreload=10000
endif

" }}}

" STATUS LINE {{{
set ruler "always show cursor location in bottom left
" }}}
