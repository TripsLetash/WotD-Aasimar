---@diagnostic disable: undefined-global

-------------------------------------------------------------------------------------------------
--                                                                                             --
--                                        Logging                                              --
--                                                                                             --
-------------------------------------------------------------------------------------------------
Utils = {}

function Utils.Info(message)
    Ext.Utils.Print(WOTD.modPrefix .. ' [Info] ' .. message)
end

function Utils.Warn(message)
    Ext.Utils.Print(WOTD.modPrefix .. ' [Warning] ' .. message)
end

function Utils.Debug(message)
    Ext.Utils.Print(WOTD.modPrefix .. ' [Debug] ' .. message)
end

function Utils.Error(message)
    Ext.Utils.Print(WOTD.modPrefix .. ' [Error] ' .. message)
end


-------------------------------------------------------------------------------------------------
--                                                                                             --
--                                        utils                                                --
--                                                                                             --
-------------------------------------------------------------------------------------------------

function Utils.contains(list, item)
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
function Utils.stringContains(str, sub)
    return (string.find(str, sub) ~= nil)
end
function Utils.Wait(delayInMs, func)
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
function Utils.GetRainbowText(text)
    local coloredText = ""
    local len = #text
    local step = 360 / len
    local hue = 0

    for i = 1, len do
        local char = text:sub(i, i)
        local r, g, b = Utils.HSVToRGB(hue, 1, 1)
        coloredText = coloredText .. string.format("\x1b[38;2;%d;%d;%dm%s\x1b[0m", r, g, b, char)
        hue = (hue + step) % 360
    end
    return coloredText
end

--@param h integer hue
--@param s integer saturation
--@param v integer value
--@return integer r red
--@return integer g green
--@return integer b blue
function Utils.HSVToRGB(h, s, v)
    local c = v * s
    local hp = h / 60
    local x = c * (1 - math.abs(hp % 2 - 1))
    local r, g, b = 0, 0, 0

    if hp >= 0 and hp <= 1 then
        r, g, b = c, x, 0
    elseif hp >= 1 and hp <= 2 then
        r, g, b = x, c, 0
    elseif hp >= 2 and hp <= 3 then
        r, g, b = 0, c, x
    elseif hp >= 3 and hp <= 4 then
        r, g, b = 0, x, c
    elseif hp >= 4 and hp <= 5 then
        r, g, b = x, 0, c
    elseif hp >= 5 and hp <= 6 then
        r, g, b = c, 0, x
    end

    local m = v - c
    return math.floor((r + m) * 255), math.floor((g + m) * 255), math.floor((b + m) * 255)
end

function Utils.GetMagentaText(text)
	local coloredText = ""
		local color = "35"
		coloredText = string.format("\x1b[%sm%s\x1b[0m", color, text)
return coloredText
end
function Utils.GetYellowText(text)
    local coloredText = ""
        local color = "33"
        coloredText = string.format("\x1b[%sm%s\x1b[0m", color, text)
    return coloredText
end
function Utils.GetGreenText(text)
    local coloredText = ""
        local color = "32"
        coloredText = string.format("\x1b[%sm%s\x1b[0m", color, text)
    return coloredText
end
function Utils.GetBlueText(text)
    local coloredText = ""
        local color = "34"
        coloredText = string.format("\x1b[%sm%s\x1b[0m", color, text)
    return coloredText
end

-- Get all party uuids
function Utils.GetPartyWotD()
	local characters = {}
	local players = Osi.DB_Players:Get(nil)
	for _, player in pairs(players) do
		table.insert(characters, player[1])
	end
	return characters
end