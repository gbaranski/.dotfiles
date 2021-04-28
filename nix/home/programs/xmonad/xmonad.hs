import XMonad
import System.IO
import System.Exit

import qualified Data.Map as Map
import qualified XMonad.StackSet as W
import Graphics.X11.ExtraTypes.XF86
import XMonad.Layout.Spacing
import XMonad.Hooks.ManageDocks
import XMonad.Layout.NoBorders
import XMonad.Layout.Tabbed (tabbed)
import XMonad.Layout.ThreeColumns
import XMonad.Layout.ToggleLayouts
import XMonad.Hooks.EwmhDesktops
import XMonad.Hooks.DynamicLog
import XMonad.Util.Run


bg     = "#282C34"
red    = "#E06C75"
green  = "#98C379"
yellow = "#E5C07B"
blue   = "#61AFEF"
purple = "#C678DD"
aqua   = "#56B6C2"
gray   = "#ABB2BF"


myTerminal       = "alacritty"
myLauncher       = "j4-dmenu-desktop --dmenu='dmenu -i' --term='alacritty'"
myScreenshot     = "flameshot gui -p ~/screenshots"
myToggleMute     = "pamixer --toggle-mute"
myLowerVolume    = "pamixer -ud 5"
myRaiseVolume    = "pamixer -ui 5"
myAudioPlay      = "playerctl play-pause"
myAudioNext      = "playerctl next"
myAudioPrev      = "playerctl previous"
myBrightnessUp   = "light -A 5"
myBrightnessDown = "light -U 5"

myLayout = 
            avoidStruts $
            spacings $
	    smartBorders ( tiled ||| Mirror tiled ||| Full )
	where
            -- Smart spacings, they show only if window is fullscreened
            spacings    = smartSpacing spacingSize

            -- Size of the spacings
            spacingSize = 10

            -- default tiling algorithm partitions the screen into two panes
            tiled       = Tall nmaster delta ratio 

            -- The default number of windows in the master pane
            nmaster     = 1
 
            -- Default proportion of screen occupied by master pane
            ratio       = 1/2
 
            -- Percent of screen to increment by when resizing panes
            delta       = 2/100

main = do
    xmproc <- spawnPipe "xmobar"
    xmonad $ docks defaultConfig
        { terminal            = myTerminal
        , modMask             = myModMask
        , handleEventHook     = fullscreenEventHook
        , borderWidth         = 2
        , normalBorderColor   = bg
        , focusedBorderColor  = aqua
        , keys                = myKeys
        , layoutHook          = myLayout
        , logHook = dynamicLogWithPP  sjanssenPP
			{ ppOutput  = hPutStrLn xmproc

		        --                        fg      bg
                        , ppCurrent = xmobarColor aqua    ""                 -- Current workspace in xmobar
                        , ppVisible = xmobarColor yellow  ""                 -- Visible but not current workspace
                        , ppHidden  = xmobarColor gray    ""                 -- Hidden workspaces in xmobar
                        , ppUrgent  = xmobarColor red     "" . wrap "!" "!"  -- Urgent workspace

			, ppWsSep   = " | "                                  -- Separator of workspaces
                        , ppOrder  = \(ws:l:t) -> [ws, l]                    -- Order, first show workspaces, and then layout
                        }
        }

------------------------------------------------------------------------
-- Key bindings
--
-- modMask lets you specify which modkey you want to use. The default
-- is mod1Mask ("left alt").  You may also consider using mod3Mask
-- ("right alt"), which does not conflict with emacs keybindings. The
-- "windows key" is usually mod4Mask.
--
myModMask = mod4Mask

myKeys conf@(XConfig {XMonad.modMask = modMask}) = Map.fromList $
  ----------------------------------------------------------------------
  -- Custom key bindings
  --

  -- Start a terminal.  Terminal to start is specified by myTerminal variable.
  [ ((modMask .|. shiftMask, xK_Return),
     spawn $ XMonad.terminal conf)

  -- Lock the screen using command specified by myScreensaver.
  -- , ((modMask .|. controlMask, xK_l),
  --   spawn myScreensaver)

  -- Spawn the launcher using command specified by myLauncher.
  -- Use this to launch programs without a key binding.
  , ((modMask, xK_p),
     spawn myLauncher)

  -- Take screenshot
  , ((0, xK_Print),
     spawn myScreenshot)

  -- Mute volume.
  , ((0, xF86XK_AudioMute),
     spawn myToggleMute)

  -- Decrease volume.
  , ((0, xF86XK_AudioLowerVolume),
     spawn myLowerVolume)

  -- Increase volume.
  , ((0, xF86XK_AudioRaiseVolume),
     spawn myRaiseVolume)

  -- Play/pause.
  , ((0, xF86XK_AudioPlay),
     spawn myAudioPlay)

  -- Audio previous.
  , ((0, xF86XK_AudioPrev),
     spawn myAudioPrev)

  -- Audio next.
  , ((0, xF86XK_AudioNext),
     spawn myAudioNext)

  -- Brightness up.
  , ((0, xF86XK_MonBrightnessUp),
     spawn myBrightnessUp)

  -- Brightness up.
  , ((0, xF86XK_MonBrightnessDown),
     spawn myBrightnessDown)

  --------------------------------------------------------------------
  -- "Standard" xmonad key bindings
  --

  -- Close focused window.
  , ((modMask .|. shiftMask, xK_c),
     kill)

  -- Cycle through the available layout algorithms.
  , ((modMask, xK_space),
     sendMessage NextLayout)

  --  Reset the layouts on the current workspace to default.
  , ((modMask .|. shiftMask, xK_space),
     setLayout $ XMonad.layoutHook conf)

  -- Resize viewed windows to the correct size.
  , ((modMask, xK_n),
     refresh)

  -- Move focus to the next window.
  , ((modMask, xK_Tab),
     windows W.focusDown)

  -- Move focus to the next window.
  , ((modMask, xK_j),
     windows W.focusDown)

  -- Move focus to the previous window.
  , ((modMask, xK_k),
     windows W.focusUp  )

  -- Move focus to the master window.
  , ((modMask, xK_m),
     windows W.focusMaster  )

  -- Swap the focused window and the master window.
  , ((modMask, xK_Return),
     windows W.swapMaster)

  -- Swap the focused window with the next window.
  , ((modMask .|. shiftMask, xK_j),
     windows W.swapDown  )

  -- Swap the focused window with the previous window.
  , ((modMask .|. shiftMask, xK_k),
     windows W.swapUp    )

  -- Shrink the master area.
  , ((modMask, xK_h),
     sendMessage Shrink)

  -- Expand the master area.
  , ((modMask, xK_l),
     sendMessage Expand)

  -- Push window back into tiling.
  , ((modMask, xK_t),
     withFocused $ windows . W.sink)

  -- Increment the number of windows in the master area.
  , ((modMask, xK_comma),
     sendMessage (IncMasterN 1))

  -- Decrement the number of windows in the master area.
  , ((modMask, xK_period),
     sendMessage (IncMasterN (-1)))

  -- Toggle the status bar gap.
  -- TODO: update this binding with avoidStruts, ((modMask, xK_b),

  -- Quit xmonad.
  , ((modMask .|. shiftMask, xK_q),
     io (exitWith ExitSuccess))

  -- Restart xmonad.
  , ((modMask, xK_q),
     restart "xmonad" True)
  ]
  ++

  -- mod-[1..9], Switch to workspace N
  -- mod-shift-[1..9], Move client to workspace N
  [((m .|. modMask, k), windows $ f i)
      | (i, k) <- zip (XMonad.workspaces conf) [xK_1 .. xK_9]
      , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]
