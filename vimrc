
" local conf
function! VimrcLocalCheck()
	if filereadable("~/.vimrc.local")
		source ~/.vimrc.local
	endif
endfunction
call VimrcLocalCheck()


" vimrc:plugin {{{
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" ----------------
" color and theme
" ----------------
Plug 'jonathanfilip/vim-lucius'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" ---------------------
" syntax and highlight
" ---------------------
" indent
Plug 'nathanaelkane/vim-indent-guides'
" python
Plug 'klen/python-mode'
" ruby
Plug 'tpope/vim-endwise'
" html
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
" slim
Plug 'slim-template/vim-slim'
" go
Plug 'fatih/vim-go'
Plug 'vim-jp/vim-go-extra'
" rust
Plug 'rust-lang/rust.vim'
" nginx
Plug 'vim-scripts/nginx.vim'
" docker
Plug 'ekalinin/Dockerfile.vim'

Plug 'machakann/vim-highlightedyank'

" ---
" LSP
" ---
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" --------
" Utility
" --------
" A tree explorer plugin for vim.
Plug 'preservim/nerdtree'
" An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'tomtom/tcomment_vim'
" fugitive.vim: A Git wrapper so awesome, it should be illegal
Plug 'tpope/vim-fugitive'
" A Vim plugin which shows git diff markers in the sign column and stages/previews/undoes hunks and partial hunks.
Plug 'airblade/vim-gitgutter'
" Fuzzy file, buffer, mru, tag, etc finder.
Plug 'kien/ctrlp.vim'
" Run tests easily in any language, with any framework
Plug 'davidpdrsn/vim-spectacular'

" Initialize plugin system
call plug#end()
" }}}


" vimrc:basic {{{
" updatetime
set updatetime=500

" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
augroup END

"----------
" 検索設定
"----------
set ignorecase          " 大文字小文字を区別しない
set smartcase           " 検索文字に大文字がある場合は大文字小文字を区別
set incsearch           " インクリメンタルサーチ
set hlsearch            " 検索マッチテキストをハイライト

" バックスラッシュやクエスチョンを状況に合わせ自動的にエスケープ
cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'


"----------
" 編集設定
"----------
set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
"set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=1         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" Swapファイル,Backupファイル全て無効化する
set nowritebackup
set nobackup
set noswapfile


"----------
" 表示設定
"----------
set list                " 不可視文字の可視化
set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化
set colorcolumn=80      " その代わり80文字目にラインを入れる
" set cursorline          " カーソル行にラインを表示
set laststatus=2        " ステータスラインを常に表示
set showtabline=2       " タブラインを常に表示
set scrolloff=5         " スクロールのオフセット
set ambiwidth=double    " 文脈によって文字幅の異なる文字は全角にする

" スクリーンベルを無効化
set t_vb=
set novisualbell

" 補完の表示方法
set wildmode=longest,list

" デフォルト不可視文字は美しくないのでUnicodeで綺麗に
set listchars=tab:▸\ ,trail:\ ,extends:»,precedes:«,nbsp:%,eol:↲

" 全角スペースをハイライトする
augroup highlightIdegraphicSpace
  autocmd!
  autocmd Colorscheme * highlight IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
augroup END

" SpecialKeyをハイライトする
" augroup highlightSpecialKey
"   autocmd!
"   autocmd ColorScheme * highlight SpecialKey term=underline ctermbg=DarkRed guibg=DarkRed
" augroup END


"------------------
" マクロ・キー設定
"------------------
" キーマップリーダー
let mapleader = ","

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap jj <Esc>

" クオートを入力した場合、対応するクオートを自動で入力
inoremap " ""<Left>
inoremap ' ''<Left>

" ESCを二回押すことでハイライトを消す
nmap <silent> <Esc><Esc> :nohlsearch<CR>

" スペース + cd で現在のバッファにカレントディレクトリ変更
nmap <Space>cd :cd %:h<CR>

" カーソル下の単語を * で検索
vnoremap <silent> * "vy/\V<C-r>=substitute(escape(@v, '\/'), "\n", '\\n', 'g')<CR><CR>

" 検索後にジャンプした際に検索単語を画面中央に持ってくる
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" j, k による移動を折り返されたテキストでも自然に振る舞うように変更
nnoremap j gj
nnoremap k gk

