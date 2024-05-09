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
WotDBar = wotdwindow:AddTabBar("")
WotDCC = WotDBar:AddTabItem("Painting")
-- tSET = WotDBar:AddTabItem("Settings")
WotDABO = WotDBar:AddTabItem("How to use")
WotDCRED = WotDBar:AddTabItem("Credits")

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
WotDABO:AddSeparatorText("General")
WotDABO:AddText("First of all, this menu only works in the Mirror.")
WotDABO:AddDummy(0,5)
WotDABO:AddSeparatorText("Customization selection")
WotDABO:AddText("Slide to change the labeled customization.")
WotDABO:AddText("For facetats; The tattoos stack in terms of RGB channels,")
WotDABO:AddText("meaning you can have up to three pre-set tattoos together.")
WotDABO:AddText("Select what's showing using the Layer Visibility checkboxes.")
WotDABO:AddSeparatorText("Atlas Details")
WotDABO:AddText("This menu overrides clown-makeup and HalfIllithid visuals.")
WotDABO:AddText("So for this reason, buttons and options were added to remedy that.")
WotDABO:AddText("The Atlas buttons swap the used Atlas for the particular visuals.")
WotDABO:AddText("See Nexus Mods article on how to customise using the built-in Unique_Tav.")
WotDABO:AddText("Paths and naming convention are in said article.")
WotDABO:AddSeparatorText("Layer Visibility")
WotDABO:AddText("Use Visibility checkboxes to enable/disable visuals.")
WotDABO:AddText("Per layer basis of the Atlas, Red, Blue and Green are supported. Alpha channel is ignored.")
WotDABO:AddSeparatorText("Tattoo Color")
WotDABO:AddText("Color per layer of the Atlas, Red, Blue and Green are supported. Alpha channel is ignored.")
WotDABO:AddText("I suggest using vanilla menu for make-up color. Menu color for tattoos so they match body and face.")
WotDABO:AddText("")



WotDCRED:AddDummy(0,5)
WotDCRED:AddSeparatorText("Author:")
WotDCRED:AddText("Trips")
WotDCRED:AddSeparatorText("Credits:")
WotDCRED:AddText("klementineQt for the guidance and general good vibes")
WotDCRED:AddText("Skiz and Satan for invaluable help and wisdom")
WotDCRED:AddText("Norbyte for making this feature even possible")
WotDCRED:AddText("Simosas for helping out with a big find")
WotDCRED:AddText("In no particular order:")
WotDCRED:AddText("Chronos Perpetua, Kaz and Aahz")
WotDCRED:AddText("My home away from home:")
WotDCRED:AddText("Down by the River Community")
--wotdwindow.Closeable = true
wotdwindow.Visible = false
wotdwindow.NoFocusOnAppearing = true
wotdwindow.Closeable = false
wotdwindow.NoBringToFrontOnFocus = true
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