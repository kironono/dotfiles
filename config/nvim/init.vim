
" Plugins
call plug#begin(stdpath('data') . '/plugged')

" ----
" color and theme
" ----
Plug 'jonathanfilip/vim-lucius'
Plug 'folke/tokyonight.nvim'

" ----
" syntax and highlight
" ----
" highlight
Plug 'machakann/vim-highlightedyank'
" indent
Plug 'Yggdroot/indentLine'
" ruby
Plug 'tpope/vim-endwise'
" rust
Plug 'rust-lang/rust.vim'

" ----
" LSP
" ----
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

" ----
" Utility
" ----
" A tree explorer plugin for vim.
Plug 'preservim/nerdtree'
" An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'tomtom/tcomment_vim'

Plug 'jeffkreeftmeijer/vim-numbertoggle'

Plug 'hoob3rt/lualine.nvim'
Plug 'ryanoasis/vim-devicons'

call plug#end()

" Init lua
lua require('init')

" ----
" Basic
" ----
set encoding=UTF-8
set updatetime=300
set splitbelow
set splitright
set wildmenu wildmode=list:longest,full

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
set relativenumber
set wrap
set ruler
set signcolumn=number

" Theme
set t_Co=256
set background=dark
let g:lucius_no_term_bg = 1
" colorscheme lucius
colorscheme tokyonight

" Search
set ignorecase
set smartcase
set incsearch
set hlsearch

" Swap, Backups
set nowritebackup
set nobackup
set noswapfile

" Keymaps
let mapleader = "\<Space>"
noremap <Space>s :source $MYVIMRC<CR>
noremap <Space>w :<C-u>w<CR>

nnoremap <silent><C-e> :NERDTreeToggle<CR>

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

" vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_start_level = 2
" let g:indent_guides_auto_colors = 0
" let g:indent_guides_color_change_percent = 30
" let g:indent_guides_guide_size = 1
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg = 238
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg = 237

" vim-rust
let g:rustfmt_autosave = 1

syntax enable
filetype plugin indent on
