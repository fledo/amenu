/* Navigation
		Description:
			Hotkeys/Labels used to navigate GUI.
			Enabled only when gui is visible
*/

; Tab or right arrow to move selection right 
Tab::
Right::
	if (Selected < Match.MaxIndex())
		GuiUpdate(+1)
return

; shift + Tab or left arrow to move selection left 
+Tab::
Left::
	if (Selected > Match.MinIndex())
		GuiUpdate(-1)
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

; Ignore selection and try to run Input
^Enter::
	GuiControlGet, InputBox
	Run(InputBox)
return

; Hide and reset
Escape::
	GuiHide()
return
