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

; Disable gui hotkeys
HotkeysState("Off")

; Load settings
if !FileExist("settings.ini") 
	SettingsCreate()
SettingsLoad()

; Create and hide GUI
GuiCreate()

; Load database
if !FileExist(DatabaseFile)
	DatabaseCreate(DatabaseFile)
Database := DatabaseLoad(DatabaseFile)

Hotkey, %InterfaceHotkey%, GuiToggle ; Ready to work, register hotkey to show interface
Return

; Labels
#Include gui/tray.ahk
#Include hotkeys/navigation.ahk