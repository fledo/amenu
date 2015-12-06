/* function GuiToggle()
		Description:
				Hide/show GUI and clear InputBox
*/
GuiToggle() {
	if !WinActive("amenu") { 
		Gui, Show
		NavigationHotkeys("On")
	} else {
		Gui, Hide
		NavigationHotkeys("Off")
	}
	GuiControl, Text, InputBox
}