#include keyMouse_define.ahk

global mode := 0
MOUSE_MOVE_DISTANCE := 8
PREFIX_MODE := 0
NO_PREFIX_MODE := 1
VI_MODE := 2
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
vk1C & i::Run, %EDITOR% %AHK_FILE%


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

;-----------------------------
; Vi Mode Change
;-----------------------------
sc03A::
	if mode <> 2
	{
		mode := VI_MODE
		TrayTip , ,Vi Mode, 1
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
vk1C & k::
vk1C & j::
vk1C & h::
vk1C & l::
    While (GetKeyState("vk1C", "P"))
    {
        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("k", "P") ? -MOUSE_MOVE_DISTANCE : 0
        MoveX += GetKeyState("h", "P") ? -MOUSE_MOVE_DISTANCE : 0
        MoveY += GetKeyState("j", "P") ?  MOUSE_MOVE_DISTANCE : 0
        MoveX += GetKeyState("l", "P") ?  MOUSE_MOVE_DISTANCE : 0
        MouseMove, %MoveX%, %MoveY%, 1, R
        Sleep, 0
    }
    Return

;--------------------------
; Mouse move to fix point
;--------------------------
vk1C & q::MouseMove, %X_1%, %Y_1%, 7
vk1C & w::MouseMove, %X_2%, %Y_2%, 7
vk1C & e::MouseMove, %X_3%, %Y_3%, 7
vk1C & a::MouseMove, %X_4%, %Y_4%, 7
vk1C & s::MouseMove, %X_5%, %Y_5%, 7
vk1C & d::MouseMove, %X_6%, %Y_6%, 7
vk1C & z::MouseMove, %X_7%, %Y_7%, 7
vk1C & x::MouseMove, %X_8%, %Y_8%, 7
vk1C & c::MouseMove, %X_9%, %Y_9%, 7

;--------------------------
; Change Mouse Speed
;--------------------------
vk1C & sc03A::
  if A_TickCount < %MuhenkanDouble%
  {
	if MOUSE_MOVE_DISTANCE <> 24
	{
		MOUSE_MOVE_DISTANCE := 24
	}
	else
	{
		MOUSE_MOVE_DISTANCE := 8
	}
	Return
  }
  else
  {
    MuhenkanDouble = %A_TickCount%
    MuhenkanDouble += 400

	if MOUSE_MOVE_DISTANCE <> 8
	{
		MOUSE_MOVE_DISTANCE := 8
	}
	else
	{
		MOUSE_MOVE_DISTANCE := 2
	}
  }
 
Return


;-------------------
; Home / End
;-------------------
vk1D & g::
if GetKeyState("shift", "P")
	Send {End}
else
	Send {Home}
return

;-------------------
; PageUp / PageDown
;-------------------
vk1D & p::Send {Blind}{PgUp}
vk1D & n::Send {Blind}{PgDn}

;----------------------------
; Windows Virtual Desktop
;----------------------------
^#h::^#Left
^#l::^#Right

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
; Vi Mode
;-------------------
#if mode = 2
	k::Up
	j::Down
	h::Left
	l::Right
	i::
		Send, {F2}
		mode := PREFIX_MODE
		Return
#if


