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
local ModuleUUID = "4806bd2a-929b-406e-b1d4-2e0e9cc23bb2"
local SHOWWINGS = true
local TagLevelOne = "2d21255c-7cf7-4cbb-9802-2ee7e0593380"
local TagLevelTen = "3a7452df-934b-43af-8905-211b3b7e3b96"
local TagCressa = "34db36a2-51c3-4cd6-83c4-39221c6d52b2"
local TagAasimar = {
	"Trips_Aasimar_Harbinger_3e2e1c74-9efd-4837-9088-890ba7331491",
	"CONS_Elixir_Blood_Harbinger_e9c1ba87-0186-4802-828f-aeb171c1b087",
	"Trips_Aasimar_Scourge_6cbfe8ea-d9eb-4e2f-bae6-9caa2daf201f",
	"CONS_Elixir_Blood_Scourge_aa6cee6c-6107-4770-9412-8df30965a3df",
	"Trips_Aasimar_Fallen_39bc17c6-300d-4c18-8095-bf7a12d8722e",
	"CONS_Elixir_Blood_Fallen_f4264f62-decf-48f0-a16c-8b49356a3f7f",
	"Trips_Aasimar_Protector_3ea6f061-6eb2-48ef-9ad3-c0afdbb21a26",
	"CONS_Elixir_Blood_Protector_b08e3437-92db-4c07-9a14-a9dc1e6b14d1"
  }
  -- Osi.DB_GLO_BloodElixirs_RacialElixirTemplates("REALLY_AASIMAR_2fddf7dd-f79b-4998-882c-d7257badbfe6", "CONS_Elixir_Blood_Aasimar_aa6cee6c-6107-4770-9412-8df30965a3df", "1")
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
--Checks if the player is below level 10 AND has the lvl 10 wings option enabled
local function IsLowLevelTagTen(uuid)
	if GetLevel(uuid) <= 9 and contains(Ext.Entity.Get(uuid):GetAllComponents().Tag.Tags, TagLevelTen) == true then
		return true
	else
		return false
	end
