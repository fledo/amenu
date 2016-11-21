/*
	Install default theme and default settings
*/
Install() {
	; Default theme
	FileCreateDir theme\default
	if !FileExist("theme\default\gui.html")
		FileInstall, theme\default\gui.html, theme\default\gui.html, 1
	if !FileExist("theme\default\gui.css")
		FileInstall, theme\default\gui.css, theme\default\gui.css, 1
	if !FileExist("theme\default\gui.ini") {
		FileInstall, theme\default\gui.ini, theme\default\gui.ini, 1
		ConvertFile("theme\default\gui.ini")
	}

	; Default-orange theme
	FileCreateDir theme\default-orange
	if !FileExist("theme\default-orange\gui.html")
		FileInstall, theme\default-orange\gui.html, theme\default-orange\gui.html, 1
	if !FileExist("theme\default-orange\gui.css")
		FileInstall, theme\default-orange\gui.css, theme\default-orange\gui.css, 1
	if !FileExist("theme\default-orange\gui.ini") {
		FileInstall, theme\default-orange\gui.ini, theme\default-orange\gui.ini, 1
		ConvertFile("theme\default-orange\gui.ini")
	}

	; Default-orange theme
	FileCreateDir theme\default-red
	if !FileExist("theme\default-red\gui.html")
		FileInstall, theme\default-red\gui.html, theme\default-red\gui.html, 1
	if !FileExist("theme\default-red\gui.css")
		FileInstall, theme\default-red\gui.css, theme\default-red\gui.css, 1
	if !FileExist("theme\default-red\gui.ini") {
		FileInstall, theme\default-red\gui.ini, theme\default-red\gui.ini, 1
		ConvertFile("theme\default-red\gui.ini")
	}

	; Default settings, must be converted to Unicode
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

	; Misc
	Theme := IniRead("misc.ini", "misc", "Theme")
	ThemeDir := A_WorkingDir . "\theme\" . Theme . "\"
	DatabaseFile := IniRead("misc.ini", "misc", "DatabaseFile")
	ExitOnHide := IniRead("misc.ini", "misc", "ExitOnHide")
	ShowTrayIcon := IniRead("misc.ini", "misc", "ShowTrayIcon")
	if (IniRead("misc.ini", "misc", "ShowOnStart"))
		ShowOnStart := ""
	else
		ShowOnStart := "Hide"

	; GUI
	Width := IniRead(ThemeDir . "gui.ini", "gui", "Width", A_ScreenWidth)
	Height := IniRead(ThemeDir . "gui.ini", "gui", "Height", A_ScreenHeight)
	X := IniRead(ThemeDir . "gui.ini", "gui", "X", (A_ScreenWidth/2)-(Width/2))
	Y := IniRead(ThemeDir . "gui.ini", "gui", "Y", (A_ScreenHeight/2)-(Height/2))
	Size := " w" Width " h" Height
	Position := " x" X " y" Y

	; Iterate hotkey section and register all keys
	IniRead, keys, hotkeys.ini, hotkey
	keys := StrSplit(keys , ["=","`n"])
	Loop % keys.Length() {
		if (mod(A_index,2) == 0)
			Hotkey(keys[A_Index-1], keys[A_index])
	}
}