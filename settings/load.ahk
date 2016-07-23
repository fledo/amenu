/* 	function SettingsLoad()
		Description:
			Load the following sections from settings.ini:
			position, apperance, delimiter, misc.
*/
SettingsLoad() {
	global
	if !FileExist("settings.ini") 
		SettingsCreate()
		
	; Height, width and position of interface and elements
	IniRead, W, settings.ini, position, InterfaceW, %A_ScreenWidth%
	IniRead, H, settings.ini,  position, InterfaceH
	IniRead, X, settings.ini, position, InterfaceX
	IniRead, Y, settings.ini, position, InterfaceY
	IniRead, SearchBoxWidth, settings.ini, position, SearchBoxWidth
	ResultBoxWidth := W-SearchBoxWidth-10
	BoxHeight := H+20
	
	; Color and font settings
	IniRead, BackgroundColor, settings.ini, apperance, BackgroundColor
	IniRead, FontColor, settings.ini, apperance, FontColor
	IniRead, FontName, settings.ini, apperance, FontName
	IniRead, FontSize, settings.ini, apperance, FontSize
	
	; Characters between results
	IniRead, DelimiterLeft, settings.ini, delimiter, DelimiterLeft
	IniRead, DelimiterRight, settings.ini, delimiter, DelimiterRight
	IniRead, DelimiterNormal, settings.ini, delimiter, DelimiterNormal
	
	; Misc settings
	IniRead, DatabaseFile, settings.ini, misc, DatabaseFile
	IniRead, ShowTrayIcon, settings.ini, misc, ShowTrayIcon
	
	; Hotkey settings
	IniRead, GuiToggle, settings.ini, hotkey, GuiToggle
	IniRead, GuiRight, settings.ini, hotkey, GuiRight
	IniRead, GuiRight2, settings.ini, hotkey, GuiRight2
	IniRead, GuiLeft, settings.ini, hotkey, GuiLeft
	IniRead, GuiLeft2, settings.ini, hotkey, GuiLeft2
	IniRead, GuiRun, settings.ini, hotkey, GuiRun
	IniRead, GuiRunInput, settings.ini, hotkey, GuiRunInput
	IniRead, GuiHide, settings.ini, hotkey, GuiHide
}