/* 	tray
		Description:
			Labels used in the tray icon menu.
*/
Exit:
	exitApp

Restart:
	reload
return

Rescan:
	Suspend, On
	DatabaseCreate(DatabaseFile)
	Database := DatabaseLoad(DatabaseFile)
	Suspend, Off
return

Settings:
	run open settings.ini
return
