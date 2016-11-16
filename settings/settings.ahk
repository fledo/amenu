/*
	Install default.ini to %appdata&\amenu\settings.ini
	Convert from ANSI (which git likes) to Unicode (which AHK likes)
*/
SettingsCreate() {
	FileCreateDir % A_AppData "\amenu"
	FileInstall, settings/default.ini, settings.ini, 1
	FileRead, settings, settings.ini
	FileDelete settings.ini
	FileAppend, % settings, settings.ini, UTF-16
}

; Load all settings (but not paths to be scanned) from settings.ini
SettingsLoad() {
	global
	
	; Interface
	Width := IniRead("interface", "Width", A_ScreenWidth)
	Height := IniRead("interface", "Height")
	X := IniRead("interface", "X")
	Y := IniRead("interface", "Y")
	ShowOnStart := IniRead("interface", "ShowOnStart")
	ShowTrayIcon := IniRead("interface", "ShowTrayIcon")

	; Prepare strings to, hopefully, increase readability of gui code
	Size := " w" Width " h" Height
	Position := " x" X " y" Y
	if (ShowOnStart)
		ShowOnStart := ""
	else
		ShowOnStart := "Hide"
	
	; Misc
	DatabaseFile := IniRead("misc", "DatabaseFile")

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