
" Plugins
call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'nvim-lua/completion-nvim'

call plug#end()

" Basic
set number
set ruler
set splitbelow
set splitright

set expandtab
set tabstop=2
set shiftwidth=2

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
set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
set shortmess+=c

" Init lua
lua require('init')
