version 6.0
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
map! <C-End> <C-End>
map! <C-Home> <C-Home>
vmap  "-d
imap �� *
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
nmap <C-End> <C-End>
vmap <C-End> <C-End>
nmap <C-Home> <C-Home>
vmap <C-Home> <C-Home>
vmap �� "*d
vmap �� "*d
vmap �� "*y
vmap �� "-d"*P
nmap �� "*P
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set backspace=indent,eol,start
set helplang=ja
set laststatus=2
set ruler
set showmatch
set statusline=%<%F%h%m%r\ [%{&ff}]\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})%=%l,%c%V\ %P
set visualbell
" vim: set ft=vim :

"==================
"mysettings
"==================

"�s�ԍ��\��
set number

