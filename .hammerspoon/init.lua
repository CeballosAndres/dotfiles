-- Local variables
local hyper = { "cmd", "alt", "ctrl", "shift" }

local applicationHotkeys = {
   a = "iTerm",
   x = "Bitrix24",
   c = "TopTracker",
   b = "TablePlus",
   d = "Discord",
   e = "Spark",
   f = "Finder",
   m = "Music",
   p = "System Preferences",
   q = "Google Chrome",
   t = "Telegram",
   v = "Visual Studio Code",
   w = "WhatsApp",
   z = "Bitrix",
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
hs.notify.new({ title = "Hammerspoon", informativeText = "Config loaded" }):send()

-- Resizing windows with 'hjkl' like vim
hs.window.animationDuration = 0
hs.hotkey.bind(hyper, "h", function()
   local win = hs.window.focusedWindow()
   if not win then
      return
   end
   win:moveToUnit(hs.layout.left50)
end)
hs.hotkey.bind(hyper, "j", function()
   local win = hs.window.focusedWindow()
   if not win then
      return
   end
   win:moveToUnit(hs.layout.maximized)
end)
hs.hotkey.bind(hyper, ";", function()
   local win = hs.window.focusedWindow()
   if not win then
      return
   end
   win:moveToScreen(win:screen():next())
end)
hs.hotkey.bind(hyper, "l", function()
   local win = hs.window.focusedWindow()
   if not win then
      return
   end
   win:moveToUnit(hs.layout.right50)
end)

-- Change keyboard layout with
-- hs.hotkey.bind(hyper, "1", function()
-- 	hs.keycodes.setLayout("U.S.")
-- 	hs.notify.new({ title = "Hammerspoon", informativeText = "Layout U.S." }):send()
-- end)
-- hs.hotkey.bind(hyper, "2", function()
-- 	hs.keycodes.setLayout("U.S. International - PC")
-- 	hs.notify.new({ title = "Hammerspoon", informativeText = "Layout U.S. Internacional" }):send()
-- end)
-- hs.hotkey.bind(hyper, "3", function()
-- 	hs.keycodes.setLayout("Spanish - ISO")
-- 	hs.notify.new({ title = "Hammerspoon", informativeText = "Layout Spanish" }):send()
-- end)

-- -- Show date time and battery
-- hs.hotkey.bind(hyper, "b", function()
--    local seconds = 3
--    local message = os.date "%I:%M%p" .. "\n" .. os.date "%a %b %d" .. "\nBattery: " .. hs.battery.percentage() .. "%"
--    hs.alert.show(message, seconds)
-- end)

-------------------------------------
-- Window layouts for work mood
-------------------------------------

local leftScreen = hs.screen { x = 0, y = 0 }
local rightScreen = hs.screen { x = 1, y = 0 }

local applicationWorkflow = {
   "iTerm2",
   "Google Chrome",
   "Discord",
   "Bitrix24",
   "Finder",
   "Postman",
}

local function launchApps()
   for _, appName in ipairs(applicationWorkflow) do
      hs.alert.show(appName)
      hs.application.launchOrFocus(appName)
   end
end

function switchSpaces()
   local numScreens = #hs.screen.allScreens()
   if numScreens == 1 then
      createSpaces(6)
   elseif numScreens == 2 then
      createSpaces(3)
      windowToSpace("Telegram", hs.layout.left50, leftScreen, 1)
      windowToSpace("WhatsApp", hs.layout.right50, leftScreen, 1)
      windowToSpace("Postman", hs.layout.maximized, leftScreen, 2)
      windowToSpace("Chrome", hs.layout.maximized, leftScreen, 3)
      windowToSpace("iTerm2", hs.layout.maximized, rightScreen, 1)
      windowToSpace("Finder", hs.layout.maximized, rightScreen, 2)
      windowToSpace("Discord", hs.layout.right50, rightScreen, 3)
      windowToSpace("Bitrix24", hs.layout.left50, rightScreen, 3)
   end
end

function createSpaces(number)
   local spaces = hs.spaces.allSpaces()
   for uuid, space in pairs(spaces) do
      if #space <= number then
         for i = 1, number, 1 do
            if space[i] == nil then
               hs.spaces.addSpaceToScreen(uuid)
            end
         end
      elseif #space >= number then
         for i = #space, number + 1, -1 do
            hs.spaces.removeSpace(space[i])
         end
      end
   end
end

function windowToSpace(title, ratio, sc, sp)
   local win = hs.application(title)
   if win ~= nil then
      win = win:mainWindow()
      local uuid = sc:getUUID() -- uuid for current screen
      local spaceID = hs.spaces.allSpaces()[uuid][sp] -- internal index for sp
      hs.spaces.moveWindowToSpace(win:id(), spaceID) -- move window to new space
      win:moveToUnit(ratio)
   end
end

function jumpToSpace(sp)
   local numScreens = #hs.screen.allScreens()
   local uuid = leftScreen:getUUID()
   if numScreens == 2 and sp > 3 then
      sp = sp - 3
      uuid = rightScreen:getUUID()
   end
   local spaceID = hs.spaces.allSpaces()[uuid][sp]
   hs.spaces.gotoSpace(spaceID)
   hs.spaces.closeMissionControl()
end

hs.hotkey.bind(hyper, "1", function()
   jumpToSpace(1)
end)
hs.hotkey.bind(hyper, "2", function()
   jumpToSpace(2)
end)
hs.hotkey.bind(hyper, "3", function()
   jumpToSpace(3)
end)
hs.hotkey.bind(hyper, "4", function()
   jumpToSpace(4)
end)
hs.hotkey.bind(hyper, "5", function()
   jumpToSpace(5)
end)
hs.hotkey.bind(hyper, "6", function()
   jumpToSpace(6)
end)

hs.hotkey.bind(hyper, "=", function()
   switchSpaces()
end)

hs.hotkey.bind(hyper, "-", function()
   launchApps()
end)
