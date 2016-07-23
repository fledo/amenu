/*	
	gui/functions.ahk
*/
#Include gui/center.ahk
#Include gui/create.ahk
#Include gui/interact.ahk
#Include gui/read.ahk
#Include gui/update.ahk

; Hide GUI, clear elements
GuiHide() {
	Gui, Hide
	GuiControl, Text, ResultBox
	GuiControl, Text, InputBox
}

; Show GUI, clear elements
GuiShow() {
	Gui, Show
	GuiControl, Text, ResultBox
	GuiControl, Text, InputBox
}

; Show GUI if it's hidden or have lost focus else hide the GUI
GuiToggle() {
	if !WinActive("amenu v" . Version)
 		GuiShow()
	else
		GuiHide()
}