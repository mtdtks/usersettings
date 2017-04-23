;; -*-mode: ahk; coding:utf-8-dos-*-"
;; utf-8
FileEncoding, CP65001
#InstallKeybdHook

; My TenKey
; ( Num )
; [ Tab ][  /  ][  *  ][ BS  ]
; [  7  ][  8  ][  9  ][  -  ]
; [  4  ][  5  ][  6  ][  +  ]
; [  1  ][  2  ][  3  ][Enter]
; [  0  ][ 00  ][  .  ][Enter]
;
;  "00"はNumkey0×2打である模様
;母音
;アルファベットキーマップ
; + Normal
; [  a  ][  i  ][  u  ]
; [  e  ][  o  ][  b  ]
; [  c  ][  d  ][  f  ]
; + Enter
; [  g  ][  h  ][  j  ]
; [  k  ][  l  ][  m  ]
; [  n  ][  p  ][  q  ]
; + Dot
; [  r  ][  s  ][  t  ]
; [  v  ][  w  ][  x  ]
; [  y  ][  z  ]
;
;リファレンス
;
;キーリスト
;https://sites.google.com/site/autohotkeyjp/reference/KeyList
;



;Shift + Numpadは一回以降効かなくなるっぽい

;ひとまず大文字は置いておく＝3つ押しの問題

NumpadEnter Up::send,{Enter} ;修飾キー1
NumpadDot Up::send,{NumpadDot} ;修飾キー2
NumpadAdd::LShift ;+＝Shiftキー
NumpadAdd Up::send,{NumpadAdd}

; NumpadEnter Down::TrayTip, Cutkey, testeste, , , 50

;;        ;;
;; Normal ;;
;;        ;;
Numpad7::send,{a}
;NumpadHome::send,{A}
+Numpad7::send,{A}
Numpad8::send,{i}
NumpadUp::send,{I}
Numpad9::send,{u}
NumpadPgUp::send,{U}

Numpad4::send,{e}
NumpadLeft::send,{E}
Numpad5::send,{o}
vk0Csc04C::send,{O} ;Numpad5 + Shift;
Numpad6::send,{b}
NumpadRight::send,{B}

Numpad1::send,{c}
NumpadEnd::send,{C}
Numpad2::send,{d}
NumpadDown::send,{D}
Numpad3::send,{f}
NumpadPgDn::send,{F}
;;        ;;
;; +Enter ;;
;;        ;;
NumpadEnter & Numpad7::send,{g}
;NumpadEnter & LShift & Numpad7::send,{G}
NumpadEnter & Numpad8::send,{h}
NumpadEnter & Numpad9::send,{j}

NumpadEnter & Numpad4::send,{k}
NumpadEnter & Numpad5::send,{l}
NumpadEnter & Numpad6::send,{m}

NumpadEnter & Numpad1::send,{n}
NumpadEnter & Numpad2::send,{p}
NumpadEnter & Numpad3::send,{q}

;;        ;;
;; +Dot   ;;
;;        ;;
NumpadDot & Numpad7::send,{r}
NumpadDot & Numpad8::send,{s}
NumpadDot & Numpad9::send,{t}

NumpadDot & Numpad4::send,{v}
NumpadDot & Numpad5::send,{w}
NumpadDot & Numpad6::send,{x}

NumpadDot & Numpad1::send,{y}
NumpadDot & Numpad2::send,{z}


;参考
;任意のモードを設定し、そのモードを任意のキーで切り替えるスクリプト - blechmusikの日記
;http://blechmusik.hatenablog.jp/entry/20120324/1332530553
;片手用キーボードHalfKeyboardをAutoHotkeyでエミュレーションする - 情報科学屋さんを目指す人のメモ（FC2ブログ版）
;http://did2.blog64.fc2.com/blog-entry-367.html

;; 変換キーで「数字＋カーソル移動モード」の配列を呼び出す
;; 無変換キーで「記号モード」の配列を呼び出す
;; 
;; モードを解除するには、「使用中のモード」へと切り替えるキーを再度押すこと
;; プログラムを終了するには F12 を押す

