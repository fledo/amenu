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

; Run the current match. If there are no matches, or if the RunPattern hotkey 
; was pressed, try running the search pattern
GuiRun() {
	global RunPattern
	if (!Match[Selected] or A_ThisHotkey = RunPattern)
		GuiControlGet, target,, InputBox
	else
		target := Match[Selected].path
	Run, % target, % A_Desktop, UseErrorLevel
	if !ErrorLevel
		GuiHide()
}