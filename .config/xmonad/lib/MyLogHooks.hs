module MyLogHooks (
    statusBarPP,
) where

import XMonad (gets, windowset,)
import XMonad.Hooks.DynamicLog (PP(..), xmobarColor, xmobarPP)
import XMonad.StackSet (integrate', stack, workspace, current,)


windowCount = 
    gets
    $ Just
    . show
    . length
    . integrate'
    . stack
    . workspace
    . current
    . windowset


statusBarPP :: PP
statusBarPP = xmobarPP {
    ppCurrent = xmobarColor "#c3e88d" "",
    ppVisible = xmobarColor "#c3e88d" "",
    ppHidden = xmobarColor "#82AAFF" "",
    ppHiddenNoWindows = xmobarColor "#F07178" "",
    ppSep = "<fc=#666666> | </fc>",
    ppUrgent = xmobarColor "#C45500" "",
    ppExtras = [windowCount],
    ppOrder  = \(workspaces:layout:title:extras) -> [workspaces, layout] ++ extras
}