/*	function GuiHide()
		Description:
			Hide GUI, clear elements, disable gui hotkeys
*/
GuiHide() {
	Gui, Hide
	GuiControl, Text, ResultBox
	GuiControl, Text, InputBox
	Hotkey, Left, Off
	Hotkey, Right, Off
	Hotkey, Tab, Off
	Hotkey, +Tab, Off
	Hotkey, Enter, Off
	Hotkey, Escape, Off
}