/* Navigation
		Description:
			Hotkeys/Labels used to navigate GUI.
			Enabled only when gui is visible
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

; Run selected entry or try to run input.
Enter::
	if (Match[Selected].path)
		Run(Match[Selected].path)
	else {
		GuiControlGet, InputBox
		Run(InputBox)
	}
return

; Hide and reset
Escape::
	Gui, Hide
	GuiControl, Text, InputBox
	HotkeysState("Off")
return
