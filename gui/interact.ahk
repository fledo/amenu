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
		GuiRunInput()
	}
}

; Ignore selection and try to run Input
; Example input "c:" would open explorer C: even though it's not a exe.
GuiRunInput() {
	GuiControlGet, InputBox
	Run(InputBox)
}
