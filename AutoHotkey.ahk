
#Include %A_ScriptDir%\vim.ahk

; 十字キー設定
#k::send,{Up}
#j::send,{Down}
#l::send,{Right}
#h::send,{Left}

; テンキー
#.::send,{0}
#`;::send,{1}
#vkBAsc028::send,{2}  ;win+:
#]::send,{3}
#p::send,{4}
#@::send,{5}
#[::send,{6}
#-::send,{7}
#^::send,{8}
#\::send,{9}

; 右クリック
#z::send,{RButton}