if filereadable($VIMRUNTIME . "/defaults.vim")
  source $VIMRUNTIME/defaults.vim
endif

" --------------------------------
" 基本設定 Basics
" --------------------------------
nnoremap <Space> <Nop>
let mapleader = "\<Space>"
noremap \ <Space>
" map ; :
set encoding=utf-8
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
Plug 'szw/vim-tags'
Plug 'w0rp/ale'
Plug 'thinca/vim-ref' | Plug 'mojako/ref-sources.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'itchyny/lightline.vim'
Plug 'easymotion/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/vim-cursorword'
Plug 'tpope/vim-fugitive'
Plug 'tyru/caw.vim'
Plug 'osyo-manga/vim-anzu'
Plug 'osyo-manga/vim-over'
Plug 'ctrlpvim/ctrlp.vim' | Plug 'nixprime/cpsm'
Plug 'airblade/vim-gitgutter'
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
Plug 'Rigellute/rigel'
" textobj
Plug 'kana/vim-textobj-user'

" language server
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'

" yaml
Plug 'stephpy/vim-yaml'
Plug 'cespare/vim-toml'
" golang
Plug 'fatih/vim-go', { 'for': 'go' }
" rust
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" php
Plug 'stephpy/vim-php-cs-fixer', { 'for': 'php' }
Plug 'jwalton512/vim-blade', { 'for': 'php' }
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
Plug 'tpope/vim-rails', { 'for': 'ruby' }
" Plug 'tpope/vim-bundler', { 'for': 'ruby' } " 起動時にエラーが出るのでとりあえず
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
" fish
Plug 'dag/vim-fish', { 'for': 'fish' }
Plug 'hashivim/vim-terraform', { 'for': 'terraform' }
" ReasonML
Plug 'reasonml-editor/vim-reason-plus'

call plug#end()

set t_Co=256

set background=dark
" colorscheme lucius
" colorscheme jellybeans
" colorscheme railscasts
" colorscheme japanesque
" colorscheme molokai
colorscheme rigel
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

" 検索結果のハイライトを消す
nnoremap <Leader>c :<C-u>noh<Return>

" --------------------------------
" ale
" --------------------------------

let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_delay = 500

let g:ale_linters = {
    \ 'ruby': ['ruby', 'rubocop'],
    \}
let g:ale_ruby_rubocop_executable = 'bundle exec rubocop'
let g:ale_fixers = {
    \ 'javascript': ['prettier'],
    \}
" let g:ale_fix_on_save = 1

" --------------------------------
" NERDTreeToggle
" --------------------------------
nnoremap <silent> <Leader>nt :<C-u>NERDTreeToggle<Return>

" --------------------------------
" nerdtree-git-plugin
" --------------------------------
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "*",
    \ "Staged"    : "✚",
    \ "Untracked" : "N",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" --------------------------------
" vim-markdown
" --------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1

" --------------------------------
" itchyny/lightline.vim
" --------------------------------
let g:lightline = {
        \ 'colorscheme': 'wombat',
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [
        \     [ 'mode', 'paste' ],
        \     [ 'fugitive', 'filename' ],
        \     [ 'ale' ],
        \   ]
        \ },
        \ 'component_function': {
        \   'modified': 'LightLineModified',
        \   'readonly': 'LightLineReadonly',
        \   'fugitive': 'LightLineFugitive',
        \   'filename': 'LightLineFilename',
        \   'fileformat': 'LightLineFileformat',
        \   'filetype': 'LightLineFiletype',
        \   'fileencoding': 'LightLineFileencoding',
        \   'mode': 'LightLineMode',
        \   'ale': 'ALEStatus'
        \ }
        \ }

function! LightLineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightLineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightLineFilename()
  return ('' != LightLineReadonly() ? LightLineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightLineModified() ? ' ' . LightLineModified() : '')
endfunction

function! LightLineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightLineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightLineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightLineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightLineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

set laststatus=2

" --------------------------------
" vim-easymotion
" --------------------------------
let g:EasyMotion_smartcase = 1

" --------------------------------
" vim-anzu
" --------------------------------
nmap n <Plug>(anzu-n)
nmap N <Plug>(anzu-N)
nmap * <Plug>(anzu-star)
nmap # <Plug>(anzu-sharp)
nmap <silent> <Esc><Esc> :<C-u>nohlsearch<Return><Plug>(anzu-clear-search-status)

" --------------------------------
" vim-over
" --------------------------------
nnoremap <silent> <Leader>s :<C-u>OverCommandLine<Return>
xnoremap <silent> <Leader>s :<C-u>'<,'>OverCommandLine<Return>

" --------------------------------
" CtrlP
" --------------------------------
if get(g:, 'load_cpsm')
  let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
endif

if get(g:, 'ctrlp_use_files') && executable('files')
  let g:ctrlp_user_command = 'files -a %s'
else
  let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
endif

let g:ctrlp_match_window = 'bottom,order:btt,min:3,max:15,results:15'
let g:ctrlp_open_new_file = 'r'

