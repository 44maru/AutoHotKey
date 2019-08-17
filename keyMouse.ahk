global mode := 0
MOUSE_MOVE_DISTANCE := 5
PREFIX_MODE := 0
NO_PREFIX_MODE := 1
VI_MODE := 2

X_1 := 100
Y_1 := 100
X_2 := 1000
Y_2 := Y_1
X_3 := X_1
Y_3 := 450
X_4 := X_2
Y_4 := Y_3

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
vk1D & Space::MouseClick, Left,,,,,D
vk1D & Space UP::MouseClick, Left,,,,,U
vk1D & vk1C::MouseClick, Right
vk1D & @::MouseClick, Middle

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
vk1D & j::
vk1D & h::
vk1D & l::
    While (GetKeyState("vk1D", "P"))
    {
    	if GetKeyState("shift", "P")
	    	Magnification := 5
	    else if GetKeyState("ctrl", "P")
	    	Magnification := 1
	    else
	    	Magnification := 2

        MoveX := 0, MoveY := 0
        MoveY += GetKeyState("k", "P") ? -MOUSE_MOVE_DISTANCE*Magnification : 0
        MoveX += GetKeyState("h", "P") ? -MOUSE_MOVE_DISTANCE*Magnification : 0
        MoveY += GetKeyState("j", "P") ? MOUSE_MOVE_DISTANCE*Magnification : 0
        MoveX += GetKeyState("l", "P") ? MOUSE_MOVE_DISTANCE*Magnification : 0
        MouseMove, %MoveX%, %MoveY%, 1, R
        Sleep, 0
    }
    Return

vk1D & 1::MouseMove, %X_1%, %Y_1%, 1
vk1D & 2::MouseMove, %X_2%, %Y_2%, 1
vk1D & 3::MouseMove, %X_3%, %Y_3%, 1
vk1D & 4::MouseMove, %X_4%, %Y_4%, 1

vk1D & r::Reload