end
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
	local CurrentWing = getCurrentWing(uuid)
	if CurrentWing == nil then CurrentWing = "nil" end
	_P("overrideWing : " .. CurrentWing)
	if summon == false then
		_P("WOTD SUMMON IS FALSE")
		if CurrentWing == invisWing then
			_P("WOTD CURRENT WING IS INVIS")
		else
			_P("WOTD CURRENT WING IS being removed, then invis applied")
			Osi.RemoveCustomVisualOvirride(uuid, getCurrentWing(uuid))
			Osi.AddCustomVisualOverride(uuid, invisWing)
		end
	elseif summon == true then
		if IsLowLevelTagTen(uuid) then
			if Osi.HasActiveStatus(uuid, "IS_WINGING") == 1 then
				_P(GetYellowText("WOTD [WARNING]: setting new wing, removing invisWing, IS WINGING"))
				Osi.RemoveCustomVisualOvirride(uuid, invisWing)
				Osi.AddCustomVisualOverride(uuid, player.Vars.AAS_WingsChosen)
			end
		elseif GetLevel(uuid) >= 10 and contains(Ext.Entity.Get(uuid):GetAllComponents().Tag.Tags, TagLevelTen) == true then
			_P(GetYellowText("WOTD [WARNING]: setting new wing, lvlten passive, but higher than 9"))
			Osi.RemoveCustomVisualOvirride(uuid, invisWing)
			Osi.AddCustomVisualOverride(uuid, newWing)
		elseif contains(Ext.Entity.Get(uuid):GetAllComponents().Tag.Tags, TagLevelTen) == false then
			_P(GetYellowText("WOTD [WARNING]: setting new wing, removing inviswing, cuz lvl1 passive"))
			Osi.RemoveCustomVisualOvirride(uuid, invisWing)
			Osi.AddCustomVisualOverride(uuid, newWing)
		end
	elseif summon == nil then
		_P(GetYellowText("WOTD [WARNING]: newWing is nil, overridewing fallback reached."))	
		Osi.RemoveCustomVisualOvirride(uuid, invisWing)
		Osi.AddCustomVisualOverride(uuid, invisWing)
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
function ToggleWings(uuid, IsPlayerWinging, CCExit)
	local allTags = Ext.Entity.Get(uuid):GetAllComponents().Tag.Tags
	local entity = Ext.Entity.Get(uuid)
	local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
	if raceTable[race] then
		if stringContains(uuid, "Dummy") then
			--_P(GetBlueText("WOTD [DEBUG]: Supressed the toggling of " .. uuid .. ", they are a DUMMY."))
		else
			--_P(GetBlueText("WOTD [DEBUG]: Tried to Toggle active object " .. uuid))
			Osi.RemovePassive(uuid, "Aasimar_Get_Toggle_WingsShow")
			if contains(allTags, TagLevelOne) then
				Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
				_P(GetBlueText("WOTD [DEBUG]: SYNCING LEVEL ONE TOGGLE"))
				MayHaveWings(uuid, true, CCExit)
			elseif contains(allTags, TagLevelTen) and not contains (allTags, TagLevelOne) then
				if GetLevel(uuid) >= 10 then
					_P(GetBlueText("WOTD [DEBUG]: LVL10 PASSIVE, LVL >= 10"))
					local xyzDummy = getCurrentWing(uuid)
					if xyzDummy == nil then xyzDummy = "nil" end
					_P(GetYellowText("Toggle Wings: getCurrentWing(uuid) : " .. xyzDummy))
					local xyzChosenDummy = entity.Vars.AAS_WingsChosen
					if xyzChosenDummy == nil then xyzChosenDummy = "nil" end
					_P(GetYellowText("Toggle Wings: entity.Vars.AAS_WingsChosen : " .. xyzChosenDummy))
					if IsPlayerWinging == true then
						Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
						_P(GetBlueText("WOTD [DEBUG]: SYNCING LEVEL TEN, HIGHER THAN LEVEL TEN AND WINGING"))
						MayHaveWings(uuid, true, false)
					elseif IsPlayerWinging == false then
						Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
						_P(GetBlueText("WOTD [DEBUG]: SYNCING LEVEL TEN, HIGHER THAN LEVEL TEN AND NOT WINGING"))
						MayHaveWings(uuid, true, false)
					end
				elseif GetLevel(uuid) <= 9 and contains (allTags, TagLevelTen)then
					_P(GetBlueText("WOTD [DEBUG]: LVL10 PASSIVE, LVL <= 9"))
					if IsPlayerWinging == true then
						_P(GetBlueText("WOTD [DEBUG]: SYNCING LEVEL TEN, LOWER THAN LEVEL TEN AND WINGING"))
						MayHaveWings(uuid, true, CCExit)
					elseif IsPlayerWinging == false then
						_P(GetBlueText("WOTD [DEBUG]:" .. " SYNCING LEVEL TEN, LOWER THAN LEVEL TEN AND NOT WINGING"))
						local dummyCCExit = ""
						if CCExit then
							dummyCCExit = "true"
						elseif CCExit == false then
							dummyCCExit = "false"
						else
							dummyCCExit = "nil"
						end
						_P("WOTD CCExit ToggleWings:" .. dummyCCExit)
						MayHaveWings(uuid, false, CCExit)
					end
				end
			elseif contains(allTags, TagLevelTen) == false and contains(allTags, TagLevelOne) == false then
				Osi.AddPassive(uuid,"Aasimar_Get_Toggle")
				_P(GetBlueText("WOTD [DEBUG]: Old savegame detected, giving them wings at level one"))
				--_P(GetYellowText("WOTD [WARN]: SETTING AAS_WINGSCHOSEN VAR TOGGLEIWINGS OLD"))
				if getCurrentWing(uuid) ~= invisWing then
					if getCurrentWing(uuid) == nil then
						for i, SubRace in pairs(raceTable) do
							if entity:GetAllComponents().Race.Race == SubRace then
								_P("WOTD SET THE WINGS TO DEFAULT_LOOP")
								entity.Vars.AAS_WingsChosen = getPermittedWings(uuid)[i]
							end
						end
						if entity.Vars.AAS_WingsChosen == nil then
							_P("WOTD SET THE WINGS TO DEFAULT")
							entity.Vars.AAS_WingsChosen = getPermittedWings(uuid)[1]
						end
					else
						_P("WOTD SET THE WINGS TO CURRENT WINGS")
						entity.Vars.AAS_WingsChosen = getCurrentWing(uuid)
					end
				end
				_P("WOTD SENT MAYHAVEWINGS IN TOGGLEWINGS LVL10")
				MayHaveWings(uuid, true, false)				
			end	
		end
	else
		if contains(allTags, TagCressa) then
			--_P(GetBlueText("WOTD [DEBUG]: SYNCING CRESSA"))
			MayHaveWings(uuid, true, CCExit)
			Osi.AddPassive(uuid,"Aasimar_Get_Toggle_WingsShow")
		else
			--_P(GetBlueText("WOTD [DEBUG]: Surpressed the toggling of " .. uuid .. ", they are a NOT an Aasimar, clearing Vars."))
			--entity.Vars.AAS_WingsChosen = nil
			--Ext.Vars.SyncUserVariables()
		end
	end
