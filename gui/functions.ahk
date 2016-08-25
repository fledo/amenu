/*	
	gui/functions.ahk
*/
#Include gui/create.ahk
#Include gui/interact.ahk
#Include gui/read.ahk
#Include gui/update.ahk

; Hide GUI, clear elements
GuiHide() {
	Gui, Hide
	GuiControl, Text, InputBox
	GuiSet("result")
	GuiSet("search")
}

; Show GUI
GuiShow() {
	Gui, Show
}

; Change inner html of GUI element
GuiSet(Id, html := "") {
	global WB
	WB.Document.getElementById(Id).innerHTML := html
}

; Show GUI if it's hidden or have lost focus else hide the GUI
GuiToggle() {
	if !WinActive("amenu v" . Version)
 		GuiShow()
	else
		GuiHide()
}