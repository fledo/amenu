/*	
	gui/gui.ahk
*/

; Create GUI and tray icon menu.
GuiCreate() {
	global
	if !FileExist("gui.html")
		FileInstall, gui/gui.html, gui.html, 1
	if !FileExist("gui.css")
		FileInstall, gui/gui.css, gui.css, 1
	Gui, +AlwaysOnTop -Resize -SysMenu -Caption +Owner
	Gui, Add, Edit, w0 h0 vInputBox gGuiRead ; Triggers GuiRead() on input.
	Gui Add, ActiveX, x0 y0 w%Width% h%Height% vWB, Shell.Explorer2  ; 2 removes scroll-bar
	WB.Navigate(A_AppData . "\amenu\gui.html")
	while WB.ReadyState != 4
	Sleep 10
	Gui, Show, x%X% y%Y% w%Width% h%Height%, amenu v%Version%
}

; Run the current match. If there are no matches, or if the RunPattern hotkey 
; was pressed, try running the search pattern
GuiRun() {
	global RunPattern
	if (!Match[Selected] or A_ThisHotkey = RunPattern)
		GuiControlGet, target,, InputBox
	else
		target := Match[Selected].path
	Run, % target, % A_Desktop, UseErrorLevel
	if !ErrorLevel
		GuiHide()
}

/* 	function GuiRead()
		Descrition:
			Retreive user input and add matches from Database into arrays.
			Select the first object in Match and update gui().
*/
GuiRead() {
	; Reset selection
	Selected := 1
	Match := Object() 
	matchSecondary := Object()
	
	GuiControlGet, InputBox
	GuiSet("search", InputBox)
	if !InputBox
		return
	for key, file in Database {
		StringGetPos, pos, % file.name, %InputBox%
		if (pos = 0) ; Filename starts with Search string
			Match.push({name:file.name, path:file.path})
		else if (pos > 0) ; Filename contains search string
			matchSecondary.push({name:file.name, path:file.path})
 	}
	Match.push(matchSecondary*) ; Add secondary matches to the array of good matches
	GuiUpdate()
}

/*	function GuiUpdate(step)
		Description:
			Updates the result div with entries from the Match array.
		
		Paramaters:
			(step) Optional. Increment/decrement Selection integer.
*/
GuiUpdate(step := 0) {
	Selected += step
	for key, object in Match {
		if (key = Selected) {
			text := text . "<div class='selected'>" . object.name . "</div>"
		} else {
			text := text . "<div class='normal'>" . object.name . "</div>"
		}
	}
	GuiSet("result", text)
}

; Show GUI
GuiShow() {
	Gui, Show
}

; Hide GUI, clear elements
GuiHide() {
	Gui, Hide
	GuiControl, Text, InputBox
	GuiSet("result")
	GuiSet("search")
}

; Show GUI if it's hidden or have lost focus else hide the GUI
GuiToggle() {
	if !WinActive("amenu v" . Version)
 		GuiShow()
	else
		GuiHide()
}

; Change inner html of GUI element
GuiSet(Id, html := "") {
	global WB
	WB.Document.getElementById(Id).innerHTML := html
}

; Move selection right 
GuiRight() {
	if (Selected < Match.MaxIndex())
		GuiUpdate(+1)
}

; Move selection left 
GuiLeft() {
	if (Selected > Match.MinIndex())
		GuiUpdate(-1)
}