;; ================================================================
;; モードの初期化
initialize_key_layout_mode()

;; モード変更時にモードの情報を表示する時間（ミリ秒）
RemoveToolTip_time := 3000
return

;; ============================================================
;; モード変更用のキー

;; 無変換->記号モード
NumpadDiv::
	set_key_layout_mode("Symbol")
return

;; 変換->数字+カーソル移動モード
NumpadMult::
  set_key_layout_mode("NumberAndMove")
return

;; 大文字モード
NumpadSub::
  set_key_layout_mode("Uppercase")
return

;; ============================================================
;; F12 を押せばプログラムを終了する
F12::
	MsgBox, 4, プログラムの終了, プログラムを終了しますか？
	IfMsgBox, Yes
		ExitApp
return

;; ============================================================

;; #If - AutoHotkeyJp
;; http://sites.google.com/site/autohotkeyjp/reference/commands/-If

;; キーリスト - AutoHotkeyJp
;; http://sites.google.com/site/autohotkeyjp/reference/KeyList

#if get_key_layout_mode("Symbol")
	A::
		send,-
		return
#if

#if get_key_layout_mode("NumberAndMove")
	A::
		send,1
		return
#if

#if get_key_layout_mode("Uppercase")
  ;;        ;;
  ;; Normal ;;
  ;;        ;;
  Numpad7::send,{A}
  Numpad8::send,{I}
  Numpad9::send,{U}
  
  Numpad4::send,{E}
  Numpad5::send,{O}
  Numpad6::send,{B}
  
  Numpad1::send,{C}
  Numpad2::send,{D}
  Numpad3::send,{F}
  ;;        ;;
  ;; +Enter ;;
  ;;        ;;
  NumpadEnter & Numpad7::send,{G}
  NumpadEnter & Numpad8::send,{H}
  NumpadEnter & Numpad9::send,{J}
  
  NumpadEnter & Numpad4::send,{K}
  NumpadEnter & Numpad5::send,{L}
  NumpadEnter & Numpad6::send,{M}
  
  NumpadEnter & Numpad1::send,{N}
  NumpadEnter & Numpad2::send,{P}
  NumpadEnter & Numpad3::send,{Q}
  
  ;;        ;;
  ;; +Dot   ;;
  ;;        ;;
  NumpadDot & Numpad7::send,{R}
  NumpadDot & Numpad8::send,{S}
  NumpadDot & Numpad9::send,{T}
  
  NumpadDot & Numpad4::send,{V}
  NumpadDot & Numpad5::send,{W}
  NumpadDot & Numpad6::send,{X}
  
  NumpadDot & Numpad1::send,{Y}
  NumpadDot & Numpad2::send,{Z}
#if

get_num_for_key_layout_mode(str){
	return % (str = "NumberAndMove") ? 1 
		   : (str = "Symbol") ? 2 
       : (str = "Uppercase") ? 3 
		   : 0
}

get_str_for_key_layout_mode(num){
	return % (num = 1) ? "Number+MoveMode"
		   : (num = 2) ? "SymbolMode"
       : (num = 3) ? "UppercaseMode"
		   : "NormalMode"
}

initialize_key_layout_mode(){
	global
	key_layout_mode := 0
}

set_key_layout_mode(str){
	global key_layout_mode
	global RemoveToolTip_time
		
	ret := get_num_for_key_layout_mode(str)
	;; toggle
	key_layout_mode := (key_layout_mode = ret) ? 0 : ret
	
	if (0 < ret) {
		;ToolTip, % "-> " get_str_for_key_layout_mode(key_layout_mode)
		;SetTimer, RemoveToolTip, %RemoveToolTip_time%
    TrayTip, title, % get_str_for_key_layout_mode(key_layout_mode), , , %RemoveToolTip_time%
	}

	return key_layout_mode
}

get_key_layout_mode(str){
	global key_layout_mode
	
	ret := get_num_for_key_layout_mode(str)
	
	return % (ret = key_layout_mode) ? True : False
}


RemoveToolTip:
	SetTimer, RemoveToolTip, Off
	ToolTip
return
