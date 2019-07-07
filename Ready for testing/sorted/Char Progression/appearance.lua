--Load after starteritems.lua
local appearance = {}

appearance.OnPlayerEndCharGen = function(eventStatus, pid)

    Players[pid].currentCustomMenu = "appearance"
    menuHelper.DisplayMenu(pid, Players[pid].currentCustomMenu)
end

customEventHooks.registerHandler("OnPlayerEndCharGen", appearance.OnPlayerEndCharGen)

return appearance