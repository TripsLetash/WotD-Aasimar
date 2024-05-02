Ext.Require("Utils/Rainbow.lua")

WOTDNC = {}
WOTDNC.modPrefix = "WOTDNC"
WOTDNC.modTableKey = ""
WOTDNC.modVersion = { major = 2, minor = 0, revision = 0 }

local function OnSessionLoaded()

    local ModInfo = Ext.Mod.GetMod("d5c9a3fb-57fa-4bc1-bccc-b0489e874f85")["Info"]
    WOTDNC.modTableKey = ModInfo.Name
    WOTDNC.modVersion = { major = ModInfo.ModVersion[1], minor = ModInfo.ModVersion[2], revision = ModInfo.ModVersion[3] }

    _P(GetRainbowTextUtil(WOTDNC.modTableKey) .. " Version: " .. WOTDNC.modVersion.major .. "." .. WOTDNC.modVersion.minor .. "." .. WOTDNC.modVersion.revision .. GetRainbowTextUtil(" Loaded"))
end

Ext.Events.SessionLoaded:Subscribe(OnSessionLoaded)