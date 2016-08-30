/*
	functions.ahk
*/
#Include settings/settings.ahk
#Include database/database.ahk
#include gui/gui.ahk
#Include tray/tray.ahk

; Display error message
Error(string) {
	MsgBox, 48, amenu v%Version% Error, % string ".`n`namenu will now exit."
	ExitApp
}

/*
	Return value from ini file
		section
			Section of ini file
		key
			Key of section
		default
			Default value in case of missing/empty key
		File
			File to read
*/
IniRead(section, key, default := "", file := "settings.ini") {
	IniRead, value, %file%, %section%, %key%, %default%
	if(value="ERROR") {
		Error("An error occured while loading settings.ini. Unable to read the value of key '" key "' in section '" section "'")
	}
	Return, value
}