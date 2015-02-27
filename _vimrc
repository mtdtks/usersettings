"==================
"Global_Settings
"==================
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

"---------------------------
" Start Neobundle Settings.
"---------------------------
" Required:
call neobundle#begin(expand('~/.vim/bundle/'))


" 以下を追記
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

" 以下は必要に応じて追加
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet'
" ver.4.1からは以下を追加する
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'ujihisa/unite-colorscheme'
"colorscheme test
":Unite colorscheme -auto-preview

"==================
"vimproc
"==================
"- Shougo/vimproc
"NeoBundle 'Shougo/vimproc'


"kaoriya_vim\tools\plugins\vimroc\vimproc_win32.dllを
".vim/bundle/vimproc/aoutoload/にコピー

"==================
"neocomplete
"==================
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


"==================
"yankaround.vim
"==================

"NeoBundle 'LeafCage/yankround.vim'

" yankround.vim {{{
"nmap p <Plug>(yankround-p)
"nmap P <Plug>(yankround-P)
"nmap <C-p> <Plug>(yankround-prev)
"nmap <C-n> <Plug>(yankround-next)
"let g:yankround_max_history = 100
"nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>
"}}}

"==================
"NERDTree
"==================
" ファイルをtree表示してくれる

"- 'scrooloose/nerdtree'
NeoBundle 'scrooloose/nerdtree'
":NERDTreeでツリー起動
":NERDTreeToggleでトグル

"==================
"vim_surround
"==================
NeoBundle 'tpope/vim-surround'

"==================
"Tern for Vim
"==================
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

"==================
"syntastic
"==================
NeoBundle 'scrooloose/syntastic.git'
":helptagsを実行する
"consoleで npm install -g jshint
let g:syntastic_mode_map = {
let g:syntastic_javascript_checkers = [‘jshint’]

\ "mode" : "active",
\ "active_filetypes" : ["javascript", "json"],
\}


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"==================
"Color_Scheme
"==================
"hybrid
NeoBundle 'w0ng/vim-hybrid.vim'
" solarized
NeoBundle 'altercation/vim-colors-solarized'
" jellybeans
NeoBundle 'nanotech/jellybeans.vim'
" molokai
NeoBundle 'tomasr/molokai'
" mustang
NeoBundle 'croaker/mustang-vim'
" vim-hybrid
NeoBundle 'w0ng/vim-hybrid'

"set t_Co=256
colorscheme ron
syntax on

"  set t_Co=256
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"elseif &term =~ "xterm-color"
"  set t_Co=8
"  set t_Sf=[3%dm
"  set t_Sb=[4%dm
"endif
"
"syntax enable
"hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

call neobundle#end()

" Required:
filetype plugin indent on

" 未インストールのプラグインがある場合、インストールするかどうかを尋ねてくれるようにする設定
" 毎回聞かれると邪魔な場合もあるので、この設定は任意です。
NeoBundleCheck

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

