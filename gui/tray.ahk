/* 	tray
		Description:
			Labels used in the tray icon menu.
*/
Exit() {
	exitApp
}

Restart() {
	reload
}

Rescan(){
	Suspend, On
	DatabaseCreate(DatabaseFile)
	Database := DatabaseLoad(DatabaseFile)
	Suspend, Off
}

Settings(){
	run open settings.ini
}
