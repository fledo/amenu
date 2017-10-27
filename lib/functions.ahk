/*
	functions.ahk
*/
#Include <settings>
#Include <database>
#include <gui>

/*
	Display error message and exit
		string
			Error message to display
*/
Error(string) {
	MsgBox, 48, % Title " error", % string ".`n`namenu will now exit."
	ExitApp
}

/*
	Return value from ini file
		file
			Path to ini file
		section
			Section of ini file, set to ALL to return string with section names
		key
			Key to read in specified section
		default
			Default value in case of missing/empty key
*/
IniRead(file, section := "", key := "", default := "") {
	IniRead, value, % file, % section, % key, % default
	if(value == "ERROR" and ! section) {
		Error("An error occured while reading section names from " file)
	}
	else if (value == "ERROR") {
		Error("An error occured while reading " file ", section " section ", key " key)
	}
	Return value
}

/*
	Return true if path is an existing directory
		path
			Path to check
*/
DirExist(path) {
	if (InStr(FileExist(path), "D"))
		return true
	else
		return false
}

/*
	Create path and set it as working dir
		path
			Path to directory
*/
SetWorkingDir(path) {
	if !DirExist(path)
		FileCreateDir % path
	SetWorkingDir % path
}

/*
	Register new hotkey. Only hotkeys with GuiToggle as target are global.
		key
			Combination of keys to be pressed
		target
			Function triggered by hotkey
*/
Hotkey(key, target) {
	if (target == "GuiToggle")
		Hotkey, IfWinActive
	else
		Hotkey, IfWinActive, % Title
	Hotkey, % key, % target, UseErrorLevel
	if ErrorLevel {
		if (ErrorLevel == 1)
			errorstring := "The target '" . target . "' does not exist. Check settings.ini for a list of valid target functions"
		else if ErrorLevel in 2,4
			errorstring := "The defined key combination '" . key . "' is not recognized or is not supported"
		else if (ErrorLevel == 3)
			errorstring := "The prefix in '" . key . "' is not allowed"
		Error("Hotkey configuration error! Setting """ . key . " = " . target . """ is invalid. " . errorstring . " (code " . ErrorLevel . ")")
	}
}

/*
	Convert file to new encoding
		source
			Path to file
		target
			Path to new file
		encoding
			Encoding to change to. Default: UTF-16
			Possible encoding: UTF-8, UTF-16, UTF-8-RAW, CPXX. No BOM: UTF-8-RAW, UTF-16-RAW
*/
ConvertFile(source, target := "", encoding := "UTF-16") {
	if !target
		target := source
	FileRead, content, % source
	FileDelete, % target
	FileAppend, % content, % target, % encoding
}