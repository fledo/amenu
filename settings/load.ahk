/* 	function SettingsLoad()
		Description:
			Load the following sections from settings.ini:
			position, apperance, delimiter, misc.
*/
SettingsLoad() {
	global
	if !FileExist("settings.ini") 
		SettingsCreate()
		
	; Height, width and position of interface and elements
	IniRead, Width, settings.ini, interface, Width, %A_ScreenWidth%
	IniRead, Height, settings.ini,  interface, Height
	IniRead, X, settings.ini, interface, X
	IniRead, Y, settings.ini, interface, Y
	
	; Misc settings
	IniRead, DatabaseFile, settings.ini, misc, DatabaseFile
	IniRead, ShowTrayIcon, settings.ini, misc, ShowTrayIcon
	
	; Hotkey settings
	IniRead, Toggle, settings.ini, hotkey, Toggle
	IniRead, Right, settings.ini, hotkey, Right
	IniRead, Right2, settings.ini, hotkey, Right2
	IniRead, Left, settings.ini, hotkey, Left
	IniRead, Left2, settings.ini, hotkey, Left2
	IniRead, Run, settings.ini, hotkey, Run
	IniRead, TryRun, settings.ini, hotkey, TryRun
	IniRead, Hide, settings.ini, hotkey, Hide
}