;;; hotkeys ;;;


;;; GLOBAL
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;;

;; alt+{wasd} for navigating text 
!a::Send {Left}    ;; left
Return

!w::Send {Up}      ;; up
Return

!s::Send {Down}    ;; down
Return

!d::Send {Right}   ;; right
Return

^h::WinMinimize, A ;; minimize (hide) windows with {control}{h}

#Esc::

;;; FILE EXPLORER
#IfWinActive ahk_class CabinetWClass
^l::Send ^e


;;; FIREFOX
#If WinActive("ahk_class MozillaWindowClass")
    ^,::
        Send !t
        Sleep 1
        Send o
    Return

    ^z::Send ^+t
    Return
#If

#If ("ahk_class MozillaWindowClass")
    ^Left::Send !{Left}
    Return
    ^Right::Send !{Right}
    Return
#If


;;; EVERNOTE
#If ("ahk_class ENMainFrame")
    ^q::Send !{F4}
    Return
#If

#IfWinActive ahk_class ENMainFrame
^l::^q

#n::
    Send, {F6}
    Sleep, 10
    Send, {LControl Down}{n}{LControl Up}
Return
