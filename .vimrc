source ~/.dotfiles/.vimrc.init
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

" vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg = 238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg = 237
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1

" python-mode
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_virtualenv = 1
let g:pymode_lint_ignore = "E501,E711,E712,C901"
let g:pymode_lint_on_fly = 0

au FileType javascript set ts=2 sw=2 expandtab
au FileType html set ts=2 sw=2 expandtab
au FileType json set ts=2 sw=2 expandtab

autocmd BufNewFile,BufRead *.jinja2 set filetype=html
autocmd BufNewFile,BufRead *.tpl set filetype=html
