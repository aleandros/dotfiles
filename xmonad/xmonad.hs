import XMonad
import XMonad.Config.Desktop
import XMonad.Util.EZConfig(additionalKeysP)
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run
import System.IO
import XMonad.Util.WorkspaceCompare
import XMonad.Layout.Spacing

myStartupHook = do
  spawn "~/.xmonad/start.sh"

main = do
xmproc <- spawnPipe "~/.cabal/bin/xmobar"
xmonad $ defaultConfig
  { modMask = mod4Mask
  , normalBorderColor  = "#000000"
  , focusedBorderColor = "#FF0044"
  , startupHook = myStartupHook
  , manageHook = manageDocks <+> manageHook defaultConfig
  , layoutHook = smartSpacing 4 $ avoidStruts $ layoutHook defaultConfig
  , terminal = "urxvt"
  , logHook = dynamicLogWithPP xmobarPP
    { ppOutput = hPutStrLn xmproc
    , ppCurrent = xmobarColor "#FF0044" "" . wrap "[" "]"
    , ppVisible = xmobarColor "#FD971F" "" . wrap "[" "]"
    , ppHidden = wrap "*" ""
    , ppHiddenNoWindows = wrap "" ""
    , ppSort = getSortByXineramaRule
    , ppLayout = const ""
    , ppTitle  = const ""
    }
  } `additionalKeysP`
     [ ("<XF86AudioLowerVolume>", spawn "amixer -D pulse sset Master 2%-"),
       ("<XF86AudioRaiseVolume>", spawn "amixer -D pulse sset Master 2%+"),
       ("<XF86AudioMute>", spawn "amixer -D pulse sset Master 1+ toggle"),
       ("<XF86AudioPlay>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause"),
       ("<XF86AudioNext>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next"),
       ("<XF86AudioPrev>", spawn "dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous"),
       ("M-<Escape>", spawn "/home/ecabrera/.xmonad/toggle_layout.sh")]

