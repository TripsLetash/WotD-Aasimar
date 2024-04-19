----------------------------------------------------------------------------------------------------
-- 
-- 					Dynamic wing Modification - based on MrFunSize's implementation
--												altered by majestic_piss_lord
--												applied and converted to WotD: Aasimar by Trips
-- 
----------------------------------------------------------------------------------------------------
--
--
--

-- Constants

-- masc/femme
BODYTYPE = {
	MALE = 0,
	FEMALE = 1
} 
-- Strong is only for humanoids
BODYSHAPE = {
	NORMAL = 0,
	STRONG = 1,
}
local SHOWWINGS = true
local TagLevelOne = "2d21255c-7cf7-4cbb-9802-2ee7e0593380"
local TagLevelTen = "3a7452df-934b-43af-8905-211b3b7e3b96"
local TagCressa = "34db36a2-51c3-4cd6-83c4-39221c6d52b2"
local raceTable={
	["ff2b6894-b03e-4bc6-a3b4-ce16ce405e7e"]=true,
	["dd21fb84-2d6a-4d7d-a418-ca96991d3920"]=true,
	["4738a422-5abd-41a7-a3f8-a35250a73209"]=true,
	["f40da0bb-58e0-4b53-8ec5-805bc1533c8c"]=true,
	["449f93dd-817f-4870-be6d-fbdb8f0dfb1d"]=true,
	["309b9cc5-0156-4f64-b857-8cf83fa2160b"]=true
}
local classTable ={
	"dd21fb84-2d6a-4d7d-a418-ca96991d3920",
	"4738a422-5abd-41a7-a3f8-a35250a73209",
	"f40da0bb-58e0-4b53-8ec5-805bc1533c8c",
	"449f93dd-817f-4870-be6d-fbdb8f0dfb1d",
	"309b9cc5-0156-4f64-b857-8cf83fa2160b"
}
local classVfxTable ={
	"SUM_VFX_PROT",
	"SUM_VFX_SCO",
	"SUM_VFX_FAL",
	"SUM_VFX_HARB",
	"SUM_VFX_CRESSA"
}
local dummyTable={
	["S_GLO_CharacterCreationDummy_001_e2badbf0-159a-4ef5-9e73-7bbeb3d1015a"]=true,
	["S_GLO_CharacterCreationDummy_002_aa772968-b5e0-4441-8d86-2d0506b4aab5"]=true,
	["S_GLO_CharacterCreationDummy_003_81c48711-d7cc-4a3d-9e49-665eb915c15c"]=true,
	["S_GLO_CharacterCreationDummy_004_6bff5419-5a9e-4839-acd4-cac4f6e41bd7"]=true
}
local invisWing = "c4484e9e-0991-43b8-b6d3-e505bd55340f"
local oldWingsTable={
	"812ba0ed-454b-4a3e-84f6-4ec2e2e6eb7b",
	"00355696-1c4b-4e0f-a735-071e6eb24762",
	"20110880-cd92-4c24-9ed1-2c676498d36a",
	"526f7821-d442-429b-8b70-9aae14fac463",
	"8bc82dd5-e636-492a-81bf-75bf4a7142ad",
	"1615a35d-ae69-4e5e-b5ce-6fe1ff852992",
	"e92cf0a1-9658-45cc-bbc0-52f9c060aaf3",
	"3d75fc44-d618-4330-a43d-e1fbf8c95228"
}
local SaveLoaded = false
local CharacterCreated

----------------------------------------------------------------------------------------------------
-- 
-- 									Shorthands and Helpers
-- 
----------------------------------------------------------------------------------------------------
--- Checks if an item is present in a list.
-- @param list table	- The table to be searched.
-- @param item any		- The item to search for in the table.
-- @return bool 		- Returns true if the item is found, otherwise returns false.
local function contains(list, item)
    for i, object in ipairs(list) do
        if object == item then
            return true
        end
    end
    return false
