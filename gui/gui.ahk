; Create GUI and tray icon menu.
GuiCreate() {
	global

	; install required files
	if !FileExist("gui.html")
		FileInstall, gui/gui.html, gui.html, 1
	if !FileExist("gui.css")
		FileInstall, gui/gui.css, gui.css, 1

	; Create interface, navigate to HTML and show interface
	Gui, +AlwaysOnTop -Resize -SysMenu -Caption +Owner
	Gui, Add, Edit, % "w0 h0 vFilter gGuiRead"
	Gui Add, ActiveX, % "vWB x0 y0" Size, Shell.Explorer2  ; 2 removes scroll-bar
	WB.Navigate(A_AppData . "\amenu\gui.html")
	while WB.ReadyState != 4
		Sleep 10
	Gui, Show, % ShowOnStart Position Size, % Title

	if ShowTrayIcon {
		Menu, Tray, NoStandard
		Menu, Tray, add, % Title, GuiTray
		Menu, Tray, disable, % Title
		Menu, Tray, add, Restart, GuiTray
		Menu, Tray, add, Scan, GuiTray
		Menu, Edit, add, settings.ini, GuiTray
		Menu, Edit, add, gui.css, GuiTray
		Menu, Edit, add, gui.html, GuiTray
		Menu, Tray, add, Edit, :Edit
		Menu, Tray, add, Exit, GuiTray
		menu, Tray, Icon ; Show tray menu with amenu icon
		if FileExist("amenu-icon.ico") ; Check workingdir for custom icon
			Menu, Tray, Icon, amenu-icon.ico
	}
}

; Run the current search pattern or the current selection
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
GuiTray(Choice, Position, menu) {
	if (Choice == "Restart")
		Reload
	else if (Choice = "Exit")
		ExitApp
	else if (Choice == "Scan") {
		global DatabaseFile
		DatabaseCreate(DatabaseFile)
		Global Database := DatabaseLoad(DatabaseFile)
	} else if (menu == "Edit") {
		run % "edit " Choice, , UseErrorLevel
		if ErrorLevel
			run % A_WorkingDir
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