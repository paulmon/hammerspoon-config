--- === Chime ===

local obj = {}
obj.__index = obj

-- Metadata
obj.name = "Chime"
obj.version = "1.0.0"
obj.author = "Paul Monson <paulmons@gmail.com>"
obj.homepage = ""
obj.license = "ISC - https://opensource.org/licenses/ISC"
obj.log = hs.logger.new('Chime')
obj.hyper = {"shift", "ctrl", "cmd", "alt"}
obj.appTitle = "Amazon Chime:"

-- http://lua-users.org/wiki/StringRecipes
local function starts_with(str, start)
  return str:sub(1, #start) == start
end

function obj:init()
  self.window_filter = hs.window.filter.new(function (window)
    return starts_with(window:title(), self.appTitle)
  end)
end

function obj:bindToggleMuteKey(key)
  hs.hotkey.bindSpec({self.hyper, key}, function()
    self.log.i("bind focus and toggle mute")

    local windows = self.window_filter:getWindows(self.appTitle)
    for _, window in pairs(windows) do
      self.log.i('window ' .. window:id() .. ' of app ' .. window:title())
      window:focus()
      hs.eventtap.keyStroke({"cmd"}, 'Y')
    end
  end)
end

function obj:bindFocusKey(key)
  hs.hotkey.bindSpec({self.hyper, key}, function()
    self.log.i("bind focus only")

    local windows = self.window_filter:getWindows(self.appTitle)
    for _, window in pairs(windows) do
      self.log.i('window ' .. window:id() .. ' of app ' .. window:title())
      window:focus()
    end
  end)
end

return obj