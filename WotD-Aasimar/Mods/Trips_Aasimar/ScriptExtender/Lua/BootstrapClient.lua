Ext.Require("Client/WotD_UI_Window.lua")
Ext.Require("Client/WotD_UI_TattooSwitcher.lua")

    Ext.Vars.RegisterUserVariable("AAS_WingsChosen", {
        Server = true,
        Client = true,
        WriteableOnClient = true,
        SyncToClient = true,
        SyncToServer = true
    })
    Ext.Vars.RegisterUserVariable("WOTDSaveData", {
        Server = true,
        Client = true,
        WriteableOnClient = true,
        SyncToClient = true,
        SyncToServer = true
    })
    _P("WOTD: Registered User Variables")