" vを二回で行末まで選択
vnoremap v $h

" TABにて対応ペアにジャンプ
nnoremap <Tab> %
vnoremap <Tab> %

" Ctrl + hjkl でウィンドウ間を移動
" map <C-h> <C-w>h
" map <C-j> <C-w>j
" map <C-k> <C-w>k
" map <C-l> <C-w>l

nnoremap <Leader>k <C-w><C-+>
nnoremap <Leader>j <C-w><C-->
nnoremap <Leader>h <C-w><C-<>
nnoremap <Leader>l <C-w><C->>

nnoremap <Leader>t :tabnew<CR>
nnoremap <Leader>w :tabclose<CR>
nnoremap <Leader>n :tabnext<CR>
nnoremap <Leader>p :tabprev<CR>

" paste モードをトグル
set pastetoggle=<F2>

" NERDTreeをトグル
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" make, grep などのコマンド後に自動的にQuickFixを開く
autocmd MyAutoCmd QuickfixCmdPost make,grep,grepadd,vimgrep copen

" QuickFixおよびHelpでは q でバッファを閉じる
autocmd MyAutoCmd FileType help,qf nnoremap <buffer> q <C-w>c

" w!! でスーパーユーザーとして保存（sudoが使える環境限定）
cmap w!! w !sudo tee > /dev/null %

" :e などでファイルを開く際にフォルダが存在しない場合は自動作成
function! s:mkdir(dir, force)
  if !isdirectory(a:dir) && (a:force ||
        \ input(printf('"%s" does not exist. Create? [y/N]', a:dir)) =~? '^y\%[es]$')
    call mkdir(iconv(a:dir, &encoding, &termencoding), 'p')
  endif
endfunction
autocmd MyAutoCmd BufWritePre * call s:mkdir(expand('<afile>:p:h'), v:cmdbang)

" vim 起動時のみカレントディレクトリを開いたファイルの親ディレクトリに指定
autocmd MyAutoCmd VimEnter * call s:ChangeCurrentDir('', '')
function! s:ChangeCurrentDir(directory, bang)
    if a:directory == ''
        lcd %:p:h
    else
        execute 'lcd' . a:directory
    endif

    if a:bang == ''
        pwd
    endif
endfunction

augroup vimrc-checktime
  autocmd!
  autocmd WinEnter * checktime
augroup END

" ~/.vimrc.localが存在する場合のみ設定を読み込む
let s:local_vimrc = expand('~/.vimrc.local')
if filereadable(s:local_vimrc)
    execute 'source ' . s:local_vimrc
endif

" vimdiffで起動した際自動的に単語単位の差分(diffchar.vim)を有効にする
if &diff
  augroup enable_diffchar
    autocmd!
    autocmd VimEnter * execute "%SDChar"
  augroup END
endif

" davidpdrsn/vim-spectacular
map <leader>t :write\|:call spectacular#run_tests()<cr>

" }}}


" vimrc:filetype {{{
autocmd FileType javascript set ts=2 sw=2 expandtab
autocmd FileType html set ts=2 sw=2 expandtab
autocmd FileType yaml set ts=2 sw=2 expandtab
autocmd FileType json set ts=2 sw=2 expandtab
autocmd FileType ruby set ts=2 sw=2 expandtab
autocmd FileType sh set ts=4 sw=4 expandtab
autocmd FileType rust set ts=4 sw=4 expandtab

autocmd BufNewFile,BufRead *.jinja2 set filetype=html
autocmd BufNewFile,BufRead *.tpl set filetype=html
autocmd BufNewFile,BufRead *.jbuilder set filetype=ruby

" davidpdrsn/vim-spectacular
call spectacular#add_test_runner('rust', 'cargo check && cargo check --tests && cargo check --examples | -', '')
" }}}


" vimrc:basic {{{
" Vimのデフォルト設定を利用する
set nocompatible

" 矢印キーで入力するとA B C Dが入力される問題を解決
" http://cohama.hateblo.jp/entry/20120129/1327817462
imap OA <Up>
imap OB <Down>
imap OC <Right>
imap OD <Left>

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

let g:rustfmt_autosave = 1
" }}}
