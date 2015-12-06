/* 	function GuiCreate() 
		Description:
			Create GUI and tray icon menu.
			Edit elements used instead of text element to avoid flickering
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
	
	; Create tray menu
	Menu, Tray, NoStandard
	Menu, Tray, add, Restart
	Menu, Tray, add, Rescan
	Menu, Tray, add, Settings
	Menu, Tray, add, Exit
	if (ShowTrayIcon)
		menu, Tray, Icon
	
	; Set initial GUI position
	Gui, Show, w%w% h%h% x%x% y%y%, amenu
	Gui, Hide
}