end
-- Checks if the substring 'sub' is present within the string 'str'.
-- @param str string 	-  The string to search within.
-- @param sub string 	- The substring to look for.
-- @return bool			- Returns true if 'sub' is found within 'str', otherwise returns false.
local function stringContains(str, sub)
    return (string.find(str, sub) ~= nil)
end
function Wait(delayInMs, func)
    local startTime = Ext.Utils.MonotonicTime()
    local handlerId;
    handlerId = Ext.Events.Tick:Subscribe(function()
        local endTime = Ext.Utils.MonotonicTime()
        if (endTime - startTime > delayInMs) then
            Ext.Events.Tick:Unsubscribe(handlerId)
            func()
        end
    end) 
end
--By Fararagi/FallenStar
---Applies a rainbow color effect to a given string.
---The ANSI color codes are used to achieve the rainbow effect.
---@param text string The input text to be colored with a rainbow effect.
---@return string coloredText input text with rainbow colors applied.
function GetRainbowText(text)
    local colors = { "31", "33", "32", "36", "35", "34" } -- Red, Yellow, Green, Cyan, Magenta, Blue
    local coloredText = ""
    for i = 1, #text do
        local char = text:sub(i, i)
        local color = colors[i % #colors + 1]
        coloredText = coloredText .. string.format("\x1b[%sm%s\x1b[0m", color, char)
    end
    return coloredText
end
function GetMagentaText(text)
	local coloredText = ""
		local color = "35"
		coloredText = string.format("\x1b[%sm%s\x1b[0m", color, text)
return coloredText
end
function GetYellowText(text)
    local coloredText = ""
        local color = "33"
        coloredText = string.format("\x1b[%sm%s\x1b[0m", color, text)
    return coloredText
end
function GetGreenText(text)
    local coloredText = ""
        local color = "32"
        coloredText = string.format("\x1b[%sm%s\x1b[0m", color, text)
    return coloredText
end
function GetBlueText(text)
    local coloredText = ""
        local color = "34"
        coloredText = string.format("\x1b[%sm%s\x1b[0m", color, text)
    return coloredText
end
----------------------------------------------------------------------------------------------------
-- 
-- 									XML Handling
-- 				 read information saved in xml files from game
-- 
----------------------------------------------------------------------------------------------------
-- Get all CharacterCreationAppearaceVisuals of type Tail loaded in the game
---return 				- list of CharacterCreationAppearaceVisual IDs for all Tails
local function getAllWings()
	local allWings = {}
	local allCCAV = Ext.StaticData.GetAll("CharacterCreationAppearanceVisual")
	for _, CCAV in pairs(allCCAV)do
		local contents = Ext.StaticData.Get(CCAV, "CharacterCreationAppearanceVisual")
		local slotName = contents.SlotName
		if slotName and slotName == "Tail" then
			table.insert(allWings, CCAV)
		end
	end
	return allWings
end
-- Get all allowed genitals for entity (Ex: all Tail for Aasimar)
-- @param uuis 	    - uuid of entity that will receive the wing
---return 			- List of IDs of CharacterCreationAppearaceVisuals
local function getPermittedWings(uuid)
	local permittedWings = {}
	-- Get entities body
	local allWings = getAllWings()
	local E = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats
	local race = E.Race 
	-- get Tails/Wings with same stats
	for _, wing in pairs(allWings) do
		local G = Ext.StaticData.Get(wing, "CharacterCreationAppearanceVisual")	
		if (E.BodyType == G.BodyType) and (E.BodyShape == G.BodyShape) and (race == G.RaceUUID) then
			table.insert(permittedWings, wing)
		end
	end
	return permittedWings
end
local function getCurrentWing(uuid)
	local allWings = getAllWings()
	local characterVisuals =  Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationAppearance.Visuals
	for _, visual in pairs(characterVisuals)do
		if contains(allWings, visual) then
		return visual
		end
	end
end
----------------------------------------------------------------------------------------------------
-- 
-- 										Spell Handling
-- 
----------------------------------------------------------------------------------------------------


-- TODO: 3rd party support Assigns Spells/Containers based on available penises
-- Test with horsecock and Munnmos Realistic Erections

-- Maybe some dynamic spell additon like in DECOR - scan files, if 
-- spell == foldername already exist, do nothing,
-- else create spell in container genitals

----------------------------------------------------------------------------------------------------
-- 
-- 									Transformations
-- 
----------------------------------------------------------------------------------------------------
-- Override the current wing with the new one
-- @param newWing	- ID of CharacterCreationAppearaceVisual of type Tail
-- @param uuid 	     	- uuid of entity that will receive the wing
local function overrideWing(newWing, uuid, summon)
	local player = Ext.Entity.Get(uuid)
	if summon == false then
		Osi.RemoveCustomVisualOvirride(uuid, player.Vars.AAS_WingsChosen)
		Osi.AddCustomVisualOverride(uuid, invisWing) 
	elseif summon then
		if 	newWing == nil then
			_P(GetYellowText("WOTD [WARNING]: newWing is nil"))
		else
			Osi.RemoveCustomVisualOvirride(uuid, invisWing)
			Osi.AddCustomVisualOverride(uuid, newWing)
		end
	end
end
----------------------------------------------------------------------------------------------------
-- 
-- 									Functions
-- 
----------------------------------------------------------------------------------------------------
-- Get all party uuids
function GetPartyWotD()
	local characters = {}
	local players = Osi.DB_Players:Get(nil)
	for _, player in pairs(players) do
		table.insert(characters, player[1])
	end
	return characters
end
-- enables the passive toggle and sends the params on to the check for wings
-- @param IsPlayerWinging	- to determine if the entity has the lvl3 ability active
-- @param uuid 	     		- uuid of entity that will receive the wing
function ToggleWings(uuid, IsPlayerWinging)
	local allTags = Ext.Entity.Get(uuid):GetAllComponents().Tag.Tags
	local entity = Ext.Entity.Get(uuid)
	local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
	if raceTable[race] then
		if stringContains(uuid, "Dummy") then
			_P(GetBlueText("WOTD [DEBUG]: Supressed the toggling of " .. uuid .. ", they are a DUMMY."))
		else
			_P(GetBlueText("WOTD [DEBUG]: Tried to Toggle active object " .. uuid))
			if contains(allTags, TagLevelOne) then
				Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
				_P(GetBlueText("WOTD [DEBUG]: SYNCING LEVEL ONE TOGGLE"))
				MayHaveWings(uuid, true)
			elseif contains(allTags, TagLevelTen) then
				if GetLevel(uuid) >= 10 then
					Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
					_P(GetBlueText("WOTD [DEBUG]: SYNCING LEVEL ONE TEN HIGHER THAN LEVEL TEN"))
					MayHaveWings(uuid, true)
				else
					if IsPlayerWinging then
						Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
						_P(GetBlueText("WOTD [DEBUG]: SYNCING LEVEL ONE TEN LOWER THAN LEVEL TEN AND WINGING"))
						MayHaveWings(uuid, true)
					elseif IsPlayerWinging == false then
						_P(GetBlueText("WOTD [DEBUG]: SYNCING LEVEL ONE TEN LOWER THAN LEVEL TEN AND NOT WINGING"))
						MayHaveWings(uuid, false)
					end
				end
			else
				Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
				_P(GetBlueText("WOTD [DEBUG]: Old savegame detected, giving them wings at level one"))
				MayHaveWings(uuid, true)
			end	
		end
	else
		if contains(allTags, TagCressa) then
			_P(GetBlueText("WOTD [DEBUG]: SYNCING CRESSA"))
			MayHaveWings(uuid, true)
			Osi.AddPassive(uuid,"Aasimar_Get_Toggle_WingsShow")
		else
			_P(GetBlueText("WOTD [DEBUG]: Surpressed the toggling of " .. uuid .. ", they are a NOT an Aasimar, clearing Vars."))
			entity.Vars.AAS_WingsChosen = nil
			Ext.Vars.SyncUserVariables()
		end
	end
end
-- Decides if the player can have wings
-- @param permission		- whether the entity may have wings
-- @param uuid 	     		- uuid of entity that will receive the wing
function MayHaveWings(uuid, permission)
	SyncWings(Ext.Entity.Get(uuid))
	local currentWings = getCurrentWing(uuid)
	if permission == true then
		if currentWings == invisWing then
			_P(GetBlueText("WOTD [DEBUG]: Summoning wings, currently hidden"))
			Osi.ApplyStatus(uuid,"SUM_WINGS",0)
		else
			_P(GetBlueText("WOTD [DEBUG]: Tried to show wings, but already showing"))
		end
	else
		if currentWings ~= invisWing then
			_P(GetBlueText("WOTD [DEBUG]: Hiding wings, currently showing"))
			Osi.ApplyStatus(uuid,"UNS_WINGS",0)
		else
			_P(GetBlueText("WOTD [DEBUG]: Tried to hide wings, but already hidden"))
		end
	end	
end
-- Sync the valuess
-- @param playerEntity		- player entity
function SyncWings(playerEntity)
	if playerEntity ~= nill then
		local race = playerEntity:GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			Ext.Vars.SyncUserVariables()
		end
	end
end
----------------------------------------------------------------------------------------------------
-- 
-- 									Event Listener
--
----------------------------------------------------------------------------------------------------
Ext.Osiris.RegisterListener("StatusApplied", 4, "after", function(object, status, causee, storyActionID)
	if status == "SUM_WINGS" then
		local delay = 600
		local player = Ext.Entity.Get(object)
		local uuid = player.Uuid.EntityUuid
		local eRace = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats
		_P(GetMagentaText("WOTD [INFO]: Race is " .. eRace.SubRace))
		for index, SubClass in pairs(classTable) do
			if eRace.SubRace == SubClass then
			Osi.ApplyStatus(uuid, classVfxTable[index], 0)
			Wait(delay, function() overrideWing(player.Vars.AAS_WingsChosen, uuid, true) end)	
			end 
		end
	end
	if status == "UNS_WINGS" then
		local delay = 600
		local player = Ext.Entity.Get(object)
		local uuid = player.Uuid.EntityUuid
		local eRace = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats
		_P(GetMagentaText("WOTD [INFO]: SubRace is " .. eRace.SubRace))
		for index, SubClass in pairs(classTable) do
			if eRace.SubRace == SubClass then
			Osi.ApplyStatus(uuid, classVfxTable[index], 0)
			Wait(delay, function() overrideWing(player.Vars.AAS_WingsChosen, uuid, false) end)	
			end 
		end
	end	
	if status == "IS_WINGING" then
		local race = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			ToggleWings(causee, true)
		end
	end
	if status == "WOTD_RESET_CHAR" then
		local race = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			ToggleWings(causee, false)
		end
	end
end)
Ext.Osiris.RegisterListener("StatusRemoved", 4, "after", function(object, status, causee, applyStoryActionID)
	if status == "IS_WINGING" then
		local race = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			ToggleWings(causee, false)
		end
	end
end)
Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(levelName, isEditorMode) 
	local oldWingItem = ""
	for _, uuid in pairs(GetPartyWotD()) do
		local entity = Ext.Entity.Get(uuid)
		local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			local WingOptions = getPermittedWings(uuid)
			for i, deprecatedWing in pairs(oldWingsTable) do
				local deprecatedWingItem = Osi.GetItemByTemplateInUserInventory(deprecatedWing, uuid)
				if deprecatedWingItem ~= nil then
					_P(GetMagentaText("WOTD: [CLEANUP] ".. deprecatedWing .. " found on " .. uuid .. ". Applying Status OLDWINGSDESTROYININV" .. i))
					Osi.ApplyStatus(uuid, "OLDWINGSDESTROYININV" .. i, 0)
					if entity.Vars.AAS_WingsChosen == nil then
						entity.Vars.AAS_WingsChosen = WingOptions[1]
						SyncWings(entity)
					end
					if Osi.HasActiveStatus(uuid, "IS_WINGING") == 1 then
						ToggleWings(uuid, true)
					else
						ToggleWings(uuid, false)
					end
				end
			end
			for _,item in pairs(entity:GetAllComponents().InventoryOwner.PrimaryInventory.InventoryContainer.Items) do
				local itemRoot  = item.Item.GameObjectVisual.RootTemplateId
				local itemUuid = item.Item.Uuid.EntityUuid
				if contains(oldWingsTable, itemRoot) then
					_P(GetMagentaText("WOTD: [CLEANUP] Illegally spawned wings: [ROOT] (".. itemRoot .. ") found. Deleting copy. Item [UUID] " .. itemUuid))
					Osi.RequestDelete(itemUuid)
				end
			end
			itemDeprecatedEquipped = GetEquippedItem(uuid, "Underwear")
			itemDeprecatedEquippedRoot = Ext.Entity.Get(itemDeprecatedEquipped):GetAllComponents().GameObjectVisual.RootTemplateId
			for i, deprecatedWing in pairs(oldWingsTable) do
				if deprecatedWing == itemDeprecatedEquippedRoot then
					_P(GetMagentaText("WOTD: [CLEANUP] Illegally spawned and equipped wings: [ROOT] (".. itemDeprecatedEquippedRoot .. ") found. Deleting copy. Item [UUID] " .. itemDeprecatedEquipped))
					Osi.RequestDelete(itemDeprecatedEquipped)
				end
			end
		end
	end
end)

