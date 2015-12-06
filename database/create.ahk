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
	file := FileOpen(DatabaseFile, "w")
	for key, section in sections {
		if (key < 5) ; Skip settings sections
			continue
		IniRead, path, settings.ini, %section%, path
		IniRead, recursive, settings.ini, %section%, recursive
		Loop, %path%\*.exe, , %recursive%
		{
			file.Write(A_LoopFileFullPath "`r`n")
		}
	}
	file.Close() 	
}