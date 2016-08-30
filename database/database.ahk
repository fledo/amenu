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

; Build and return array of objects with name and path to executable files.
DatabaseLoad(DatabaseFile) {
	database := Object()
	if FileExist(DatabaseFile) {
		Loop, read, %DatabaseFile%
		{
			SplitPath, A_LoopReadLine , , , , name
			database.Insert({name:name,path:A_LoopReadLine})
		}
		return database
	}
}