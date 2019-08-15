global mode := 0
MOUSE_MOVE_DISTANCE := 100
PREFIX_MODE := 0
NO_PREFIX_MODE := 1

^!n::
	if %mode% = %PREFIX_MODE%
	{
		mode := NO_PREFIX_MODE
		TrayTip , ,No Prefix Mode, 1
		return
	}
	else
	{
		mode := PREFIX_MODE
		TrayTip , ,Need Prefix Mode, 1
	}
return

;--------------
; Mouse Click
;---------------
vk1D & Space::MouseClick, Left,,,,,D
vk1D & Space UP::MouseClick, Left,,,,,U
vk1D & vk1C::MouseClick, Right
vk1D & @::MouseClick, Middle

;-------------------
; No Prefix Mode
;-------------------
#if mode = 1
	;---------------
	; Mouse Up
	;---------------
	 k::MouseMove 0, -MOUSE_MOVE_DISTANCE, 0, R
	^k::MouseMove 0, -10, 0, R
	+k::MouseMove 0, -1000, 0, R

	;---------------
	; Mouse Down
	;---------------
	 j::MouseMove 0, MOUSE_MOVE_DISTANCE, 0, R
	^j::MouseMove 0, 10, 0, R
	+j::MouseMove 0, 1000, 0, R

	;---------------
	; Mouse Left
	;---------------
	 h::MouseMove -MOUSE_MOVE_DISTANCE, 0, 0, R
	^h::MouseMove -10, 0, 0, R
	+h::MouseMove -1000, 0, 0, R

	;---------------
	; Mouse Right
	;---------------
	 l::MouseMove MOUSE_MOVE_DISTANCE, 0, 0, R
	^l::MouseMove 10, 0, 0, R
	+l::MouseMove 1000, 0, 0, R

	;--------------
	; Mouse Click
	;---------------
	Space::MouseClick, Left,,,,,D
	Space UP::MouseClick, Left,,,,,U
	vk1C::MouseClick, Right
	@::MouseClick, Middle

#if


;Mouse Wheel
vk1D & p::WheelUp
vk1D & n::WheelDown

;Home / End
vk1D & g::
if GetKeyState("shift", "P")
	Send {End}
else
	Send {Home}
return



vk1D & k::
if GetKeyState("ctrl", "P")
	MouseMove 0, -10, 0, R
else if GetKeyState("shift", "P")
	MouseMove 0, -1000, 0, R
else
	MouseMove 0, -MOUSE_MOVE_DISTANCE, 0, R
return

vk1D & j::
if GetKeyState("ctrl", "P")
	MouseMove 0, 10, 0, R
else if GetKeyState("shift", "P")
	MouseMove 0, 1000, 0, R
else
	MouseMove 0, MOUSE_MOVE_DISTANCE, 0, R
return
 
vk1D & h::
if GetKeyState("ctrl", "P")
	MouseMove -10, 0, 0, R
else if GetKeyState("shift", "P")
	MouseMove -1000, 0, 0, R
else
	MouseMove -MOUSE_MOVE_DISTANCE, 0, 0, R
return

vk1D & l::
if GetKeyState("ctrl", "P")
	MouseMove 10, 0, 0, R
else if GetKeyState("shift", "P")
	MouseMove 1000, 0, 0, R
else
	MouseMove MOUSE_MOVE_DISTANCE, 0, 0, R
return
 
