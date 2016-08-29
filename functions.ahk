/*
	functions.ahk
*/
#Include settings/functions.ahk
#Include database/functions.ahk
#include gui/functions.ahk
#Include tray/functions.ahk

; Display error and exit
Error(string) {
	MsgBox, 48, amenu v%Version% Error, % string ".`n`namenu will now exit."
	ExitApp
}