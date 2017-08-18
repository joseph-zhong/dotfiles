" My Vimrc Configuration.

" Line Numbers.
set number

" Tabs as two spaces indentation.
set autoindent
set smartindent
set smarttab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Maximum length with wrapping.
set tw=80
set wrapmargin=2

" Cursor line.
set cursorline

" Syntax help.
set showmatch

" CUDA Files treated as C.
au BufNewFile,BufRead *.cu setlocal ft=c

" Python Files with text width at 124.
au BufNewFile,BufRead *.py setlocal tw=124 




