module MyLayouts (
    myLayouts,
) where

import XMonad.Layout


myLayouts = tiled ||| Mirror tiled ||| Full
    where
        tiled   = Tall nmaster delta ratio
        nmaster = 1      -- Default number of windows in the master pane
        delta   = 3/100  -- Percent of screen to increment by when resizing panes
        ratio   = 1/2    -- Default proportion of screen occupied by master pane