import XMonad
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops (ewmh, ewmhFullscreen,)
import XMonad.Hooks.StatusBar
import XMonad.Hooks.StatusBar.PP
import XMonad.Util.EZConfig (additionalKeys,)

import MyKeys (myKeys, myModMask)
import MyLayouts (myLayouts,)
import MyLogHooks (myLogHook,)


myWorkspaces = ["\xf489", "\xe73c", "\xe745", "\xf04b1", "\xf0361"]

myConfig = def
    {
        modMask    = myModMask,
        terminal   = "st",
        layoutHook = myLayouts,
        workspaces = myWorkspaces,
        logHook = myLogHook
    }
    `additionalKeys`
    myKeys

myXmobarPP :: PP
myXmobarPP = def

main :: IO ()
main = do
    xmonad
    . ewmhFullscreen
    . ewmh
    -- . withEasySB (statusBarProp "/home/langtano/.config/xmonad/lib/MyXmobar" (pure myXmobarPP)) defToggleStrutsKey
    $ myConfig