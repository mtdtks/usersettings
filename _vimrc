"==================
"Global_Settings
"==================

"コマンドオートコンプリート
set nocompatible
set wildmode=list,full

"undo,swap,backupファイルを1か所に保存する
:set undodir=~/.vim/tmp
:set directory=~/.vim/tmp
:set backupdir=~/.vim/tmp


language messages ja_jp.UTF-8
:set encoding=utf-8

"yankをクリップボードへ保存する
" GUI版vimエディタで、この機能を有効にするなら、この設定を追加する。
":set guioptions+=a
" GUI版でない場合は、こちらの設定を追加する。
":set clipboard+=autoselect
"cuiでこちらが確実
set clipboard+=unnamedplus,unnamed

"タブ・スペースの表示
set list
set listchars=tab:>-,trail:-,extends:>,precedes:<,nbsp:%
"カーソル行強調
set cursorline

" 全角スペース表示
autocmd ColorScheme * hi link TwoByteSpace Error
autocmd VimEnter,WinEnter * let w:m_tbs = matchadd("TwoByteSpace", '　')

"スペースをハイライト
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=bold,reverse guibg=#080808 guifg=#808080 ctermbg=Red

  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END


"======================================
"Plugins
"======================================
"--------------------------
" Start Neobundle Settings.
"--------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" 以下は必要に応じて追加
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
" ver.4.1からは以下を追加する
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ujihisa/unite-colorscheme'
"colorscheme test
":Unite colorscheme -auto-preview

"---------------------
"vim日本語ドキュメント
"---------------------
NeoBundle 'vim-jp/vimdoc-ja'
" Use = :h
" vimdoc-ja 表示されない場合は以下を実行
" "helptags ~/.vim/bundle/vimdoc-ja/doc


"-------
"vimproc
"-------
"- Shougo/vimproc

"NeoBundle 'Shougo/vimproc'


"kaoriya_vim\tools\plugins\vimroc\vimproc_win32.dllを
".vim/bundle/vimproc/aoutoload/にコピー

"-----------
"neocomplete
"-----------
if has('lua')
  NeoBundleLazy 'Shougo/neocomplete.vim', {
    \ 'depends' : 'Shougo/vimproc',
    \ 'autoload' : { 'insert' : 1,}
    \ }
endif

" neocomplete {{{
let g:neocomplete#enable_at_startup               = 1
let g:neocomplete#auto_completion_start_length    = 3
let g:neocomplete#enable_ignore_case              = 1
let g:neocomplete#enable_smart_case               = 1
let g:neocomplete#enable_camel_case               = 1
let g:neocomplete#use_vimproc                     = 1
let g:neocomplete#sources#buffer#cache_limit_size = 1000000
let g:neocomplete#sources#tags#cache_limit_size   = 30000000
let g:neocomplete#enable_fuzzy_completion         = 1
let g:neocomplete#lock_buffer_name_pattern        = '\*ku\*'
"}}}

"--------
"YankRing
"--------
"Problem : ':YRShow' not work
"Not Succeed Install!
"NeoBundle 'YankRing'

"-------------
"yankround.vim
"-------------
"なんかインストールするとレジスタ効かなくなる  
"NeoBundle 'LeafCage/yankround.vim'
"Usage
"<C-p>,<C-n>
"nmap p <Plug>(yankround-p)
"nmap P <Plug>(yankround-P)
"nmap gp <Plug>(yankround-gp)
"nmap gP <Plug>(yankround-gP)
"nmap <C-p> <Plug>(yankround-prev)
"nmap <C-n> <Plug>(yankround-next)
"let g:yankround_max_history = 35

"nnoremap <silent>g<C-p> :<C-u>CtrlPYankRound<CR>
"--------
"NERDTree
"--------
" ファイルをtree表示してくれる

"- 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdtree'
":NERDTreeでツリー起動
":NERDTreeToggleでトグル
"<C-e>でトグル
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"------------
"vim_surround
"------------
NeoBundle 'tpope/vim-surround'

"------------
"Tern for Vim
"------------
"重くて使い物にならん
"- marijnh/tern_for_vim
"NeoBundle 'marijnh/tern_for_vim', {
"\ 'build': {
"\   'others': 'npm install'
"\   }
"\}

"===
"コマンド一覧
"TernDef: Jump to the definition of the thing under the cursor.
"TernDoc: Look up the documentation of something.
"TernType: Find the type of the thing under the cursor.
"TernRefs: Show all references to the variable or property under the cursor.
"TernRename: Rename the variable under the cursor.
"===

"---------
"syntastic
"---------
NeoBundle 'scrooloose/syntastic.git'
":helptagsを実行する
"consoleで npm install -g jshint

"htmlの設定=無効
"let g:syntastic_mode_map = { 'mode': 'active',
""    \ 'active_filetypes': [],
""    \ 'passive_filetypes': ['html'] }

let g:syntastic_check_on_open=0
let g:syntastic_check_on_save=1
let g:syntastic_auto_loc_list=1
let g:syntastic_loc_list_height=6
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_mode_map = {
      \ 'mode': 'active',
      \ 'active_filetypes': ['javascript'],
      \ 'passive_filetypes': []
      \ }
