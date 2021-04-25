
" Plugins
call plug#begin(stdpath('data') . '/plugged')

" ----
" color and theme
" ----
Plug 'jonathanfilip/vim-lucius'

" ----
" syntax and highlight
" ----
" highlight
Plug 'machakann/vim-highlightedyank'
" indent
Plug 'nathanaelkane/vim-indent-guides'
" ruby
Plug 'tpope/vim-endwise'
" rust
Plug 'rust-lang/rust.vim'

" ----
" LSP
" ----
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

" ----
" Utility
" ----
" A tree explorer plugin for vim.
Plug 'preservim/nerdtree'
" An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'tomtom/tcomment_vim'

Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" ----
" Basic
" ----
set encoding=UTF-8
set updatetime=300
set splitbelow
set splitright

" Editing
set expandtab
set tabstop=2
set shiftwidth=2

set infercase
set hidden
set switchbuf=useopen
set showmatch
set matchtime=1

set matchpairs& matchpairs+=<:>

" Display
set list
set number
set wrap
set ruler

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Swap, Backups
set nowritebackup
set nobackup
set noswapfile

syntax enable
filetype plugin indent on

" Keymaps
noremap <Space>s :source $MYVIMRC<CR>
noremap <Space>w :<C-u>w<CR>

" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
set completeopt=menuone
set completeopt+=noinsert
set completeopt+=noselect
set completeopt-=preview
" Avoid showing extra messages when using completion
set shortmess+=c

" Color
set t_Co=256
set background=dark
let g:lucius_no_term_bg = 1
colorscheme lucius

" Init lua
lua require('init')
