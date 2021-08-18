#include keyMouse_define.ahk

CoordMode, Mouse, Screen

global mode := 0
MOUSE_MOVE_DISTANCE := MOUSE_MOVE_DISTANCE_M
PREFIX_MODE := 0
NO_PREFIX_MODE := 1
SysGet, Monitor, Monitor

X_L := MonitorLeft + (MonitorRight*PADDING_RATIO)
X_R := MonitorRight - (MonitorRight*PADDING_RATIO)
X_M := (X_L + X_R) / 2

Y_H := MonitorTop + (MonitorBottom*PADDING_RATIO)
Y_L := MonitorBottom - (MonitorBottom*PADDING_RATIO)
Y_M := (Y_H + Y_L) / 2

X_1 := X_L
Y_1 := Y_H
X_2 := X_M
Y_2 := Y_H
X_3 := X_R
Y_3 := Y_H
X_4 := X_L
Y_4 := Y_M
X_5 := X_M
Y_5 := Y_M
X_6 := X_R
Y_6 := Y_M
X_7 := X_L
Y_7 := Y_L
X_8 := X_M
Y_8 := Y_L
X_9 := X_R
Y_9 := Y_L


;-----------------------------
; Reload
;-----------------------------
vk1C & r::
	MsgBox, Reloaded!!
	Reload
	Return

;-----------------------------
; Edit
;-----------------------------
vk1C & 1::Run, %EDITOR% %AHK_FILE%
vk1C & 2::Run, %EDITOR% %AHK_DEF_FILE%
vk1C & 3::Run, C:\WINDOWS\explorer.exe %AHK_DIR%

;-----------------------------
; Numeric Keyboard
;-----------------------------
^+0::Send 0
^+Space::Send 0
^+n::Send,1
^+m::Send,1
^+,::Send,2
^+.::Send,3
^+j::Send,4
^+k::Send,5
^+l::Send,6
^+u::Send,7
^+i::Send,8
^+o::Send,9
^+~::Send,.
^+RAlt::Send .

;-----------------------------
; Mode Change
;-----------------------------
+!Space::
	if %mode% = %PREFIX_MODE%
	{
		mode := NO_PREFIX_MODE
		TrayTip , ,Easy Mode, 1
	}
	else
	{
		mode := PREFIX_MODE
		TrayTip , ,Normal Mode, 1
	}
Return

;--------------
; Mouse Click
;---------------
vk1C & Space::MouseClick, Left,,,,,D
vk1C & Space UP::MouseClick, Left,,,,,U
vk1C & vk1C::MouseClick, Right,,,,,D
vk1C & vk1C UP::MouseClick, Right,,,,,U
vk1C & v::MouseClick, Right,,,,,D
vk1C & v UP::MouseClick, Right,,,,,U
vk1C & @::MouseClick, Middle

;-------------------
; Mouse Wheel
;-------------------
vk1C & p::WheelUp
vk1C & n::WheelDown



;-------------------
; Mouse move
;-------------------
; Ignore key push in highspeed mode.
;vk1C & f::Return

vk1C & k::
vk1C & j::
vk1C & h::
vk1C & l::
	MOUSE_MOVE := MOUSE_MOVE_DISTANCE
    While (GetKeyState("vk1C", "P"))
    {
    	if (GetKeyState("shift", "P"))
    	{
    		MOUSE_MOVE := MOUSE_MOVE_DISTANCE_H
    	}
    	else if (GetKeyState("ctrl", "P"))
    	{
    		MOUSE_MOVE := MOUSE_MOVE_DISTANCE_L
    	}
    	else
    	{
    		if (MOUSE_MOVE == MOUSE_MOVE_DISTANCE_H) {
    			MOUSE_MOVE := MOUSE_MOVE_DISTANCE
    		}
    		
    		if (GetKeyState("k", "P") || GetKeyState("h", "P") || GetKeyState("j", "P") || GetKeyState("l", "P"))
    		{
    			if (MOUSE_MOVE < 7) {
    				MOUSE_MOVE := MOUSE_MOVE + 0.5
				}
    		}
    		else
    		{
				MOUSE_MOVE := MOUSE_MOVE_DISTANCE
    		}
    	}
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("k", "P") ? -MOUSE_MOVE : 0
        MoveX += GetKeyState("h", "P") ? -MOUSE_MOVE : 0
        MoveY += GetKeyState("j", "P") ?  MOUSE_MOVE : 0
        MoveX += GetKeyState("l", "P") ?  MOUSE_MOVE : 0
        MouseMove, %MoveX%, %MoveY%, 1, R
        Sleep, 0
    }
    Return