end
-- Decides if the player can have wings
-- @param permission		- whether the entity may have wings
-- @param uuid 	     		- uuid of entity that will receive the wing
function MayHaveWings(uuid, permission, CCExit)
	if uuid == nil then
		_P(GetYellowText("WOTD [WARN]: MayHaveWings, uuid is nil"))
	else
		_P(GetYellowText("WOTD [WARN]: MAyHaveWings called"))
		local entity = Ext.Entity.Get(uuid)
		--SyncWings(entity)
		_P(GetYellowText("MayHaveWings: getCurrentWing(uuid) : " .. getCurrentWing(uuid)))
		_P(GetYellowText("MayHaveWings: entity.Vars.AAS_WingsChosen : " .. entity.Vars.AAS_WingsChosen))
		local currentWings = getCurrentWing(uuid)
		if permission == true then
			if currentWings == invisWing then
				_P(GetBlueText("WOTD [DEBUG]: Summoning wings, currently hidden"))
				Osi.ApplyStatus(uuid,"SUM_WINGS",0)
			else
				if CCExit == true then
					--_P(GetBlueText("WOTD [DEBUG]: Came out of CC, forced wings"))
					if Osi.HasActiveStatus(uuid, "DEVA_LOCO") == 1 then
						_P(GetBlueText("WOTD [DEBUG]: Tried to summon wings, currently already showing. CCExit True"))
					else
						_P(GetBlueText("WOTD [DEBUG]: Tried to summon wings, currently already showing. CCExit True, DEVA False"))
						Osi.ApplyStatus(uuid,"SUM_WINGS",0)
					end
				else
					--_P(GetBlueText("WOTD [DEBUG]: Tried to summon wings, currently already showing"))
					if Osi.HasActiveStatus(uuid, "DEVA_LOCO") == 1 then
						_P(GetBlueText("WOTD [DEBUG]: Tried to summon wings, currently already showing. CCExit False"))
					else
						_P(GetBlueText("WOTD [DEBUG]: Tried to summon wings, currently already showing. CCExit False, DEVA False"))
						Osi.ApplyStatus(uuid,"SUM_WINGS",0)
					end
				end
			end
		else
			Osi.ApplyStatus(uuid,"UNS_WINGS",0)
			if CCExit == true then
				_P(GetBlueText("WOTD [DEBUG]: Not allowed wings, spawning invis."))
				--Osi.ApplyStatus(uuid,"SUM_WINGS_SPAWN",0)
				Osi.RemoveStatus(uuid, "DEVA_LOCO", uuid)
				Osi.RemoveStatus(uuid, "AASIMAR_PASSIVE_WINGS_10", uuid)
				overrideWing(inviswing, uuid, false)
			elseif CCExit == false then
				if IsLowLevelTagTen(uuid) then
					if GetLevel(uuid) >= 2 then
						if Osi.HasActiveStatus(uuid, "DEVA_LOCO") == 1 then
							Osi.ApplyStatus(uuid,"UNS_WINGS",0)
						end
						_P(GetBlueText("WOTD [DEBUG]: Not allowed wings and higher than level 1, UNSUM."))
					else
						if Osi.HasActiveStatus(uuid, "DEVA_LOCO") == 1 then
							_P(GetBlueText("WOTD [DEBUG]: Not allowed wings and level 1, doing nothing."))
							Osi.ApplyStatus(uuid,"UNS_WINGS",0)
						end
					end
				else
					if Osi.HasActiveStatus(uuid, "DEVA_LOCO") == 1 then
						_P(GetBlueText("WOTD [DEBUG]: Not allowed wings."))
						Osi.ApplyStatus(uuid,"UNS_WINGS",0)
					end
				end
			end
		end
	end
end
-- Sync the valuess
-- @param playerEntity		- player entity
function SyncWings(playerEntity)
	if playerEntity ~= nil then
		if playerEntity:GetAllComponents().CharacterCreationStats.Race ~= nil then
			local race = playerEntity:GetAllComponents().CharacterCreationStats.Race
			if raceTable[race] then
				Ext.Vars.SyncUserVariables()
			end			
		end
	end
