module MyKeys (
    myModMask,
    myKeys,
) where

import XMonad
import Graphics.X11.ExtraTypes.XF86 as XF86


myModMask = mod4Mask    -- rebind Mod to super key

myKeys :: [((KeyMask, KeySym), X ())]
myKeys =
    [
         (
            (myModMask, xK_p),
            spawn "rofi -show run"
        ),
        (
            (myModMask, xK_f),
            spawn "firefox"
        ),
        (
            (0, XF86.xF86XK_AudioLowerVolume),
            spawn "pactl set-sink-volume @DEFAULT_SINK@ -1%"
        ),
        (
            (0, XF86.xF86XK_AudioRaiseVolume),
            spawn "pactl set-sink-volume @DEFAULT_SINK@ +1%"
        ),
        (
            (0, XF86.xF86XK_AudioMute),
            spawn "pactl set-sink-mute @DEFAULT_SINK@ toggle"
        ),
        (
            (0, XF86.xF86XK_KbdBrightnessUp),
            spawn "xbacklight -inc 5"
        ),
        (
            (0, XF86.xF86XK_KbdBrightnessDown),
            spawn "xbacklight -dec 5"
        ),
        (
            (0, xK_Print),
            spawn "scrot '%Y-%m-%d_%wx$h.png' -e 'mv $f ~/Pictures/'"
        ),
        (
            (shiftMask, xK_Print),
            spawn "scrot -s '%Y-%m-%d_%wx$h.png' -e 'mv $f ~/Pictures/'"
        ),
        (
            (myModMask, xK_F8),
            spawn "arandr"
        )
    ]