source $VIMRUNTIME/defaults.vim

" --------------------------------
" 基本設定 Basics
" --------------------------------
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
noremap \ <Space>
map ; :
set scrolloff=5                  " スクロール時の余白確保
set textwidth=0                  " 一行に長い文章を書いていても自動折り返しをしない
set nobackup                     " バックアップ取らない
set autoread                     " 他で書き換えられたら自動で読み直す
set noswapfile                   " スワップファイル作らない
set hidden                       " 編集中でも他のファイルを開けるようにする
set formatoptions=lmoq           " テキスト整形オプション，マルチバイト系を追加
set vb t_vb=                     " ビープをならさない
set browsedir=buffer             " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]    " カーソルを行頭、行末で止まらないようにする
set noshowmode                   " lightline.vimを使う
set viminfo='50,<1000,s100,\"50  " viminfoファイルの設定
set modelines=0                  " モードラインは無効
set cursorline                   " カーソル行を表示
set list                         " 不可視文字の表示
set listchars=tab:>-,trail:~,extends:>,precedes:<
set notitle                      " vimを使ってくれてありがとう
set hlsearch
set incsearch
set ignorecase
set smartcase

set shell=/bin/sh

" runtime/defaultでok
" set backspace=indent,eol,start   " バックスペースでなんでも消せるように
" ターミナルでマウスを使用できるようにする
" set mouse=a
" set guioptions+=a

augroup CursorLineOnlyInActiveWindow
  autocmd!
  autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  autocmd WinLeave * setlocal nocursorline
augroup END

" ヤンクした文字は、システムのクリップボードに入れる
set clipboard=unnamed

" vim-plug(plugin manager)
if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
" basic
Plug 'junegunn/vim-plug', {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'wakatime/vim-wakatime'
Plug 'Shougo/vimfiler'
Plug 'tyru/open-browser.vim'
Plug 'szw/vim-tags'
" Plug 'scrooloose/syntastic'
Plug 'w0rp/ale'
Plug 'thinca/vim-ref' | Plug 'mojako/ref-sources.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'thinca/vim-quickrun'
Plug 'itchyny/lightline.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/vim-cursorword'
Plug 'jreybert/vimagit'
Plug 'ghpr-blame.vim'
Plug 'tyru/caw.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'nixprime/cpsm'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/emmet-vim'
Plug 'rizzatti/dash.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'editorconfig/editorconfig-vim'
" colorscheme
Plug 'aereal/vim-colors-japanesque'
Plug 'freeo/vim-kalisi'
Plug 'mhartington/oceanic-next'
Plug 'tomasr/molokai'
Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
Plug 'jpo/vim-railscasts-theme'
Plug 'nanotech/jellybeans.vim'
Plug 'jonathanfilip/vim-lucius'
" textobj
Plug 'kana/vim-textobj-user'

" emoji
Plug 'junegunn/vim-emoji', { 'for': ['gitcommit', 'markdown'] } | Plug 'rhysd/github-complete.vim'

" yaml
Plug 'stephpy/vim-yaml'
" golang
Plug 'fatih/vim-go', { 'for': 'go' }
" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" php
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
" Dockerfile
Plug 'ekalinin/Dockerfile.vim', { 'for': 'Dockerfile' }
" crystal
Plug 'rhysd/vim-crystal', { 'for': 'crystal' }
" markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'kannokanno/previm', { 'for': 'markdown' }
" python
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-endwise', { 'for': 'ruby' }
Plug 'yuku-t/vim-ref-ri', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-bundler', { 'for': 'ruby' }
Plug 'jgdavey/vim-blockle', { 'for': 'ruby' }
" Plug 'git@github.com:osyo-manga/vim-monster.git', { 'for': 'ruby' }
Plug 'rhysd/vim-textobj-ruby', { 'for': 'ruby' }
Plug 'todesking/ruby_hl_lvar.vim', { 'for': 'ruby' }
Plug 'slim-template/vim-slim'
" javascript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'myhere/vim-nodejs-complete', { 'for': 'javascript' }
Plug 'mxw/vim-jsx', { 'for': 'javascript '}
Plug 'pmsorhaindo/syntastic-local-eslint.vim', { 'for': 'javascript' }
Plug 'nicklasos/vim-jsx-riot', { 'for': 'javascript' }
Plug 'posva/vim-vue'
Plug 'Galooshi/vim-import-js'
Plug 'kchmck/vim-coffee-script'
" typescript
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
" php
Plug 'jwalton512/vim-blade', { 'for': 'php' }
" fish
Plug 'dag/vim-fish', { 'for': 'fish' }
call plug#end()

set t_Co=256

set background=dark
colorscheme lucius
" colorscheme jellybeans
" colorscheme railscasts
" colorscheme japanesque
" colorscheme molokai
" ---------------------
" color: kalisi
" ---------------------
" colorscheme kalisi
" syntax enable
" set background=dark
" set t_Co=256
" let &t_AB="\e[48;5;%dm"
" let &t_AF="\e[38;5;%dm"

" ---------------------
" color for OceanicNext
" ---------------------
" syntax enable
" let $NVIM_TUI_ENABLE_TRUE_COLOR=1
" colorscheme OceanicNext
" set background=dark

" insertモードから抜ける
inoremap <silent> jj <ESC>

" 行頭・行末移動方向をキーの相対位置にあわせる
"
nnoremap 0 $ 
nnoremap 1 0

" 挿入モードでのカーソル移動
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

" ミス防止
nnoremap ZZ <Nop>
nnoremap ZQ <Nop>
nnoremap Q <Nop>

" タグジャンプ
nnoremap [tagj] <Nop>
nmap <Leader>j [tagj]
nnoremap <silent> [tagj]n :tjump <C-r><C-w><CR>
nnoremap <silent> [tagj]b <C-O>
nnoremap <silent> [tagj]<C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <silent> [tagj]<C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

source ~/.vimrc.plug
source ~/.vimrc.indent
source ~/.vimrc.lang

" colors
if exists('+termguicolors')
  set termguicolors
endif

