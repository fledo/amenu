/* 	function SettingsLoad()
		Description:
			Load the following sections from settings.ini:
			position, apperance, delimiter, misc.
*/

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