/* 	
	tray/functions.ahk
*/

; Create tray menu
TrayCreate() {
	Menu, Tray, NoStandard
	Menu, Tray, add, amenu v%Version%, TrayExit
	Menu, Tray, disable, amenu v%Version%
	Menu, Tray, add, Restart, TrayRestart
	Menu, Tray, add, Rescan, TrayRescan
	Menu, Tray, add, Settings, TraySettings
	Menu, Tray, add, Exit, TrayExit
	menu, Tray, Icon
}

; Exit
TrayExit() {
	exitApp
}

; Restart
TrayRestart() {
	reload
}

; Scan directories and build database
TrayRescan(){
	Suspend, On
	DatabaseCreate(DatabaseFile)
	Database := DatabaseLoad(DatabaseFile)
	Suspend, Off
}

; Open settings
TraySettings(){
	run open settings.ini
}
