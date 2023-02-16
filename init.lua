local hyper = {"shift", "ctrl", "cmd", "alt"}
local log = hs.logger.new('hammerspoon','debug')

hs.ipc.cliInstall()
hs.hotkey.bindSpec({ hyper, "r" }, hs.reload)
hs.hotkey.bindSpec({ hyper, "l" }, hs.toggleConsole)
hs.hotkey.bindSpec({hyper, "z"}, hs.caffeinate.lockScreen)

hs.loadSpoon("MiroWindowsManager")

hs.window.animationDuration = 0.3
spoon.MiroWindowsManager:bindHotkeys({
  up = {hyper, "up"},
  right = {hyper, "right"},
  down = {hyper, "down"},
  left = {hyper, "left"},
  fullscreen = {hyper, "f"},
  nextscreen = {hyper, "n"}
})

-- osascript -e 'id of app "Cisco AnyConnect Secure Mobility Client"'
hs.loadSpoon("AppHotkeys")
spoon.AppHotkeys:bindAppHotKeys({
  b = "com.cisco.anyconnect.gui",
  c = "com.google.Chrome",
  e = "com.microsoft.edgemac",
  f = "org.mozilla.firefox",
  i = "com.jetbrains.intellij",
  m = "com.apple.Music",
  o = "com.microsoft.Outlook",
  q = "com.quip.Desktop",
  s = "com.tinyspeck.slackmacgap",
  t = "com.googlecode.iterm2",
  v = "com.microsoft.VSCode",
  y = "com.google.Chrome",
  tab = "com.google.Chrome",
})

hs.loadSpoon("Chime")
spoon.Chime:init()
spoon.Chime:bindFocusKey('x')
spoon.Chime:bindToggleMuteKey('a')