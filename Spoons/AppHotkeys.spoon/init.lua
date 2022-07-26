--- === AppHotKeys ===
---
--- Simple spoon for launching apps with single letter hotkeys.
---
--- Example configuration:
--- ```
-- hs.loadSpoon("AppHotkeys")
-- spoon.AppHotkeys:bindAppHotKeys({
--   c = "com.amazon.Amazon-Chime",
--   e = "com.microsoft.edgemac",
--   i = "com.jetbrains.intellij",
--   m = "com.apple.Music",
--   o = "com.microsoft.Outlook",
--   q = "com.quip.Desktop",
--   s = "com.tinyspeck.slackmacgap",
--   t = "com.googlecode.iterm2",
--   v = "com.microsoft.VSCode",
--   y = "com.google.Chrome",
-- })
--- ```
---
--- Download: [https://github.com/Hammerspoon/Spoons/raw/master/Spoons/AppLauncher.spoon.zip](https://github.com/Hammerspoon/Spoons/raw/master/Spoons/AppLauncher.spoon.zip)
local log = hs.logger.new('AppHotkeys')
local hyper = {"shift", "ctrl", "cmd", "alt"}
local obj = {}
obj.__index = obj

-- Metadata
obj.name = "AppHotKeys"
obj.version = "1.0.0"
obj.author = "Paul Monson <paulmons@gmail.com>"
obj.homepage = "https://github.com/Hammerspoon/Spoons"
obj.license = "ISC - https://opensource.org/licenses/ISC"

function obj:openApp(name)
  fm = hs.application.frontmostApplication();
  log.i("frontmost:", fm:bundleID(), " name:", name)

  if fm:bundleID() == name then
    log.i("app hiding")
    fm:hide()
  else
    log.i("app focusing ")
    hs.application.launchOrFocusByBundleID(name)
  end
end

function obj:bindAppHotKeys(appBindings)
  for key, appBundle in pairs(appBindings) do
    log.i(key,appBundle)
    hs.hotkey.bindSpec({hyper, key}, function()
      log.i(key,appBundle)

      self:openApp(appBundle)
      end)
  end
end

return obj
