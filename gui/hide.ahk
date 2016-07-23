/*	function GuiHide()
		Description:
			Hide GUI, clear elements, disable gui hotkeys
*/
GuiHide() {
	Gui, Hide
	GuiControl, Text, ResultBox
	GuiControl, Text, InputBox
}