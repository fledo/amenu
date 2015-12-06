/* function GuiToggle()
		Description:
				Show GUI if it's hidden or have lost focus
				else hide the GUI
*/
GuiToggle() {
	if !WinActive("amenu v" . Version)
 		GuiShow()
	else
		GuiHide()
}