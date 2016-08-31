/*
	Create new database of executables. Get paths from the extra
	[sections] in the settings file. Use existing GUI elements to
	show progress.
		file
			File to store data
*/
DatabaseCreate(file) {
	sections := SubStr(IniRead(), 23) ; Strip [interface], [hotkey], [misc]
	GuiShow()
	loop, parse, sections, `n
	{
		GuiSet("search", A_LoopField)
		path := IniRead(A_LoopField, "path")
		recursive := IniRead(A_LoopField, "recursive")
		if DirExist(path) {
			Loop, % path "\*.exe", , % recursive
			{
				database .= A_LoopFileFullPath "`n"
				GuiSet("result", A_LoopFileFullPath)
			}
		}
	}
	Sort, database, \ CL U ; Sort by filename
	FileDelete % file
	FileAppend, % database, % file
	GuiHide()
}

; 
/*
	Load database file into array of objects with name and path to executable files.
		file
			File where paths to exe files are stored
*/
DatabaseLoad(file) {
	database := Object()
	if FileExist(file) {
		Loop, read, % file
		{
			SplitPath, A_LoopReadLine , , , , name
			database.Insert({name:name,path:A_LoopReadLine})
		}
		return database
	}
}

; Disable input, create new database and load it into memory
DatabaseScan(){
	global DatabaseFile
	Suspend On
	Gui +Disabled
	DatabaseCreate(DatabaseFile)
	Database := DatabaseLoad(DatabaseFile)
	Suspend Off
}
