/*	function GuiUpdate(step)
		Description:
			Updates the text in ResultBox with entries from the Match array.
			Marks selected entry with special delimiters.
		
		Paramaters:
			(step) Optional. Increment/decrement Selection integer.
*/
GuiUpdate(step := 0) {
	global ; Access Match array, delimiter and current selection.
	local text
	
	Selected := Selected + step
	for key, object in Match {
		if (key = Selected) {
			text := text . DelimiterLeft . object.name . DelimiterRight
		} else {
			text := text . DelimiterNormal . object.name . DelimiterNormal
		}
	}
	GuiControl, Text, ResultBox, %text%
}