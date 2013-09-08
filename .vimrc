"""""""""""""""""""""""""""
" 更新日 2013.9.8   Unite Unite-outlineの追加・設定
" 更新日 2013.9.7
"""""""""""""""""""""""""""

"エンコーディング関係
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8

" ヘルプの日本語化
set helplang=ja

" 改行時のインデントを有効にする
set autoindent
set smartindent
" コマンドライン補完の強化
set wildmenu
" 自動改行しない
set nowrap
" ソフトタブの無効化
set noexpandtab
" 全角記号のズレ防止
set ambiwidth=double
" 行番号表示
set number
" ルーラーの表示
set ruler
" シンタックスハイライト
syntax on
" ヒストリの保存数
set history=100
" ステータス行を2行表示
set laststatus=2
" Insertモード、ReplaceモードまたはVisualモードで最終行にメッセージを表示する
set showmode
" 新しいWindowの設定
set splitbelow "新しいウィンドウを下に開く
set splitright "新しいウィンドウを右に開く
" インクリメントを10進数で
set nf=""
" タブ幅を設定
set tabstop=4
set shiftwidth=4

" Clipboardの共有
set clipboard=unnamed,autoselect
" Ruby
au BufNewFile,BufRead *.rb    set nowrap tabstop=2 shiftwidth=2 expandtab

" ノーマルモードでのキーマップ
nnoremap <C-j> <PageDown>
nnoremap <C-k> <PageUp>
nnoremap <C-h> <Left>
nnoremap <C-l> <Right>

" ウィンドウ移動
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Shift + 矢印でウィンドウサイズを変更
nnoremap <S-Left>  <C-w><
nnoremap <S-Right> <C-w>>
nnoremap <S-Up>    <C-w>-
nnoremap <S-Down>  <C-w>+

" 方向キー入力での不具合解決
nnoremap OA gi<Up>
nnoremap OB gi<Down>
nnoremap OC gi<Right>
nnoremap OD gi<Left>
nnoremap OF gi<End>
nnoremap OH gi<Home>

" 挿入モードでのキーマップ
inoremap <silent> jj <ESC>
inoremap <silent> ff <PageDown>
inoremap <silent> bb <PageUp>
" inoremap <C-j> <PageDown>
" inoremap <C-j> <PageDown>
" inoremap <C-j> <PageDown>
" inoremap <C-k> <PageUp>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
inoremap <C-f> <PageDown>
inoremap <C-b> <PageUp>
inoremap <Nul> <Enter>


"ファイルを開いたら前回のカーソル位置へ移動
augroup vimrcEx
 autocmd!
 autocmd BufReadPost *
 \ if line("'\"") > 1 && line("'\"") <= line('$') |
 \   exe "normal! g`\"" |
 \ endif
augroup END

