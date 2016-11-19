/*
	Create new database of executables. Get paths from the extra
	[sections] in the settings file. Use existing GUI elements to
	show progress.
		file
			File to store data
*/
DatabaseCreate(file) {
	sections := IniRead("paths.ini", "all")
	GuiShow()
	Suspend On
	Gui +Disabled
	loop, parse, sections, `n
	{
		GuiSet("search", A_LoopField)
		path := IniRead(A_LoopField, "path")
		recurse := IniRead(A_LoopField, "recurse")
		if DirExist(path) {
			Loop, % path "\*.exe", , % recurse
			{
				database .= A_LoopFileFullPath "`n"
				GuiSet("results", A_LoopFileFullPath)
			}
		}
	}
	Sort, database, \ CL U ; Sort by filename
	FileDelete % file
	FileAppend, % database, % file
	Suspend Off
	Gui -Disabled
	GuiHide()
}
 
/*
	Return array of objects with name and path to executable files.
		file
			Path to text file containing list of executables
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