Osi.IterateInventory(Osi.GetHostCharacter(), "OnItem", "InventoryDone")
Ext.Osiris.RegisterListener("CharacterJoinedParty", 1, "after", function(character) 
	local Entity = Ext.Entity.Get(character)
	local allTags = Ext.Entity.Get(character):GetAllComponents().Tag.Tags
	_P(GetMagentaText("WOTD [HIRELING]: " .. character .. " joined the party."))
	if stringContains(character, "Dummy") then
	elseif stringContains(character, "Hirelings") then
		if contains(allTags, TagCressa) then
			_P(GetMagentaText("WOTD [HIRELING]: Saving Scourge wings for Cressa,  " .. character))
			Entity.Vars.AAS_WingsChosen = "19ce82fa-7f72-41f5-bbfe-b2c75baf575e"
			Ext.Vars.SyncUserVariables()
			if Osi.HasActiveStatus(character, "IS_WINGING") == 1 then
				ToggleWings(character, true)
			else
				ToggleWings(character, false)
			end
		end
	end
end)
Ext.Osiris.RegisterListener("TemplateUseFinished", 4, "after", function(uuid, itemroot, item, _)
    if (itemroot == "UNI_MagicMirror_72ae7a39-d0ce-4cb6-8d74-ebdf7cdccf91") then
        local player = Ext.Entity.Get(uuid)
		_P(GetYellowText("WOTD [WARN]: Left Magic Mirror"))
		local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			local CurrentWing = getCurrentWing(uuid)
			if (player.Vars.AAS_WingsChosen ~= CurrentWing) then
				player.Vars.AAS_WingsChosen = CurrentWing
			end
			ToggleWings(uuid, false)
		end
    end
end)
Ext.Osiris.RegisterListener("CharacterCreationFinished", 0, "after", function()
	_P(GetYellowText("WOTD [WARN]: Character Creation Finished"))
	local JustOnce = false
	for _, character in pairs(GetPartyWotD()) do
		local charactersEntity = Ext.Entity.Get(character)
		Ext.Entity.Subscribe("CCState", function(entity, _, _)
			if entity.CCState.HasDummy == false then
				local uuid = entity.Uuid.EntityUuid
				local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
				local WingOptions = getPermittedWings(uuid)
				if raceTable[race] then
					if (entity.Vars.AAS_WingsChosen == nil) then
						entity.Vars.AAS_WingsChosen = WingOptions[1]
					end
					entity.Vars.AAS_WingsChosen = getCurrentWing(uuid)
					if JustOnce == false then
						Osi.ApplyStatus(uuid,"UNS_WINGS",0)
						ToggleWings(uuid, false)
						JustOnce = true
					end
				end
			end
		end, charactersEntity)
	end
end)
Ext.Osiris.RegisterListener("ChangeAppearanceCompleted", 1, "after", function(character) 
	_P(GetYellowText("WOTD [WARN]: Appearance Changed"))
	local player = Ext.Entity.Get(character)
	local uuid = character
	local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
	if raceTable[race] then
		local CurrentWing = getCurrentWing(uuid)
		if (player.Vars.AAS_WingsChosen ~= CurrentWing) then
			player.Vars.AAS_WingsChosen = CurrentWing
		end
		ToggleWings(uuid, false)
	end
end)
Ext.Osiris.RegisterListener("LongRestFinished", 0, "after", function()
	_P(GetYellowText("WOTD [WARN]: Long Rest Finished"))
	for _, uuid in pairs(GetPartyWotD()) do
		local entity = Ext.Entity.Get(uuid)
		local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			local toggleShowWings =  SHOWWINGS
			if toggleShowWings == false then				
				overrideWing(entity.Vars.AAS_WingsChosen, uuid, false)
			elseif toggleShowWings == true then
				overrideWing(entity.Vars.AAS_WingsChosen, uuid, true)
			end
		end
	end
end)
Ext.Osiris.RegisterListener("RequestEndTheDaySuccess", 0, "before", function()
	_P(GetYellowText("WOTD [WARN]: End of Day Requested"))
	for _, uuid in pairs(GetPartyWotD()) do
		local entity = Ext.Entity.Get(uuid)
		local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			local toggleShowWings =  Osi.HasActiveStatus(uuid, "AASIMAR_WINGS_SHOW")
			if toggleShowWings == 0 then
				overrideWing(entity.Vars.AAS_WingsChosen, uuid, false)
			end
		end
	end
end)
Ext.Osiris.RegisterListener("DialogStartRequested", 2, "before", function(target, player)
	_P(GetYellowText("WOTD [WARN]: Dialog Start Requested"))
	local uuid = player
	local entity = Ext.Entity.Get(uuid)
	local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
	if raceTable[race] then
		local toggleShowWings =  Osi.HasActiveStatus(uuid, "AASIMAR_WINGS_SHOW")
		if toggleShowWings == 0 then
			overrideWing(entity.Vars.AAS_WingsChosen, uuid, false)
		end
	end
end)
Ext.Osiris.RegisterListener("DialogEnded", 2, "before", function(dialog, instanceID)
	_P(GetYellowText("WOTD [WARN]: Dialog Ended"))
	local DialogInvolved = 1
	local dialogIndex = 1
	local characters = GetPartyWotD()
	local dialogCharacters = {}
	DialogInvolved = Osi.DialogGetNumberOfInvolvedPlayers(instanceID)
	for _, player in pairs(characters) do
		local DialogPlayer = Osi.DialogGetInvolvedPlayer(instanceID, dialogIndex)
		if DialogPlayer ~= nil then
			dialogIndex = dialogIndex + 1
			table.insert(dialogCharacters, DialogPlayer)
		end
	end
	for _, uuid in pairs(dialogCharacters) do
		local entity = Ext.Entity.Get(uuid)
		local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			if Osi.HasActiveStatus(uuid, "IS_WINGING") == 1 then
				ToggleWings(uuid, true)
			else
				ToggleWings(uuid, false)
			end
		end		
	end
end)
Ext.Osiris.RegisterListener("SavegameLoaded", 0, "after", function()
    -- We track this to prevent doing operations on new game
    SaveLoaded = true
end)