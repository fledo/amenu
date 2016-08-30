; Scan folders och populate database with full paths to exe files
DatabaseCreate(DatabaseFile) {
	FileDelete, %DatabaseFile%
	IniRead, sections, settings.ini
	sections := StrSplit(sections, "`n")
	for key, section in sections {
		if (key < 6) 
			continue ; Don't index settings sections
		IniRead, path, settings.ini, %section%, path
		IniRead, recursive, settings.ini, %section%, recursive
		if InStr(FileExist(path), "D") {
			Loop, %path%\*.exe, , %recursive%
			{
				database := database . A_LoopFileFullPath "`n"
				file.Write(A_LoopFileFullPath "`r`n")
			}
		}
	}
	Sort, database, \ CL U
	FileAppend, %database%, %DatabaseFile% 	
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