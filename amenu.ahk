/*	amenu
		Description:
			Lists executables found in specific directories.
			Very much inspired by dmenu (http://tools.suckless.org/dmenu/).
			
		Author:
			fred.uggla@gmail.com
			github.com/fledo/amenu
*/

; Functions
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

; Settings
#Persistent
#SingleInstance force
#NoEnv 
#NoTrayIcon
SetBatchLines, -1
FileEncoding, UTF-8
SetWorkingDir, %A_AppData%\amenu

; Initialize
HotkeysState("Off")
SettingsLoad()
GuiCreate()
Database := DatabaseLoad(DatabaseFile)

; Ready to work, register hotkey to show interface
Hotkey, %InterfaceHotkey%, GuiToggle 
Return

; Labels
#Include gui/tray.ahk
#Include hotkeys/navigation.ahk