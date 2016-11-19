; Create GUI and tray icon menu.
GuiCreate() {
	global

	; Create interface, navigate to HTML and show interface
	Gui, +AlwaysOnTop -Resize -SysMenu -Caption +Owner
	Gui, Add, Edit, % "w0 h0 vFilter gGuiRead"
	Gui Add, ActiveX, % "vWB x0 y0" Size, Shell.Explorer2  ; 2 removes scroll-bar
	WB.Navigate(A_AppData . "\amenu\theme\" . Theme . "\gui.html")
	while WB.ReadyState != 4
		Sleep 10
	Gui, Show, % ShowOnStart Position Size, % Title

	if ShowTrayIcon {
		; Root
		Menu, Tray, NoStandard
		Menu, Tray, add, % Title, GuiTray
		Menu, Tray, disable, % Title
		Menu, Tray, add, Restart, GuiTray
		Menu, Tray, add, Scan, GuiTray

		; Settings
		Menu, Settings, add, Misc, GuiTray
		Menu, Settings, add, Paths, GuiTray
		Menu, Settings, add, Hotkeys, GuiTray
		Menu, Tray, add, Settings, :Settings

		; Themes
		Menu, Theme, add, Directory..., GuiTray
		Loop, Files, theme\*, D 
		{
			Menu, Theme, add, % A_LoopFileName, GuiTray,, +Radio
			if (A_LoopFileName == Theme) {
				Menu, Theme, Check, % A_LoopFileName
				Menu, Theme, Disable, % A_LoopFileName
			}
		}
		Menu, Tray, add, Theme, :Theme

		; Root
		Menu, Tray, add, Exit, GuiTray
		menu, Tray, Icon ; Show tray menu with amenu icon
		if FileExist("amenu-icon.ico") ; Check workingdir for custom icon
			Menu, Tray, Icon, amenu-icon.ico
	}
}

; Run the current selection
GuiRun() {
	if (Match[Selected]) {
		Run, % Match[Selected].path, % A_Desktop, UseErrorLevel
		if !ErrorLevel
			GuiHide()
	}
}

; Run the current filter string
GuiRunF() {
	GuiControlGet, target,, Filter
	Run, % target, % A_Desktop, UseErrorLevel
	if !ErrorLevel
		GuiHide()
}

; Handle user input from tray menu
GuiTray(choice, position, menu) {
	if (choice == "Restart")
		Reload
	else if (choice = "Exit")
		ExitApp
	else if (choice == "Scan") {
		global DatabaseFile
		DatabaseCreate(DatabaseFile)
		Global Database := DatabaseLoad(DatabaseFile)
	} else if (menu == "Settings") {
		run % "edit " choice ".ini"
	} else if (menu == "Theme") {
		if (choice == "Directory...") {
			run "theme"
		} else {
			IniWrite, % choice, misc.ini, misc, theme
			Reload
		}
	}
}

; Retreive user input and add matches from Database into Match.
GuiRead() {
	; Reset selection
	Selected := 1
	Match := Object() 
	matchSecondary := Object()
	
	GuiControlGet Filter
	GuiSet("search", Filter)
	if !Filter {
		GuiSet("results")
		return
	}
	for key, file in Database {
		StringGetPos, pos, % file.name, % Filter
		if (pos = 0) ; Filename starts with Filter string
			Match.push({name:file.name, path:file.path})
		else if (pos > 0) ; Filename contains Filter string
			matchSecondary.push({name:file.name, path:file.path})
 	}
	Match.push(matchSecondary*) ; Add secondary matches to the array of good matches
	
	; Create GUI HTML. Results are numbered and classed as "normal", see gui.html for further info
	i := 1
	for key, object in Match {
		html := html . "<div id='result" . i++ . "' class='normal'>" . object.name . "</div>"
	}
	GuiSet("results", html)
	GuiUpdate() ; Change class of first div to "selected"
}

/*
	Set class of the selected div to "selected". Change surrounding div classes to "normal"
		step
			Increment/decrement which result in the array of matches that is selected
*/
GuiUpdate(step := 0) {
	global WB
	Selected += step
	WB.Document.getElementById("result" Selected).className := "selected"
	WB.Document.getElementById("result" Selected+1).className := "normal"
	WB.Document.getElementById("result" Selected-1).className := "normal"
}

; Show GUI
GuiShow() {
	Gui Show
}

; Hide GUI, clear elements
GuiHide() {
	global ExitOnHide
	if ExitOnHide
		ExitApp
	Gui Hide
	GuiControl, Text, Filter
	GuiSet("results")
	GuiSet("search")
}

; Show GUI if it's hidden or have lost focus else hide the GUI
GuiToggle() {
	if !WinActive(Title)
 		GuiShow()
	else
		GuiHide()
}

/*
	Change inner html of GUI element
		Id
			id of element to be changed
		html
			New inner html
*/
GuiSet(id, html := "") {
	global WB
	WB.Document.getElementById(id).innerHTML := html
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