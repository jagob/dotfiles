import XMonad
-- import Dzen
import System.IO                   -- hPutStrLn scope
import System.Exit
-- import Control.Monad (liftM2)

-- import Data.Char (isSpace)
import qualified Data.Map as M
import qualified XMonad.StackSet as W   -- manageHook rules

-- import XMonad.Actions.CycleWindows -- classic alt-tab
import XMonad.Actions.CycleWS      -- cycle thru WS', toggle last WS
import XMonad.Actions.NoBorders

import XMonad.Hooks.ManageDocks    -- dock/tray mgmt
import XMonad.Hooks.ManageHelpers
import XMonad.Hooks.DynamicLog     -- statusbar 
import XMonad.Hooks.UrgencyHook    -- window alert bells 
import XMonad.Hooks.SetWMName
import XMonad.Hooks.InsertPosition
import XMonad.Hooks.EwmhDesktops   -- fullscreenEventHook fixes chrome fullscreen

import XMonad.Layout.NoBorders     -- smart borders on solo clients
-- import XMonad.Layout.PerWorkspace (onWorkspace)
-- import XMonad.Layout.SimplestFloat
import XMonad.Layout.Spacing
import XMonad.Layout.ResizableTile
import XMonad.Layout.Grid
-- import XMonad.Layout.Renamed
import XMonad.Layout.Decoration
import XMonad.Layout.NoFrillsDecoration
import XMonad.Layout.Maximize

import XMonad.Util.Run
import XMonad.Util.Run(spawnPipe)  -- spawnPipe and hPutStrLn
import XMonad.Util.Font
-- import XMonad.Util.EZConfig        -- append key/mouse bindings
import Graphics.X11.ExtraTypes.XF86
 

-- Main function that launches xmonad
main =  do
    dzen     <- spawnPipe myStatusBar
    conkyapp <- spawnPipe myStartBar
    conkytop <- spawnPipe myTopBar
    conkybot <- spawnPipe myBotBar
    trayer   <- spawnPipe myTrayer


    xmonad $ withUrgencyHook NoUrgencyHook $ defaultConfig {
          terminal              = "urxvt"
        , focusedBorderColor    = green
        , normalBorderColor     = myDzenBGColor
        -- , modMask               = mod4Mask -- Swap alt and win to play Dota
        , borderWidth           = 3
        , workspaces            = myWorkspaces
        , keys                  = myKeys
        , layoutHook            = myLayouts  -- avoidStruts are bugged for multi monitor
        -- , layoutHook=avoidStruts $ layoutHook defaultConfig
        , logHook               = dynamicLogWithPP $ myPrettyPrinter dzen
        , manageHook            = manageDocks <+> myManageHook 
        -- , manageHook            = manageHook defaultConfig <+> manageDocks 
        , handleEventHook       = ewmhDesktopsEventHook <+> docksEventHook 
        , startupHook           = setWMName "LG3D"
        , focusFollowsMouse     = False
        , clickJustFocuses      = False
    }


myWorkspaces            = clickable . (map dzenEscape) $ ["1","2","3","4","5","6","7","8","9"]
  where clickable l     = [ "^ca(1,xdotool key alt+" ++ show (n) ++ ")" ++ ws ++ "^ca()" |
                            (i,ws) <- zip [1..] l,
                            let n = i ]

-- You can use the commandline tool xprop to find out a window’s properties for use in these manageHooks.
-- Define the workspace an application has to go to
myManageHook = composeAll [ 
      isDialog                              --> doCenterFloat
    -- , isFullscreen                          --> doFullFloat
    , className =? "stalonetray"            --> doIgnore
    , className =? "trayer"                 --> doIgnore
    , className =? "Xfce4-notifyd"          --> doIgnore
    , className =? "Vlc"                    --> doFloat
    , className =? "Steam"                  --> doShift (myWorkspaces !! 4) -- send to ws 5
    , title     =? "mutt"                   --> doShift (myWorkspaces !! 5) -- send to ws 6
    , title     =? "irssi"                  --> doShift (myWorkspaces !! 6) -- send to ws 7
    -- , className =? "XCalc"                  --> doFloat
    , title     =? "Copying Files"          --> doFloat
    , title     =? "File Operation Progress"--> doFloat
    -- , className =? "Gimp"                   --> doFloat
    -- , insertPosition Above Newer
    , insertPosition Below Newer
    , transience'
    ]

