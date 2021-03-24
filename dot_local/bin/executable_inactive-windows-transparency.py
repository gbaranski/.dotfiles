#!/usr/bin/python

from i3ipc import Connection, Event
from threading import Thread
from time import sleep

FOCUSED_OPACITY = 0.97
UNFOCUSED_OPACITY = 0.70
TERMINAL_APPID = "Alacritty"

last_focused = None

def on_window_focus(ipc, e):
    global last_focused

    if e.container.id != last_focused.id:
        if e.container.app_id == TERMINAL_APPID:
            e.container.command("opacity " + str(FOCUSED_OPACITY))

        if last_focused.app_id == TERMINAL_APPID:
            last_focused.command("opacity " + str(UNFOCUSED_OPACITY))

        last_focused = e.container

ipc = Connection()
for window in ipc.get_tree():
    if window.focused:
        last_focused = window
        if window.app_id == TERMINAL_APPID:
            window.command("opacity " + str(FOCUSED_OPACITY))
        else:
            window.command("opacity 1")
    else:
        if window.app_id == TERMINAL_APPID:
            window.command("opacity " + str(UNFOCUSED_OPACITY))
        else:
            window.command("opacity 1")


ipc.on(Event.WINDOW_FOCUS, on_window_focus)
# ipc.on(Event.WINDOW_NEW, on_window_new)
# ipc.on(Event.WINDOW_FLOATING, on_window_floating)
ipc.main()
