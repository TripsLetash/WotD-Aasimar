---@diagnostic disable: undefined-global

-------------------------------------------------------------------------------------------------
--                                                                                             --
--                                        Logging                                              --
--                                                                                             --
-------------------------------------------------------------------------------------------------

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
