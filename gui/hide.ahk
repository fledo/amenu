/*	function GuiHide()
		Description:
			Hide GUI, clear elements
*/
GuiHide() {
	Gui, Hide
	GuiControl, Text, ResultBox
	GuiControl, Text, InputBox
}