-- myLayouts = maximize (tile ||| mtile ||| full)
myLayouts = avoidStruts $ (tile ||| mtile ||| full)
    where
        tile  = noFrillsDeco shrinkText myTheme $ spacing 5 $ smartBorders $ ResizableTall nmaster delta ratio []
        mtile = noFrillsDeco shrinkText myTheme $ spacing 5 $ smartBorders $ Mirror $ ResizableTall nmaster delta ratio []
        -- full  = noFrillsDeco shrinkText myTheme $ noBorders Full
        full  = noBorders Full
        nmaster = 1     -- The default number of windows in the master pane
        delta   = 3/100 -- Percent of screen to increment by when resizing panes
        ratio   = 1/2   -- Default proportion of screen occupied by master pane

-- update theme with mod-shift-space. xmonad restart is not enough
myTheme = defaultTheme { 
      decoHeight            = 22
    , fontName              = "xft:Ubuntu:size=12"
    , activeColor           = green
    , activeBorderColor     = green
    , activeTextColor       = myDzenBGColor
    , inactiveColor         = myDzenBGColor
    , inactiveBorderColor   = myDzenBGColor
    , inactiveTextColor     = green
    }

-- Pretty printer for dzen workspace bar
myPrettyPrinter h = dzenPP {
      ppOutput          = hPutStrLn h
    , ppCurrent         = dzenColor myDzenBGColor myDzenFGColor2 . wrap " " " " 
    , ppVisible         = dzenColor myDzenBGColor myDzenFGColor . wrap " " " " 
    , ppHidden          = dzenColor myDzenFGColor2 myDzenBGColor . wrap " " " "
    , ppHiddenNoWindows = dzenColor myDzenFGColor myDzenBGColor . wrap " " " "
    , ppUrgent          = dzenColor red     myDzenBGColor . wrap " " " " 
    , ppWsSep           = " "
    , ppSep             = "  |  "
    , ppTitle           = (" " ++) . dzenColor myDzenFGTextColor myDzenBGColor . wrap "^ca(1,xdotool key alt+j)^ca(3,xdotool key alt+shift+c)"
                          "                          ^ca()^ca()" . shorten 80 . dzenEscape
    , ppLayout          = wrap "^ca(1,xdotool key alt+space)" "^ca()" . dzenColor myDzenFGColor myDzenBGColor .
      (\x -> case x of
          "NoFrillsDeco Spacing ResizableTall"        -> "^i(/home/jacob/.xmonad/dzen2/img/layout_tall.xbm)"
          "NoFrillsDeco Spacing Mirror ResizableTall" -> "^i(/home/jacob/.xmonad/dzen2/img/layout_mirror_tall.xbm)"
          "Full"                                      -> "^i(/home/jacob/.xmonad/dzen2/img/layout_full.xbm)"
          _                                           -> x
      )
    }

-- Colors
black  = "#282828"
green  = "#5faf5f"
brown  = "#eee8d5"
brown2 = "#fdf6e3" 
red    = "#ff0000"
-- -- Light theme
-- myDzenBGColor = brown2
-- myDzenFGColor = green
-- myDzenFGColor2 = green
-- myDzenFGTextColor = green
-- myTrayerColor = "0xfdf6e3"
-- Dark theme
myDzenBGColor = black
myDzenFGColor = green
myDzenFGColor2 = brown
myDzenFGTextColor = green
myTrayerColor = "0x282828"

myFont = "Ubuntu regular:size=12:antialias=true"
myDzenStyle = "-h 20 -fg "++myDzenFGColor++" -bg "++myDzenBGColor++" -fn "++myFont++""

-- -- 1280x1024
-- myStartBar  = "conky -c ~/.xmonad/dzen2/.conky_start_apps | dzen2 -dock       -x 0   -y 0    -w 30   -ta l " ++myDzenStyle
-- myStatusBar =                                              "dzen2 -dock -e '' -x 30  -y 0    -w 870  -ta l " ++myDzenStyle
-- myTopBar    = "conky -c ~/.xmonad/dzen2/.conky_dzen_top   | dzen2 -dock -e '' -x 900 -y 0    -w 380  -ta r " ++myDzenStyle
-- myBotBar    = "conky -c ~/.xmonad/dzen2/.conky_dzen_bot   | dzen2 -dock -e '' -x 0   -y 1004 -w 1280 -ta l " ++myDzenStyle
-- myTrayer    = "trayer --edge top --align left --margin 900 --widthtype request --SetDockType true --SetPartialStrut false --expand false --heighttype pixel --height 20 --transparent true --tint 0xfdf6e3 --alpha 0"