;--------------------------
; Mouse move to fix point
;--------------------------
vk1C & q::
	x := X_1
	y := Y_1
	if (GetKeyState("shift", "P"))
    {
    	if MULTI_DISPLAY_TYPE = %HOROZION%
    		x := x + MonitorRight
    	else
    		y := y + MonitorBottom
	}
	MouseMove, %x%, %y%, 5
	Return

vk1C & w::
	x := X_2
	y := Y_2
	if (GetKeyState("shift", "P"))
    {
    	if MULTI_DISPLAY_TYPE = %HOROZION%
    		x := x + MonitorRight
    	else
    		y := y + MonitorBottom
   	}
	MouseMove, %x%, %y%, 5
	Return
	
vk1C & e::
	x := X_3
	y := Y_3
	if (GetKeyState("shift", "P"))
    {
    	if MULTI_DISPLAY_TYPE = %HOROZION%
    		x := x + MonitorRight
    	else
    		y := y + MonitorBottom
   	}
	MouseMove, %x%, %y%, 5
	Return
	
vk1C & a::
	x := X_4
	y := Y_4
	if (GetKeyState("shift", "P"))
    {
    	if MULTI_DISPLAY_TYPE = %HOROZION%
    		x := x + MonitorRight
    	else
    		y := y + MonitorBottom
   	}
	MouseMove, %x%, %y%, 5
	Return
	
vk1C & s::
	x := X_5
	y := Y_5
	if (GetKeyState("shift", "P"))
    {
    	if MULTI_DISPLAY_TYPE = %HOROZION%
    		x := x + MonitorRight
    	else
    		y := y + MonitorBottom
   	}
	MouseMove, %x%, %y%, 5
	Return
	
vk1C & d::
	x := X_6
	y := Y_6
	if (GetKeyState("shift", "P"))
    {
    	if MULTI_DISPLAY_TYPE = %HOROZION%
    		x := x + MonitorRight
    	else
    		y := y + MonitorBottom
   	}
	MouseMove, %x%, %y%, 5
	Return
	
vk1C & z::
	x := X_7
	y := Y_7
	if (GetKeyState("shift", "P"))
    {
    	if MULTI_DISPLAY_TYPE = %HOROZION%
    		x := x + MonitorRight
    	else
    		y := y + MonitorBottom
   	}
	MouseMove, %x%, %y%, 5
	Return
	
vk1C & x::
	x := X_8
	y := Y_8
	if (GetKeyState("shift", "P"))
    {
    	if MULTI_DISPLAY_TYPE = %HOROZION%
    		x := x + MonitorRight
    	else
    		y := y + MonitorBottom
   	}
	MouseMove, %x%, %y%, 5
	Return
	
vk1C & c::
	x := X_9
	y := Y_9
	if (GetKeyState("shift", "P"))
    {
    	if MULTI_DISPLAY_TYPE = %HOROZION%
    		x := x + MonitorRight
    	else
    		y := y + MonitorBottom
   	}
	MouseMove, %x%, %y%, 5
	Return

;-----------------------------
; Henkan -> Hankaku/Zenkaku
;-----------------------------
vk1C::
	Send, {vkf3}
	Return

;-------------------
; VI mode
;-------------------
vk1D & k::Up
vk1D & j::Down
vk1D & h::Left
vk1D & l::Right
vk1D & i::F2
vk1D & d::Send {Blind}{Delete}
vk1D & x::Send {Blind}{Backspace}
vk1D & w::Send {Blind}{Right}{Right}{Right}{Right}
vk1D & b::Send {Blind}{Left}{Left}{Left}{Left}

;--------------------
; Escape
;--------------------
vk1D & e::Send, {Esc}


;-------------------
; Home / End
;-------------------
;vk1D & g::
;if GetKeyState("shift", "P")
;	Send {End}
;else
;	Send {Home}
;return

;-------------------
; PageUp / PageDown
;-------------------
vk1D & p::Send {Blind}{PgUp}
vk1D & n::Send {Blind}{PgDn}

;-------------------
; Ctrl+Tab / Ctrl+Shift+Tab
;-------------------
vk1C & o::^tab
vk1C & i::^+tab

