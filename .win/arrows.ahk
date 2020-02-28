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
!a::Send {Left}    ;; left
Return

!w::Send {Up}      ;; up
Return

!s::Send {Down}    ;; down
Return

!d::Send {Right}   ;; right
Return

^q::Send {AltDown}{F4}{AltUp}     ;; alt+F4 (close window)
Return

;; alt+shift+{a/d} ;; jump/move word left and right
>!+a::Send ^{Left}
>!+d::Send ^{Right}

^h::WinMinimize, A ;; minimize (hide) windows with {control}{h}

#Esc::


;;; FILE EXPLORER
#If WinActive("ahk_class CabinetWClass")
^l::Send ^e
#If


;;; FIREFOX
#If WinActive("ahk_exe firefox.exe")
^,::
    Send !t
    Sleep 1
    Send o
Return

^Left::Send !{Left}
Return

^Right::Send !{Right}
#If


;;; EVERNOTE
#If WinActive("ahk_class ENMainFrame")
^l::^q

#n::
Send, {F6}
Sleep, 10
Send, {LControl Down}{n}{LControl Up}
Return
^\::Send {F10}
Return

^+\::Send {F11}
Return
#If

