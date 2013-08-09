set nocompatible

source ~/.dotfiles/.vimrc.neobundle
source ~/.dotfiles/.vimrc.basic

" キーマップリーダー
let mapleader = ","

" neocomplcache を起動時に有効化
let g:neocomplcache_enable_at_startup = 1

" シンタックスハイライト
syntax enable

" colorsheme
set background=dark
let g:lucius_no_term_bg = 1
colorscheme lucius

" python-mode
let g:pymode_folding = 0

au FileType javascript set ts=2 sw=2 expandtab
au FileType html set ts=2 sw=2 expandtab

autocmd BufNewFile,BufRead *.jinja2 set filetype=html
autocmd BufNewFile,BufRead *.tpl set filetype=html
