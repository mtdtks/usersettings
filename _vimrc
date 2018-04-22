"======================================
"Plugins
"======================================

"--------------------------
" Start Dein Settings.
"--------------------------
"AutoCmd setting
" reset augroup
augroup MyAutoCmd
autocmd!
augroup END



"""
" Dein TOML
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~\vimfiles\dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '\repos\github.com\Shougo\dein.vim'
" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    "execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
    execute 'set runtimepath^=' . s:dein_repo_dir   
    "変更点
endif
" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)
  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/dein')      "ここも .vim → vimfiles に変えた
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'
  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})
  "call dein#add('Shougo/vimproc.vim', {
  "    \ 'build': {
  "    \     'windows' : 'tools\\update-dll-mingw',
  "    \     'cygwin'  : 'make -f make_cygwin.mak',
  "    \     'mac'     : 'make -f make_mac.mak',
  "    \     'linux'   : 'make',
  "    \     'unix'    : 'gmake',
  "    \    },
  "    \ })
  " 設定終了
  call dein#end()
  call dein#save_state()
endif



" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif





"==================
"Global_Settings
"==================


" for js test
au FileType javascript map <F4>  :!node %<CR>

"vimproc
let g:vimproc#download_windows_dll = 1

"Cygwin用設定
" ダメであった
if (has("win32") || has ("win64") )
set viminfo+=n~/.vim/viminfo_win
else
set viminfo+=n~/.vim/viminfo
endif

" 最後のヤンクを貼り付ける
"nnoremap p "0p
"nnoremap P "0P

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
"set clipboard+=unnamedplus,unnamed
set clipboard=unnamed,autoselect

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

" ハイライトのセッティング
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

"======================================
"UserCommand
"======================================
" XMLを整形
" :%s/></>\r</g | filetype indent on | setf xml | normal gg=G
command! XMLindent %s/></>\r</g | filetype indent on | setf xml | normal gg=G
command! Reconfig source ~/_vimrc | source $MYGVIMRC
command! Vimrc edit $MYVIMRC
command! Gvimrc edit $MYGVIMRC



"======================================
" Plugins
"======================================

"NeoBundle 'Shougo/unite.vim'
"NeoBundle 'Shougo/neocomplcache'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'ujihisa/unite-colorscheme'
"colorscheme test
":Unite colorscheme -auto-preview

"---------------------
"vim日本語ドキュメント
"---------------------
"NeoBundle 'vim-jp/vimdoc-ja'
" Use = :h
" vimdoc-ja 表示されない場合は以下を実行
" "helptags ~/.vim/bundle/vimdoc-ja/doc


"---------------------
"neosnippet
"---------------------
" Shougo/neosnippet
" Shougo/neocomplcache
" Shougo/neosnippet-snippets
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"

" Plugin key-mappings.
imap <C-;>     <Plug>(neosnippet_expand_or_jump)
smap <C-;>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
imap <expr><TAB> pumvisible() ? "\<C-n>" : neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

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
" Shougo/neocomplete

" Note: This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'




"-------------
"yankround.vim
"-------------
"なんかインストールするとレジスタ効かなくなる  
" yankround.vim {{{
"" キーマップ
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
"nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
"" 履歴取得数
let g:yankround_max_history = 50
""履歴一覧(kien/ctrlp.vim)
nnoremap <C-p>h :<C-u>CtrlPYankRound<CR>
" }}}
"yankroundが有効でないときは通常動作する
nnoremap <silent><SID>(ctrlp) :<C-u>CtrlP<CR>
nmap <expr><C-p> yankround#is_active() ? "\<Plug>(yankround-prev)" : "<SID>(ctrlp)"


"--------
"NERDTree
"--------
" ファイルをtree表示してくれる

"- 'scrooloose/nerdtree'
":NERDTreeでツリー起動
":NERDTreeToggleでトグル
"<C-e>でトグル
nnoremap <silent><C-e> :NERDTreeToggle<CR>

"------------
"vim_surround
"------------
"NeoBundle 'tpope/vim-surround'

"------------
"open-browzer
"------------
"NeoBundle 'open-browser.vim'
"カーソル位置のURLを"gx"でブラウザーで開く
"let g:netrw_nogx = 1 " disable netrw's gx mapping.
"nmap gx <Plug>(openbrowser-smart-search)
"vmap gx <Plug>(openbrowser-smart-search)

"htmlをブラウザーで開く
"command! OpenBrowserCurrent execute "OpenBrowser" expand("%:p")

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
"NeoBundle 'scrooloose/syntastic.git'
":helptagsを実行する
"consoleで npm install -g jshint

"htmlの設定=無効
"let g:syntastic_mode_map = { 'mode': 'active',
""    \ 'active_filetypes': [],
""    \ 'passive_filetypes': ['html'] }

"let g:syntastic_check_on_open=0
"let g:syntastic_check_on_save=1
"let g:syntastic_auto_loc_list=1
"let g:syntastic_loc_list_height=6
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_javascript_checkers = ['jshint']
"let g:syntastic_mode_map = {
"      \ 'mode': 'active',
"      \ 'active_filetypes': ['javascript'],
"      \ 'passive_filetypes': []
"      \ }
"let g:syntastic_enable_signs=1
"let g:syntastic_error_symbol='✗'
"let g:syntastic_warning_symbol='⚠'
"
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"-----------------
"kannokanno/previm
"-----------------
"NeoBundle 'kannokanno/previm'
"NeoBundle 'tyru/open-browser.vim'
" リアルタイムにプレビューする
"let g:previm_enable_realtime = 1
"let g:previm_open_cmd = ''
".md設定
"augroup PrevimSettings
"    autocmd!
"    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
"augroup END
"au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'open -a Firefox'

"Need to Add The Pass.
":command! PrevimFx32 :!firefox "C:\Documents and Settings\%USER%\.vim\bundle\previm\preview\index.html"
":command! PrevimFx :!firefox "C:\Users\%USER%\.vim\bundle\previm\preview\index.html"

"use :PrevimOpen


"-------------
"lightline.vim
"-------------
"NeoBundle 'itchyny/lightline.vim'

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
"NeoBundle 'mattn/webapi-vim'
"NeoBundle 'mattn/gist-vim'
"
"let g:github_user = 'mtdtks'
"let g:github_token = 'daca7772064fc77d74d88cf65defdc0ff8b9ae4e'
"let g:gist_curl_options = "-k"
"let g:gist_detect_filetype = 1

"-------
"TwitVim
"-------
"NeoBundle 'TwitVim'
"let twitvim_browser_cmd = 'C:\Program Files (x86)\Mozilla Firefox\firefox.exe'
"let twitvim_count = 40
"このコマンドでつぶやきます。
"    :PosttoTwitter
"こちらは、自分のタイムラインを表示します。
"    :FriendsTwitter
"タイムラインをリフレッシュ
"    :RefreshTwitter

"--------------
"vimperator.vim
"--------------
"NeoBundle 'vimperator/vimperator.vim'



"--------------
"minimap-vim
"--------------
"NeoBundle 'koron/minimap-vim.git'

"==============={webCodingTools}=======================


"-----------------
"emmet-vim
"-----------------
"NeoBundle 'mattn/emmet-vim'
"default = <C-y>+,
"let g:user_emmet_leader_key='<C-t>'

"---------
"html5.vim
"---------
"NeoBundle 'othree/html5.vim'
"---------------
"vim-css3-syntax
"---------------
"NeoBundle 'hail2u/vim-css3-syntax'

"---------------
"vim-vimperator
"vimperator-syntax
"---------------
"NeoBundle 'superbrothers/vim-vimperator'

"==================
"Color_Scheme
"==================
"hybrid
"set background=dark
"colorscheme hybrid
"syntax on

"cli colorscheme
colorscheme desert

" solarized
"NeoBundle 'altercation/vim-colors-solarized'
" jellybeans
"NeoBundle 'nanotech/jellybeans.vim'
" molokai
"NeoBundle 'tomasr/molokai'
" mustang
"NeoBundle 'croaker/mustang-vim'
"vim-tomorrow-theme
"NeoBundle 'chriskempson/vim-tomorrow-theme'

"set t_Co=256

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

imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

nnoremap <C-o> :<C-u>call append(expand('.'), '')<Cr>j

nnoremap wu <C-w>+<C-w>+
nnoremap wd <C-w>-<C-w>-
nnoremap wf <C-w>><C-w>>
nnoremap wb <C-w><<C-w><

"====================
"Helpを日本語に
"====================
"helptags ~/.vim/doc -error
"set helplang=ja,en -error
"たぶんこれいらない

set background=dark
colorscheme desert
syntax on

