---@diagnostic disable: lowercase-global
------------------------------------------------------
--                                                  --
--                    UI Layout                     --
--                                                  --
------------------------------------------------------
--- Windows
w = Ext.IMGUI.NewWindow("Whispers of the Divine: Aasimar SEE Settings")

-- w:AddText("Test") -- test if you can add above tab bar (works)
--- Tab Bar
tBar = w:AddTabBar("")
tCC = tBar:AddTabItem("Tattoo Options")
-- tSET = tBar:AddTabItem("Settings")
tABO = tBar:AddTabItem("About")

------------------------------------------------------
--                                                  --
--                 Settings Elements                --
--                                                  --
------------------------------------------------------

-- tSET:AddDummy(0,5)
-- tSET:AddSeparatorText("REDACTED Settings")
-- stripCheckBox = tSET:AddCheckbox("Block REDACTED?", true)
-- erectionCheckBox = tSET:AddCheckbox("Would you like to get REDACTED?", true)

------------------------------------------------------
--                                                  --
--                   About Elements                 --
--                                                  --
------------------------------------------------------

tABO:AddDummy(0,5)
tABO:AddSeparatorText("Authors:")
tABO:AddText("Trips")

w.Visible = false
------------------------------------------------------
--                                                  --
--                  Elements to Add                 --
--                                                  --
------------------------------------------------------

---  ExtuiTreeParent:ExtuiStyledRenderable
--- AddBulletText fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddButton fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddCheckbox fun(self:ExtuiTreeParent, a1:string, a2:boolean|nil):ImguiHandle
--- AddCollapsingHeader fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddColorEdit fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddColorPicker fun(self:ExtuiTreeParent, a1:string, a2:vec3|nil):ImguiHandle
--- AddCombo fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddDrag fun(self:ExtuiTreeParent, a1:string, a2:number|nil, a3:number|nil, a4:number|nil):ImguiHandle
--- AddDragInt fun(self:ExtuiTreeParent, a1:string, a2:int32|nil, a3:int32|nil, a4:int32|nil):ImguiHandle
--- AddDummy fun(self:ExtuiTreeParent, a1:number, a2:number):ImguiHandle
--- AddGroup fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddInputInt fun(self:ExtuiTreeParent, a1:string, a2:int32|nil):ImguiHandle
--- AddInputScalar fun(self:ExtuiTreeParent, a1:string, a2:number|nil):ImguiHandle
--- AddInputText fun(self:ExtuiTreeParent, a1:string, a2:string|nil):ImguiHandle
--- AddNewLine fun(self:ExtuiTreeParent):ImguiHandle
--- AddPopup fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddRadioButton fun(self:ExtuiTreeParent, a1:string, a2:boolean|nil):ImguiHandle
--- AddSeparator fun(self:ExtuiTreeParent):ImguiHandle
--- AddSeparatorText fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddSlider fun(self:ExtuiTreeParent, a1:string, a2:number|nil, a3:number|nil, a4:number|nil):ImguiHandle
--- AddSliderInt fun(self:ExtuiTreeParent, a1:string, a2:int32|nil, a3:int32|nil, a4:int32|nil):ImguiHandle
--- AddSpacing fun(self:ExtuiTreeParent):ImguiHandle
--- AddTabBar fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddTable fun(self:ExtuiTreeParent, a1:string, a2:uint32):ImguiHandle
--- AddText fun(self:ExtuiTreeParent, a1:string):ImguiHandle
--- AddTree fun(self:ExtuiTreeParent, a1:string):ImguiHandle

Ext.Events.NetMessage:Subscribe(function(e) 
    if (e.Channel == "GameStartedAndLoadedIn") then
        w.Visible = true
    end
end)