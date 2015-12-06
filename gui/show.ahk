/*	function GuiShow()
		Description:
			Show GUI, clear elements, enable gui hotkeys
*/
GuiShow() {
	Gui, Show
	GuiControl, Text, ResultBox
	GuiControl, Text, InputBox
	Hotkey, Left, On
	Hotkey, Right, On
	Hotkey, Tab, On
	Hotkey, +Tab, On
	Hotkey, Enter, On
	Hotkey, Escape, On
}