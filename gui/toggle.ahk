/* function GuiToggle()
		Description:
				Hide/show GUI and clear InputBox
*/
GuiToggle() {
	if !WinActive("amenu") { 
		Gui, Show
		HotkeysState("On")
	} else {
		Gui, Hide
		HotkeysState("Off")
	}
	GuiControl, Text, InputBox
}