let g:syntastic_enable_signs=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"-----------------
"kannokanno/previm
"-----------------
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
" リアルタイムにプレビューする
let g:previm_enable_realtime = 1
let g:previm_open_cmd = ''
".md設定
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
"au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'open -a Firefox'

"Need to Add The Pass.
":command! PrevimFx32 :!firefox "C:\Documents and Settings\Owner\.vim\bundle\previm\preview\index.html"
:command! PrevimFx :!firefox "C:\Users\matsuoka\.vim\bundle\previm\preview\index.html"

"use :PrevimOpen

"-------------------
"thinca/vim-fontzoom
"-------------------
NeoBundle 'thinca/vim-fontzoom'

"-------------
"lightline.vim
"-------------
NeoBundle 'itchyny/lightline.vim'

"-----------------
"evervim
"-----------------
"win8.1ではpythonがうまく動作しない為動作不良
"参考:http://gk9187.hatenablog.com/entry/2014/12/08/175751
"NeoBundle 'kakkyz81/evervim'
"初期設定
"let g:evervim_devtoken="S=s71:U=9a45ba:E=1577f0ca7e7:C=150275b7a70:P=1cd:A=en-devtoken:V=2:H=993031ddb0537fe4da8c1635e1b2b431"


"---------
"vim-gista
"---------
"NeoBundle 'lambdalisue/vim-gista', {
"     \  'depends': [
"     \     'Shougo/unite.vim',
"     \     'tyru/open-browzer.vim',
"     \]}
"neobundle.vim (Lazy)
"NeoBundleLazy 'lambdalisue/vim-gista', {
"    \ 'autoload': {
"    \    'commands': ['Gista'],
"    \    'mappings': '<Plus>(gista-',
"    \    'unite_sources': 'gista',
"    \}}

"let g:gista#github_user = 'mtdtks'

"--------
"vim-gist
"--------
"Require cURL in Win32
"mattn/webapi-vim
NeoBundle 'mattn/webapi-vim'
NeoBundle 'mattn/gist-vim'

let g:github_user = 'mtdtks'
let g:github_token = 'daca7772064fc77d74d88cf65defdc0ff8b9ae4e'
let g:gist_curl_options = "-k"
let g:gist_detect_filetype = 1

"-------
"TwitVim
"-------
NeoBundle 'TwitVim'
let twitvim_browser_cmd = 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe'
let twitvim_count = 40
"このコマンドでつぶやきます。
"    :PosttoTwitter
"こちらは、自分のタイムラインを表示します。
"    :FriendsTwitter
"タイムラインをリフレッシュ
"    :RefreshTwitter



"==============={webCodingTools}=======================


"-----------------
"emmet-vim
"-----------------
NeoBundle 'mattn/emmet-vim'
"default = <C-y>+,
let g:user_emmet_leader_key='<C-t>'

"---------
"html5.vim
"---------
NeoBundle 'othree/html5.vim'
"---------------
"vim-css3-syntax
"---------------
NeoBundle 'hail2u/vim-css3-syntax'

"==================
"Color_Scheme
"==================
"hybrid
"!!manual Install!!
"git clone "https://github.com/w0ng/vim-hybrid.git" ->.vim/bundle/vim-hybrid
"NeoBundle 'w0ng/vim-hybrid'

" solarized
NeoBundle 'altercation/vim-colors-solarized'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" molokai
NeoBundle 'tomasr/molokai'
" mustang
NeoBundle 'croaker/mustang-vim'
"vim-tomorrow-theme
NeoBundle 'chriskempson/vim-tomorrow-theme'

"set t_Co=256
syntax on
set background=dark
colorscheme hybrid


"  set t_Co=256
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"elseif &term =~ xterm-color"
"  set t_Co=8
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"endif
"
"syntax enable
"hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c


" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
"NeoBundleCheck
call neobundle#end()
"-------------------------
" End Neobundle Settings.
"-------------------------

"==================
"view_settings
"==================

set autoindent
set backspace=indent,eol,start
set helplang=ja
set laststatus=2
set ruler
set showmatch
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P
set visualbell
" vim: set ft=vim :

"行番号の表示
set number
"インクメンタルサーチ
set incsearch
"コマンドライン補完
"set wildmenu=list:full -error

"==================
"font_settings
"==================
"set guifont=Ricty Discord:h20 -error
"set guifontwide=Ricty Discord:h20 -error


"==================
"syntax
"==================


set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"==================
"文字コード関係
"==================

set encoding=utf-8
"ターミナル内エンコーディングはsjisらしい
set termencoding=sjis
"ここらへんはまだ不明
set fileencoding=utf-8
set fileencodings=utf-8,cp932

"英語メニューにする
source $VIMRUNTIME/delmenu.vim
set langmenu=none
source $VIMRUNTIME/menu.vim

"英語メッセージにする
if has("multi_lang")
language C
endif

"==================
"keymap
"==================

nmap <C-End> <C-End>
vmap <C-End> <C-End>
nmap <C-Home> <C-Home>
vmap <C-Home> <C-Home>

"====================
"Helpを日本語に
"====================
"helptags ~/.vim/doc -error
"set helplang=ja,en -error
"たぶんこれいらない

