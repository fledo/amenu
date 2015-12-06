/*	function GuiCenter(hwnd)
		Description:
			Center text vertically in Edit element.
			
		Parameter:
			(hwnd) Window handle of specific control.
		
		Author:
			"just me" http://ahkscript.org/boards/viewtopic.php?p=44099#p44099
*/
GuiCenter(hwnd) {
   VarSetCapacity(RC, 16, 0)
   DllCall("User32.dll\GetClientRect", "Ptr", hwnd, "Ptr", &RC)
   CLHeight := NumGet(RC, 12, "Int")
   SendMessage, 0x0031, 0, 0, , ahk_id %hwnd% ; WM_GETFONT
   HFONT := ErrorLevel
   HDC := DllCall("GetDC", "Ptr", hwnd, "UPtr")
   DllCall("SelectObject", "Ptr", HDC, "Ptr", HFONT)
   VarSetCapacity(RC, 16, 0)
   DTH := DllCall("DrawText", "Ptr", HDC, "Str", "W", "Int", 1, "Ptr", &RC, "UInt", 0x2400)
   DllCall("ReleaseDC", "Ptr", hwnd, "Ptr", HDC)
   SendMessage, 0x00BA, 0, 0, , ahk_id %hwnd% ; EM_GETLINECOUNT
   TXHeight := DTH * ErrorLevel
   If (TXHeight > CLHeight)
      Return False
   VarSetCapacity(RC, 16, 0)
   SendMessage, 0x00B2, 0, &RC, , ahk_id %hwnd%
   DY := (CLHeight - TXHeight) // 2
   NumPut(DY, RC, 4, "Int")
   NumPut(TXHeight + DY, RC, 12, "Int")
   SendMessage, 0x00B3, 0, &RC, , ahk_id %hwnd%
}