" 引用符, 括弧の設定
""inoremap { {}<Left>
""inoremap [ []<Left>
""inoremap ( ()<Left>
""inoremap " ""<Left>
""inoremap ' ''<Left>
""inoremap <> <><Left>

" タブ・全角スペースの可視化
set lcs=tab:>.,trail:_,extends:\
set list
highlight SpecialKey cterm=NONE ctermfg=7 guifg=7
highlight JpSpace cterm=underline ctermfg=7 guifg=7
au BufRead,BufNew * match JpSpace /　/

" タブページの設定
set showtabline=2 " 常にタブラインを表示


" ノーマルモードに戻った時に日本語入力をオフにする
set imdisable

""""""""""""""""""""
" 検索関係
""""""""""""""""""""
" 検索コマンドを打ち込んでいる間にも、打ち込んだところまでのパターンがマッチするテキストを、すぐに表示する
set incsearch
" 大文字小文字の区別をしない、ただし大文字小文字両方がるときは区別する
set ignorecase
set smartcase
" 検索時にファイルの最後までいったら最初に戻る
set wrapscan
" 検索文字の強調表示
set hlsearch


" 挿入モード時にステータスバーの色変更
" lightline.vimを導入したので利用していない
" if !exists('g:hi_insert')
  " let g:hi_insert = 'highlight StatusLine guifg=White guibg=DarkCyan gui=none ctermfg=White ctermbg=DarkCyan cterm=none'
" endif
 
" if has('unix') && !has('gui_running')
  " inoremap <silent> <ESC> <ESC>
  " inoremap <silent> <C-[> <ESC>
" endif
 
" if has('syntax')
  " augroup InsertHook
    " autocmd!
    " autocmd InsertEnter * call s:StatusLine('Enter')
    " autocmd InsertLeave * call s:StatusLine('Leave')
  " augroup END
" endif
 
" let s:slhlcmd = ''
" function! s:StatusLine(mode)
  " if a:mode == 'Enter'
    " silent! let s:slhlcmd = 'highlight ' . s:GetHighlight('StatusLine')
    " silent exec g:hi_insert
  " else
    " highlight clear StatusLine
    " silent exec s:slhlcmd
  " endif
" endfunction
 
" function! s:GetHighlight(hi)
  " redir => hl
  " exec 'highlight '.a:hi
  " redir END
  " let hl = substitute(hl, '[\r\n]', '', 'g')
  " let hl = substitute(hl, 'xxx', '', '')
  " return hl
" endfunction

" neobundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

" install plugins 
NeoBundle 'Shougo/neobundle.vim'  " NeoBundle (書く必要あるのか？？)
NeoBundle 'tpope/vim-endwise.git' " 自動でendとか挿入する
NeoBundle 'scrooloose/nerdtree'   " ファイルツリーの表示
NeoBundle 'Shougo/neocomplcache'  " 入力補完プラグイン
NeoBundle 'Shougo/neosnippet'     " スニペット
NeoBundle 'Shougo/vimshell'       " vimでのシェル実行
" 非同期処理実行ライブラリ（vimshellで使う）
NeoBundle 'Shougo/vimproc', {
\ 'build': {
\ 'windows': 'make -f make_mingw32.mak',
\ 'cygwin': 'make -f make_cygwin.mak',
\ 'mac': 'make -f make_mac.mak',
\ 'unix': 'make -f make_unix.mak',
\ }
\}
NeoBundle 'tpope/vim-rails'       " railsプラグイン
NeoBundle 'git://github.com/scrooloose/syntastic.git'     "シンタックスチェック
NeoBundle 'tpope/vim-surround'    " 文字を囲える
NeoBundle 'git://github.com/miripiruni/csscomb-for-vim.git' "CSSプロパティの順序整形プラグイン-CSScomb-
NeoBundle 'Lokaltog/vim-easymotion'      " 移動用プラグイン
NeoBundle 'thinca/vim-quickrun'   " vim-quickrun
NeoBundle 'tpope/vim-fugitive'    " git client
NeoBundle 'The-NERD-Commenter'    " コメント入力プラグイン
NeoBundle "kien/ctrlp.vim"        " ファイル検索プラグイン
NeoBundle 'itchyny/lightline.vim' " ステータスバーに色を付けてくれるプラグイン
NeoBundle 'Shougo/unite.vim'      " Unite
NeoBundle 'h1mesuke/unite-outline' " アウトラインの表示

" プラグインの有効化
filetype plugin on
filetype indent on


" zencodingの設定。zencodingはNeobundlerではいれていないので注意
let g:user_zen_expandabbr_key='<C-e>'


" NendTreeの設定
" 引数なしで実行したとき、NERDTreeを実行する
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * call ExecuteNERDTree()
endif
 
" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
    "b:nerdstatus = 1 : NERDTree 表示中
    "b:nerdstatus = 2 : NERDTree 非表示中
 
    if !exists('g:nerdstatus')
        execute 'NERDTree ./'
        let g:windowWidth = winwidth(winnr())
        let g:nerdtreebuf = bufnr('')
        let g:nerdstatus = 1 
 
    elseif g:nerdstatus == 1 
        execute 'wincmd t'
        execute 'vertical resize' 0 
        execute 'wincmd p'
        let g:nerdstatus = 2 
    elseif g:nerdstatus == 2 
        execute 'wincmd t'
        execute 'vertical resize' g:windowWidth
        let g:nerdstatus = 1 
 
    endif
endfunction
noremap <c-t> :<c-u>:call ExecuteNERDTree()<cr>


"" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'


" easy-motionの設定
" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 「;」 + 何かにマッピング
let g:EasyMotion_leader_key=";"
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue


" Nerd_Commenter
let g:NERDCreateDefaultMappings = 0
let NERDSpaceDelims = 1
" \ + c でコメント・アンコメント
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle

" Unite-Outline
" Uniteを縦分割時に右表示に
let g:unite_split_rule = 'botright'
" \ oでunite-outlineを縦分割でかつ閉じないように表示する
nnoremap <silent> <Leader>o :<C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>
