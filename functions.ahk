; Functions organized by type
#Include settings/create.ahk
#Include settings/load.ahk
#Include gui/center.ahk
#Include gui/create.ahk
#Include gui/read.ahk
#Include gui/toggle.ahk
#Include gui/update.ahk
#Include database/create.ahk
#Include database/load.ahk
#Include hotkeys/state.ahk

/*	function Run(target)
		Description:
			Try to open target file. Hide gui and disable hotkeys on success.
*/
Run(target) {
	EnvGet, homepath, HOMEPATH
	Run, %target%, %homepath%, UseErrorLevel
	if ErrorLevel
		return
	Gui, Hide
	HotkeysState("Off")
}