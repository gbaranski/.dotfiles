#!/usr/bin/python

# This script requires i3ipc-python package (install it from a system package manager
# or pip).
# It makes inactive windows transparent. Use `transparency_val` variable to control
# transparency strength in range of 0…1 or use the command line argument -o.

import i3ipc
import signal
import sys
import re
from functools import partial

default_opacity          = str(1.00)
opacity_terminal         = str(0.97)
not_focused_opacity      = str(0.70)

def on_window_focus(ipc, event):
    global prev_focused
    global prev_workspace

    focused = event.container
    workspace = ipc.get_tree().find_focused().workspace().num

    if focused.id != prev_focused.id:  # https://github.com/swaywm/sway/issues/2859
        if focused.app_id == "Alacritty":
            focused.command("opacity " + opacity_terminal)
        else:
            focused.command("opacity " + default_opacity)

        if workspace == prev_workspace:
            prev_focused.command("opacity " + not_focused_opacity)

        prev_focused = focused
        prev_workspace = workspace


def restore_opacity(ipc):
    for workspace in ipc.get_tree().workspaces():
        for w in workspace:
            w.command("opacity " + default_opacity)
    ipc.main_quit()
    sys.exit(0)


if __name__ == "__main__":
    ipc = i3ipc.Connection()
    prev_focused = None
    prev_workspace = ipc.get_tree().find_focused().workspace().num

    for window in ipc.get_tree():
        if window.focused:
            prev_focused = window
        else:
            window.command("opacity " + default_opacity)
    for sig in [signal.SIGINT, signal.SIGTERM]:
        signal.signal(sig, lambda signal, frame: restore_opacity(ipc))
    ipc.on("window::focus", partial(on_window_focus))
    ipc.main()
