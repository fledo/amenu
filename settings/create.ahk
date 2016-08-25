/* 	function SettingsCreate()
		Description:
			Create settings.ini encoded in Unicode. Stored as ANSI
			in the repo because git dislikes UTF-16 and AHK ini functions
			dislikes UTF-8...
*/
SettingsCreate() {
	FileCreateDir, %A_AppData%\amenu
	FileInstall, settings/default.ini, settings.ini, 1
	FileRead, settings, settings.ini
	FileDelete, settings.ini
	FileAppend, %settings%, settings.ini, UTF-16
	MsgBox, , amenu, This seems to be the first time you're starting amenu. Default settings have been applied and can be changed via the tray icon menu. An index of your executables will now be generated. This might take a while. When completed you can access the interface be pressing WIN + SPACE.
}