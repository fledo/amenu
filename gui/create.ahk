/* 	function GuiCreate() 
		Description:
			Create GUI and tray icon menu.
*/
GuiCreate() {
	global
	if !FileExist("gui.html")
		FileInstall, gui/gui.html, gui.html, 1
	if !FileExist("gui.css")
		FileInstall, gui/gui.css, gui.css, 1
	Gui, +AlwaysOnTop -Resize -SysMenu -Caption +Owner
	Gui, Add, Edit, w0 h0 vInputBox gGuiRead ; Triggers GuiRead() on input.
	Gui Add, ActiveX, x0 y0 w%W% h%H% vWB, Shell.Explorer2  ; 2 removes scroll-bar
	WB.Navigate(A_AppData . "\amenu\gui.html")
	while WB.ReadyState != 4
	Sleep 10
	Gui, Show, x%X% y%Y% w%W% h%H%, amenu v%Version%
}
