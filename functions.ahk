/*
	functions.ahk
*/
#Include settings/settings.ahk
#Include database/database.ahk
#include gui/gui.ahk

; Display error message
Error(string) {
	MsgBox, 48, amenu v%Version% Error, % string ".`n`namenu will now exit."
	ExitApp
}

/*
	Return value from ini file
		section
			Section of ini file, set to ALL to return section names in a fil
		key
			Key of section
		default
			Default value in case of missing/empty key
		File
			File to read
*/
IniRead(section := "", key := "", default := "", file := "settings.ini") {
	IniRead, value, % file, % section, % key, % default
	if(value == "ERROR" and section == "ALL") {
		Error("An error occured while reading section names from " file)
	}
	else if (value == "ERROR") {
		Error("An error occured while reading " file ", section " section ", key " key)
	}
	Return value
}

; Exit
Exit() {
	exitApp
}

; Restart
Restart() {
	reload
}

; Scan directories and build database
Rescan(){
	global DatabaseFile
	Suspend, On
	DatabaseCreate(DatabaseFile)
	Database := DatabaseLoad(DatabaseFile)
	Suspend, Off
}

; Check if directory exists
DirExist(path) {
	if (InStr(FileExist(path), "D"))
		return true
	else
		return false
}