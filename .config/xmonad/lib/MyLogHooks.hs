module MyLogHooks (
    myLogHook,
) where

import GHC.IO.Handle.Types (Handle)
import XMonad.Config.Prime (MonadIO)
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, PP(..), xmobarColor, xmobarPP)
import XMonad.Util.Run (hPutStrLn, spawnPipe,)


output :: MonadIO m => m Handle
output = spawnPipe "xmobar /home/langtano/.config/xmobar/xmobarrc"

myPP :: PP
myPP = xmobarPP {
    ppCurrent = xmobarColor "#c3e88d" "",
    ppVisible = xmobarColor "#c3e88d" "",
    ppHidden = xmobarColor "#82AAFF" "",
    ppHiddenNoWindows = xmobarColor "#F07178" "",
    ppSep = "<fc=#666666> | </fc>",
    ppUrgent = xmobarColor "#C45500" "",
    -- ppExtras  = [windowCount],
    ppOrder  = \(workspaces:layout:title:extras) -> [workspaces, layout] ++ extras,
    ppOutput = output >>= hPutStrLn
}
myLogHook = dynamicLogWithPP myPP

-- xmproc <- spawnPipe "xmobar -x 0 /home/langtano/.config/xmobar/xmobarrc"
-- hPutStrLn xmproc

-- m1 >>= f = do
--     x <- m1
--     f x
-- spawnPipe >>= hPutStrLn

-- f = hPutStrLn
-- x = xmproc
-- x = spawnPipe