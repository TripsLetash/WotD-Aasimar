local raceUuid= "ff2b6894-b03e-4bc6-a3b4-ce16ce405e7e"
local uuidReallyTags = {
    "8e288154-e7ca-4277-b2df-e61639b1cce8",
    "78884c5f-9504-41af-912d-ce212df0ebea",
    "772b1dc6-14be-417f-afa3-c6cf364f45b4",
    "b12e8dff-c1f0-4e9c-9ec0-1cafd22bb637",
    "676e854b-d74b-44f3-8363-3ef27164a54d",
    "c71eb8de-74e3-4d70-9826-22da7e2dc607",
    "d2d60a81-688e-4d3d-ba56-3e467cae37fc",
    "277f9609-ad0c-4883-b56d-0850904e88df",
    "bb7c731c-7af7-4c2d-b3d7-b4e8bd86a244",
    "8ac1b27c-c5c4-4a2c-95dd-256e4349e483",
    "3dbe23e0-2c9f-4a81-b586-ec6e50f720e1",
    "987a41e3-2482-4c74-8c30-f3843cfdb7f3",
    "7bf7207f-7406-49c0-b501-eaaa2bb4efd7",
    "6591a20a-12de-46ff-bf82-b866cd97bb9a",
    "c70e1dc2-72d4-44f9-83fd-c63d247edd9b",
    "3a5efd84-5925-4a75-83ee-4f336b56f716",
    "e49c027c-6ec6-4158-9afb-8b59236d10fd",
    "ab3eff19-d094-4102-88bd-d097b6b6e4f0",
    "42483542-7915-4de5-a7d9-ac0d15fe301c",
    "df697d73-5469-405a-aa95-6e1e720c5ee6",
    "b0401c02-70b3-47f5-998f-8d440ad6954f",
    "17d29357-beba-4096-accc-c28bdea88fda",
    "ad129444-0f41-4114-9ee5-2b9902d7ca8d",
    "9a92ac6d-b7cc-4ccb-8965-074c6b36a342",
    "18659b46-73ae-49d2-85a8-7e6cc43ce94f",
    "45b007f7-f4f6-46e2-9480-395a49b87ef3",
    "2b40a033-7a5c-47e9-92f0-7de9b5cd3a42",
    "da1d4f47-8583-49a1-b262-d77d361b2e09",
    "058df86a-97b6-4dc4-a246-a1db65ff3c0f",
    "39783f17-8484-46a6-aa3b-f3d51122e5f3",
    "1029b3e3-3ff0-4d73-b4ed-79b622cad4f9",
    "2fddf7dd-f79b-4998-882c-d7257badbfe6",
    "aa68eccb-7875-436f-881e-c3775eee37f6",
    "4cb02915-7ad7-4141-907e-93253c6a8644",
    "2d0a73b9-f113-4d35-bdee-a31ab9163d74"
}
local uuidNormalTags = {
    "69fd1443-7686-4ca9-9516-72ec0b9d94d7",
    "492c3200-1226-4114-bad1-f6b1ba737f3d",
    "351f4e42-1217-4c06-b47a-443dcf69b111",
    "889e0db5-d03e-4b63-86d7-13418f69729f",
    "a672ac1d-d088-451a-9537-3da4bf74466c",
    "ef9c5b74-56a8-48cc-b0b9-169ee16bf026",
    "6e913b6e-58b1-41bf-8751-89250dd17bff",
    "34317158-8e6e-45a2-bd1e-6604d82fdda2",
    "52b71dea-9d4e-402d-9700-fb9c360a44c9",
    "5ffb703c-3ef4-493b-966d-749bc038f6bd",
    "4fa13243-199d-4c9a-b455-d844276a98f5",
    "d2f86ec3-c41f-47e1-8acd-984872a4d7d5",
    "aaef5d43-c6f3-434d-b11e-c763290dbe0c",
    "c3fd1fc3-2edf-4d17-935d-44ab92406df1",
    "ec5bea6b-26f1-4917-919c-375f67ac13d1",
    "ab677895-e08a-479f-a043-eac2d8447188",
    "677ffa76-2562-4217-873e-2253d4720ba4",
    "3311a9a9-cdbc-4b05-9bf6-e02ba1fc72a3",
    "1f0551f3-d769-47a9-b02b-5d3a8c51978c",
    "664cc044-a0ea-43a1-b21f-d8cad7721102",
    "09518377-4ea1-4ce2-b8e8-61477c26ebdd",
    "2bbc3217-3d8c-46e6-b599-a0f1c9063f9a",
    "486a2562-31ae-437b-bf63-30393e18cbdd",
    "534098fa-601d-4f6e-8c4e-b3a8d4b1f141",
    "1dc20a7a-00e7-4126-80ad-aa1152a2136c",
    "78adf3cd-4741-47a8-94f6-f3d322432591",
    "b99b6a5d-8445-44e4-ac58-81b2ee88aab1",
    "57a00605-9e74-477c-bd9d-53c721e25e56",
    "8d545fa1-8416-493f-8325-7d112bceced8",
    "02e5e9ed-b6b2-4524-99cd-cb2bc84c754a",
    "92aae5aa-4595-4f1c-96d2-9e2499d35c6f",
    "41c6cdc9-aff5-46ae-afc4-aa0ccd9cd201",
    "48d7b679-dffd-4f68-a306-adac19de8acf",
    "bad00ba2-8a49-450c-8387-af47681717f1",
    "60f6b464-752f-4970-a855-f729565b5e07"
}
local debugText = false


