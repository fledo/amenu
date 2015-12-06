/*	amenu
		Description:
			Lists executables found in specific directories.
			Very much inspired by dmenu (http://tools.suckless.org/dmenu/).
			
		Author:
			fred.uggla@gmail.com
			github.com/fledo/amenu
*/

; Settings
#Persistent
#SingleInstance force
#NoEnv 
#NoTrayIcon
SetBatchLines, -1
FileEncoding, UTF-8
SetWorkingDir, %A_AppData%\amenu

; Initialize
if !FileExist("settings.ini") { 
	SettingsCreate() ;FileInstall?
}
SettingsLoad()
GuiCreate()
Return

; Functions
#Include settings/create.ahk
#Include settings/load.ahk
#Include gui/center.ahk
#Include gui/create.ahk
#Include gui/read.ahk
#Include gui/update.ahk
#Include database/create.ahk
#Include database/load.ahk

; Labels
#Include gui/tray.ahk