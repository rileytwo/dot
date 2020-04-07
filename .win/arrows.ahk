;;; AHK ;;;

;;; GLOBAL
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; ^ = CTRL
; ! = ALT
; + = SHIFT
; # = Windows Key


;; alt+{w/a/s/d} for navigating text
!w::Send {Up}
!s::Send {Down}
!a::Send {Left}
!d::Send {Right}

;; alt+shift+{a/d} ;; jump/move word left and right
>!+a::Send ^{Left}
>!+d::Send ^{Right}

;; ^q => close window | ^h => minimize window
^q::Send {AltDown}{F4}{AltUp}
^h::WinMinimize, A

#Esc::


;;; FILE EXPLORER
#If WinActive("ahk_class CabinetWClass")
^l::Send ^{e}

^i::
    Send !{h}
    Sleep, 1
    Send {p}{r}
    Send {Enter}
Return
#If

;;; OUTLOOK
#If WinActive("ahk_exe OUTLOOK.EXE")
^+m::
    Send !{h}
    Sleep, 1
    Send {m}{v}
Return
#If

;;; FIREFOX
#If WinActive("ahk_exe firefox.exe")
^,::
    Send !{t}
    Sleep, 1
    Send {o}
Return

^Left::Send !{Left}
^Right::Send !{Right}
#If
