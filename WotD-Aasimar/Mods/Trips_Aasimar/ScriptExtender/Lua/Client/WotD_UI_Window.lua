---@diagnostic disable: lowercase-global
------------------------------------------------------
--                                                  --
--                    UI Layout                     --
--                                                  --
------------------------------------------------------
--- Windows
wotdwindow = Ext.IMGUI.NewWindow("WotD: Aasimar SEE")

-- wotdwindow:AddText("Test") -- test if you can add above tab bar (works)
--- Tab Bar
tBar = wotdwindow:AddTabBar("")
tCC = tBar:AddTabItem("Painting")
-- tSET = tBar:AddTabItem("Settings")
tABO = tBar:AddTabItem("How to use")
tCRED = tBar:AddTabItem("Credits")

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
tABO:AddSeparatorText("General")
tABO:AddText("First of all, this menu only works in the Mirror.")
tABO:AddDummy(0,5)
tABO:AddSeparatorText("Customization selection")
tABO:AddText("Slide to change the labeled customization.")
tABO:AddText("For facetats; The tattoos stack in terms of RGB channels,")
tABO:AddText("meaning you can have up to three pre-set tattoos together.")
tABO:AddText("Select what's showing using the Layer Visibility checkboxes.")
tABO:AddSeparatorText("Atlas Details")
tABO:AddText("This menu overrides clown-makeup and HalfIllithid visuals.")
tABO:AddText("So for this reason, buttons and options were added to remedy that.")
tABO:AddText("The Atlas buttons swap the used Atlas for the particular visuals.")
tABO:AddText("See Nexus Mods article on how to customise using the built-in Unique_Tav.")
tABO:AddText("Paths and naming convention are in said article.")
tABO:AddSeparatorText("Layer Visibility")
tABO:AddText("Use Visibility checkboxes to enable/disable visuals.")
tABO:AddText("Per layer basis of the Atlas, Red, Blue and Green are supported. Alpha channel is ignored.")
tABO:AddSeparatorText("Tattoo Color")
tABO:AddText("Color per layer of the Atlas, Red, Blue and Green are supported. Alpha channel is ignored.")
tABO:AddText("I suggest using vanilla menu for make-up color. Menu color for tattoos so they match body and face.")
tABO:AddText("")



tCRED:AddDummy(0,5)
tCRED:AddSeparatorText("Author:")
tCRED:AddText("Trips")
tCRED:AddSeparatorText("Credits:")
tCRED:AddText("klementineQt for the guidance and general good vibes")
tCRED:AddText("Skiz and Satan for invaluable help and wisdom")
tCRED:AddText("Norbyte for making this feature even possible")
tCRED:AddText("Simosas for helping out with a big find")
tCRED:AddText("In no particular order:")
tCRED:AddText("Chronos Perpetua, Kaz and Aahz")
tCRED:AddText("My home away from home:")
tCRED:AddText("Down by the River Community")
--wotdwindow.Closeable = true
wotdwindow.Visible = false
wotdwindow.NoFocusOnAppearing = true
wotdwindow.Closeable = true
wotdwindow.Open = false
wotdwindow:SetStyle("WindowMinSize", 500, 500)
wotdwindow:SetStyle("WindowRounding", 30)
wotdwindow:SetStyle("WindowBorderSize", 5)
wotdwindow:SetColor("WindowBg", {0.7824, 0.7824, 0.7824, 0.5})
wotdwindow:SetColor("TitleBg", {0.62, 0.07, 0.07, 0.5})
wotdwindow:SetColor("TitleBgActive", {0.9, 0.07, 0.07, 0.5})
wotdwindow:SetColor("TitleBgCollapsed", {0.42, 0.07, 0.07, 0.5})
wotdwindow:SetColor("Tab", {0.62, 0.07, 0.07, 0.5})
wotdwindow:SetColor("TabActive", {0.9, 0.07, 0.07, 0.5})
wotdwindow:SetColor("TabHovered", {0.42, 0.07, 0.07, 0.5})
wotdwindow:SetColor("TabUnfocused", {0.9, 0.07, 0.07, 0.5})
wotdwindow:SetColor("TabUnfocusedActive", {0.42, 0.07, 0.07, 0.5})
wotdwindow:SetColor("Header", {0.62, 0.07, 0.07, 0.5})
wotdwindow:SetColor("HeaderActive", {0.9, 0.07, 0.07, 0.5})
wotdwindow:SetColor("HeaderHovered", {0.42, 0.07, 0.07, 0.5})
wotdwindow:SetColor("CheckMark", {1, 0.39, 0.39, 0.5})
wotdwindow:SetColor("Border", {0.62, 0.07, 0.07, 0.5})
wotdwindow:SetColor("Button", {0.62, 0.07, 0.07, 0.5})

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
    if (e.Channel == "ChangeAppearanceCompletedWotD") then wotdwindow.Visible = false wotdwindow.Open = false end
    if (e.Channel == "ChangeAppearanceStartedWotD") then wotdwindow.Visible = true wotdwindow.Open = true end
end)


-- Ext.Events.KeyInput:Subscribe(
    
-- function (e)
--     if e.Event == "KeyDown" and e.Repeat == false then
--         if e.Key == "L" then
--             wotdwindow.Visible = true
--             wotdwindow.Open = not wotdwindow.Open
--         end
--     end
-- end)