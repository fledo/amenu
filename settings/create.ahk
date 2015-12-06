/* 	function SettingsCreate()
		Description:
			Create deafault settings.ini under %appdata%/amenu.
			Promt user to edit settings and reload amenu.
*/
SettingsCreate() {
	FileCreateDir, %A_AppData%\amenu
	SetWorkingDir, %A_AppData%\amenu
	FileAppend,
(
; Height, width and position of interface and elements
[position]
;InterfaceW		=	1920 ; Defaults to current screen width.
InterfaceH		=	30
InterfaceX		=	0
InterfaceY		=	0
SearchBoxWidth	=	100

; Color and font settings
[apperance]
BackgroundColor	=	"333333"
FontColor		=	"11FFFF"
FontName		=	"Lucida Console"
FontSize		=	9

; Characters between results
[delimiter]
DelimiterLeft	= 	"[ "
DelimiterRight	= 	" ]"
DelimiterNormal	= 	"  "

; Miscellaneous settings
; The hotkey to show the interface is assigned using the following pattern:
; # = win	+ = shift	! = alt		^ = control		& = used between any two keys
; Examples: "#Space", "+c", CapsLock & r" are all valid.
; More info here: http://ahkscript.org/docs/Hotkeys.htm#Symbols
[misc]
InterfaceHotkey	=	"#Space"
ShowTrayIcon	=	1
DatabaseFile	=	"database.db"


; All surplus section names are all interpreted as directories regardless their section name
[programfiles]
path			=	"C:\program files"
recursive		=	1

[x86]
path			=	"C:\program files (x86)"
recursive		=	1

[win]
path			=	"C:\windows"
recursive		=	0
), settings.ini
	MsgBox, 4, amenu, Default settings have been generated. Do you want to edit the settings file?
	IfMsgBox Yes 
	{
		Run, open settings.ini
		MsgBox, When you are done, click "OK" to load your configuration file.
	}
}