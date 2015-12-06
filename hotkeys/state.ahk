/* function HotkeysState(state)
		Description:
			Enable/Disable hotkeys used to interact with GUI.
			Does not disable the global hotkey to show gui.
		
		Parameter:
			(state) Set hotkeys "On" or "Off".
*/
HotkeysState(state) {
	Hotkey, Left, %state%
	Hotkey, Right, %state%
	Hotkey, Tab, %state%
	Hotkey, +Tab, %state%
	Hotkey, Enter, %state%
	Hotkey, Escape, %state%
}