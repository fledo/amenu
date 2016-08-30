; Install default.ini to %appdata&\amenu\settings.ini
SettingsCreate() {
	FileCreateDir, %A_AppData%\amenu
	FileInstall, settings/default.ini, settings.ini, 1

	; Convert from ANSI (which git likes) to Unicode (which AHK likes)
	FileRead, settings, settings.ini
	FileDelete, settings.ini
	FileAppend, %settings%, settings.ini, UTF-16
	MsgBox, , amenu, This seems to be the first time you're starting amenu. Default settings have been applied and can be changed via the tray icon menu. An index of your executables will now be generated. This might take a while. When completed you can access the interface be pressing WIN + SPACE.
}

; Load all settings except paths from settings.ini
SettingsLoad() {
	global
	if !FileExist("settings.ini") 
		SettingsCreate()
	
	; Interface
	Width := IniRead("interface", "Width", A_ScreenWidth)
	Height := IniRead("interface", "Height")
	X := IniRead("interface", "X")
	Y := IniRead("interface", "Y")
	
	; Misc
	DatabaseFile := IniRead("misc", "DatabaseFile")
	ShowTrayIcon := IniRead("misc", "ShowTrayIcon")

	; Hotkey
	Toggle := IniRead("hotkey", "Toggle")
	Right := IniRead("hotkey", "Right")
	Right2 := IniRead("hotkey", "Right2")
	Left := IniRead("hotkey", "Left")
	Left2 := IniRead("hotkey", "Left2")
	RunSelection := IniRead("hotkey", "RunSelection")
	RunPattern := IniRead("hotkey", "RunPattern")
	Hide := IniRead("hotkey", "Hide")
}

; Open settings
SettingsOpen(){
	run open settings.ini
}