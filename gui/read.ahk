/* 	function GuiRead()
		Descrition:
			Retreive user input and add matches from Database to Match array.
			Select the first object in Match and update gui().
*/
GuiRead() {
	;global
	Global Database
	GuiControlGet, InputBox
	GuiControl, Text, SearchBox, %InputBox%
	global Match := Object()
	if (InputBox) {
		for key, object in Database {
			if InStr(object.name, InputBox) {
				Match.Insert({name:object.name,path:object.path})
			}
		}
	} 
	Global Selected = 1
	GuiUpdate()
}