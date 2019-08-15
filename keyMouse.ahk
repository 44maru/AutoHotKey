vk1D & Space::MouseClick, Left,,,,,D
vk1D & Space UP::MouseClick, Left,,,,,U
vk1D & vk1C::MouseClick, Right

vk1D & k::
if GetKeyState("ctrl", "P")
	MouseMove 0, -10, 0, R
else
	MouseMove 0, -50, 0, R
return

vk1D & j::
if GetKeyState("ctrl", "P")
	MouseMove 0, 10, 0, R
else
	MouseMove 0, 50, 0, R
return
 
vk1D & h::
if GetKeyState("ctrl", "P")
	MouseMove -10, 0, 0, R
else
	MouseMove -50, 0, 0, R
return

vk1D & l::
if GetKeyState("ctrl", "P")
	MouseMove 10, 0, 0, R
else
	MouseMove 50, 0, 0, R
return
 
