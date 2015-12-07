/* 	function SettingsCreate()
		Description:
			Create deafault settings.ini under %appdata%/amenu.
			Promt user to edit settings and reload amenu.
*/
SettingsCreate() {
	FileCreateDir, %A_AppData%\amenu
	SetWorkingDir, %A_AppData%\amenu
	FileInstall, settings/default.ini, settings.ini, 1
	MsgBox, , amenu, This seems to be the first time you're starting amenu. Default settings have been applied and can be changed via the tray icon menu. An index of your executables will now be generated. This might take a while. When completed you can access the interface be pressing WIN + SPACE.
}