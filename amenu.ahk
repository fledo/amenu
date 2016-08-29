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
Hotkey, %Toggle%, GuiToggle
Hotkey, IfWinActive, amenu v%Version%
Hotkey, %Right%, GuiRight
Hotkey, %Right2%, GuiRight
Hotkey, %Left%, GuiLeft
Hotkey, %Left2%, GuiLeft
Hotkey, %RunSelection%, GuiRun
Hotkey, %RunPattern%, GuiRun
Hotkey, %Hide%, GuiHide
Return