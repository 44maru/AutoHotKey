distance := 100

vk1D & Space::MouseClick, Left,,,,,D
vk1D & Space UP::MouseClick, Left,,,,,U
vk1D & vk1C::MouseClick, Right
vk1D & @::MouseClick, Middle

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
	MouseMove 0, -distance, 0, R
return

vk1D & j::
if GetKeyState("ctrl", "P")
	MouseMove 0, 10, 0, R
else if GetKeyState("shift", "P")
	MouseMove 0, 1000, 0, R
else
	MouseMove 0, distance, 0, R
return
 
vk1D & h::
if GetKeyState("ctrl", "P")
	MouseMove -10, 0, 0, R
else if GetKeyState("shift", "P")
	MouseMove -1000, 0, 0, R
else
	MouseMove -distance, 0, 0, R
return

vk1D & l::
if GetKeyState("ctrl", "P")
	MouseMove 10, 0, 0, R
else if GetKeyState("shift", "P")
	MouseMove 1000, 0, 0, R
else
	MouseMove distance, 0, 0, R
return
 