"-------------------------------------------------------------------------------
" インデント設定 Indents 
"-------------------------------------------------------------------------------
" defaultのインデント管理
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set smartindent

if has("autocmd")
 " ファイルタイプの検索を有効にする
 filetype plugin on
 " そのファイルタイプにあわせたインデントを利用する
 filetype indent on
 autocmd FileType apache     setlocal sw=4 sts=4 ts=4 et
 autocmd FileType aspvbs     setlocal sw=4 sts=4 ts=4 et
 autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
 autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
 autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
 autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
 autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
 autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
 autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
 autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
 autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
 autocmd FileType jsx        setlocal sw=2 sts=2 ts=2 et
 autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
 autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
 autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
 autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
 autocmd FileType eruby      setlocal sw=2 sts=2 ts=2 et
 autocmd FileType haml       setlocal sw=2 sts=2 ts=2 et
 autocmd FileType sh         setlocal sw=2 sts=2 ts=2 et
 autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
 autocmd FileType vb         setlocal sw=4 sts=4 ts=4 et
 autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
 autocmd FileType wsh        setlocal sw=4 sts=4 ts=4 et
 autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
 autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
 autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
 autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
 autocmd FileType scala      setlocal sw=2 sts=2 ts=2 et
 autocmd FileType go         setlocal noexpandtab ts=4 sts=4 sw=4
endif

" --------------------------------
" C
" --------------------------------
if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

" --------------------------------
" golang
" --------------------------------
if executable('golsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'golsp',
        \ 'cmd': {server_info->['golsp', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
endif

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_autosave = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:go_list_type = "quickfix"
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>db <Plug>(go-doc-browser)
au FileType go nmap <Leader>ii <Plug>(go-implements)
au FileType go nmap <Leader>in <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

" --------------------------------
" php
" --------------------------------

" Baselibメソッドのハイライト
let php_baselib = 1
" <? をハイライト除外にする
let php_noShortTags = 1
" カッコが閉じていない場合にハイライト
let php_parent_error_close = 1
let g:syntastic_php_checkers = ['phpcs']
let g:syntastic_php_phpcs_args= '--standard=psr2 --encoding=utf-8'

" --------------------------------
" javascript
" --------------------------------
au BufRead,BufNewFile *.tag :set filetype=javascript
let g:syntastic_javascript_checkers=['eslint']
" http://koturn.hatenablog.com/entry/2015/07/27/042519
if executable('jq')
  function! s:jq(has_bang, ...) abort range
    execute 'silent' a:firstline ',' a:lastline '!jq' string(a:0 == 0 ? '.' : a:1)
    if !v:shell_error || a:has_bang
      return
    endif
    let error_lines = filter(getline('1', '$'), 'v:val =~# "^parse error: "')
    " 範囲指定している場合のために，行番号を置き換える
    let error_lines = map(error_lines, 'substitute(v:val, "line \\zs\\(\\d\\+\\)\\ze,", "\\=(submatch(1) + a:firstline - 1)", "")')
    let winheight = len(error_lines) > 10 ? 10 : len(error_lines)
    " カレントバッファがエラーメッセージになっているので，元に戻す
    undo
    " カレントバッファの下に新たにウィンドウを作り，エラーメッセージを表示するバッファを作成する
    execute 'botright' winheight 'new'
    setlocal nobuflisted bufhidden=unload buftype=nofile
    call setline(1, error_lines)
    " エラーメッセージ用バッファのundo履歴を削除(エラーメッセージをundoで消去しないため)
    let save_undolevels = &l:undolevels
    setlocal undolevels=-1
    execute "normal! a \<BS>\<Esc>"
    setlocal nomodified
    let &l:undolevels = save_undolevels
    " エラーメッセージ用バッファは読み取り専用にしておく
    setlocal readonly
  endfunction
  command! -bar -bang -range=% -nargs=? Jq  <line1>,<line2>call s:jq(<bang>0, <f-args>)
endif

" colors
if exists('+termguicolors')
  set termguicolors
endif

" digdag
au BufNewFile,BufRead *.dig setf yaml

" https://github.com/prabirshrestha/asyncomplete.vim
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
" let s:opam_share_dir = system("opam config var share")
" let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')
" 
" let s:opam_configuration = {}
" 
" function! OpamConfOcpIndent()
"   execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
" endfunction
" let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')
" 
" function! OpamConfOcpIndex()
"   execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
" endfunction
" let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')
" 
" function! OpamConfMerlin()
"   let l:dir = s:opam_share_dir . "/merlin/vim"
"   execute "set rtp+=" . l:dir
" endfunction
" let s:opam_configuration['merlin'] = function('OpamConfMerlin')
" 
" let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
" let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
" let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
" for tool in s:opam_packages
"   " Respect package order (merlin should be after ocp-index)
"   if count(s:opam_available_tools, tool) > 0
"     call s:opam_configuration[tool]()
"   endif
" endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
