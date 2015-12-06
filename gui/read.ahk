/* 	function GuiRead()
		Descrition:
			Retreive user input and add matches from Database into arrays.
			Select the first object in Match and update gui().
*/
GuiRead() {
	; Access Database, reset Match and current selection.
 	Global Database
	Global Selected := 1
	Global Match := Object() 
	matchSecondary := Object()
	GuiControlGet, InputBox
	GuiControl, Text, SearchBox, %InputBox%
	if !InputBox
		return
	for key, file in Database {
		StringGetPos, pos, % file.name, %InputBox%
		if (pos = 0) ; Filename starts with Search string
			Match.push({name:file.name, path:file.path})
		else if (pos > 0) ; Filename contains search string
			matchSecondary.push({name:file.name, path:file.path})
 	}
	Match.push(matchSecondary*) ; Add secondary matches to the array of good matches
	GuiUpdate()
}