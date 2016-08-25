/* 	function GuiCreate() 
		Description:
			Create GUI and tray icon menu.
*/
GuiCreate() {
	global
	html =
(
<!DOCTYPE html>
<html>
	<head>
		<style>
			body {
				font-family: %FontName%, sans-serif;
				font-size: %FontSize%px;
				background-color: 	%BackgroundColor%;
				color: %FontColor%;
				margin: 0;
				padding: 0;
			}
			div{
				float: left;
				padding: 0 5px;
				margin: 0 5px;
				height:	%H%px;
				line-height: %H%px;}
			#search{
				width: %SearchBoxWidth%px;
				overflow: hidden;
			}
			#selected{
				background-color: %FontColor%;
				color: %BackgroundColor%
			}
		</style>
	</head>
	<body>
		<div id=search></div>
		<div id=result></div>
	</body>
</html>
)
Gui, +AlwaysOnTop -Resize -SysMenu -Caption +Owner
Gui, Add, Edit, w0 h0 vInputBox gGuiRead ; Triggers GuiRead() on input.
Gui Add, ActiveX, x0 y0 w%W% h%H% vWB, Shell.Explorer2  ; 2 removes scroll-bar
WB.Navigate("about:blank")
while WB.ReadyState != 4
	Sleep 10
WB.Document.open()
WB.Document.write(html)
WB.Document.close()

Gui, Show, Hide x%X% y%Y% w%W% h%H%, amenu v%Version%
}
