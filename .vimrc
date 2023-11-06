" Line Numbers
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
augroup END

" Tabs
set tabstop=2
set softtabstop=2
set noexpandtab
set shiftwidth=2

" Highlights
syntax enable
set showcmd
set cursorline
hi CursorLine cterm=NONE
hi CursorLineNr ctermbg=darkred ctermfg=white

" Perf
set lazyredraw

" Search preference
set incsearch
set nohlsearch
 
" Leader
nnoremap <Space> <nop>
let mapleader=" "

" Key Rebinds
" Key Additions
inoremap ii <esc> " ESC is way too far to exit insert
nnoremap <leader>nl o<esc>

" Spacemacs style commands
nnoremap <leader>fs :w<CR>
nnoremap <leader>feR :source ~/.vimrc<CR>
nnoremap <leader>qq :q!
