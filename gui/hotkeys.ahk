/* Navigation
		Description:
			Hotkeys/Labels used to navigate GUI.
			Enabled only when gui is visible
*/

; Tab or right arrow to move selection right 
NavRight() {
	global
	if (Selected < Match.MaxIndex())
		GuiUpdate(+1)
}

; shift + Tab or left arrow to move selection left 
NavLeft() {
	global
	if (Selected > Match.MinIndex())
		GuiUpdate(-1)
}

; Run selected entry or try to run input.
NavRun() {
	global
	if (Match[Selected].path)
		Run(Match[Selected].path)
	else {
		GuiControlGet, InputBox
		Run(InputBox)
	}
}

; Ignore selection and try to run Input
NavRunInput() {
	global
	GuiControlGet, InputBox
	Run(InputBox)
}

; Hide and reset
NavEscape() {
	global
	GuiHide()
}
