/* 	function GuiCreate() 
		Description:
			Create GUI and tray icon menu.
			Edit elements used instead of text element to avoid flickering.
*/

GuiCreate() {
	global ; Create GUI globally
	Gui, +AlwaysOnTop -Resize -SysMenu -Caption +Owner
	Gui, Color, %BackgroundColor%, %BackgroundColor%
	Gui, Font, c%FontColor% s%FontSize%, %FontName%
	Gui, Add, Edit, w0 h0 vInputBox gGuiRead ; Triggers ReadInputBox() on input.
	Gui, Add, Edit, w%SearchBoxWidth% h%BoxHeight% y-10 x5 vSearchBox hwndSearch Center ReadOnly -E0x200 -VSCroll -HScroll
	Gui, Add, Edit, w%ResultBoxWidth% h%BoxHeight% xp%SearchBoxWidth% y-10 vResultBox hwndResult ReadOnly -E0x200 -VSCroll -HScroll
	
	; Center text
	GuiCenter(Search)
	GuiCenter(Result)
	
	; Set initial GUI position
	Gui, Show, Hide w%W% h%H% x%X% y%Y%, amenu v%Version%
}