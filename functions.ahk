/*
	functions.ahk
*/
#Include settings/functions.ahk
#Include database/functions.ahk
#include gui/gui.ahk
#Include tray/functions.ahk

; Display error and exit
Error(string) {
	MsgBox, 48, amenu v%Version% Error, % string ".`n`namenu will now exit."
	ExitApp
}

; Read values from .ini file
IniRead(section, key, default := "", file := "settings.ini") {
	IniRead, value, %file%, %section%, %key%, %default%
	if(value="ERROR") {
		Error("An error occured while loading settings.ini. Unable to read the value of key '" key "' in section '" section "'")
	}
	Return, value
}