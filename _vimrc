"==================
"NeoBundle
"==================
# 以下を追記
set nocompatible
filetype plugin indent off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

# 以下は必要に応じて追加
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neosnippet.vim'

filetype plugin indent on





"==================
"keymap
"==================


nmap <C-End> <C-End>
vmap <C-End> <C-End>
nmap <C-Home> <C-Home>
vmap <C-Home> <C-Home>

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


"====================
"Helpを日本語に
"====================
helptags ~/.vim/doc
set helplang=ja,en

