----------------------------------------------------------------------------------------------------
-- 
-- 					Dynamic wing Modification - based on MrFunSize's implementation
--												altered by majestic_piss_lord
--												applied and converted to WotD: Aasimar by Trips
-- 
----------------------------------------------------------------------------------------------------


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

	if summon == false then
		local player = Ext.Entity.Get(uuid)
		Osi.RemoveCustomVisualOvirride(uuid, player.Vars.AAS_WingsChosen) 
	elseif summon then
		Osi.AddCustomVisualOverride(uuid, newWing)
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
	if contains(allTags, TagLevelOne) then
		Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
		MayHaveWings(uuid, true)
	elseif contains(allTags, TagLevelTen) then
		if GetLevel(uuid) >= 10 then
			Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
			MayHaveWings(uuid, true)
		else
			if IsPlayerWinging then
				Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
				MayHaveWings(uuid, true)
			elseif IsPlayerWinging == false then
				Osi.RemovePassive(uuid,"Aasimar_Get_Toggle")
				MayHaveWings(uuid, false)
			end
		end
	elseif contains(allTags, TagCressa) then
		MayHaveWings(uuid, true)
		Osi.RemovePassive(uuid,"Aasimar_Get_Toggle_WingsShow")
	end
end
-- Decides if the player can have wings
-- @param permission		- whether the entity may have wings
-- @param uuid 	     		- uuid of entity that will receive the wing
function MayHaveWings(uuid, permission)
	if permission == true then
		Osi.ApplyStatus(uuid,"SUM_WINGS",0)
	else
		Osi.ApplyStatus(uuid,"UNS_WINGS",0)
	end	
end
----------------------------------------------------------------------------------------------------
-- 
-- 									Event Listener
-- 
----------------------------------------------------------------------------------------------------
Ext.Osiris.RegisterListener("StatusApplied", 4, "after", function(object, status, causee, storyActionID)
	Ext.Vars.SyncUserVariables()	
	if status == "SUM_WINGS" then
		local player = Ext.Entity.Get(object)
		overrideWing(player.Vars.AAS_WingsChosen, player.Uuid.EntityUuid, true)
	end
	if status == "UNS_WINGS" then
		local player = Ext.Entity.Get(object)
		overrideWing(player.Vars.AAS_WingsChosen, player.Uuid.EntityUuid, false)	
	end	
	if status == "IS_WINGING" then
		ToggleWings(causee, true)
	end
	if status == "WOTD_RESET_CHAR" then
		ToggleWings(causee, false)
	end
end)
Ext.Osiris.RegisterListener("StatusRemoved", 4, "after", function(object, status, causee, applyStoryActionID)
	if status == "IS_WINGING" then
		ToggleWings(causee, false)
	end
end)
Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(levelName, isEditorMode) 
	_P("WOTD: Level loaded")
	local oldWingItem = ""
	local newUnderwear = ""
	local newUnderwearRoot = "82c84433-0464-442a-8e5a-0891d829f99a"
	for _, uuid in pairs(GetPartyWotD()) do
		local entity = Ext.Entity.Get(uuid)
		local race = entity.Race
		if raceTable[race.Race] then
			local WingOptions = getPermittedWings(uuid)
			oldWingItem = GetEquippedItem(uuid, "Underwear")
			if oldWingItem == nil then
			else
				Osi.ApplyStatus(uuid, "OLDWINGSDESTROY", 0)
				if entity.Vars.AAS_WingsChosen == nil then
					entity.Vars.AAS_WingsChosen = WingOptions[1]
					Ext.Vars.SyncUserVariables()
				end
				if Osi.HasActiveStatus(uuid, "IS_WINGING") == 1 then
					ToggleWings(uuid, true)
				else
					ToggleWings(uuid, false)
				end
			end		
		end
	end
end)
Ext.Osiris.RegisterListener("CharacterJoinedParty", 1, "after", function(character) 
	local Entity = Ext.Entity.Get(character)
	local race = character.Race
	if raceTable["309b9cc5-0156-4f64-b857-8cf83fa2160b"] then
		_P("WOTD: Aasimar Hireling joined the party.")
		Entity.Vars.AAS_WingsChosen = "19ce82fa-7f72-41f5-bbfe-b2c75baf575e"
		Ext.Vars.SyncUserVariables()
		if Osi.HasActiveStatus(character, "IS_WINGING") == 1 then
			ToggleWings(character, true)
		else
			ToggleWings(character, false)
		end
	end
end)
Ext.Osiris.RegisterListener("CharacterCreationFinished", 0, "after", function()
	_P("WOTD: CharacterCreation Finished")
	local JustOnce = false
	for _, character in pairs(GetPartyWotD()) do
		local charactersEntity = Ext.Entity.Get(character)
		Ext.Entity.Subscribe("CCState", function(entity, _, _)
			if entity.CCState.HasDummy == false then
				local uuid = entity.Uuid.EntityUuid
				local race = entity.Race
				local WingOptions = getPermittedWings(uuid)
				if raceTable[race.Race] then
					if (entity.Vars.AAS_WingsChosen == nil) then
						entity.Vars.AAS_WingsChosen = WingOptions[1]
						Ext.Vars.SyncUserVariables()
					end
					entity.Vars.AAS_WingsChosen = getCurrentWing(uuid)
					Ext.Vars.SyncUserVariables()
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
	local player = Ext.Entity.Get(character)
	_P("WOTD: Left Mirror")
	local uuid = character
	local race = player.Race.Race
	if raceTable[race] then
		local CurrentWing = getCurrentWing(uuid)
		if (player.Vars.AAS_WingsChosen ~= CurrentWing) then
			player.Vars.AAS_WingsChosen = CurrentWing
			Ext.Vars.SyncUserVariables()
		end
		ToggleWings(uuid, false)
	end
end)
Ext.Osiris.RegisterListener("LongRestFinished", 0, "after", function()
	for _, uuid in pairs(GetPartyWotD()) do
		local entity = Ext.Entity.Get(uuid)
		local race = entity.Race
		if raceTable[race.Race] then
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
	for _, uuid in pairs(GetPartyWotD()) do
		local entity = Ext.Entity.Get(uuid)
		local race = entity.Race
		if raceTable[race.Race] then
			local toggleShowWings =  Osi.HasActiveStatus(uuid, "AASIMAR_WINGS_SHOW")
			if toggleShowWings == 0 then
				overrideWing(entity.Vars.AAS_WingsChosen, uuid, false)
			elseif toggleShowWings == 1 then
			end
		end
	end
end)
Ext.Osiris.RegisterListener("DialogStartRequested", 2, "before", function(target, player)
	local uuid = player
	local entity = Ext.Entity.Get(uuid)
	local race = entity.Race
	if raceTable[race.Race] then
		local toggleShowWings =  Osi.HasActiveStatus(uuid, "AASIMAR_WINGS_SHOW")
		if toggleShowWings == 0 then
			overrideWing(entity.Vars.AAS_WingsChosen, uuid, false)
		end
	end
end)
Ext.Osiris.RegisterListener("DialogEnded", 2, "after", function(dialog, instanceID) 
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
		local race = entity.Race
		if raceTable[race.Race] then
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