-- -- 1680x1050
-- myStartBar  = "conky -c ~/.xmonad/dzen2/.conky_start_apps | dzen2 -dock -x 0 -y 0 -w 30 -ta l "           ++ myDzenStyle
-- myStatusBar =                                              "dzen2 -dock -e '' -x 30 -y 0 -w 1220 -ta l "  ++ myDzenStyle
-- myTopBar    = "conky -c ~/.xmonad/dzen2/.conky_dzen_top   | dzen2 -dock -e '' -x 1350 -y 0 -w 330 -ta r " ++ myDzenStyle
-- myBotBar    = "conky -c ~/.xmonad/dzen2/.conky_dzen_bot   | dzen2 -dock -x 0 -y 1030 -w 1680 -ta l "      ++ myDzenStyle
-- myTrayer    = "trayer --edge top --align left --margin 1250 --widthtype pixel --width 100 --SetDockType true --SetPartialStrut false --expand false --heighttype pixel --height 20 --transparent true --tint 0xfdf6e3 --alpha 0"

-- 1920x1080
myStartBar  = "conky -c ~/.xmonad/dzen2/.conky_start_apps | dzen2 -dock -x 0 -y 0 -w 30 -ta l "           ++ myDzenStyle
myStatusBar =                                              "dzen2 -dock -e '' -x 30 -y 0 -w 1220 -ta l "  ++ myDzenStyle
myTopBar    = "conky -c ~/.xmonad/dzen2/.conky_dzen_top   | dzen2 -dock -e '' -x 1350 -y 0 -w 570 -ta r " ++ myDzenStyle
myBotBar    = "conky -c ~/.xmonad/dzen2/.conky_dzen_bot   | dzen2 -dock -x 0 -y 1060 -w 1920 -ta l "      ++ myDzenStyle
myTrayer    = "trayer --edge top --align left --margin 1250 --widthtype pixel --width 100 --SetDockType true --SetPartialStrut false --expand false --heighttype pixel --height 20 --transparent true --alpha 0" ++ " --tint "++myTrayerColor++""

-- -- 2560x1440
-- myStartBar  = "conky -c ~/.xmonad/dzen2/.conky_start_apps | dzen2 -dock -x 0 -y 0 -w 30 -ta l "            ++ myDzenStyle
-- myStatusBar =                                              "dzen2 -dock -e '' -x 30 -y 0 -w 1220 -ta l "   ++ myDzenStyle
-- myTopBar    = "conky -c ~/.xmonad/dzen2/.conky_dzen_top   | dzen2 -dock -e '' -x 1350 -y 0 -w 1210 -ta r " ++ myDzenStyle
-- myBotBar    = "conky -c ~/.xmonad/dzen2/.conky_dzen_bot   | dzen2 -dock -x 0 -y 1420 -w 2560 -ta l "       ++ myDzenStyle
-- myTrayer    = "trayer --edge top --align left --margin 1250 --widthtype pixel --width 100 --SetDockType true --SetPartialStrut false --expand false --heighttype pixel --height 20 --transparent true --tint 0xfdf6e3 --alpha 0"


