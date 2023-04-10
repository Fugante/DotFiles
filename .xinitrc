#!/bin/bash

# Set up an icon tray
trayer\
    --edge top\
    --align right\
    --SetDockType true\
    --SetPartialStrut true\
    --expand true\
    --width 10\
    --transparent true\
    --alpha 0\
    --tint 0x1e1e2e\
    --height 30 &

# Set the default X cursor to the usual pointer
xsetroot -cursor_name left_ptr

# Set a nice background
nitrogen --restore

# Fire up screensaver
# xscreensaver -no-splash &

# Power Management
# xfce4-power-manager &

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

exec /home/langtano/.local/bin/xmonad