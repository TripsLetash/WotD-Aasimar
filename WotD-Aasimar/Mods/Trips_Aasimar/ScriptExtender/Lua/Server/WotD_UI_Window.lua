Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(_, _)  
    Ext.Net.BroadcastMessage("GameStartedAndLoadedIn", "LevelGameplayStarted")
end)

Ext.Events.NetMessage:Subscribe(function(e) 
    --Tattoo Buttons
    if (e.Channel == "changeTattoo0") then
        --ApplyOverride(Osi.GetHostCharacter(),"Index", 1)
        _P("Changed to tattoo 0")
    end

    if (e.Channel == "changeTattoo1") then
        _P("Changed to tattoo 1")
        --ApplyOverride(Osi.GetHostCharacter(),"Index", 2)
    end

end)


-- Klementines functions

PersistentVars = {}

function RevertOverride(character, overrideType)
    Osi.RemoveCustomMaterialOverride(character,
        Overrides[overrideType][PersistentVars[character][overrideType]])
    PersistentVars[character][overrideType] = nil
end

function ApplyOverride(character, overrideType, override)
    if PersistentVars[character][overrideType] then
        RevertOverride(character, overrideType)
    end
    Osi.AddCustomMaterialOverride(character, Overrides[overrideType][override])
    PersistentVars[character][overrideType] = override
end

function ToggleOverride(character, overrideType, toggleableOverride)
    if PersistentVars[character][overrideType][toggleableOverride] then
        Osi.RemoveCustomMaterialOverride(character, Overrides[overrideType][toggleableOverride])
        PersistentVars[character][overrideType][toggleableOverride] = nil
    else
        Osi.AddCustomMaterialOverride(character, Overrides[overrideType][toggleableOverride])
        PersistentVars[character][overrideType][toggleableOverride] = true
    end
end

-- Table of material overrides, with subtables for each type
local Overrides = {
    Index = {
        "81640b3d-cbf6-4048-9773-d89b0d681431",
        "fb72da11-0cb1-45af-ab0d-4c575b1c89eb",
        "b59f566f-d333-4188-8641-db66ec6a59df",
        "020353e3-d6af-4954-97b5-a72fa7ca1319",
        "be8e1efe-f771-4132-9ec4-2b70c5d8fea9",
        "1bd4956b-9e52-4f29-93dd-005ad933c56b",
        "23009130-f0f2-48e1-91f6-9da7e2433e0b",
        "d1da6a01-ee85-4a5a-8d02-4e0b3f6bfdfc",
        "f5c687b6-6cea-42a8-917a-2ad633e610ce",
        "31696d71-dd26-484a-bf96-5ec05e34ac5b",
        "2a398bd6-e6db-4109-a505-4571957d804c",
        "e908e7d0-4db0-433a-b90b-3d55f8f65906",
        "d9b9fb2e-6553-4d18-85b1-6da9da856dc7",
        "33b516cc-b05f-47c6-b840-0a5b54006acd",
        "9c9d7ae6-55d9-48f8-b4a1-f158bbb18320",
        "146bfe56-bd7c-46be-a98f-305efe4f4792",
        "0db2a564-5f1c-4e3c-bb7f-54c87a96855b",
        "8a947c4f-d40d-4083-85fe-208b0c288b7e",
        "575e0d73-ba90-42ec-afcb-773375e4599d",
        "69155d61-86a3-4c0e-a205-e695c3455db4"
    },

    -- Opacity overrides simply toggle which channels are visible
    Opacity = {
        RGB = "d0c85bf5-80e0-44c6-a885-893746ecd5b9",
        None = "be41d21c-7593-41fc-90f1-917b828ff932",
        R = "e806581b-cf76-4281-a158-c32f90e0c2c6",
        G = "3bbdd7e4-657e-47fa-afce-9bd874b4d157",
        B = "80971792-7470-431a-9128-3902f62bc323",
        RG = "3814591e-2dd8-4098-9854-d3b99a199ea7",
        RB = "d2f03f46-a3b4-4c85-ba67-4d906d89a400",
        GB = "bd71beb6-3f12-4570-bf14-f73f67ce4b54"
    },

    Shine = {
        Metalness = "38163b5b-859e-48e8-a571-7d437c187a8c",
        Reflectance = "e6073903-c482-4222-ae3f-93793b15129c"
    },

    Color1 = {
        Black = "f8587226-cab2-4ddc-8b7a-149a1bb977be",
        Red = "e1e427b2-93fe-4d1c-ad6a-3d423291754c",
        Orange = "9176f243-69af-40ca-b366-67c061889206",
        Yellow = "7cc863ec-6579-45ac-88c7-56cbc830b0f0",
        Green = "1c41b1fd-9a83-43b2-9247-3ad17fdc0301",
        Blue = "a2b68688-0e6e-4fde-b52d-bba5fae7aeb8",
        Purple = "c9eb6b28-203f-4c0e-8879-61640e3a144e",
        Pink = "6b57c539-c782-4859-9a4d-ddaa9473ede0",
        Brown = "a01ebf67-4158-4b98-8e7f-582ee974adc7",
        White = "2c1a0e7e-d636-41fa-9528-e31cb49594be"
    },

    Color2 = {
        Black = "fb724fa8-4046-4a9d-95d1-c5d5f193785c",
        Red = "fb86b869-791b-4a98-aa0e-a6e64c1d2c40",
        Orange = "3dfdf9f3-9818-4e39-bc23-1d39782894b6",
        Yellow = "63cf310c-d6f2-4ca4-81a8-23f1ebd8229f",
        Green = "effbf27a-8de8-4563-b865-167bbbc678e0",
        Blue = "d05bf95e-9488-4b0b-ba00-7d558f63e9f1",
        Purple = "abb503f2-2e80-4aeb-ae61-b0b15939686b",
        Pink = "b35a4e96-24ec-4df6-8627-a99ef488056a",
        Brown = "dbb49540-6be0-4d61-9698-8bd6ef0a10c8",
        White = "2155acda-6ae5-467a-a1d4-6900a487b187"
    },

    Color3 = {
        Black = "2fb4044c-fcb7-4aca-ba67-152cd1f624af",
        Red = "c6c7b2b7-6d0a-494f-9831-0bfbd945702d",
        Orange = "19b468f8-b7aa-45b7-807c-0e07dae270b6",
        Yellow = "86ce04a9-c990-44e4-af46-c7880c3b4f1d",
        Green = "abfe4110-c421-4568-8699-3c03c7049fff",
        Blue = "35abeab3-a8a6-441c-8fe3-cd4163828c70",
        Purple = "0c10f061-8bc1-485b-8fe0-e881ea5559bd",
        Pink = "785cae71-7749-4354-ac5f-337cf0782985",
        Brown = "257c8b4e-2898-4006-9806-701dff9fcb50",
        White = "11dd6851-ad4d-4201-9e0b-64805416cdc2"
    }

}