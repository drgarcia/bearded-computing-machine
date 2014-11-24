execute pathogen#infect()
filetype plugin indent on
set number
command Trim execute ':%s/\s\+$//'
set smartindent
set tabstop=4
set shiftwidth=4
"set expandtab
set ruler
syntax enable
autocmd BufRead *.java set efm=%A\ %#[javac]\ %f:%l:\ %m,%-Z\ %#[javac]\ %p^,%-C%.%#
autocmd BufRead set makeprg=ant\ -find\ build.xml
command Dark execute "set background=dark"
command Light execute "set background=light"
autocmd BufRead *.txt setlocal spell spelllang=en_ca
autocmd BufRead *.tex setlocal spell spelllang=en_ca
set background=dark
colorscheme railscasts
set guifont=Inconsolata:h14
