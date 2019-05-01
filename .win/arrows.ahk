;;; hotkeys ;;;


;;; GLOBAL
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;;


^h::WinMinimize, A ;; minimize (hide) windows with {control}{h}
;;

;; alt+{wasd} for navigating text 
!a::Send {Left} ;; left
return
;;

!w::Send {Up} ;; up
return
;;

!s::Send {Down} ;; down
return
;;

!d::Send {Right} ;; right
return
;;; END GLOBAL

;;; FILE EXPLORER

#IfWinActive ahk_class CabinetWClass
^l::Send ^e


;;; FIREFOX
#IfWinActive ahk_class MozillaWindowClass
^,::
    Send !t
    Sleep 1
    Send o
Return
#IfWinActive
;;

#IfWinActive ahk_class MozillaWindowClass
^z::Send ^+t
return
#IfWinActive
;;

#IfWinActive ahk_class MozillaWindowClass
^Left::Send !{Left}
^Right::Send !{Right}
#IfWinActive
;;; END FIREFOX

;;; EVERNOTE
#IfWinNotActive ahk_class ENMainFrame
^q::Send !{F4}

#IfWinNotActive


#IfWinActive ahk_class ENMainFrame

^l::^q

#n::
    Send, {F6}
    Sleep, 10
    Send, {LControl Down}{n}{LControl Up}
return

; end evernote