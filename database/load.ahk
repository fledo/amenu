/*	function DatabaseLoad()
		Description:
			Read paths from DatabaseFile and save filename and path in array.
		
		Return:
			Array of Objects with name and path.
*/
DatabaseLoad(databaseFile) {
	database := Object()
	Loop, read, %databaseFile%
	{
		SplitPath, A_LoopReadLine , , , , name
		database.Insert({name:name,path:A_LoopReadLine})
	}
	return database
}