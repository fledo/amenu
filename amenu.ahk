/*	amenu
		Description:
			Lists executables found in specific directories.
			Very much inspired by dmenu (http://tools.suckless.org/dmenu/).
			
		Author:
			fred.uggla@gmail.com
			github.com/fledo/amenu
*/

; Includes
#Include settings/create.ahk
#Include settings/load.ahk

; Settings
#Persistent
#SingleInstance force
#NoEnv 
#NoTrayIcon
SetBatchLines, -1
FileEncoding, UTF-8
SetWorkingDir, %A_AppData%\amenu

if !FileExist("settings.ini") { 
	SettingsCreate() ;FileInstall?
}
SettingsLoad()

Return