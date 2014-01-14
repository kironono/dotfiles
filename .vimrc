set nocompatible

source ~/.dotfiles/.vimrc.neobundle
source ~/.dotfiles/.vimrc.basic

" neocomplcache を起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" シンタックスハイライト
syntax enable

" colorsheme
set t_Co=256
set background=dark
let g:lucius_no_term_bg = 1
colorscheme lucius
let g:airline_theme = "bubblegum"

" python-mode
let g:pymode_syntax_all = 1
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore = "E501,W0401"
let g:pymode_virtualenv = 0

au FileType javascript set ts=2 sw=2 expandtab
au FileType html set ts=2 sw=2 expandtab

autocmd BufNewFile,BufRead *.jinja2 set filetype=html
autocmd BufNewFile,BufRead *.tpl set filetype=html
