; Create GUI and tray icon menu.
GuiCreate() {
	global
	if !FileExist("gui.html")
		FileInstall, gui/gui.html, gui.html, 1
	if !FileExist("gui.css")
		FileInstall, gui/gui.css, gui.css, 1
	Gui, +AlwaysOnTop -Resize -SysMenu -Caption +Owner
	Gui, Add, Edit, w0 h0 vSearchPattern gGuiRead ; Triggers GuiRead() on change.
	Gui Add, ActiveX, x0 y0 w%Width% h%Height% vWB, Shell.Explorer2  ; 2 removes scroll-bar
	WB.Navigate(A_AppData . "\amenu\gui.html")
	while WB.ReadyState != 4
		Sleep 10
	Gui, Show, x%X% y%Y% w%Width% h%Height%, amenu v%Version%

	if ShowTrayIcon {
		Menu, Tray, NoStandard
		Menu, Tray, add, amenu v%Version%, Exit
		Menu, Tray, disable, amenu v%Version%
		Menu, Tray, add, Restart, Restart
		Menu, Tray, add, Scan, DatabaseScan
		Menu, Tray, add, Settings, SettingsOpen
		Menu, Tray, add, Exit, Exit
		menu, Tray, Icon
	}
}

; Run the current search pattern or the current selection
GuiRun() {
	global RunPattern
	if (!Match[Selected] or A_ThisHotkey = RunPattern)
		GuiControlGet, target,, SearchPattern
	else
		target := Match[Selected].path
	Run, % target, % A_Desktop, UseErrorLevel
	if !ErrorLevel
		GuiHide()
}


; Retreive user input and add matches from Database into arrays.
GuiRead() {
	; Reset selection
	Selected := 1
	Match := Object() 
	matchSecondary := Object()
	
	GuiControlGet SearchPattern
	GuiSet("search", SearchPattern)
	if !SearchPattern {
		GuiSet("result")
		return
	}
	for key, file in Database {
		StringGetPos, pos, % file.name, % SearchPattern
		if (pos = 0) ; Filename starts with Search string
			Match.push({name:file.name, path:file.path})
		else if (pos > 0) ; Filename contains search string
			matchSecondary.push({name:file.name, path:file.path})
 	}
	Match.push(matchSecondary*) ; Add secondary matches to the array of good matches
	GuiUpdate() ; Update GUI with new content
}

/*
	Updates the result div with entries from the Match array.
		step
			Increment/decrement Selection integer. Changes current selection.
*/
GuiUpdate(step := 0) {
	Selected += step
	for key, object in Match {
		if (key = Selected) {
			html := html . "<div class='selected'>" . object.name . "</div>"
		} else {
			html := html . "<div class='normal'>" . object.name . "</div>"
		}
	}
	GuiSet("result", html)
}

; Show GUI
GuiShow() {
	Gui Show
}

; Hide GUI, clear elements
GuiHide() {
	Gui Hide
	GuiControl, Text, SearchPattern
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