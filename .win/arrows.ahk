;;; GLOBAL
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%

; ^ = CTRL
; ! = ALT
; + = SHIFT
; # = Windows Key
; Full Key List: https://www.autohotkey.com/docs/KeyList.htm

;; Unbind Win+Esc
#Esc::

; Remap Ctrl-Tab to Alt-Tab
LControl & Tab::AltTab
Shift::ShiftAltTab

;; ctrl+{w/a/s/d} for navigating text
>^w::Send {Up}
>^s::Send {Down}
>^a::Send {Left}
>^d::Send {Right}

;; ctrl+shift+{a/d} ;; jump/move word left and right
>^+a::Send ^{Left}
>^+d::Send ^{Right}

;; ^q => close window | ^h => minimize window
<^q::Send {AltDown}{F4}{AltUp}
<^h::WinMinimize, A

;; LWin+shift+[/]
#+[::Send #{Left}
#+]::Send #{Right}


;;; EXPLORER
#If WinActive("ahk_class CabinetWClass")
<^3::
    Send !{v}
    Sleep, 1
    Send {s}{f}
Return

<^i::
    Send !{h}
    Sleep, 1
    Send {p}{r}
    Send {Enter}
Return

<^+p::
    Send !{v}
    Sleep, 1
    Send {p}
Return

<^+d::
    Send !{v}
    Sleep, 1
    Send {d}
Return

^[::Send !{Left}
^]::Send !{Right}
#If

;;; ONENOTE (for Windows)
#If WinActive("ahk_exe ApplicationFrameHost.exe")
<^[::Send !+{Left}
<^]::Send !+{Right}
Return
#If


;;; OUTLOOK
#If WinActive("ahk_exe OUTLOOK.EXE")
<^+m::
    Send !{h}
    Sleep, 1
    Send {m}{v}
Return
#If


;;; FIREFOX
#If WinActive("ahk_exe firefox.exe")
<^,::
    Send !{t}
    Sleep, 1
    Send {o}
Return
#If
