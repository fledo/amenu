/* 
	gui/interact.ahk
*/

; Move selection right 
GuiRight() {
	if (Selected < Match.MaxIndex())
		GuiUpdate(+1)
}

; Move selection left 
GuiLeft() {
	if (Selected > Match.MinIndex())
		GuiUpdate(-1)
}

; Run selected entry or try to run input.
GuiRun() {
	if (Match[Selected].path)
		Run(Match[Selected].path)
	else {
		GuiControlGet, InputBox
		Run(InputBox)
	}
}

; Ignore selection and try to run Input
GuiRunInput() {
	GuiControlGet, InputBox
	Run(InputBox)
}