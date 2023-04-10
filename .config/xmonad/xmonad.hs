import XMonad
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen,)
import XMonad.Hooks.StatusBar (statusBarProp, withEasySB, defToggleStrutsKey,)
import XMonad.Util.EZConfig (additionalKeys,)

import MyKeys (myKeys, myModMask)
import MyLayouts (myLayouts,)
import MyLogHooks (statusBarPP,)


myWorkspaces = ["\xf489", "\xe73c", "\xe745", "\xf04b1", "\xf0361"]

myConfig = def
    {
        modMask    = myModMask,
        terminal   = "st",
        layoutHook = myLayouts,
        workspaces = myWorkspaces
    }
    `additionalKeys`
    myKeys

myStatusBar = statusBarProp "/home/langtano/.config/xmonad/lib/MyXmobar" (pure statusBarPP)

main :: IO ()
main = do
    xmonad
    . ewmhFullscreen
    . ewmh
    . withEasySB myStatusBar defToggleStrutsKey
    $ myConfig