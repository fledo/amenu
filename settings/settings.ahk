/*
	Install default.ini to %appdata&\amenu\settings.ini
	Convert from ANSI (which git likes) to Unicode (which AHK likes)
*/
SettingsCreate() {
	FileCreateDir % A_AppData "\amenu"
	if !FileExist("gui.ini") {
		FileInstall, settings/gui.ini, gui.ini, 1
		ConvertFile("gui.ini")
	}
	if !FileExist("misc.ini") {
		FileInstall, settings/misc.ini, misc.ini, 1
		ConvertFile("misc.ini")
	}
	if !FileExist("hotkeys.ini") {
		FileInstall, settings/hotkeys.ini, hotkeys.ini, 1
		ConvertFile("hotkeys.ini")
	}
	if !FileExist("paths.ini") {
		FileInstall, settings/paths.ini, paths.ini, 1
		ConvertFile("paths.ini")
	}
}

; Load all settings (but not paths to be scanned) from settings.ini
SettingsLoad() {
	global

	; GUI
	Width := IniRead("gui.ini", "gui", "Width", A_ScreenWidth)
	Height := IniRead("gui.ini", "gui", "Height")
	X := IniRead("gui.ini", "gui", "X", (A_ScreenWidth/2)-(Width/2))
	Y := IniRead("gui.ini", "gui", "Y", (A_ScreenHeight/2)-(Height/2))
	Size := " w" Width " h" Height
	Position := " x" X " y" Y

	; Misc
	DatabaseFile := IniRead("misc.ini", "misc", "DatabaseFile")
	ExitOnHide := IniRead("misc.ini", "misc", "ExitOnHide")
	ShowTrayIcon := IniRead("misc.ini", "misc", "ShowTrayIcon")
	if (IniRead("misc.ini", "misc", "ShowOnStart"))
		ShowOnStart := ""
	else
		ShowOnStart := "Hide"

	; Iterate hotkey section and register all keys
	IniRead, keys, hotkeys.ini, hotkey
	keys := StrSplit(keys , ["=","`n"])
	Loop % keys.Length() {
		if (mod(A_index,2) == 0)
			Hotkey(keys[A_Index-1], keys[A_index])
	}
}