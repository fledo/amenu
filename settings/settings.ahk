/*
	Install default.ini to %appdata&\amenu\settings.ini
	Convert from ANSI (which git likes) to Unicode (which AHK likes)
*/
SettingsCreate() {
	FileCreateDir %A_AppData%\amenu
	FileInstall, settings/default.ini, settings.ini, 1
	FileRead, settings, settings.ini
	FileDelete settings.ini
	FileAppend, %settings%, settings.ini, UTF-16
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
	RunSelected := IniRead("hotkey", "RunSelected")
	RunPattern := IniRead("hotkey", "RunPattern")
	Hide := IniRead("hotkey", "Hide")
}

; Open settings
SettingsOpen(){
	run open settings.ini
}