/*	amenu.ahk
		Description:
			Search for and run executable files found in user defined directories.
			<github.com/fledo/amenu>
			
		Acknowledgements:
			 - amenu is Very much inspired by [dmenu](http://tools.suckless.org/dmenu/).
			 - amenu is written in [AHK](http://www.ahkscript.org/) 
			
		Author:
			Fred Uggla <fred.uggla@gmail.com>
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
Global Version = 0.2
Global Database
Global Selected
Global Match
Global InputBox

; amenu settings
SettingsLoad()
if !FileExist(DatabaseFile)
	DatabaseCreate(DatabaseFile)
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