
;Default vim.ahk settings.
;#Include  %A_ScriptDir%\vim.ahk

;write to "%HOME%\AutoHotkey.ahk"
;Setting fot win7
;-----
;#Include  C:\Users\username\vim.ahk
;#Include  C:\Users\username\AutoHotkey.ahk
;------

; 十字キー設定
#k::send,{Up}
#j::send,{Down}
#l::send,{Right}
#h::send,{Left}

;日本語切り替え
;ctrl+無変換=半角/全角
^sc07B::send,{sc029}

