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
main = xmonad =<< statusBar myBar pp toggleStrutsKey conf
	where
		myBar = "xmobar"
		pp = customPP
		toggleStrutsKey XConfig {XMonad.modMask = modMask} = (modMask, xK_b)
		uhook = withUrgencyHookC NoUrgencyHook urgentConfig
		conf = uhook myConfig

------------------------------------------------------------------------------
-- Configs --
myConfig = defaultConfig { 
	-- workspaces = ["1:web", "2:main", "3:dev", "4:misc", "5:mail", "6:chat"] ++ map show [7..9]
	workspaces = [" 1 ", " 2 ", " 3 ", " 4 ", " 5 ", " 6 ", " 7 ", " 8 ", " 9 "]
	, borderWidth = 3
	, normalBorderColor = "#000000"
	, focusedBorderColor = "#4a914a"
	, terminal = "urxvt"
	, layoutHook = layoutHook'
	, manageHook = manageHook'
	, startupHook = setWMName "LG3D"
	, focusFollowsMouse = False
	, clickJustFocuses = True
	}
	`additionalKeysP` myKeys

------------------------------------------------------------------------------
-- Looks --
customPP = defaultPP { 
	ppCurrent = xmobarColor "#e4e4e4" "#5e5e42" 
	, ppHidden = xmobarColor "#87875f" ""
	, ppHiddenNoWindows = xmobarColor "#606060" ""
	-- , ppTitle =  xmobarColor "#aaaaaa" "" . shorten 80
	, ppUrgent = xmobarColor "#df0000" ""
	, ppSep = xmobarColor "#87875f" "" " | "
	}

-- Urgent Notification
urgentConfig = UrgencyConfig { suppressWhen = Focused, remindWhen = Dont }

-- layouts -------------------------------------------------------------------
layoutHook' = tile ||| mtile ||| full
	where
		rt = ResizableTall 1 (2/100) (1/2) []
		tile = renamed [Replace "tile"] $ spacing 2 $ smartBorders rt
		mtile = renamed [Replace "mtile"] $ smartBorders $ Mirror rt
		full = renamed [Replace "full"] $ noBorders Full


------------------------------------------------------------------------------
-- Window Management --
-- To show application name: xprop | grep WM_CLASS
manageHook' = composeAll [ 
	isFullscreen             			--> doFullFloat
	-- , className =? "Google-chrome"  	--> doShift "1:web"
	, className =? "Thunderbird"  	--> doShift "5:mail"
	, title 		=? "mutt"  				--> doShift "5:mail"
	, className =? "Skype"        	--> doShift "6:chat" <+> doFloat
	, className =? "hl2_linux" 		--> doFullFloat
	, className =? "dota_linux" 		--> doFullFloat
	-- -novid -w 1680 -h 1020 -window
	, className =? "war3.exe" 			--> doFullFloat
	, className =? "Gimp"      		--> doFloat
	, className =? "Inkscape"  		--> doFloat
	, className =? "Vlc"       		--> doFloat
	, className =? "feh"       		--> doFloat
	, title     =? "Copying Files"   --> doFloat
	, insertPosition Below Newer
	, transience'
	]


------------------------------------------------------------------------------
-- Keybinding-- 
myKeys = [ 
	  ("M-<Right>"  , nextWS                             ) -- go to next workspace
	, ("M-<Left>"   , prevWS                             ) -- go to prev workspace
	, ("M-p" , spawn "exe=`dmenu_run -fn 'Droid Sans Mono-13'`")
	, ("M-g"        , spawn "google-chrome"              ) -- launch chrome
	, ("M-e"        , spawn "/usr/bin/urxvt -e /usr/bin/mutt") -- launch thunderbird
	, ("M-f"        , spawn "thunar"                ) 
	-- , ("M-x"        , spawn "xchat"                      ) -- launch xchat
	-- , ("C-M-x"      , spawn "xlock"                      ) -- lockdown                                                               
	-- , ("C-l"        , spawn "xlock"                      ) -- lockdown                                                               
	-- , ("M-s"        , spawn "sudo /usr/sbin/pm-suspend"  ) -- suspend
	-- , ("C-M-h"      , spawn "sudo /usr/sbin/pm-hibernate") -- hibernate                                  
	-- , ("C-M-r"      , spawn "sudo /sbin/shutdown -r now" ) -- reboot
	-- , ("C-M-s"      , spawn "sudo /sbin/shutdown -h now" ) -- halt
	--
	-- , ("<XF86AudioRaiseVolume>" , spawn "amixer -c 0 set Master 1+") -- desktop
	-- , ("<XF86AudioLowerVolume>" , spawn "amixer -c 0 set Master 1-") -- desktop
	, ("<XF86AudioRaiseVolume>" , spawn "amixer -c 1 set Master 1+") -- laptop
	, ("<XF86AudioLowerVolume>" , spawn "amixer -c 1 set Master 1-") -- laptop
	, ("<XF86AudioMute>" , spawn "amixer set Master toggle") -- raise volume
	]
 



-- Multimedia
-- , ((0, xF86XK_AudioRaiseVolume ), safeSpawn "amixer" ["-q", "set", "Master", "2+"])
-- , ((0, xF86XK_AudioLowerVolume ), safeSpawn "amixer" ["-q", "set", "Master", "2-"])
-- , ((0, xF86XK_AudioMute ), safeSpawn "amixer" ["-q", "set", "Master", "toggle"])
-- , ((0, xF86XK_AudioPlay ), safeSpawn "ncmpcpp" ["play"])
-- , ((0, xF86XK_AudioNext ), safeSpawn "ncmpcpp" ["next"])
-- , ((0, xF86XK_AudioPrev ), safeSpawn "ncmpcpp" ["prev"])
-- , ((0, xF86XK_AudioStop ), safeSpawn "ncmpcpp" ["stop"])
