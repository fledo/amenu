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
	ExitOnHide := IniRead("interface", "ExitOnHide")
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

	; Iterate hotkey section and register all keys
	IniRead, keys, settings.ini, hotkey
	keys := StrSplit(keys , ["=","`n"])
	Loop % keys.Length() {
		if (mod(A_index,2) == 0)
			continue
		if (keys[A_index+1] == "GuiToggle") {
			Hotkey, IfWinActive ; Register GuiToggle hotkeys as global
			Hotkey, % keys[A_Index], % keys[A_Index+1]
		} else {
			Hotkey, IfWinActive, % Title ; Only listen to the following hotkeys when the gui is active
			Hotkey, % keys[A_Index], % keys[A_Index+1]
		}
	}
}