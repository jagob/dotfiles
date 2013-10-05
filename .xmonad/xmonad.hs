import XMonad

-- keybinding
import qualified XMonad.StackSet as W
import qualified Data.Map as M
import XMonad.Util.EZConfig 

import System.Exit
import XMonad.Util.Run (safeSpawn)
import Graphics.X11.ExtraTypes.XF86
import Data.Monoid (mappend)

-- actions
import XMonad.Actions.GridSelect
import XMonad.Actions.CycleWS
 
-- hooks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.UrgencyHook
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.SetWMName
 
-- layouts
import XMonad.Layout.NoBorders
import XMonad.Layout.ResizableTile
import XMonad.Layout.Renamed
import XMonad.Layout.Tabbed
import XMonad.Layout.Grid
import XMonad.Layout.Spacing


-- import XMonad.Hooks.DynamicLog
-- import XMonad.Hooks.ManageDocks (manageDocks, avoidStruts)
-- import XMonad.Hooks.ManageHelpers
-- import XMonad.Hooks.SetWMName
-- import XMonad.Layout.MultiToggle
-- import XMonad.Layout.MultiToggle.Instances
-- import XMonad.Layout.NoBorders
-- import XMonad.Layout.PerWorkspace
-- import XMonad.Layout.Spacing
-- import XMonad.Layout.Gaps
-- import XMonad.Util.Run (spawnPipe, hPutStrLn)
-- import qualified Data.Map                 as M
-- import qualified GHC.IO.Handle.Types      as H
-- import qualified XMonad.Layout.Fullscreen as FS
-- import qualified XMonad.StackSet          as W

------------------------------------------------------------------------------
-- Main --
main = xmonad =<< statusBar myBar pp toggleStrutsKey myConfig
  where
-- -- Command to launch the bar.
    myBar = "xmobar"
    pp = customPP
-- Key binding to toggle the gap for the bar.
    toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
    uhook = withUrgencyHookC NoUrgencyHook urgentConfig
    conf = uhook myConfig

------------------------------------------------------------------------------
-- Configs --
myConfig = defaultConfig { 
			 workspaces = ["1:web", "2:main", "3:dev", "4:misc", "5:mail", "6:chat"] ++ map show [7..9]
                         , borderWidth = 3
                         , normalBorderColor = "#080808"
                         , focusedBorderColor = "#00df5f"
                         , terminal = "urxvt"
                         -- , keys = myKeys
--                          , mouseBindings = mouseBindings'
                         , layoutHook = layoutHook'
                         , manageHook = manageHook'
 			 , startupHook = setWMName "LG3D"
			 , focusFollowsMouse = False
			 , clickJustFocuses = True
                         }
			 `additionalKeysP` myKeys

------------------------------------------------------------------------------
-- Looks --
-- bar
--customPP = defaultPP { ppCurrent = xmobarColor "#B8860B" "" . wrap "<" ">"
customPP = defaultPP { 
   		       -- ppOrder = \(ws:l:t) -> [ws,l,t]
		     ppCurrent = xmobarColor "#00df5f" ""
                     , ppHidden = xmobarColor "#87875f" ""
                     , ppHiddenNoWindows = xmobarColor "#606060" ""
		     -- , ppHiddenNoWindows = const ""
                     -- , ppLayout = xmobarColor "#aaaaaa" ""
                     -- , ppTitle =  xmobarColor "#aaaaaa" "" . shorten 80
                     , ppUrgent = xmobarColor "#df0000" "" . wrap "[" "]"
                     -- , ppUrgent = xmobarColor "#df0000" ""
                     , ppSep = xmobarColor "#87875f" "" " | "
                     }

-- layouts -------------------------------------------------------------------
layoutHook' = tile ||| mtile ||| full
  where
    rt = ResizableTall 1 (2/100) (1/2) []
    tile = renamed [Replace "tile"] $ spacing 2 $ smartBorders rt
    mtile = renamed [Replace "mtile"] $ smartBorders $ Mirror rt
    full = renamed [Replace "full"] $ noBorders Full

-- urgent notification
urgentConfig = UrgencyConfig { suppressWhen = Focused, remindWhen = Dont }

------------------------------------------------------------------------------
-- Window Management --
-- To show application name:
-- xprop | grep WM_CLASS
manageHook' = composeAll [ isFullscreen             --> doFullFloat
                         , className =? "Google-chrome"  --> doShift "1:web"
                         , className =? "Thunderbird"  --> doShift "5:mail"
    			 , className =? "Skype"        --> doShift "6:chat" <+> doFloat
			 , className =? "hl2_linux" --> doFullFloat
			 , className =? "dota_linux" --> doFullFloat
			 , className =? "war3.exe" --> doFullFloat

                         , className =? "Gimp"      --> doFloat
                         , className =? "Inkscape"  --> doFloat
                         , className =? "Vlc"       --> doFloat
                         , className =? "feh"       --> doFloat

			 , title     =? "Copying Files"   --> doFloat
-- , className =? "Gimp"                      --> doShift "8 grphx" <+> doFloat
-- , resource	=? "firefox-bin"    --> doF (W.shift "2-web")

                         -- , insertPosition Below Newer
                         , insertPosition Above Newer
                         , transience'
                         ]


------------------------------------------------------------------------------
-- Keybinding-- 

    --
    --

-- myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $
myKeys = [ 
           ("M-<Right>"  , nextWS                             ) -- go to next workspace
         , ("M-<Left>"   , prevWS                             ) -- go to prev workspace
         , ("M-p" , spawn "exe=`dmenu_run -fn 'Droid Sans Mono-13'`")
         , ("M-g"        , spawn "google-chrome"              ) -- launch chrome
         , ("M-e"        , spawn "thunderbird"                ) -- launch thunderbird
         , ("M-f"        , spawn "thunar"                ) 
         -- , ("M-x"        , spawn "xchat"                      ) -- launch xchat
         -- , ("M-o"        , spawn "opera"                      ) -- launch opera
         -- , ("C-M-x"      , spawn "xlock"                      ) -- lockdown                                                               
         -- , ("C-l"      , spawn "xlock"                      ) -- lockdown                                                               
         -- , ("M-s"        , spawn "sudo /usr/sbin/pm-suspend"  ) -- suspend
         -- , ("C-M-h"      , spawn "sudo /usr/sbin/pm-hibernate") -- hibernate                                  
         -- , ("C-M-r"      , spawn "sudo /sbin/shutdown -r now" ) -- reboot
         -- , ("C-M-s"      , spawn "sudo /sbin/shutdown -h now" ) -- halt
         , ("<XF86AudioRaiseVolume>" , spawn "amixer -c 0 set Master 1+") -- raise volume
         , ("<XF86AudioLowerVolume>" , spawn "amixer -c 0 set Master 1-") -- raise volume
         , ("<XF86AudioMute>" , spawn "amixer set Master toggle") -- raise volume

    -- -- Resize viewed windows to the correct size
	 -- , ("M-n" , refresh)
    -- , ((modm,               xK_n     ), refresh)
         ]
 
    -- -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    -- [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
    --     | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
    --     , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
