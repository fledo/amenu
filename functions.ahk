/*
	functions.ahk
*/
#Include settings/functions.ahk
#Include database/functions.ahk
#include gui/functions.ahk
#Include tray/functions.ahk

; Try to open target file and hide gui.
Run(target) {
	EnvGet, homepath, HOMEPATH
	Run, %target%, %homepath%, UseErrorLevel
	if !ErrorLevel
		GuiHide()
}

; Display error and exit
Error(string) {
	MsgBox, 48, amenu v%Version% Error, % string ".`n`namenu will now exit."
	ExitApp
}