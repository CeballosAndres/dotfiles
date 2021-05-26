-- Local variables
local hyper = { "cmd", "alt", "ctrl", "shift" }

local applicationHotkeys = {
  a = 'Telegram',
  p = 'System Preferences',
  e = 'Spark',
  w = 'WhatsApp',
  f = 'Finder',
  n = 'Notion',
  m = 'Music',
  c = 'Google Chrome',
  t = 'iTerm',
  s = 'Safari',
  v = 'Visual Studio Code'
}

-- Launch || focus an app 
for key, app in pairs(applicationHotkeys) do
  hs.hotkey.bind(hyper, key, function()
    hs.application.launchOrFocus(app)
  end)
end

-- Reload config & notify
hs.hotkey.bind(hyper, "r", function()
  hs.reload()
end)
hs.notify.new({title="Hammerspoon", informativeText="Config loaded"}):send()

-- Resizing windows with 'hjkl' like vim
hs.window.animationDuration = 0
hs.hotkey.bind(hyper, "h", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.left50)
end)
hs.hotkey.bind(hyper, "j", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.maximized)
end)
hs.hotkey.bind(hyper, ";", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToScreen(win:screen():next())
end)
hs.hotkey.bind(hyper, "l", function()
  local win = hs.window.focusedWindow();
  if not win then return end
win:moveToUnit(hs.layout.right50)
end)

-- Change keyboard layout with
hs.hotkey.bind(hyper, "1", function()
  hs.keycodes.setLayout("U.S.")
  hs.notify.new({title="Hammerspoon", informativeText="Layout U.S."}):send()
end)
hs.hotkey.bind(hyper, "2", function()
  hs.keycodes.setLayout("U.S. International - PC")
  hs.notify.new({title="Hammerspoon", informativeText="Layout U.S. Internacional"}):send()
end)
hs.hotkey.bind(hyper, "3", function()
  hs.keycodes.setLayout("Spanish - ISO")
  hs.notify.new({title="Hammerspoon", informativeText="Layout Spanish"}):send()
end)

-- Show date time and battery
hs.hotkey.bind(hyper, 'b', function()
  local seconds = 3
  local message = os.date("%I:%M%p") .. "\n" .. os.date("%a %b %d") .. "\nBattery: " ..
     hs.battery.percentage() .. "%"
  hs.alert.show(message, seconds)
end)

-------------------------------------
-- Window layouts
-------------------------------------

local leftScreen = hs.screen{x=0,y=0}
local centerScreen = hs.screen{x=1,y=0}
local rightScreen = hs.screen{x=2,y=0}

local threeScreenLayout = {
 {"Emacs", nil, centerScreen, hs.layout.maximized, nil, nil},
 {"Google Chrome", nil, leftScreen, hs.layout.maximized, nil, nil},
 {"iTerm2", nil, leftScreen, hs.layout.maximized, nil, nil},
 {"Gmail", nil, leftScreen, hs.layout.maximized, nil, nil},
 {"GmailPersonal", nil, leftScreen, hs.layout.right50, nil, nil},
 {"GCalendar", nil, centerScreen, hs.layout.left50, nil, nil},
 {"Slack", nil, leftScreen, hs.layout.right50, nil, nil},
 {"MacVim", nil, leftScreen, hs.layout.right50, nil, nil},
 {"Org", nil, leftScreen, hs.layout.left50, nil, nil},
 {"Xcode", nil, centerScreen, hs.layout.right50, nil, nil},
 {"Finder", nil, centerScreen, hs.layout.left50, nil, nil},
 {"Preview", nil, centerScreen, hs.layout.left50, nil, nil},
 {"OmniGraffle 6", nil, centerScreen, hs.layout.maximized, nil, nil},
 {"Terminal", nil, centerScreen, hs.layout.left50, nil, nil},
 {"Spotify", nil, centerScreen, hs.layout.left50, nil, nil},
 {"PowerPoint", nil, leftScreen, hs.layout.left50, nil, nil},
 {"Calendar", nil, leftScreen, hs.layout.maximized, nil, nil},
 {"System Preferences", nil, leftScreen, hs.layout.left50, nil, nil}
}

local twoScreenLayout = {
 {"Google Chrome", nil, leftScreen, hs.layout.left50, nil, nil},
 {"iTerm2", nil, leftScreen, hs.layout.maximized, nil, nil},
 {"Finder", nil, leftScreen, hs.layout.left50, nil, nil},
 {"Preview", nil, leftScreen, hs.layout.left50, nil, nil},
 {"Terminal", nil, leftScreen, hs.layout.left50, nil, nil},
 {"Spotify", nil, leftScreen, hs.layout.left50, nil, nil},
 {"PowerPoint", nil, leftScreen, hs.layout.left50, nil, nil},
 {"Calendar", nil, leftScreen, hs.layout.left50, nil, nil},
 {"System Preferences", nil, leftScreen, hs.layout.left50, nil, nil}
}

function switchLayout()
  local numScreens = #hs.screen.allScreens()
  local layout = {}
  if numScreens == 1 then
    layout = twoScreenLayout
  elseif numScreens == 2 then
    layout = twoScreenLayout
  elseif numScreens == 3 then
    layout = threeScreenLayout
  end
  hs.layout.apply(layout)
end

hs.hotkey.bind(hyper, "'", function()
  switchLayout()
  local seconds = 2
  local message = "Switch layout"
  hs.alert.show(message, seconds)
end)