end
----------------------------------------------------------------------------------------------------
-- _D(Ext.Entity.Get(_C):GetAllComponents())
-- 									Event Listener
--
----------------------------------------------------------------------------------------------------
Ext.Osiris.RegisterListener("StatusApplied", 4, "after", function(object, status, causee, storyActionID)
	if status == "SUM_WINGS_TOGGLE" then
		_P(GetMagentaText("WOTD [INFO]TOGGLE WAS CLICKED INTO ON"))
		local delay = 600
		local player = Ext.Entity.Get(object)
		local uuid = player.Uuid.EntityUuid
		local eRace = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats
		if IsLowLevelTagTen(uuid) then
			_P("SUM_WINGS_TOGGLE ON LOW LEVEL")
		else
			for index, SubClass in pairs(classTable) do
				if eRace.SubRace == SubClass then
					Osi.ApplyStatus(uuid, classVfxTable[index], 0)
					Wait(delay, function() overrideWing(player.Vars.AAS_WingsChosen, uuid, true) end)	
				end
			end
		end
	end
	if status == "UNS_WINGS_TOGGLE" then
		_P(GetMagentaText("WOTD [INFO]TOGGLE WAS CLICKED INTO OFF"))
		local delay = 600
		local player = Ext.Entity.Get(object)
		local uuid = player.Uuid.EntityUuid
		local eRace = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats
		for index, SubClass in pairs(classTable) do
			if eRace.SubRace == SubClass then
				if IsLowLevelTagTen(uuid) then
					_P("SUM_WINGS_TOGGLE OFF LOW LEVEL")
				else

					Osi.ApplyStatus(uuid, classVfxTable[index], 0)
					Wait(delay, function() overrideWing(invisWing, uuid, false) end)
			
				end
			end
		end
	end	
	if status == "SUM_WINGS" then
		local delay = 600
		local player = Ext.Entity.Get(object)
		local uuid = player.Uuid.EntityUuid
		local eRace = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats
		for index, SubClass in pairs(classTable) do
			if eRace.SubRace == SubClass then
				if IsLowLevelTagTen(uuid) then
					_P(GetMagentaText("WOTD [INFO]SUMMON: Don't summon cuz low level and wings10passive"))
					Osi.ApplyStatus(uuid, classVfxTable[index], 0)
					Wait(delay, function() overrideWing(invisWing, uuid, true) end)
				else
					_P(GetMagentaText("WOTD [INFO]SUMMON: SMU WINGS Race is " .. eRace.SubRace))
					Osi.ApplyStatus(uuid, classVfxTable[index], 0)
					Wait(delay, function() overrideWing(player.Vars.AAS_WingsChosen, uuid, true) end)
				end
			end 
		end
	end
	if status == "SUM_WINGS_SPAWN" then
		local delay = 600
		local player = Ext.Entity.Get(object)
		local uuid = player.Uuid.EntityUuid
		local eRace = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats
		_P(GetMagentaText("WOTD [INFO]SUMMON: SUM WINGS SPAWN"))
		for index, SubClass in pairs(classTable) do
			if eRace.SubRace == SubClass then
				if GetLevel(uuid) >= 2 then
					_P(GetMagentaText("WOTD [INFO]SUMMON: didn't do shit cuz level > 1"))
					if IsLowLevelTagTen(uuid) then
						Osi.ApplyStatus(uuid, classVfxTable[index], 0)
						Wait(delay, function() overrideWing(invisWing, uuid, false) end)
					end
				else
					_P(GetMagentaText("WOTD [INFO]SUMMON: did shit cuz level = 1"))
					
					Osi.ApplyStatus(uuid, classVfxTable[index], 0)
					Wait(delay, function() overrideWing(invisWing, uuid, false) end)
					
				end
			end 
		end
	end
	if status == "UNS_WINGS" then
		local delay = 600
		local player = Ext.Entity.Get(object)
		local uuid = player.Uuid.EntityUuid
		local eRace = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats
		----_P(GetMagentaText("WOTD [INFO]:UNSUMMON: SubRace is " .. eRace.SubRace))
		for index, SubClass in pairs(classTable) do
			if eRace.SubRace == SubClass then
				if GetLevel(uuid) >= 10 or contains(player:GetAllComponents().Tag.Tags, TagLevelOne) then
					_P(GetMagentaText("WOTD [INFO]: Not unsummmoning wings, level above 9 and has lvl1 tag"))
					--Wait(delay, function() overrideWing(player.Vars.AAS_WingsChosen, uuid, false) end)
				elseif IsLowLevelTagTen(uuid) then
					if GetLevel(uuid) >= 2 then
						_P(GetMagentaText("WOTD [INFO]: UNSUM, level under 10 and above 1 and has lvl10 tag, player saved wings: " .. player.Vars.AAS_WingsChosen))
						Osi.ApplyStatus(uuid, classVfxTable[index], 0)
						Wait(delay, function() overrideWing(invisWing, uuid, false) end)
					else
						Osi.ApplyStatus(uuid, classVfxTable[index], 0)
						_P(GetMagentaText("WOTD [INFO]: Unsummmoning wings, level under 10 and has lvl10 tag, player saved wings: " .. player.Vars.AAS_WingsChosen))
						----_P(GetYellowText("WOTD [INFO]: Unsummmoning wings, level under 10 and has lvl10 tag, player current wings: " .. getCurrentWing(uuid)))
						Wait(delay, function() overrideWing(invisWing, uuid, false) end)
					end
				end
			end
		end
	end	
	if status == "IS_WINGING" then
		local race = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			ToggleWings(object, true, false)
			--_P(GetYellowText("WOTD [WARN]: ERROR 006"))
		end
	end
	if status == "WOTD_RESET_CHAR" then
		local race = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			ToggleWings(object, false, false)
		end
	end
end)
Ext.Osiris.RegisterListener("StatusRemoved", 4, "after", function(object, status, causee, applyStoryActionID)
	if status == "IS_WINGING" then
		local race = Ext.Entity.Get(object):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			ToggleWings(object, false, false)
		end
	end
end)
Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(levelName, isEditorMode) 
	_P(GetYellowText("WOTD [WARN]: Inserted the AASIMAR ELIXIRS at GameStart"))
	Osi.DB_GLO_BloodElixirs_RacialElixirTemplates(TagAasimar[1], TagAasimar[2], "1")
	Osi.DB_GLO_BloodElixirs_RacialElixirTemplates(TagAasimar[3], TagAasimar[4], "2")
	Osi.DB_GLO_BloodElixirs_RacialElixirTemplates(TagAasimar[5], TagAasimar[6], "3")
	Osi.DB_GLO_BloodElixirs_RacialElixirTemplates(TagAasimar[7], TagAasimar[8], "4")
	local oldWingItem = ""
	for _, uuid in pairs(GetPartyWotD()) do
		local entity = Ext.Entity.Get(uuid)
		local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			local WingOptions = getPermittedWings(uuid)
			for i, deprecatedWing in pairs(oldWingsTable) do
				local deprecatedWingItem = Osi.GetItemByTemplateInUserInventory(deprecatedWing, uuid)
				if deprecatedWingItem ~= nil then
					--_P(GetMagentaText("WOTD: [CLEANUP] ".. deprecatedWing .. " found on " .. uuid .. ". Applying Status OLDWINGSDESTROYININV" .. i))
					Osi.ApplyStatus(uuid, "OLDWINGSDESTROYININV" .. i, 0)
					if entity.Vars.AAS_WingsChosen == nil then
						--_P(GetYellowText("WOTD [WARN]: SETTING AAS_WINGSCHOSEN VAR LEVEL GAMEPLAY STARTED"))
						entity.Vars.AAS_WingsChosen = WingOptions[i]
						--_P(GetYellowText("WOTD: [CLEANUP] Setting player uuid " .. uuid .. " to wings ".. WingOptions[i]))
						--_P(GetYellowText("WOTD [WARN]: Synced wings at line 416"))
						SyncWings(Ext.Entity.Get(uuid))				
					end
				end
			end
			for _,item in pairs(entity:GetAllComponents().InventoryOwner.PrimaryInventory.InventoryContainer.Items) do
				local itemRoot  = item.Item.GameObjectVisual.RootTemplateId
				local itemUuid = item.Item.Uuid.EntityUuid
				if contains(oldWingsTable, itemRoot) then
					--_P(GetMagentaText("WOTD: [CLEANUP] Illegally spawned wings: [ROOT] (".. itemRoot .. ") found. Deleting copy. Item [UUID] " .. itemUuid))
					Osi.Drop(itemUuid)
					Osi.RequestDelete(itemUuid)
				end
			end
			if Osi.HasActiveStatus(uuid, "IS_WINGING") == 1 then
				ToggleWings(uuid, true, false)
				--_P(GetYellowText("WOTD [WARN]: ERROR 005"))
			else
				if IsLowLevelTagTen(uuid) then
					--_P(GetYellowText("WOTD [WARN]: Is low level 10 and has tag during Gameplay started, doing nothing"))
					if entity.Vars.AAS_WingsChosen == nil then
						
					end
				else
					--_P(GetYellowText("WOTD [WARN]: Is normal during Gameplay started, ToggleWings False"))
					ToggleWings(uuid, false, false)
				end
			end
			--Wait for legally spawned wings to resolve
			Wait(3000, function()
				itemDeprecatedEquipped = GetEquippedItem(uuid, "Underwear")
				if itemDeprecatedEquipped ~= nil then
					itemDeprecatedEquippedRoot = Ext.Entity.Get(itemDeprecatedEquipped):GetAllComponents().GameObjectVisual.RootTemplateId
					for i, deprecatedWing in pairs(oldWingsTable) do
						if deprecatedWing == itemDeprecatedEquippedRoot then
							--_P(GetMagentaText("WOTD: [CLEANUP] Illegally spawned and equipped wings: [ROOT] (".. itemDeprecatedEquippedRoot .. ") found. Deleting copy. Item [UUID] " .. itemDeprecatedEquipped))
							Osi.RequestDelete(itemDeprecatedEquipped)
						end
					end
				end
			end)
		end
	end