-- Define new key combinations to be added
myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList $ [
      ((modm .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf) -- launch a terminal
    , ((modm .|. shiftMask, xK_p     ), spawn "gmrun")          -- launch gmrun
    -- , ((modMask4 .|. shiftMask, xK_p     ), spawn "gmrun")          -- launch gmrun
    , ((modm,               xK_p     ), spawn "dmenu_run -fn 'Ubuntu Mono-14'")
    , ((modm .|. shiftMask, xK_c     ), kill)                   -- close focused window
    , ((modm,               xK_space ), sendMessage NextLayout) -- Rotate through the available layout algorithms
    , ((modm .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf) --  Reset the layouts on the current workspace to default
    , ((modm,               xK_n     ), refresh)                -- Resize viewed windows to the correct size
    , ((modm,               xK_Tab   ), windows W.focusDown)    -- Move focus to the next window
    , ((modm,               xK_j     ), windows W.focusDown)    -- Move focus to the next window
    , ((modm,               xK_k     ), windows W.focusUp  )    -- Move focus to the previous window
    -- , ((modm,               xK_m     ), windows W.focusMaster  )
    , ((modm,               xK_Return), windows W.swapMaster)   -- Swap the focused window and the master window
    , ((modm .|. shiftMask, xK_j     ), windows W.swapDown  )   -- Swap the focused window with the next window
    , ((modm .|. shiftMask, xK_k     ), windows W.swapUp    )   -- Swap the focused window with the previous window
    , ((modm,               xK_h     ), sendMessage Shrink)     -- Shrink the master area
    , ((modm,               xK_l     ), sendMessage Expand)     -- Expand the master area
    , ((modm .|. shiftMask, xK_h     ), sendMessage MirrorShrink)
    , ((modm .|. shiftMask, xK_l     ), sendMessage MirrorExpand) 
    , ((modm,               xK_t     ), withFocused $ windows . W.sink) -- Push window back into tiling
    , ((modm              , xK_comma ), sendMessage (IncMasterN 1)) -- Increment the number of windows in the master area
    , ((modm              , xK_period), sendMessage (IncMasterN (-1))) -- Deincrement the number of windows in the master area
    , ((modm              , xK_m     ), sendMessage ToggleStruts) -- Toggle the status bar gap
    , ((modm .|. shiftMask, xK_q     ), io (exitWith ExitSuccess)) -- Quit xmonad
    -- , ((modm .|. shiftMask, xK_q     ), io exitSuccess)
    , ((modm              , xK_q     ), spawn "killall conky dzen2 trayer; xmonad --recompile; xmonad --restart") -- Restart xmonad
    , ((modm,               xK_o     ), nextScreen)
    , ((modm .|. shiftMask, xK_o     ), shiftNextScreen >> nextScreen)
    , ((modm              , xK_z     ), withFocused toggleBorder) 
    , ((0                 , xK_Print ), spawn "scrot -e 'mv $f ~/screenshots/'")
    , ((0, xF86XK_AudioMute          ), spawn "amixer -D pulse sset Master toggle")
    , ((0, xF86XK_AudioLowerVolume   ), spawn "amixer -D pulse sset Master 1%-")
    , ((0, xF86XK_AudioRaiseVolume   ), spawn "amixer -D pulse sset Master 1%+")
    , ((0, xF86XK_AudioPlay ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
    -- , ((0, xF86XK_AudioStop ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause")
    , ((0, xF86XK_AudioPrev ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Prev")
    , ((0, xF86XK_AudioNext ), spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next")
    -- , ((0, xF86XK_AudioStop ), spawn "mpc stop")
    -- , ((0, xF86XK_AudioPrev ), spawn "mpc prev")
    -- , ((0, xF86XK_AudioNext ), spawn "mpc next")
    -- , ((0, xF86XK_AudioPlay ), spawn "mpc toggle")
    -- , ((0, xF86XK_Standby   ), spawn "sudo systemctl suspend")
    -- , ((0, xF86XK_Sleep     ), spawn "sudo systemctl suspend")
    , ((0, xF86XK_MonBrightnessUp  ), spawn "xbacklight -inc 10")
    , ((0, xF86XK_MonBrightnessDown), spawn "xbacklight -dec 10")
    , ((0, xK_KP_End        ), spawn "mpg123 ~/dropbox/faldkasse/soundboard/oioioi.mp3")   -- Keypad 1
    , ((0, xK_KP_Down       ), spawn "mpg123 ~/dropbox/faldkasse/soundboard/fight.mp3")    -- Keypad 2
    , ((0, xK_KP_Page_Down  ), spawn "python2 ~/dropbox/faldkasse/soundboard/soundboard.py naehnej")  -- Keypad 3
    , ((0, xK_KP_Left       ), spawn "python2 ~/dropbox/faldkasse/soundboard/soundboard.py help")   -- Keypad 4
    , ((0, xK_KP_Begin      ), spawn "mpg123 ~/dropbox/faldkasse/soundboard/oioioi.mp3")   -- Keypad 5
    , ((0, xK_KP_Right      ), spawn "python2 ~/dropbox/faldkasse/soundboard/soundboard.py nofucksgiven")   -- Keypad 6
    , ((0, xK_KP_Home       ), spawn "mpg123 ~/dropbox/faldkasse/soundboard/awesome.mp3")   -- Keypad 7
    , ((0, xK_KP_Up         ), spawn "mpg123 ~/dropbox/faldkasse/soundboard/oioioi.mp3")   -- Keypad 8
    , ((0, xK_KP_Page_Up    ), spawn "mpg123 ~/dropbox/faldkasse/soundboard/oioioi.mp3")   -- Keypad 9
    ]
    ++
    -- mod-[1..9], Switch to workspace N
    -- mod-shift-[1..9], Move client to workspace N
    [((m .|. modm, k), windows $ f i)
        | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
    ++
    -- mod-{w,e,r}, Switch to physical/Xinerama screens 1, 2, or 3
    -- mod-shift-{w,e,r}, Move client to screen 1, 2, or 3
    [((m .|. modm, key), screenWorkspace sc >>= flip whenJust (windows . f))
        | (key, sc) <- zip [xK_w, xK_e, xK_r] [0..]
        , (f, m) <- [(W.view, 0), (W.shift, shiftMask)]]
