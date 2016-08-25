/*	function GuiUpdate(step)
		Description:
			Updates the result div with entries from the Match array.
		
		Paramaters:
			(step) Optional. Increment/decrement Selection integer.
*/
GuiUpdate(step := 0) {
	Selected += step
	for key, object in Match {
		if (key = Selected) {
			text := text . "<div class='selected'>" . object.name . "</div>"
		} else {
			text := text . "<div class='normal'>" . object.name . "</div>"
		}
	}
	GuiSet("result", text)
}