local hotkey = require "hs.hotkey"
local grid = require "hs.grid"

grid.MARGINX = 10
grid.MARGINY = 10
grid.GRIDHEIGHT = 3
grid.GRIDWIDTH = 7

local CTRL_ALT = {"ctrl", "alt"}
local CMD_CTRL = {"cmd", "ctrl"}


function moveWindowToDisplay(d)
  return function()
    local displays = hs.screen.allScreens()
    local win = hs.window.focusedWindow()
    win:moveToScreen(displays[d], false, true)
  end
end

--resize windows
hotkey.bind(CMD_CTRL, 'UP', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
    win:setFrame(f)
end)

hotkey.bind(CMD_CTRL, 'RIGHT', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.w / 2
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

hotkey.bind(CMD_CTRL, 'LEFT', function()
    local win = hs.window.focusedWindow()
    local f = win:frame()
    local screen = win:screen()
    local max = screen:frame()

    f.x = max.x
    f.y = max.y
    f.w = max.w / 2
    f.h = max.h
    win:setFrame(f)
end)

-- move window to display
hotkey.bind(CTRL_ALT, 'LEFT', moveWindowToDisplay(2))
hotkey.bind(CTRL_ALT, 'RIGHT', moveWindowToDisplay(1))
