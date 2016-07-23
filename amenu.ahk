/*	amenu.ahk
		Description:
			Lists executables found in specific directories.
			Very much inspired by dmenu (http://tools.suckless.org/dmenu/).
			
		Author:
			fred.uggla@gmail.com
			github.com/fledo/amenu
*/

; AHK Settings
#Persistent
#SingleInstance force
#NoEnv 
#NoTrayIcon
#Include functions.ahk
SetBatchLines, -1
FileEncoding, UTF-8
SetWorkingDir, %A_AppData%\amenu

; Variables
Global Version = 0.1
Global Database
Global Selected
Global Match
Global InputBox

; amenu settings
SettingsLoad()
Database := DatabaseLoad(DatabaseFile)
GuiCreate()
if (ShowTrayIcon)
	TrayCreate()

; Ready to work, register hotkeys
Hotkey, %GuiToggle%, GuiToggle 
Hotkey, IfWinActive, amenu v%Version%
Hotkey, %GuiRight%, GuiRight
Hotkey, %GuiRight2%, GuiRight
Hotkey, %GuiLeft%, GuiLeft
Hotkey, %GuiLeft2%, GuiLeft
Hotkey, %GuiRun%, GuiRun
Hotkey, %GuiRunInput%, GuiRunInput
Hotkey, %GuiHide%, GuiHide
Return