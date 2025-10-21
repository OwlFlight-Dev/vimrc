" ===============================
" Plugin management with vim-plug
" ===============================

" Set leader key to space
let mapleader = " "

" Initialize vim-plug
call plug#begin('~/.vim/plugged')

" Linting and fixing with ALE (including ESLint support)
Plug 'dense-analysis/ale'

" EasyMotion for fast visual jumps
Plug 'easymotion/vim-easymotion' " [<leader><leader> + 'w' / 's' / 'j' / 'k'] | jumps to word/char/line down/line up

" Sneak for lightning-fast 2-char motions
Plug 'justinmk/vim-sneak' " ['s' + 2 char]

" Toggle comments easily
Plug 'tpope/vim-commentary' " ['gcc']

" End plugin section
call plug#end()

" ===============================
" Indentation and Tabs
" ===============================

" Use 2 spaces for tabs and indentation for consistent style
set tabstop=2        " Number of spaces a tab displays as
set shiftwidth=2     " Number of spaces for autoindent
set softtabstop=2    " Number of spaces a <Tab> inserts in insert mode
set expandtab        " Use spaces instead of tabs

" ===============================
" Notes:
" - Run :PlugInstall after adding new plugins
" - Run :PlugClean after removing plugins
" ===============================
