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

" Make all yank operations use the system clipboard by default
set clipboard=unnamed

" Enable persistent undo so undo history is saved to a file
set undofile

if has('unix')
  let s:undodir = expand('~/.vim/undodir')

  " Create undo directory if it doesn't exist
  if !isdirectory(s:undodir)
    call mkdir(s:undodir, 'p')
  endif

  " Set the undo directory option to the expanded path
  let &undodir = s:undodir

  " Optional: clean undo files older than 7 days
  call system('find ' . shellescape(&undodir) . ' -type f -mtime +7 -delete')
endif

" Specify fixers to use with ALE for different filetypes.
" Here, we use Prettier to automatically format JavaScript, TypeScript,
" CSS, JSON, and HTML files whenever ALEFix is triggered.
" [:ALEFix]
" let g:ale_fixers = {
"       \ 'javascript': ['prettier'],
"       \ 'typescript': ['prettier'],
"       \ 'css': ['prettier'],
"       \ 'json': ['prettier'],
"       \ 'html': ['prettier'],
"       \ }

" let g:ale_linters = {
" \   'javascript': [],
" \   'typescript': [],
" \}

" Define a lighter red color (you can adjust the hex value)
highlight ALEError guifg=#cc0000 ctermfg=Red

" Disable linting on entering the buffer (opening file)
let g:ale_lint_on_enter = 0
" Disable linting while typing (this is why errors show up as you type)
let g:ale_lint_on_text_changed = 'never'
" Disable linting when leaving Insert mode (avoid lint on exiting insert)
let g:ale_lint_on_insert_leave = 0
" Disable linting when cursor is idle in Normal mode (no lint on CursorHold)
let g:ale_lint_on_cursor_hold = 0
" Disable linting when cursor is idle in Insert mode (no lint on CursorHoldI)
let g:ale_lint_on_cursor_hold_insert = 0

" ===============================
" Notes:
" - Run :PlugInstall after adding new plugins
" - Run :PlugClean after removing plugins
" ===============================
