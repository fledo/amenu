/* Navigation
		Description:
			Hotkeys/Labels used to navigate GUI.
			Enabled
*/

; Arrow keys or tab/shift tab for selection step. 
Tab::
Right::
	if (Selected < Match.MaxIndex()) {
		GuiUpdate(+1)
	}
return
+Tab::
Left::
	if (Selected > Match.MinIndex()) {
		GuiUpdate(-1)
	}
return

; Run selection, hide interface
Enter::
	EnvGet, home, HOMEPATH
	if (Match[Selected].path)
		Run % Match[Selected].path, %home%
	else {
		EnvGet, home, HOMEPATH
		Run % InputBox, %home%
	}
	Gui, Hide
	HotkeysState("Off")
return

; Hide and reset
Escape::
	Gui, Hide
	GuiControl, Text, InputBox
	HotkeysState("Off")
return
