" pipenv --venv で表示されたpathをセッティングする
let g:pipenv_path = '/.local/share/virtualenvs/python-fZSHTmm1'
let g:python3_host_prog = $HOME . g:pipenv_path . '/bin/python'
let g:python2_host_prog = ''

" Leader設定
let g:mapleader = "\<Space>"

" init.vimファイル再読込
nnoremap <silent> <leader>R :source $MYVIMRC<CR>

" neovim + tmux時の日本語文字化けを修正する
set ttimeout
set ttimeoutlen=50

"プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir          = expand('~/.config/nvim')
  let s:toml            = g:rc_dir . '/dein.toml'
  let s:lazy_toml       = g:rc_dir . '/dein_lazy.toml'
  let s:completion_toml = g:rc_dir . '/completion.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,            {'lazy': 0})
  call dein#load_toml(s:lazy_toml,       {'lazy': 1})
  call dein#load_toml(s:completion_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

filetype plugin indent on

"----------------------------------------
" 設定 
"----------------------------------------

" ファイルを上書きする前にバックアップを作ることを無効化
set nowritebackup
" ファイルを上書きする前にバックアップを作ることを無効化
set nobackup
" vim の矩形選択で文字が無くても右へ進める
set virtualedit=block
" 挿入モードでバックスペースで削除できるようにする
set backspace=indent,eol,start
" 全角文字専用の設定
set ambiwidth=double
" wildmenuオプションを有効(vimバーからファイルを選択できる)
set wildmenu
"クリップボードを使用する
set clipboard+=unnamedplus
"ファイルを保存する
nnoremap <S-s> :w<CR>
" カーソル位置から行末までヤンク
nnoremap Y y$
" ヤンクした内容をペースト
nnoremap <silent> <leader>p "0p
vnoremap <silent> <leader>p "0p

"----------------------------------------
" ESC・移動
"----------------------------------------

inoremap <silent> jj <ESC>
inoremap <silent> <C-f> <Right>
inoremap <silent> <C-b> <Left>
nnoremap <silent> <C-h> <C-w>h
nnoremap <silent> <C-j> <C-w>j
nnoremap <silent> <C-k> <C-w>k
nnoremap <silent> <C-l> <C-w>l
nnoremap j gj
nnoremap k gk
nnoremap H ^
nnoremap L $
nnoremap <silent> <leader>o <C-^>

"----------------------------------------
" quickfix 
"----------------------------------------
nnoremap <silent> <C-n> :cn<CR>
nnoremap <silent> <C-p> :cp<CR>

"----------------------------------------
" 検索
"----------------------------------------

" 検索するときに大文字小文字を区別しない
set ignorecase
" 小文字で検索すると大文字と小文字を無視して検索
set smartcase
" 検索がファイル末尾まで進んだら、ファイル先頭から再び検索
set wrapscan
" インクリメンタル検索 (検索ワードの最初の文字を入力した時点で検索が開始)
set incsearch
" 検索結果をハイライト表示
set hlsearch
" 検索結果をセンターに表示する
nnoremap n nzz
nnoremap N Nzz
nnoremap * *Nzz
nnoremap # #Nzz

"----------------------------------------
" 表示設定
"----------------------------------------

" ウインドウのサイズをリサイズ
nnoremap <silent> <C-w>< 10<C-w><
nnoremap <silent> <C-w>> 10<C-w>>
nnoremap <silent> <C-w>+ 10<C-w>+
nnoremap <silent> <C-w>- 10<C-w>-
" 対応する括弧やブレースを表示
set showmatch matchtime=1
" メッセージ表示欄を2行確保
set cmdheight=2
" ステータス行を常に表示
set laststatus=2
" ウィンドウの右下にまだ実行していない入力中のコマンドを表示
set showcmd
" 省略されずに表示
set display=lastline
" 行末のスペースを可視化
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%
" 入力モードでTabキー押下時に半角スペースを挿入
set expandtab
" インデント幅
set shiftwidth=2
" タブキー押下時に挿入される文字幅を指定
set softtabstop=2
" ファイル内にあるタブ文字の表示幅
set tabstop=2
" 対応する括弧を強調表示
set showmatch
" 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set smartindent
" スワップファイルを作成しない
set noswapfile
" 検索にマッチした行以外を折りたたむ(フォールドする)機能
set nofoldenable
" タイトルを表示
set title
" 行番号を表示
set number
" Escの2回押しでハイライト消去
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>
" 行をまたいで移動
set whichwrap=b,s,h,l,<,>,[,],~
" 画面をリロード
nnoremap <silent> <leader>r <C-l>

" goインデント設定
augroup goIndent
  autocmd!
  autocmd bufNewFile,BufRead *.go setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" Makefileインデント設定
augroup MakefileIndent
  autocmd!
  autocmd bufNewFile,BufRead Makefile setlocal tabstop=4 shiftwidth=4 softtabstop=4
augroup END

" Railsコマンド補完
augroup RailsCommands
  autocmd!
  autocmd FileType eruby inoremap <silent><C-s> :<C-u><%=  %><Left><Left><Left>
augroup END

augroup GrepCmd
  autocmd!
  autocmd QuickFixCmdPost vim, grep make if len(getqflist() != 0 | cwindow | endif)
augroup END

augroup PrevimSettings
  autocmd!
  autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading'
endif