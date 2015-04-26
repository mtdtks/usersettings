
;Default vim.ahk settings.
;#Include  %A_ScriptDir%\vim.ahk

;honten-ssbk settings
;write to "%HOME%\AutoHotkey.ahk"
;Setting fot honten-SSBK
;-----
;#Include  C:\Users\honten\vim.ahk
;#Include  C:\Users\honten\AutoHotkey.ahk
;-----
;Setting fot LUISXIV
;-----
;#Include  C:\Users\matsuoka\vim.ahk
;#Include  C:\Users\matsuoka\AutoHotkey.ahk
;------

; 十字キー設定
#k::send,{Up}
#j::send,{Down}
#l::send,{Right}
#h::send,{Left}

;日本語切り替え
;ctrl+無変換=半角/全角
^sc07B::send,{sc029}

