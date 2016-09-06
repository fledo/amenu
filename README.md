amenu
=====

amenu is a simple and customizable application launcher very much inspired by the excellent [dmenu](http://tools.suckless.org/dmenu/). Consider amenu a Windows alternative to dmenu if you only use the latter to run executable files.

Installation
------------

Download and run the [amenu.exe](https://github.com/fledo/amenu/releases/latest) or clone the [repo](https://github.com/fledo/amenu/) and run amenu.ahk. The directories defined in [default.ini](https://github.com/fledo/amenu/blob/master/settings/default.ini) will be scanned for exe files.
 
Usage
-----

 1. Press `win + space` to open the amenu interface.
 2. Start typing to search for executables.
 3. Use `←` `→` or `tab` `shift + tab` to change selection.
 4. Press `enter` to launch the selected program.

### Example

![cyan-gui](https://raw.githubusercontent.com/fledo/amenu/dev/screenshot/01.png)

The default GUI showing the search string "fi" which matches two files in the database. Filezilla will be started when enter is pressed. Unless the selection is changed or the search pattern is narrowed down further.

Customize
---------

The following can be configured by editing the `settings.ini` file and restarting amenu:

 - Size and position of the GUI window.
 - Hotkeys to show and interact with the GUI.
 - Directories to be scanned for .exe files.

Other element settings, such as color, font, size, position and similar are all defined in `gui.css` and `gui.html`. Both are stored in `%appdata%/amenu` and are available via the tray icon menu. Simple changes requires next to none experience with HTML/CSS, the files are heavily commented.

### Example

Apply the changes below to gui.css to change from color `#28e0e0` (cyan) to `#fb8c00` (orange). Note that this requires two changes. The default font color itself and the background color of the selected result.

![orange-gui](https://raw.githubusercontent.com/fledo/amenu/dev/screenshot/02.png)

```css
body,div {
	/* Color of the font */
	color: #fb8c00;
}

.selected {
	/* background color of the selected result */
	background-color: #fb8c00;
}
```

Dependencies
------------

The [executable](https://github.com/fledo/amenu/releases/latest) should be fairly portable, require no elevated permissions and run under most versions of Windows. A cloned repository requires version 1.1.20.00+ of [AutoHotkey](https://github.com/Lexikos/AutoHotkey_L/).

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
