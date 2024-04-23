Ext.Require("WotD-Aasimar/WotD_Wings.lua")

Ext.Vars.RegisterUserVariable("AAS_WingsChosen", {
    Server = true,
    Client = true,
    WriteableOnClient = true,
    SyncToClient = true,
    SyncToServer = true
})
_P(GetYellowText("WOTD [PRELOAD]: Registered User Variable AAS_WingsChosen"))

WOTD = {}
WOTD.modPrefix = "WOTD"
WOTD.modTableKey = ""
WOTD.modVersion = { major = 2, minor = 0, revision = 0 }

local function OnSessionLoaded()

    local ModInfo = Ext.Mod.GetMod("4806bd2a-929b-406e-b1d4-2e0e9cc23bb2")["Info"]
    WOTD.modTableKey = ModInfo.Name
    WOTD.modVersion = { major = ModInfo.ModVersion[1], minor = ModInfo.ModVersion[2], revision = ModInfo.ModVersion[3], build = ModInfo.ModVersion[4] }

    _P(GetRainbowText(WOTD.modTableKey) .. " Version: " .. WOTD.modVersion.major .. "." .. WOTD.modVersion.minor .. "." .. WOTD.modVersion.revision .. "." .. WOTD.modVersion.build .. GetRainbowText(" Loaded"))
end

Ext.Events.SessionLoaded:Subscribe(OnSessionLoaded)