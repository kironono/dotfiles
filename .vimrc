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
