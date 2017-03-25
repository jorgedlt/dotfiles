" vimrc - Jorge de la Torre - jorgedlt@gmail.com
" - 11/05/14 14:16:07


set number
set background=dark
set tabstop=4


" highlight current line
set cul


" adjust color try 3,4,5, or 8 -- use 5 MAC OS
hi CursorLine term=none cterm=none ctermbg=8


" Highlight things that we find with the search
set hlsearch


" Necessary  for lots of cool vim things
set nocompatible


" This shows what you are typing as a command.  I love this!
set showcmd


" Folding Stuffs
set foldmethod=marker


" Needed for Syntax Highlighting and stuff
filetype on
filetype plugin on
syntax enable
set grepprg=grep\ -nH\ $*


" Auto-Commands
" removes extra white space on save
autocmd BufWritePre * :%s/\s\+$//e


" fin