function tripsHasStatusShapeshift(uuid, race)
    local IsDisguised = 0
    IsDisguised = HasActiveStatus(uuid, "DISGUISE_SELF_" .. race .. "_MALE") + HasActiveStatus(uuid, "DISGUISE_SELF_" .. race .. "_FEMALE") + HasActiveStatus(uuid, "SEEMING_" .. race .. "_MALE") + HasActiveStatus(uuid, "SEEMING_" .. race .. "_FEMALE") + HasActiveStatus(uuid, "DISGUISE_SELF_" .. race .. "_STRONG_MALE") + HasActiveStatus(uuid, "DISGUISE_SELF_" .. race .. "_STRONG_FEMALE") + HasActiveStatus(uuid, "SEEMING_" .. race .. "_STRONG_MALE") + HasActiveStatus(uuid, "SEEMING_" .. race .. "_STRONG_FEMALE")
    return IsDisguised
end

Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(levelName, isEditorMode) 
    for _, uuid in pairs(GetPartyWotD()) do
        local entity = Ext.Entity.Get(uuid)
        if entity.CharacterCreationStats ~= nil then
            local race = entity.CharacterCreationStats.Race
            if raceUuid == race then
                local allTags = entity.Tag.Tags
                for i, tag in pairs(uuidNormalTags) do
                    if contains(allTags, uuidReallyTags[i]) then
                        if contains(allTags, tag) then
                            if debugText then _P(GetRainbowText("WOTD ALREADY HAS ".. Ext.StaticData.Get(tag, "Tag").Name)) end
                        else
                            if debugText then _P(GetRainbowText("WOTD ADDED: ".. Ext.StaticData.Get(tag, "Tag").Name .." TAG AFTER GAMEPLAY STARTED TO " .. uuid)) end
                            Osi.SetTag(uuid, tag)
                        end
                    end
                end
            end
        end
    end
end)
Ext.Osiris.RegisterListener("StatusApplied", 4, "before", function(uuid, status, causee, storyActionID)  
    if Osi.IsPlayer(uuid) == 1 then
        local entity = Ext.Entity.Get(uuid)
        if entity.CharacterCreationStats ~= nil then
            local race = entity.CharacterCreationStats.Race
            if raceUuid == race and (stringContains(status, "DISGUISE_SELF_") or stringContains(status, "SEEMING_")) then
                local allTags = entity.Tag.Tags
                for i, tag in pairs(uuidNormalTags) do
                    if contains(allTags, tag) then
                        if tripsHasStatusShapeshift(uuid, Ext.StaticData.Get(tag, "Tag").Name) == 0 then
                            if debugText then _P(GetRainbowText("WOTD CLEARED: ".. Ext.StaticData.Get(tag, "Tag").Name .." TAG AFTER DISGUISING FROM " .. uuid)) end
                            Osi.ClearTag(uuid, tag)
                        else
                            if debugText then _P(GetRainbowText("Didn't clear ".. Ext.StaticData.Get(tag, "Tag").Name .. " because character has the disguise status")) end
                        end
                    end
                end
            end
        end
    end
end)
Ext.Osiris.RegisterListener("StatusRemoved", 4, "before", function(uuid, status, causee, applyStoryActionID) 
    if Osi.IsPlayer(uuid) == 1 then
        local entity = Ext.Entity.Get(uuid)
        if entity.CharacterCreationStats ~= nil then
            local race = entity.CharacterCreationStats.Race
            if raceUuid == race and (stringContains(status, "DISGUISE_SELF_") or stringContains(status, "SEEMING_")) then
                local allTags = entity.Tag.Tags
                for i, tag in pairs(uuidNormalTags) do
                    if contains(allTags, uuidReallyTags[i]) then
                        if contains(allTags, tag) then
                            if debugText then _P(GetRainbowText("WOTD ALREADY HAS ".. Ext.StaticData.Get(tag, "Tag").Name)) end
                        else
                            if debugText then _P(GetRainbowText("WOTD ADDED: ".. Ext.StaticData.Get(tag, "Tag").Name .." TAG AFTER UN-DISGUISING TO " .. uuid)) end
                            Osi.SetTag(uuid, tag)
                        end
                    end
                end
            end
        end
    end
end)