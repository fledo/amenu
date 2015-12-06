/*	amenu
		Description:
			Lists executables found in specific directories.
			Very much inspired by dmenu (http://tools.suckless.org/dmenu/).
			
		Author:
			fred.uggla@gmail.com
			github.com/fledo/amenu
*/

; Settings
Suspend, On
#Persistent
#SingleInstance force
#NoEnv 
#NoTrayIcon
SetBatchLines, -1
FileEncoding, UTF-8
SetWorkingDir, %A_AppData%\amenu
Version = 0.1

; Initialize
#Include functions.ahk
SettingsLoad()
GuiCreate()
Database := DatabaseLoad(DatabaseFile)

; Ready to work, register hotkey to show interface
Suspend, Off
Hotkey, %InterfaceHotkey%, GuiToggle 
Return

; GUI Labels
#Include gui/tray.ahk
#Include gui/hotkeys.ahk