end)
Ext.Osiris.RegisterListener("CharacterJoinedParty", 1, "after", function(character) 
	local Entity = Ext.Entity.Get(character)
	local allTags = Ext.Entity.Get(character):GetAllComponents().Tag.Tags
	if stringContains(character, "Dummy") then
	elseif stringContains(character, "Hirelings") then
		--_P(GetMagentaText("WOTD [HIRELING]: " .. character .. " joined the party."))
		if contains(allTags, TagCressa) then
			--_P(GetMagentaText("WOTD [HIRELING]: Saving Scourge wings for Cressa,  " .. character))
			--_P(GetYellowText("WOTD [WARN]: SETTING AAS_WINGSCHOSEN VAR CRESSA"))
			Entity.Vars.AAS_WingsChosen = "19ce82fa-7f72-41f5-bbfe-b2c75baf575e"
			Ext.Vars.SyncUserVariables()
			if Osi.HasActiveStatus(character, "IS_WINGING") == 1 then
				ToggleWings(character, true, false)
				--_P(GetYellowText("WOTD [WARN]: ERROR 004"))
			else
				ToggleWings(character, false, false)
			end
		end
	end
end)
Ext.Osiris.RegisterListener("LeveledUp", 1, "after", function(character) 
	if character ~= nil then	
		if GetLevel(character) == 10 then		
	 		--_P(GetYellowText("WOTD [WARN]: Leveled up."))
			--_P(GetMagentaText("WOTD [INFO]SUM as you hit lvl 10"))
			local delay = 600
			local player = Ext.Entity.Get(character)
			local uuid = player.Uuid.EntityUuid
			local eRace = Ext.Entity.Get(character):GetAllComponents().CharacterCreationStats
			if GetLevel(uuid) <= 9 and contains(Ext.Entity.Get(uuid):GetAllComponents().Tag.Tags, TagLevelTen) then

			else
				for index, SubClass in pairs(classTable) do
					if eRace.SubRace == SubClass then
						--Osi.ApplyStatus(uuid, classVfxTable[index], 0)
						--Wait(delay, function() overrideWing(player.Vars.AAS_WingsChosen, uuid, true) end)
						ToggleWings(uuid, false, false)
					end
				end
			end
		end
	end
end)
Ext.Osiris.RegisterListener("RespecCompleted", 1, "after", function(character) 
	_P(GetYellowText("WOTD [WARN]: Respec complete"))
	if character ~= nil then
		local uuid = character
		local player = Ext.Entity.Get(character)		
		local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
		if raceTable[race] then
			local CurrentWing = getCurrentWing(uuid)
			if (player.Vars.AAS_WingsChosen ~= CurrentWing) then
				if CurrentWing ~= invisWing then
					if CurrentWing == nil then
						for i, SubRace in pairs(raceTable) do
							if player:GetAllComponents().Race.Race == SubRace then
								player.Vars.AAS_WingsChosen = getPermittedWings(uuid)[i]
								SyncWings(player)
							end
						end
					else
						player.Vars.AAS_WingsChosen = CurrentWing
						SyncWings(player)
					end
				end
				--_P(GetYellowText("WOTD [WARN]: SETTING AAS_WINGSCHOSEN VAR MIRROR FINISH: "  .. player.Vars.AAS_WingsChosen))
			end
			ToggleWings(uuid, false, false)
		end
	end
end)
Ext.Osiris.RegisterListener("TemplateUseFinished", 4, "after", function(uuid, itemroot, item, _)
    if (itemroot == "UNI_MagicMirror_72ae7a39-d0ce-4cb6-8d74-ebdf7cdccf91") then
        -- local player = Ext.Entity.Get(uuid)
		-- --_P(GetYellowText("WOTD [WARN]: Left Magic Mirror"))
		-- local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
		-- if raceTable[race] then
		-- 	local CurrentWing = getCurrentWing(uuid)
		-- 	if (player.Vars.AAS_WingsChosen ~= CurrentWing) then
		-- 		if CurrentWing ~= invisWing then
		-- 			if CurrentWing == nil then
		-- 				for i, SubRace in pairs(raceTable) do
		-- 					if player:GetAllComponents().Race.Race == SubRace then
		-- 						_P("WOTD Current wings : " .. getCurrentWing(uuid))
								
		-- 						player.Vars.AAS_WingsChosen = getPermittedWings(uuid)[i]
		-- 						SyncWings(player)
		-- 					end
		-- 					_P("WOTD Chosen wings : " .. player.Vars.AAS_WingsChosen)
		-- 				end
		-- 			else
		-- 				_P("WOTD Current wings CW not nil: " .. getCurrentWing(uuid))
		-- 				player.Vars.AAS_WingsChosen = CurrentWing
		-- 				SyncWings(player)
		-- 				_P("WOTD Chosen wings CW not nil : " .. player.Vars.AAS_WingsChosen)
		-- 			end
		-- 		end
		-- 		--_P(GetYellowText("WOTD [WARN]: SETTING AAS_WINGSCHOSEN VAR MIRROR FINISH: "  .. player.Vars.AAS_WingsChosen))
		-- 	end
		-- 	_P("Wotd unsummoning wings and togglewings false false")
		-- 	Osi.ApplyStatus(uuid,"UNS_WINGS",0)
		-- 	ToggleWings(uuid, false, false)
		-- 	_P("WOTD Current wings mirror exit: " .. getCurrentWing(uuid))
		-- 	--_P("WOTD Chosen wings mirror exit: " .. player.Vars.AAS_WingsChosen)
		-- end
    end
end)
Ext.Osiris.RegisterListener("CharacterCreationFinished", 0, "after", function()
	_P(GetYellowText("WOTD [WARN]: Character Creation Finished"))
	for _, character in pairs(GetPartyWotD()) do
		local charactersEntity = Ext.Entity.Get(character)
		Ext.Entity.Subscribe("CCState", function(entity, _, _)
			if entity.CCState.HasDummy == false then
				local uuid = entity.Uuid.EntityUuid
				local race = entity:GetAllComponents().Race.Race
				local WingOptions = getPermittedWings(uuid)
				if raceTable[race] then
					--_P(GetYellowText("WOTD [WARN]: SETTING AAS_WINGSCHOSEN VAR CC FINISH"))
					local CurrentWing = getCurrentWing(uuid)
					if CurrentWing == nil then CurrentWing = "nil" end
					_P("overrideWing during CA: " .. CurrentWing)
					if CurrentWing ~= invisWing then
						if CurrentWing == nil then
							for i, SubRace in pairs(raceTable) do
								if entity:GetAllComponents().Race.Race == SubRace then
									entity.Vars.AAS_WingsChosen = getPermittedWings(uuid)[i]
									SyncWings(entity)
									_P(GetYellowText("getCurrentWing(uuid) CC after toggle: CC 1" .. getCurrentWing(uuid)))
									_P(GetYellowText("entity.Vars.AAS_WingsChosen CC after toggle: CC 1" .. entity.Vars.AAS_WingsChosen))
								end
							end
						else
							entity.Vars.AAS_WingsChosen = CurrentWing
							SyncWings(entity)
						end
					end
					_P(GetYellowText("getCurrentWing(uuid) CC before toggle: " .. getCurrentWing(uuid)))
					_P(GetYellowText("entity.Vars.AAS_WingsChosen CC before toggle: " .. entity.Vars.AAS_WingsChosen))
					_P(GetYellowText("WOTD [WARN]: Toggle Wings CC Finished"))
					if IsLowLevelTagTen(uuid) then
						if getCurrentWing(uuid) ~= invisWing then
							entity.Vars.AAS_WingsChosen = getCurrentWing(uuid)
							SyncWings(entity)
							Wait(660, function() Osi.ApplyStatus(uuid,"UNS_WINGS",0)
								ToggleWings(uuid, false, true) end)
							_P(GetYellowText("getCurrentWing(uuid) CC after lowlevel10: " .. getCurrentWing(uuid)))
							_P(GetYellowText("entity.Vars.AAS_WingsChosen CC after lowlevel10: " .. entity.Vars.AAS_WingsChosen))
						end
					else
						ToggleWings(uuid, false, true)
						_P(GetYellowText("getCurrentWing(uuid) CC after toggle: " .. getCurrentWing(uuid)))
						_P(GetYellowText("entity.Vars.AAS_WingsChosen CC after toggle: " .. entity.Vars.AAS_WingsChosen))
					end					
				end
			end
		end, charactersEntity)
	end
end)
Ext.Osiris.RegisterListener("ChangeAppearanceCompleted", 1, "after", function(character) 
	--local charactersEntity = Ext.Entity.Get(character)
	local entity = Ext.Entity.Get(character)
	--Ext.Entity.Subscribe("CCState", function(entity, _, _)
		if entity.CCState.HasDummy == false then
			local uuid = entity.Uuid.EntityUuid
			local race = entity:GetAllComponents().Race.Race
			local WingOptions = getPermittedWings(uuid)
			if raceTable[race] then
				--_P(GetYellowText("WOTD [WARN]: SETTING AAS_WINGSCHOSEN VAR CC FINISH"))
				local CurrentWing = getCurrentWing(uuid)
				if CurrentWing == nil then CurrentWing = "nil" end
				_P("overrideWing during CA: " .. CurrentWing)
				if CurrentWing ~= invisWing then
					if CurrentWing == nil then
						for i, SubRace in pairs(raceTable) do
							if entity:GetAllComponents().Race.Race == SubRace then
								entity.Vars.AAS_WingsChosen = getPermittedWings(uuid)[i]
								SyncWings(entity)
								_P(GetYellowText("getCurrentWing(uuid) AC after toggle: AC 1" .. getCurrentWing(uuid)))
								_P(GetYellowText("entity.Vars.AAS_WingsChosen AC after toggle: AC 1" .. entity.Vars.AAS_WingsChosen))
							end
						end
					else
						entity.Vars.AAS_WingsChosen = CurrentWing
						SyncWings(entity)
					end
				end
				_P(GetYellowText("getCurrentWing(uuid) AC before toggle: " .. getCurrentWing(uuid)))
				_P(GetYellowText("entity.Vars.AAS_WingsChosen AC before toggle: " .. entity.Vars.AAS_WingsChosen))
				_P(GetYellowText("WOTD [WARN]: Toggle Wings AC Finished"))
				if IsLowLevelTagTen(uuid) then
					if getCurrentWing(uuid) ~= invisWing then

						entity.Vars.AAS_WingsChosen = getCurrentWing(uuid)
						SyncWings(entity)

						Wait(660, function() --Osi.ApplyStatus(uuid,"UNS_WINGS",0)
							_P("WOTD did the toggle in AC") ToggleWings(uuid, false, true) end)
						_P(GetYellowText("getCurrentWing(uuid) AC after lowlevel10: " .. getCurrentWing(uuid)))
						_P(GetYellowText("entity.Vars.AAS_WingsChosen AC after lowlevel10: " .. entity.Vars.AAS_WingsChosen))
					end
				else
					ToggleWings(uuid, false, true)
					_P(GetYellowText("getCurrentWing(uuid) CC after toggle: " .. getCurrentWing(uuid)))
					_P(GetYellowText("entity.Vars.AAS_WingsChosen CC after toggle: " .. entity.Vars.AAS_WingsChosen))
				end					
			end
		end
	--end, charactersEntity)
end)
Ext.Osiris.RegisterListener("LongRestFinished", 0, "after", function()
	--_P(GetYellowText("WOTD [WARN]: Long Rest Finished"))
	-- for _, uuid in pairs(GetPartyWotD()) do
	-- 	local entity = Ext.Entity.Get(uuid)
	-- 	local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
	-- 	if raceTable[race] then
	-- 		local toggleShowWings =  SHOWWINGS
	-- 		if toggleShowWings == false then				
	-- 			overrideWing(entity.Vars.AAS_WingsChosen, uuid, false)
	-- 		elseif toggleShowWings == true then
	-- 			overrideWing(entity.Vars.AAS_WingsChosen, uuid, true)
	-- 		end
	-- 	end
	-- end
end)
Ext.Osiris.RegisterListener("RequestEndTheDaySuccess", 0, "before", function()
	--_P(GetYellowText("WOTD [WARN]: End of Day Requested"))
	-- for _, uuid in pairs(GetPartyWotD()) do
	-- 	local entity = Ext.Entity.Get(uuid)
	-- 	local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
	-- 	if raceTable[race] then
	-- 		local toggleShowWings =  Osi.HasActiveStatus(uuid, "AASIMAR_WINGS_SHOW")
	-- 		if toggleShowWings == 0 then
	-- 			overrideWing(entity.Vars.AAS_WingsChosen, uuid, false)
	-- 		end
	-- 	end
	-- end
end)
Ext.Osiris.RegisterListener("DialogStartRequested", 2, "before", function(target, player)
	--_P(GetYellowText("WOTD [WARN]: Dialog Start Requested"))
	-- local uuid = player
	-- local entity = Ext.Entity.Get(uuid)
	-- local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
	-- if raceTable[race] then
	-- 	local toggleShowWings =  Osi.HasActiveStatus(uuid, "AASIMAR_WINGS_SHOW")
	-- 	if toggleShowWings == 0 then
	-- 		overrideWing(entity.Vars.AAS_WingsChosen, uuid, false)
	-- 	end
	-- end
end)
Ext.Osiris.RegisterListener("DialogEnded", 2, "after", function(dialog, instanceID)
	-- --_P(GetYellowText("WOTD [WARN]: AFTER Dialog Ended"))
	-- for _, character in pairs(GetPartyWotD()) do
	-- 	local uuid = character
	-- 	local entity = Ext.Entity.Get(uuid)
	-- 	local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
	-- 	if raceTable[race] then
	-- 		if Osi.HasActiveStatus(uuid, "IS_WINGING") == 1 then
	-- 			ToggleWings(uuid, true, false)
	-- 			--_P(GetYellowText("WOTD [WARN]: ERROR 003"))
	-- 		else
	-- 			ToggleWings(uuid, false, false)
	-- 		end
	-- 	end
	-- end
	if dialog == "TUT_Start_OriginIntroduction_Default_2a464bcd-c513-d282-e54e-17e6bdbf67b6" then
		--_P(GetYellowText("WOTD [WARN]: INTRO dialog ended"))
		for _, character in pairs(GetPartyWotD()) do
			local uuid = character
			local entity = Ext.Entity.Get(uuid)
			local race = Ext.Entity.Get(uuid):GetAllComponents().CharacterCreationStats.Race
			if raceTable[race] then
				if Osi.HasActiveStatus(uuid, "IS_WINGING") == 1 then
					ToggleWings(uuid, true, true)
					--_P(GetYellowText("WOTD [WARN]: ERROR 002"))
				else
					if IsLowLevelTagTen(uuid) then
						if uuid ~= nil then
							--_P(GetYellowText("WOTD [WARN]: Intro, low level and tag ten: " .. uuid))
							if getCurrentWing(uuid) ~= invisWing then
								entity.Vars.AAS_WingsChosen = getCurrentWing(uuid)
								SyncWings(entity)
								Wait(660, function() Osi.ApplyStatus(uuid,"UNS_WINGS",0)
									ToggleWings(uuid, false, true) end)
							end
							--_P(GetYellowText("WOTD [WARN]: SETTING AAS_WINGSCHOSEN VAR POST INTRO: " .. entity.Vars.AAS_WingsChosen))
						else
							_P(GetYellowText("WOTD [WARN]: uuid is nil"))
						end
					else
						ToggleWings(uuid, false, true)
					end
				end
			end
		end
	end
end)
Ext.Osiris.RegisterListener("DialogEnded", 2, "before", function(dialog, instanceID)
	--_P(GetYellowText("WOTD [WARN]: BEFORE Dialog Ended"))
	-- local DialogInvolved = 1
	-- local dialogIndex = 1
	-- local characters = GetPartyWotD()
	-- local dialogCharacters = {}
	-- DialogInvolved = Osi.DialogGetNumberOfInvolvedPlayers(instanceID)
	-- for _, player in pairs(characters) do
	-- 	local DialogPlayer = Osi.DialogGetInvolvedPlayer(instanceID, dialogIndex)
	-- 	if DialogPlayer ~= nil then
	-- 		dialogIndex = dialogIndex + 1
	-- 		table.insert(dialogCharacters, DialogPlayer)
	-- 	end
	-- end
	-- for _, uuid in pairs(dialogCharacters) do
	-- 	local entity = Ext.Entity.Get(uuid)
	-- 	local race = Ext.Entity.Get(uuid):GetAllComponents().Race.Race
	-- 	if raceTable[race] then
	-- 		if  Osi.HasActiveStatus(uuid, "IS_WINGING") then
	-- 			--ToggleWings(uuid, true, false)
	-- 			--_P(GetYellowText("WOTD [WARN]: ERROR 001"))
	-- 		else
	-- 			--ToggleWings(uuid, false, false)
	-- 		end
	-- 	end		
	-- end
end)
Ext.Osiris.RegisterListener("SavegameLoaded", 0, "after", function()
    -- We track this to prevent doing operations on new game
    SaveLoaded = true
end)