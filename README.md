amenu
=====

amenu is a simple and customizable application launcher very much inspired by the excellent [dmenu](http://tools.suckless.org/dmenu/). It will most likely never even be close to having the same set of features. Consider amenu a Windows alternative to dmenu if you only use the latter to run executable files.

Installation
------------

Run the [latest](https://github.com/fledo/amenu/releases/latest) `amenu.exe` or clone the repo and run `amenu.ahk`. This will generate default settings and search the following directories for `.exe` files.
 
- `C:\program files` (including subfolders)
- `C:\program files (x86)` (including subfolders)
-	`C:\windows`
- `C:\windows\system32`
 
Usage
-----

 1. Press `win + space` to open the amenu interface.
 2. Start typing to search for executables.
 3. Use `←` `→` or `tab` `shift + tab` to change selection.
 4. Press `enter` to launch the selected program.

Dependencies
------------

The [executable](https://github.com/fledo/amenu/releases/latest) `amenu.exe` should be fairly portable, require no elevated permissions and run under most versions of Windows. The script `amenu.ahk` requires version 1.1.20.00+ of [AutoHotkey](https://github.com/Lexikos/AutoHotkey_L/).

Settings
--------

The following can be configured by editing the `%appdata%\amenu\settings.ini` file and restarting amenu:

 - Size, position and color of gui.
 - GUI font, including color and size.
 - Delimiter between matches.
 - Hotkeys to show and interact with the GUI.
 - Tray icon visibility.
 - Directories to be scanned for .exe files.

License
-------

```
Copyright (C) 2016 Fred Uggla

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
```
