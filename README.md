amenu
=====

amenu is a simple and customizable application launcher very much inspired by the excellent [dmenu](http://tools.suckless.org/dmenu/). Consider amenu a Windows alternative to dmenu if you only use the latter to run executable files.

Installation
------------

Download and run the [latest](https://github.com/fledo/amenu/releases/latest) `amenu.exe` or clone the [repo](https://github.com/fledo/amenu/) and run `amenu.ahk`. The directoires defined in [default.ini](https://github.com/fledo/amenu/blob/master/settings/default.ini) will be scanned for exe files.
 
Usage
-----

 1. Press `win + space` to open the amenu interface.
 2. Start typing to search for executables.
 3. Use `←` `→` or `tab` `shift + tab` to change selection.
 4. Press `enter` to launch the selected program.

Customize
---------

The following can be configured by editing the `settings.ini` file and restarting amenu:

 - Size and position of the GUI window.
 - Hotkeys to show and interact with the GUI.
 - Directories to be scanned for .exe files.

All other GUI settings, such as color, font and similar are all defined in `gui.css` and `gui.html`. Both of these files are available via the tray icon menu and in the folder `%appdata%/amenu`.

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
