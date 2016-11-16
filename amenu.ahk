/*
	amenu.ahk
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
SetBatchLines -1
FileEncoding UTF-8
SetWorkingDir(A_AppData "\amenu")

; Variables
Global Version = 0.2
Global Title = "amenu v" Version
Global Database			; Array of objects containing name and path of all possible matches
Global SearchPattern	; String containing the user input used to filter matches
Global Match			; Objects from the Database which matches the SearchPattern
Global Selected			; Integer noting which Match the user has selected


; amenu settings
if !FileExist("settings.ini")
	SettingsCreate()
SettingsLoad()
GuiCreate()
if !FileExist(DatabaseFile)
	DatabaseCreate(DatabaseFile)
Database := DatabaseLoad(DatabaseFile)

; Ready to work, register hotkeys
Hotkey, % Toggle, GuiToggle
Hotkey, IfWinActive, % Title ; Only listen to the following hotkeys when the gui is active
Hotkey, % Right, GuiRight
Hotkey, % Right2, GuiRight
Hotkey, % Left, GuiLeft
Hotkey, % Left2, GuiLeft
Hotkey, % RunSelected, GuiRun
Hotkey, % RunPattern, GuiRun
Hotkey, % Hide, GuiHide
Return