;----------------------------
; Windows Virtual Desktop
;----------------------------
^#h::^#Left
^#l::^#Right

;vk1C::
;  if A_TickCount < %HenkanDouble%
;  {
;	Send, {vkf3}
;	Send, ^#{Right}
;	Return
;  }
;  else
;  {
;	Send, {vk1C}
;	HenkanDouble = %A_TickCount%
;	HenkanDouble += 400
;  }
;Return
 
vk1D::
  if A_TickCount < %MuhenkanDouble%
  {
	Send, ^#{Left}
	Return
  }
  else
  {
	MuhenkanDouble = %A_TickCount%
	MuhenkanDouble += 400
  }
Return

;-------------------
; No Prefix Mode
;-------------------
#if mode = 1
	k::
	j::
	h::
	l::
		Magnification := 2
	    While (GetKeyState("k", "P") || GetKeyState("j", "P") || GetKeyState("h", "P") || GetKeyState("l", "P"))
	    {
	        MoveX := 0, MoveY := 0
	        MoveY += GetKeyState("k", "P") ? -MOUSE_MOVE_DISTANCE*Magnification : 0
	        MoveX += GetKeyState("h", "P") ? -MOUSE_MOVE_DISTANCE*Magnification : 0
	        MoveY += GetKeyState("j", "P") ? MOUSE_MOVE_DISTANCE*Magnification : 0
	        MoveX += GetKeyState("l", "P") ? MOUSE_MOVE_DISTANCE*Magnification : 0
	        MouseMove, %MoveX%, %MoveY%, 1, R
	        Sleep, 0
	    }
	    Return

	+k::
	+j::
	+h::
	+l::
		Magnification := 5
	    While (GetKeyState("k", "P") || GetKeyState("j", "P") || GetKeyState("h", "P") || GetKeyState("l", "P"))
	    {
	        MoveX := 0, MoveY := 0
	        MoveY += GetKeyState("k", "P") ? -MOUSE_MOVE_DISTANCE*Magnification : 0
	        MoveX += GetKeyState("h", "P") ? -MOUSE_MOVE_DISTANCE*Magnification : 0
	        MoveY += GetKeyState("j", "P") ? MOUSE_MOVE_DISTANCE*Magnification : 0
	        MoveX += GetKeyState("l", "P") ? MOUSE_MOVE_DISTANCE*Magnification : 0
	        MouseMove, %MoveX%, %MoveY%, 1, R
	        Sleep, 0
	    }
	    Return


	;--------------
	; Mouse Click
	;---------------
	Space::MouseClick, Left,,,,,D
	Space UP::MouseClick, Left,,,,,U
	vk1C::MouseClick, Right
	@::MouseClick, Middle

	;--------------
	;Mouse Wheel
	;--------------
	p::WheelUp
	n::WheelDown

	;--------------
	;Home / End
	;--------------
	g::
	if GetKeyState("shift", "P")
		Send {End}
	else
		Send {Home}
	return
#if

;-------------------
; Output timestamp
;-------------------
^+;::
	FormatTime,TimeString,,yyyyMMdd
	Send,%TimeString%
	Return

^+/::
	FormatTime,TimeString,,yyyy/MM/dd
	Send,%TimeString%
	Return

^+vkBA::
	FormatTime,TimeString,,HH:mm:ss
	Send,%TimeString%
	Return


;-------------------
; Chrome
;-------------------
; Bookmark
#IfWinActive, ahk_class Chrome_WidgetWin_1
^b::
	Send, !{e}
	Send, b
	Return
#IfWinActive

; Open tab for clipboard url
vk1D & g::
	Run, %CHROME% %clipboard%


;--------------------
; On Putty
;--------------------
#if WinActive("ahk_class PuTTY") || WinActive("ahk_class KiTTY")

;
; Cursor jump next or previouse word
;
^+f::Send, {Esc}f
^+b::Send, {Esc}b


;
; Reset IME with escape vim INSERT mode
;
^j::
	Send, {vk1C}
	Send, {vkf3}
	Send, ^{j}
	Return

;
; Change window for tmux
;
vk1C & o::^!l
vk1C & i::^!h


;----------------------------------------
; Alt+Shift+(h/j/k/l) -> Vim window jump
;----------------------------------------
!+h::Send, ^wh
!+j::Send, ^wj
!+k::Send, ^wk
!+l::Send, ^wl


#if

