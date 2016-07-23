/*	function GuiShow()
		Description:
			Show GUI, clear elements, enable gui hotkeys
*/
GuiShow() {
	Gui, Show
	GuiControl, Text, ResultBox
	GuiControl, Text, InputBox
}