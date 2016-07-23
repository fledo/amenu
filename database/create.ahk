/*	function DatabaseCreate()
		Description:
			Read all sections from settings.ini (excluding the first four).
			Scan directories for .exe files.
			Append full file path to DatabaseFile.
*/
DatabaseCreate(DatabaseFile) {
	FileDelete, %DatabaseFile%
	IniRead, sections, settings.ini
	sections := StrSplit(sections, "`n")
	for key, section in sections {
		(key < 5) ? continue ; Don't index settings sections
		IniRead, path, settings.ini, %section%, path
		IniRead, recursive, settings.ini, %section%, recursive
		Loop, %path%\*.exe, , %recursive%
		{
			database := database . A_LoopFileFullPath "`n"
			file.Write(A_LoopFileFullPath "`r`n")
		}
	}
	Sort, database, \ CL U
	FileAppend, %database%, %DatabaseFile% 	
}