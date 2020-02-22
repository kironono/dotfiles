source ~/.dotfiles/.vimrc.init
source ~/.dotfiles/.vimrc.plugin
source ~/.dotfiles/.vimrc.basic
source ~/.dotfiles/.vimrc.filetype

" neocomplcache を起動時に有効化
"let g:neocomplcache_enable_at_startup = 1

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
let g:indent_guides_color_change_percent = 30
let g:indent_guides_guide_size = 1
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg = 238
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg = 237

" python-mode
let g:pymode_folding = 0
let g:pymode_rope = 0
let g:pymode_virtualenv = 1
let g:pymode_lint_ignore = "E501,E711,E712,C901"
let g:pymode_lint_on_fly = 0
