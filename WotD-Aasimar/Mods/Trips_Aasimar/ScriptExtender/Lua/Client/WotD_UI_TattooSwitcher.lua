---@diagnostic disable: lowercase-global
------------------------------------------------------
--                                                  --
--                 Tattoo Options                   --
--                                                  --
------------------------------------------------------
tCC:AddDummy(0,5)
CCBody = tCC:AddCollapsingHeader("Paint Menu")
CCBody.DefaultOpen = true
tCC:AddSeparatorText("")

tattooAtlasHeader = CCBody:AddCollapsingHeader("Customization Selection")
tattooAtlasHeader.DefaultOpen = true
IndexPickTable = tattooAtlasHeader:AddTable("", 1)
IndexPickRow1 = IndexPickTable:AddRow()
IndexPickRow2 = IndexPickTable:AddRow()
IndexPickRow3 = IndexPickTable:AddRow()
IndexPickRow4 = IndexPickTable:AddRow()
IndexPickRow5 = IndexPickTable:AddRow()
IndexPickRow6 = IndexPickTable:AddRow()
FaceTatsIntSelector = IndexPickRow1:AddCell():AddSliderInt("Face Tattoo (1-16)", 1, 1, 16)
FaceTatsIntSelector.IDContext = "SliderFaceTatsIndex"
BodyTatsIntSelector = IndexPickRow3:AddCell():AddSliderInt("Body Tattoo (1-20)", 1, 1, 20)
BodyTatsIntSelector.IDContext = "SliderBodyTatsIndex"
FaceMakeUpIntSelector = IndexPickRow5:AddCell():AddSliderInt("Make Up (1-16)", 1, 1, 16)
FaceMakeUpIntSelector.IDContext = "SliderMakeupIndex"
tattooOptionsHeader = CCBody:AddCollapsingHeader("Atlas Details")
tattooOptionsHeader.DefaultOpen = true
tattooOptionsTable = tattooOptionsHeader:AddTable("", 3)
tattooOptionsRow1 = tattooOptionsTable:AddRow()
tattooOptionsRow2 = tattooOptionsTable:AddRow()
tattooOptionsRow3 = tattooOptionsTable:AddRow()
tattooOptionsRow4 = tattooOptionsTable:AddRow()
metallicCheckbox = tattooOptionsRow1:AddCell():AddCheckbox("Metallic")
BodyNoCracklesCheckbox = tattooOptionsRow1:AddCell():AddCheckbox("No Crackles")
HalfIllithidCheckbox = tattooOptionsRow1:AddCell():AddCheckbox("Half-Illithid")
BodyAtlas1Button = tattooOptionsRow2:AddCell():AddButton("Body Atlas 1")
HeadAtlas1Button = tattooOptionsRow2:AddCell():AddButton("Face Atlas 1")
MakeupAtlas1Button = tattooOptionsRow2:AddCell():AddButton("Makeup Atlas 1")
BodyAtlas2Button = tattooOptionsRow3:AddCell():AddButton("Body Atlas 2")
HeadAtlas2Button = tattooOptionsRow3:AddCell():AddButton("Face Atlas 2")
MakeupAtlas2Button = tattooOptionsRow3:AddCell():AddButton("Makeup Atlas 2")
BodyAtlas3Button = tattooOptionsRow4:AddCell():AddButton("Body Atlas 3")
HeadAtlas3Button = tattooOptionsRow4:AddCell():AddButton("Face Atlas 3")
MakeupAtlas3Button = tattooOptionsRow4:AddCell():AddButton("Makeup Atlas 3")
--FaceTattooButton = tattooOptionsRow1:AddCell():AddButton("Set Face Tattoo")
metallicCheckbox:SetColor("Button", {0.42, 0.07, 0.07, 0.2})
tattooHideHeader = CCBody:AddCollapsingHeader("Layer Visibility")
tattooHideHeader.DefaultOpen = true
tattooHideTable = tattooHideHeader:AddTable("", 3)
tattooHideRow1 = tattooHideTable:AddRow()
tattooHideRow2 = tattooHideTable:AddRow()
tattooHideRow3 = tattooHideTable:AddRow()
FacetattooHideCheckboxR = tattooHideRow1:AddCell():AddCheckbox("Face: Red")
FacetattooHideCheckboxR:SetColor("Button", {1, 0, 0, 0.2})
FacetattooHideCheckboxR.Checked = false
FacetattooHideCheckboxR:SetColor("CheckMark", {1, 0.39, 0.39, 0.5})
FacetattooHideCheckboxG = tattooHideRow1:AddCell():AddCheckbox("Face: Green")
FacetattooHideCheckboxG:SetColor("Button", {0, 1, 0, 0.2})
FacetattooHideCheckboxG.Checked = false
FacetattooHideCheckboxG:SetColor("CheckMark", {0.72, 1, 0.75, 0.5})
FacetattooHideCheckboxB = tattooHideRow1:AddCell():AddCheckbox("Face: Blue")
FacetattooHideCheckboxB:SetColor("Button", {0, 0, 1, 0.2})
FacetattooHideCheckboxB.Checked = false
FacetattooHideCheckboxB:SetColor("CheckMark", {0.72, 0.92, 1, 0.5})

tattooHideCheckboxR = tattooHideRow2:AddCell():AddCheckbox("Body: Red")
tattooHideCheckboxR:SetColor("Button", {1, 0, 0, 0.2})
tattooHideCheckboxR.Checked = true
tattooHideCheckboxR:SetColor("CheckMark", {1, 0.39, 0.39, 0.5})
tattooHideCheckboxG = tattooHideRow2:AddCell():AddCheckbox("Body: Green")
tattooHideCheckboxG:SetColor("Button", {0, 1, 0, 0.2})
tattooHideCheckboxG.Checked = true
tattooHideCheckboxG:SetColor("CheckMark", {0.72, 1, 0.75, 0.5})
tattooHideCheckboxB = tattooHideRow2:AddCell():AddCheckbox("Body: Blue")
tattooHideCheckboxB:SetColor("Button", {0, 0, 1, 0.2})
tattooHideCheckboxB.Checked = true
tattooHideCheckboxB:SetColor("CheckMark", {0.72, 0.92, 1, 0.5})
makeupHideCheckbox = tattooHideRow3:AddCell():AddCheckbox("MakeUp")
makeupHideCheckbox:SetColor("Button", {1, 0, 0, 0.2})
makeupHideCheckbox.Checked = true
makeupHideCheckbox:SetColor("CheckMark", {1, 0.39, 0.39, 0.5})

tattooColorHeader = CCBody:AddCollapsingHeader("Tattoo Color")
tattooColorHeader.DefaultOpen = true
tColorTab = CCBody:AddTabBar("")
tColorTabRed = tColorTab:AddTabItem("Red Channel")
tColorTabRed:SetColor("Tab", {1,0,0,1})
tColorTabGreen = tColorTab:AddTabItem("Green Channel")
tColorTabGreen:SetColor("Tab", {0.03, 0.35, 0.01,1})
tColorTabBlue = tColorTab:AddTabItem("Blue Channel")
tColorTabBlue:SetColor("Tab", {0,0,1,1})

tattooColorFaceHeaderRed = tColorTabRed:AddCollapsingHeader("Face Tattoo Colors")
tattooColorFaceHeaderRed.DefaultOpen = true
tattooColorFaceRedTable = tattooColorFaceHeaderRed:AddTable("", 10)
tattooColorFaceRedRow1 = tattooColorFaceRedTable:AddRow()
tattooColorFaceRedRow2 = tattooColorFaceRedTable:AddRow()
tattooColorFaceButton1Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton1Red.IDContext = "FaceRed01"
tattooColorFaceButton1Red:SetColor("Button", {0,0,1,1}) --prot blue
tattooColorFaceButton2Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton2Red.IDContext = "FaceRed02"
tattooColorFaceButton2Red:SetColor("Button", {1,1,0,1}) --scourge yellow
tattooColorFaceButton3Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton3Red.IDContext = "FaceRed03"
tattooColorFaceButton3Red:SetColor("Button", {0,1,0,1}) --fallen green
tattooColorFaceButton4Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton4Red.IDContext = "FaceRed04"
tattooColorFaceButton4Red:SetColor("Button", {1,0,0,1}) --harb red
tattooColorFaceButton5Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton5Red.IDContext = "FaceRed05"
tattooColorFaceButton5Red:SetColor("Button", {1,0.00699541,0.2917707,1}) --pink
tattooColorFaceButton6Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton6Red.IDContext = "FaceRed06"
tattooColorFaceButton6Red:SetColor("Button", {1,0,1,1}) --purple
tattooColorFaceButton7Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton7Red.IDContext = "FaceRed07"
tattooColorFaceButton7Red:SetColor("Button", {1,1,1,1}) --white
tattooColorFaceButton8Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton8Red.IDContext = "FaceRed08"
tattooColorFaceButton8Red:SetColor("Button", {0,0,0,1}) --black
tattooColorFaceButton9Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton9Red.IDContext = "FaceRed09"
tattooColorFaceButton9Red:SetColor("Button", {0.2581829,0.05951124,0.00651209,1}) --brown
tattooColorFaceButton10Red = tattooColorFaceRedRow1:AddCell():AddButton("  ")
tattooColorFaceButton10Red.IDContext = "FaceRed10"
tattooColorFaceButton10Red:SetColor("Button", {1,0.3762622,0,1}) --orange
tattooColorFaceButton11Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton11Red.IDContext = "FaceRed11"
tattooColorFaceButton11Red:SetColor("Button", {0.4,0.78,0.73,1}) --fallen
tattooColorFaceButton12Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton12Red.IDContext = "FaceRed12"
tattooColorFaceButton12Red:SetColor("Button", {0.03,0.84,0.93,1}) --lightblue
tattooColorFaceButton13Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton13Red.IDContext = "FaceRed13"
tattooColorFaceButton13Red:SetColor("Button", {1,0.82,0.31,1}) --Pee yellow
tattooColorFaceButton14Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton14Red.IDContext = "FaceRed14"
tattooColorFaceButton14Red:SetColor("Button", {0.68,0.44,0,1}) --Gold
tattooColorFaceButton15Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton15Red.IDContext = "FaceRed15"
tattooColorFaceButton15Red:SetColor("Button", {0.99,0.7,1,1}) --Lightpink
tattooColorFaceButton16Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton16Red.IDContext = "FaceRed16"
tattooColorFaceButton16Red:SetColor("Button", {0.55,0.29,0.37,1}) --Darkpink
tattooColorFaceButton17Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton17Red.IDContext = "FaceRed17"
tattooColorFaceButton17Red:SetColor("Button", {0.59,0.59,0.59,1}) --Lightsilver
tattooColorFaceButton18Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton18Red.IDContext = "FaceRed18"
tattooColorFaceButton18Red:SetColor("Button", {0.26,0.26,0.26,1}) --DarkSilver
tattooColorFaceButton19Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton19Red.IDContext = "FaceRed19"
tattooColorFaceButton19Red:SetColor("Button", {0.79,0.61,0.88,1}) --Lightpurple
tattooColorFaceButton20Red = tattooColorFaceRedRow2:AddCell():AddButton("  ")
tattooColorFaceButton20Red.IDContext = "FaceRed20"
tattooColorFaceButton20Red:SetColor("Button", {0.28,0.4,0.29,1}) --Olive

tattooColorFaceHeaderGreen = tColorTabGreen:AddCollapsingHeader("Face Tattoo Colors")
tattooColorFaceHeaderGreen.DefaultOpen = true
tattooColorFaceGreenTable = tattooColorFaceHeaderGreen:AddTable("", 10)
tattooColorFaceGreenRow1 = tattooColorFaceGreenTable:AddRow()
tattooColorFaceGreenRow2 = tattooColorFaceGreenTable:AddRow()
tattooColorFaceButton1Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton1Green.IDContext = "FaceGreen01"
tattooColorFaceButton1Green:SetColor("Button", {0,0,1,1}) --prot blue
tattooColorFaceButton2Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton2Green.IDContext = "FaceGreen02"
tattooColorFaceButton2Green:SetColor("Button", {1,1,0,1}) --scourge yellow
tattooColorFaceButton3Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton3Green.IDContext = "FaceGreen03"
tattooColorFaceButton3Green:SetColor("Button", {0,1,0,1}) --fallen green
tattooColorFaceButton4Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton4Green.IDContext = "FaceGreen04"
tattooColorFaceButton4Green:SetColor("Button", {1,0,0,1}) --harb Green
tattooColorFaceButton5Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton5Green.IDContext = "FaceGreen05"
tattooColorFaceButton5Green:SetColor("Button", {1,0.00699541,0.2917707,1}) --pink
tattooColorFaceButton6Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton6Green.IDContext = "FaceGreen06"
tattooColorFaceButton6Green:SetColor("Button", {1,0,1,1}) --purple
tattooColorFaceButton7Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton7Green.IDContext = "FaceGreen07"
tattooColorFaceButton7Green:SetColor("Button", {1,1,1,1}) --white
tattooColorFaceButton8Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton8Green.IDContext = "FaceGreen08"
tattooColorFaceButton8Green:SetColor("Button", {0,0,0,1}) --black
tattooColorFaceButton9Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton9Green.IDContext = "FaceGreen09"
tattooColorFaceButton9Green:SetColor("Button", {0.2581829,0.05951124,0.00651209,1}) --brown
tattooColorFaceButton10Green = tattooColorFaceGreenRow1:AddCell():AddButton("  ")
tattooColorFaceButton10Green.IDContext = "FaceGreen10"
tattooColorFaceButton10Green:SetColor("Button", {1,0.3762622,0,1}) --orange
tattooColorFaceButton11Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton11Green.IDContext = "FaceGreen11"
tattooColorFaceButton11Green:SetColor("Button", {0.4,0.78,0.73,1}) --fallen
tattooColorFaceButton12Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton12Green.IDContext = "FaceGreen12"
tattooColorFaceButton12Green:SetColor("Button", {0.03,0.84,0.93,1}) --lightblue
tattooColorFaceButton13Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton13Green.IDContext = "FaceGreen13"
tattooColorFaceButton13Green:SetColor("Button", {1,0.82,0.31,1}) --Pee yellow
tattooColorFaceButton14Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton14Green.IDContext = "FaceGreen14"
tattooColorFaceButton14Green:SetColor("Button", {0.68,0.44,0,1}) --Gold
tattooColorFaceButton15Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton15Green.IDContext = "FaceGreen15"
tattooColorFaceButton15Green:SetColor("Button", {0.99,0.7,1,1}) --Lightpink
tattooColorFaceButton16Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton16Green.IDContext = "FaceGreen16"
tattooColorFaceButton16Green:SetColor("Button", {0.55,0.29,0.37,1}) --Darkpink
tattooColorFaceButton17Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton17Green.IDContext = "FaceGreen17"
tattooColorFaceButton17Green:SetColor("Button", {0.59,0.59,0.59,1}) --Lightsilver
tattooColorFaceButton18Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton18Green.IDContext = "FaceGreen18"
tattooColorFaceButton18Green:SetColor("Button", {0.26,0.26,0.26,1}) --DarkSilver
tattooColorFaceButton19Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton19Green.IDContext = "FaceGreen19"
tattooColorFaceButton19Green:SetColor("Button", {0.79,0.61,0.88,1}) --Lightpurple
tattooColorFaceButton20Green = tattooColorFaceGreenRow2:AddCell():AddButton("  ")
tattooColorFaceButton20Green.IDContext = "FaceGreen20"
tattooColorFaceButton20Green:SetColor("Button", {0.28,0.4,0.29,1}) --Olive

tattooColorFaceHeaderBlue = tColorTabBlue:AddCollapsingHeader("Face Tattoo Colors")
tattooColorFaceHeaderBlue.DefaultOpen = true
tattooColorFaceBlueTable = tattooColorFaceHeaderBlue:AddTable("", 10)
tattooColorFaceBlueRow1 = tattooColorFaceBlueTable:AddRow()
tattooColorFaceBlueRow2 = tattooColorFaceBlueTable:AddRow()
tattooColorFaceButton1Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton1Blue.IDContext = "FaceBlue01"
tattooColorFaceButton1Blue:SetColor("Button", {0,0,1,1}) --prot blue
tattooColorFaceButton2Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton2Blue.IDContext = "FaceBlue02"
tattooColorFaceButton2Blue:SetColor("Button", {1,1,0,1}) --scourge yellow
tattooColorFaceButton3Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton3Blue.IDContext = "FaceBlue03"
tattooColorFaceButton3Blue:SetColor("Button", {0,1,0,1}) --fallen Blue
tattooColorFaceButton4Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton4Blue.IDContext = "FaceBlue04"
tattooColorFaceButton4Blue:SetColor("Button", {1,0,0,1}) --harb Blue
tattooColorFaceButton5Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton5Blue.IDContext = "FaceBlue05"
tattooColorFaceButton5Blue:SetColor("Button", {1,0.00699541,0.2917707,1}) --pink
tattooColorFaceButton6Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton6Blue.IDContext = "FaceBlue06"
tattooColorFaceButton6Blue:SetColor("Button", {1,0,1,1}) --purple
tattooColorFaceButton7Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton7Blue.IDContext = "FaceBlue07"
tattooColorFaceButton7Blue:SetColor("Button", {1,1,1,1}) --white
tattooColorFaceButton8Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton8Blue.IDContext = "FaceBlue08"
tattooColorFaceButton8Blue:SetColor("Button", {0,0,0,1}) --black
tattooColorFaceButton9Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton9Blue.IDContext = "FaceBlue09"
tattooColorFaceButton9Blue:SetColor("Button", {0.2581829,0.05951124,0.00651209,1}) --brown
tattooColorFaceButton10Blue = tattooColorFaceBlueRow1:AddCell():AddButton("  ")
tattooColorFaceButton10Blue.IDContext = "FaceBlue10"
tattooColorFaceButton10Blue:SetColor("Button", {1,0.3762622,0,1}) --orange
tattooColorFaceButton11Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton11Blue.IDContext = "FaceBlue11"
tattooColorFaceButton11Blue:SetColor("Button", {0.4,0.78,0.73,1}) --fallen
tattooColorFaceButton12Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton12Blue.IDContext = "FaceBlue12"
tattooColorFaceButton12Blue:SetColor("Button", {0.03,0.84,0.93,1}) --lightblue
tattooColorFaceButton13Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton13Blue.IDContext = "FaceBlue13"
tattooColorFaceButton13Blue:SetColor("Button", {1,0.82,0.31,1}) --Pee yellow
tattooColorFaceButton14Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton14Blue.IDContext = "FaceBlue14"
tattooColorFaceButton14Blue:SetColor("Button", {0.68,0.44,0,1}) --Gold
tattooColorFaceButton15Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton15Blue.IDContext = "FaceBlue15"
tattooColorFaceButton15Blue:SetColor("Button", {0.99,0.7,1,1}) --Lightpink
tattooColorFaceButton16Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton16Blue.IDContext = "FaceBlue16"
tattooColorFaceButton16Blue:SetColor("Button", {0.55,0.29,0.37,1}) --Darkpink
tattooColorFaceButton17Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton17Blue.IDContext = "FaceBlue17"
tattooColorFaceButton17Blue:SetColor("Button", {0.59,0.59,0.59,1}) --Lightsilver
tattooColorFaceButton18Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton18Blue.IDContext = "FaceBlue18"
tattooColorFaceButton18Blue:SetColor("Button", {0.26,0.26,0.26,1}) --DarkSilver
tattooColorFaceButton19Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton19Blue.IDContext = "FaceBlue19"
tattooColorFaceButton19Blue:SetColor("Button", {0.79,0.61,0.88,1}) --Lightpurple
tattooColorFaceButton20Blue = tattooColorFaceBlueRow2:AddCell():AddButton("  ")
tattooColorFaceButton20Blue.IDContext = "FaceBlue20"
tattooColorFaceButton20Blue:SetColor("Button", {0.28,0.4,0.29,1}) --Olive

tattooColorHeaderRed = tColorTabRed:AddCollapsingHeader("Body Tattoo Colors")
tattooColorHeaderRed.DefaultOpen = true
tattooColorRedTable = tattooColorHeaderRed:AddTable("", 10)
tattooColorRedRow1 = tattooColorRedTable:AddRow()
tattooColorRedRow2 = tattooColorRedTable:AddRow()
tattooColorButton1Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton1Red.IDContext = "Red01"
tattooColorButton1Red:SetColor("Button", {0,0,1,1}) --prot blue
tattooColorButton2Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton2Red.IDContext = "Red02"
tattooColorButton2Red:SetColor("Button", {1,1,0,1}) --scourge yellow
tattooColorButton3Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton3Red.IDContext = "Red03"
tattooColorButton3Red:SetColor("Button", {0,1,0,1}) --fallen green
tattooColorButton4Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton4Red.IDContext = "Red04"
tattooColorButton4Red:SetColor("Button", {1,0,0,1}) --harb red
tattooColorButton5Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton5Red.IDContext = "Red05"
tattooColorButton5Red:SetColor("Button", {1,0.00699541,0.2917707,1}) --pink
tattooColorButton6Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton6Red.IDContext = "Red06"
tattooColorButton6Red:SetColor("Button", {1,0,1,1}) --purple
tattooColorButton7Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton7Red.IDContext = "Red07"
tattooColorButton7Red:SetColor("Button", {1,1,1,1}) --white
tattooColorButton8Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton8Red.IDContext = "Red08"
tattooColorButton8Red:SetColor("Button", {0,0,0,1}) --black
tattooColorButton9Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton9Red.IDContext = "Red09"
tattooColorButton9Red:SetColor("Button", {0.2581829,0.05951124,0.00651209,1}) --brown
tattooColorButton10Red = tattooColorRedRow1:AddCell():AddButton("  ")
tattooColorButton10Red.IDContext = "Red10"
tattooColorButton10Red:SetColor("Button", {1,0.3762622,0,1}) --orange
tattooColorButton11Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton11Red.IDContext = "Red11"
tattooColorButton11Red:SetColor("Button", {0.4,0.78,0.73,1}) --fallen
tattooColorButton12Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton12Red.IDContext = "Red12"
tattooColorButton12Red:SetColor("Button", {0.03,0.84,0.93,1}) --lightblue
tattooColorButton13Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton13Red.IDContext = "Red13"
tattooColorButton13Red:SetColor("Button", {1,0.82,0.31,1}) --Pee yellow
tattooColorButton14Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton14Red.IDContext = "Red14"
tattooColorButton14Red:SetColor("Button", {0.68,0.44,0,1}) --Gold
tattooColorButton15Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton15Red.IDContext = "Red15"
tattooColorButton15Red:SetColor("Button", {0.99,0.7,1,1}) --Lightpink
tattooColorButton16Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton16Red.IDContext = "Red16"
tattooColorButton16Red:SetColor("Button", {0.55,0.29,0.37,1}) --Darkpink
tattooColorButton17Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton17Red.IDContext = "Red17"
tattooColorButton17Red:SetColor("Button", {0.59,0.59,0.59,1}) --Lightsilver
tattooColorButton18Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton18Red.IDContext = "Red18"
tattooColorButton18Red:SetColor("Button", {0.26,0.26,0.26,1}) --DarkSilver
tattooColorButton19Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton19Red.IDContext = "Red19"
tattooColorButton19Red:SetColor("Button", {0.79,0.61,0.88,1}) --Lightpurple
tattooColorButton20Red = tattooColorRedRow2:AddCell():AddButton("  ")
tattooColorButton20Red.IDContext = "Red20"
tattooColorButton20Red:SetColor("Button", {0.28,0.4,0.29,1}) --Olive

tattooColorHeaderGreen = tColorTabGreen:AddCollapsingHeader("Body Tattoo Colors")
tattooColorHeaderGreen.DefaultOpen = true
tattooColorGreenTable = tattooColorHeaderGreen:AddTable("", 10)
tattooColorGreenRow1 = tattooColorGreenTable:AddRow()
tattooColorGreenRow2 = tattooColorGreenTable:AddRow()
tattooColorButton1Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton1Green.IDContext = "Green01"
tattooColorButton1Green:SetColor("Button", {0,0,1,1}) --prot blue
tattooColorButton2Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton2Green.IDContext = "Green02"
tattooColorButton2Green:SetColor("Button", {1,1,0,1}) --scourge yellow
tattooColorButton3Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton3Green.IDContext = "Green03"
tattooColorButton3Green:SetColor("Button", {0,1,0,1}) --fallen green
tattooColorButton4Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton4Green.IDContext = "Green04"
tattooColorButton4Green:SetColor("Button", {1,0,0,1}) --harb Green
tattooColorButton5Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton5Green.IDContext = "Green05"
tattooColorButton5Green:SetColor("Button", {1,0.00699541,0.2917707,1}) --pink
tattooColorButton6Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton6Green.IDContext = "Green06"
tattooColorButton6Green:SetColor("Button", {1,0,1,1}) --purple
tattooColorButton7Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton7Green.IDContext = "Green07"
tattooColorButton7Green:SetColor("Button", {1,1,1,1}) --white
tattooColorButton8Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton8Green.IDContext = "Green08"
tattooColorButton8Green:SetColor("Button", {0,0,0,1}) --black
tattooColorButton9Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton9Green.IDContext = "Green09"
tattooColorButton9Green:SetColor("Button", {0.2581829,0.05951124,0.00651209,1}) --brown
tattooColorButton10Green = tattooColorGreenRow1:AddCell():AddButton("  ")
tattooColorButton10Green.IDContext = "Green10"
tattooColorButton10Green:SetColor("Button", {1,0.3762622,0,1}) --orange
tattooColorButton11Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton11Green.IDContext = "Green11"
tattooColorButton11Green:SetColor("Button", {0.4,0.78,0.73,1}) --fallen
tattooColorButton12Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton12Green.IDContext = "Green12"
tattooColorButton12Green:SetColor("Button", {0.03,0.84,0.93,1}) --lightblue
tattooColorButton13Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton13Green.IDContext = "Green13"
tattooColorButton13Green:SetColor("Button", {1,0.82,0.31,1}) --Pee yellow
tattooColorButton14Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton14Green.IDContext = "Green14"
tattooColorButton14Green:SetColor("Button", {0.68,0.44,0,1}) --Gold
tattooColorButton15Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton15Green.IDContext = "Green15"
tattooColorButton15Green:SetColor("Button", {0.99,0.7,1,1}) --Lightpink
tattooColorButton16Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton16Green.IDContext = "Green16"
tattooColorButton16Green:SetColor("Button", {0.55,0.29,0.37,1}) --Darkpink
tattooColorButton17Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton17Green.IDContext = "Green17"
tattooColorButton17Green:SetColor("Button", {0.59,0.59,0.59,1}) --Lightsilver
tattooColorButton18Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton18Green.IDContext = "Green18"
tattooColorButton18Green:SetColor("Button", {0.26,0.26,0.26,1}) --DarkSilver
tattooColorButton19Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton19Green.IDContext = "Green19"
tattooColorButton19Green:SetColor("Button", {0.79,0.61,0.88,1}) --Lightpurple
tattooColorButton20Green = tattooColorGreenRow2:AddCell():AddButton("  ")
tattooColorButton20Green.IDContext = "Green20"
tattooColorButton20Green:SetColor("Button", {0.28,0.4,0.29,1}) --Olive

tattooColorHeaderBlue = tColorTabBlue:AddCollapsingHeader("Body Tattoo Colors")
tattooColorHeaderBlue.DefaultOpen = true
tattooColorBlueTable = tattooColorHeaderBlue:AddTable("", 10)
tattooColorBlueRow1 = tattooColorBlueTable:AddRow()
tattooColorBlueRow2 = tattooColorBlueTable:AddRow()
tattooColorButton1Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton1Blue.IDContext = "Blue01"
tattooColorButton1Blue:SetColor("Button", {0,0,1,1}) --prot blue
tattooColorButton2Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton2Blue.IDContext = "Blue02"
tattooColorButton2Blue:SetColor("Button", {1,1,0,1}) --scourge yellow
tattooColorButton3Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton3Blue.IDContext = "Blue03"
tattooColorButton3Blue:SetColor("Button", {0,1,0,1}) --fallen Blue
tattooColorButton4Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton4Blue.IDContext = "Blue04"
tattooColorButton4Blue:SetColor("Button", {1,0,0,1}) --harb Blue
tattooColorButton5Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton5Blue.IDContext = "Blue05"
tattooColorButton5Blue:SetColor("Button", {1,0.00699541,0.2917707,1}) --pink
tattooColorButton6Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton6Blue.IDContext = "Blue06"
tattooColorButton6Blue:SetColor("Button", {1,0,1,1}) --purple
tattooColorButton7Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton7Blue.IDContext = "Blue07"
tattooColorButton7Blue:SetColor("Button", {1,1,1,1}) --white
tattooColorButton8Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton8Blue.IDContext = "Blue08"
tattooColorButton8Blue:SetColor("Button", {0,0,0,1}) --black
tattooColorButton9Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton9Blue.IDContext = "Blue09"
tattooColorButton9Blue:SetColor("Button", {0.2581829,0.05951124,0.00651209,1}) --brown
tattooColorButton10Blue = tattooColorBlueRow1:AddCell():AddButton("  ")
tattooColorButton10Blue.IDContext = "Blue10"
tattooColorButton10Blue:SetColor("Button", {1,0.3762622,0,1}) --orange
tattooColorButton11Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton11Blue.IDContext = "Blue11"
tattooColorButton11Blue:SetColor("Button", {0.4,0.78,0.73,1}) --fallen
tattooColorButton12Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton12Blue.IDContext = "Blue12"
tattooColorButton12Blue:SetColor("Button", {0.03,0.84,0.93,1}) --lightblue
tattooColorButton13Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton13Blue.IDContext = "Blue13"
tattooColorButton13Blue:SetColor("Button", {1,0.82,0.31,1}) --Pee yellow
tattooColorButton14Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton14Blue.IDContext = "Blue14"
tattooColorButton14Blue:SetColor("Button", {0.68,0.44,0,1}) --Gold
tattooColorButton15Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton15Blue.IDContext = "Blue15"
tattooColorButton15Blue:SetColor("Button", {0.99,0.7,1,1}) --Lightpink
tattooColorButton16Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton16Blue.IDContext = "Blue16"
tattooColorButton16Blue:SetColor("Button", {0.55,0.29,0.37,1}) --Darkpink
tattooColorButton17Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton17Blue.IDContext = "Blue17"
tattooColorButton17Blue:SetColor("Button", {0.59,0.59,0.59,1}) --Lightsilver
tattooColorButton18Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton18Blue.IDContext = "Blue18"
tattooColorButton18Blue:SetColor("Button", {0.26,0.26,0.26,1}) --DarkSilver
tattooColorButton19Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton19Blue.IDContext = "Blue19"
tattooColorButton19Blue:SetColor("Button", {0.79,0.61,0.88,1}) --Lightpurple
tattooColorButton20Blue = tattooColorBlueRow2:AddCell():AddButton("  ")
tattooColorButton20Blue.IDContext = "Blue20"
tattooColorButton20Blue:SetColor("Button", {0.28,0.4,0.29,1}) --Olive
--Post messages for UI
BodyTatsIntSelector.OnChange = function() Ext.Net.PostMessageToServer("tattooBody_Index"..BodyTatsIntSelector.Value[1], "OnChange") UpdateCC() end
metallicCheckbox.OnChange = function() Ext.Net.PostMessageToServer("tattooMetallic", "OnChanged") UpdateCC() end
BodyAtlas1Button.OnClick = function() Ext.Net.PostMessageToServer("tattooBodyAtlas1", "OnClick") UpdateCC() end
BodyAtlas2Button.OnClick = function() Ext.Net.PostMessageToServer("tattooBodyAtlas2", "OnClick") UpdateCC() end
BodyAtlas3Button.OnClick = function() Ext.Net.PostMessageToServer("tattooBodyAtlas3", "OnClick") UpdateCC() end
HeadAtlas1Button.OnClick = function() Ext.Net.PostMessageToServer("tattooFaceAtlas1", "OnClick") UpdateCC() end
HeadAtlas2Button.OnClick = function() Ext.Net.PostMessageToServer("tattooFaceAtlas2", "OnClick") UpdateCC() end
HeadAtlas3Button.OnClick = function() Ext.Net.PostMessageToServer("tattooFaceAtlas3", "OnClick") UpdateCC() end
MakeupAtlas1Button.OnClick = function() Ext.Net.PostMessageToServer("makeupFaceAtlas1", "OnClick") UpdateCC() end
MakeupAtlas2Button.OnClick = function() Ext.Net.PostMessageToServer("makeupFaceAtlas2", "OnClick") UpdateCC() end
MakeupAtlas3Button.OnClick = function() Ext.Net.PostMessageToServer("makeupFaceAtlas3", "OnClick") UpdateCC() end
FaceTatsIntSelector.OnChange = function() Ext.Net.PostMessageToServer("tattooFace_Index"..FaceTatsIntSelector.Value[1], "OnChange") UpdateCC() end
FaceMakeUpIntSelector.OnChange = function() Ext.Net.PostMessageToServer("makeupFace_Index"..FaceMakeUpIntSelector.Value[1], "OnChange") UpdateCC() end
BodyNoCracklesCheckbox.OnChange = function() Ext.Net.PostMessageToServer("bodyTexVTNoCrackles", "OnChanged") UpdateCC() end
tattooColorFaceButton1Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton1Red", "OnClick") UpdateCC() end
tattooColorFaceButton1Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton1Green", "OnClick") UpdateCC() end
tattooColorFaceButton1Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton1Blue", "OnClick") UpdateCC() end
tattooColorFaceButton2Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton2Red", "OnClick") UpdateCC() end
tattooColorFaceButton2Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton2Green", "OnClick") UpdateCC() end
tattooColorFaceButton2Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton2Blue", "OnClick") UpdateCC() end
tattooColorFaceButton3Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton3Red", "OnClick") UpdateCC() end
tattooColorFaceButton3Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton3Green", "OnClick") UpdateCC() end
tattooColorFaceButton3Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton3Blue", "OnClick") UpdateCC() end
tattooColorFaceButton4Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton4Red", "OnClick") UpdateCC() end
tattooColorFaceButton4Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton4Green", "OnClick") UpdateCC() end
tattooColorFaceButton4Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton4Blue", "OnClick") UpdateCC() end
tattooColorFaceButton5Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton5Red", "OnClick") UpdateCC() end
tattooColorFaceButton5Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton5Green", "OnClick") UpdateCC() end
tattooColorFaceButton5Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton5Blue", "OnClick") UpdateCC() end
tattooColorFaceButton6Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton6Red", "OnClick") UpdateCC() end
tattooColorFaceButton6Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton6Green", "OnClick") UpdateCC() end
tattooColorFaceButton6Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton6Blue", "OnClick") UpdateCC() end
tattooColorFaceButton7Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton7Red", "OnClick") UpdateCC() end
tattooColorFaceButton7Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton7Green", "OnClick") UpdateCC() end
tattooColorFaceButton7Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton7Blue", "OnClick") UpdateCC() end
tattooColorFaceButton8Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton8Red", "OnClick") UpdateCC() end
tattooColorFaceButton8Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton8Green", "OnClick") UpdateCC() end
tattooColorFaceButton8Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton8Blue", "OnClick") UpdateCC() end
tattooColorFaceButton9Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton9Red", "OnClick") UpdateCC() end
tattooColorFaceButton9Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton9Green", "OnClick") UpdateCC() end
tattooColorFaceButton9Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton9Blue", "OnClick") UpdateCC() end
tattooColorFaceButton10Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton10Red", "OnClick") UpdateCC() end
tattooColorFaceButton10Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton10Green", "OnClick") UpdateCC() end
tattooColorFaceButton10Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton10Blue", "OnClick") UpdateCC() end
tattooColorFaceButton11Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton11Red", "OnClick") UpdateCC() end
tattooColorFaceButton11Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton11Green", "OnClick") UpdateCC() end
tattooColorFaceButton11Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton11Blue", "OnClick") UpdateCC() end
tattooColorFaceButton12Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton12Red", "OnClick") UpdateCC() end
tattooColorFaceButton12Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton12Green", "OnClick") UpdateCC() end
tattooColorFaceButton12Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton12Blue", "OnClick") UpdateCC() end
tattooColorFaceButton13Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton13Red", "OnClick") UpdateCC() end
tattooColorFaceButton13Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton13Green", "OnClick") UpdateCC() end
tattooColorFaceButton13Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton13Blue", "OnClick") UpdateCC() end
tattooColorFaceButton14Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton14Red", "OnClick") UpdateCC() end
tattooColorFaceButton14Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton14Green", "OnClick") UpdateCC() end
tattooColorFaceButton14Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton14Blue", "OnClick") UpdateCC() end
tattooColorFaceButton15Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton15Red", "OnClick") UpdateCC() end
tattooColorFaceButton15Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton15Green", "OnClick") UpdateCC() end
tattooColorFaceButton15Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton15Blue", "OnClick") UpdateCC() end
tattooColorFaceButton16Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton16Red", "OnClick") UpdateCC() end
tattooColorFaceButton16Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton16Green", "OnClick") UpdateCC() end
tattooColorFaceButton16Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton16Blue", "OnClick") UpdateCC() end
tattooColorFaceButton17Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton17Red", "OnClick") UpdateCC() end
tattooColorFaceButton17Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton17Green", "OnClick") UpdateCC() end
tattooColorFaceButton17Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton17Blue", "OnClick") UpdateCC() end
tattooColorFaceButton18Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton18Red", "OnClick") UpdateCC() end
tattooColorFaceButton18Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton18Green", "OnClick") UpdateCC() end
tattooColorFaceButton18Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton18Blue", "OnClick") UpdateCC() end
tattooColorFaceButton19Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton19Red", "OnClick") UpdateCC() end
tattooColorFaceButton19Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton19Green", "OnClick") UpdateCC() end
tattooColorFaceButton19Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton19Blue", "OnClick") UpdateCC() end
tattooColorFaceButton20Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton20Red", "OnClick") UpdateCC() end
tattooColorFaceButton20Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton20Green", "OnClick") UpdateCC() end
tattooColorFaceButton20Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorFaceButton20Blue", "OnClick") UpdateCC() end

tattooColorButton1Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton1Red", "OnClick") UpdateCC() end
tattooColorButton1Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton1Green", "OnClick") UpdateCC() end
tattooColorButton1Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton1Blue", "OnClick") UpdateCC() end
tattooColorButton2Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton2Red", "OnClick") UpdateCC() end
tattooColorButton2Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton2Green", "OnClick") UpdateCC() end
tattooColorButton2Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton2Blue", "OnClick") UpdateCC() end
tattooColorButton3Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton3Red", "OnClick") UpdateCC() end
tattooColorButton3Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton3Green", "OnClick") UpdateCC() end
tattooColorButton3Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton3Blue", "OnClick") UpdateCC() end
tattooColorButton4Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton4Red", "OnClick") UpdateCC() end
tattooColorButton4Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton4Green", "OnClick") UpdateCC() end
tattooColorButton4Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton4Blue", "OnClick") UpdateCC() end
tattooColorButton5Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton5Red", "OnClick") UpdateCC() end
tattooColorButton5Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton5Green", "OnClick") UpdateCC() end
tattooColorButton5Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton5Blue", "OnClick") UpdateCC() end
tattooColorButton6Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton6Red", "OnClick") UpdateCC() end
tattooColorButton6Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton6Green", "OnClick") UpdateCC() end
tattooColorButton6Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton6Blue", "OnClick") UpdateCC() end
tattooColorButton7Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton7Red", "OnClick") UpdateCC() end
tattooColorButton7Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton7Green", "OnClick") UpdateCC() end
tattooColorButton7Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton7Blue", "OnClick") UpdateCC() end
tattooColorButton8Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton8Red", "OnClick") UpdateCC() end
tattooColorButton8Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton8Green", "OnClick") UpdateCC() end
tattooColorButton8Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton8Blue", "OnClick") UpdateCC() end
tattooColorButton9Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton9Red", "OnClick") UpdateCC() end
tattooColorButton9Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton9Green", "OnClick") UpdateCC() end
tattooColorButton9Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton9Blue", "OnClick") UpdateCC() end
tattooColorButton10Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton10Red", "OnClick") UpdateCC() end
tattooColorButton10Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton10Green", "OnClick") UpdateCC() end
tattooColorButton10Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton10Blue", "OnClick") UpdateCC() end
tattooColorButton11Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton11Red", "OnClick") UpdateCC() end
tattooColorButton11Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton11Green", "OnClick") UpdateCC() end
tattooColorButton11Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton11Blue", "OnClick") UpdateCC() end
tattooColorButton12Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton12Red", "OnClick") UpdateCC() end
tattooColorButton12Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton12Green", "OnClick") UpdateCC() end
tattooColorButton12Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton12Blue", "OnClick") UpdateCC() end
tattooColorButton13Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton13Red", "OnClick") UpdateCC() end
tattooColorButton13Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton13Green", "OnClick") UpdateCC() end
tattooColorButton13Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton13Blue", "OnClick") UpdateCC() end
tattooColorButton14Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton14Red", "OnClick") UpdateCC() end
tattooColorButton14Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton14Green", "OnClick") UpdateCC() end
tattooColorButton14Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton14Blue", "OnClick") UpdateCC() end
tattooColorButton15Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton15Red", "OnClick") UpdateCC() end
tattooColorButton15Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton15Green", "OnClick") UpdateCC() end
tattooColorButton15Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton15Blue", "OnClick") UpdateCC() end
tattooColorButton16Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton16Red", "OnClick") UpdateCC() end
tattooColorButton16Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton16Green", "OnClick") UpdateCC() end
tattooColorButton16Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton16Blue", "OnClick") UpdateCC() end
tattooColorButton17Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton17Red", "OnClick") UpdateCC() end
tattooColorButton17Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton17Green", "OnClick") UpdateCC() end
tattooColorButton17Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton17Blue", "OnClick") UpdateCC() end
tattooColorButton18Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton18Red", "OnClick") UpdateCC() end
tattooColorButton18Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton18Green", "OnClick") UpdateCC() end
tattooColorButton18Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton18Blue", "OnClick") UpdateCC() end
tattooColorButton19Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton19Red", "OnClick") UpdateCC() end
tattooColorButton19Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton19Green", "OnClick") UpdateCC() end
tattooColorButton19Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton19Blue", "OnClick") UpdateCC() end
tattooColorButton20Red.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton20Red", "OnClick") UpdateCC() end
tattooColorButton20Green.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton20Green", "OnClick") UpdateCC() end
tattooColorButton20Blue.OnClick = function() Ext.Net.PostMessageToServer("tattooColorButton20Blue", "OnClick") UpdateCC() end
tattooHideCheckboxR.OnChange = function() 
    if tattooHideCheckboxR.Checked then
        if tattooHideCheckboxG.Checked then
            if tattooHideCheckboxB.Checked then
                --do rgb show
                Ext.Net.PostMessageToServer("Opacity_RGB", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do rg show
                Ext.Net.PostMessageToServer("Opacity_RG", "OnClick") UpdateCC()
            end
        elseif tattooHideCheckboxG.Checked == false then
            if tattooHideCheckboxB.Checked then
                --do rb show
                Ext.Net.PostMessageToServer("Opacity_RB", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do r show
                Ext.Net.PostMessageToServer("Opacity_R", "OnClick") UpdateCC()
            end
        end
    elseif tattooHideCheckboxR.Checked == false then
        if tattooHideCheckboxG.Checked then
            if tattooHideCheckboxB.Checked then
                --do gb show
                Ext.Net.PostMessageToServer("Opacity_GB", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do g show
                Ext.Net.PostMessageToServer("Opacity_G", "OnClick") UpdateCC()
            end
        elseif tattooHideCheckboxG.Checked == false then
            if tattooHideCheckboxB.Checked then
                --do b show
                Ext.Net.PostMessageToServer("Opacity_B", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do none show
                Ext.Net.PostMessageToServer("Opacity_None", "OnClick") UpdateCC()
            end
        end
    end
end
tattooHideCheckboxG.OnChange = function() 
    if tattooHideCheckboxR.Checked then
        if tattooHideCheckboxG.Checked then
            if tattooHideCheckboxB.Checked then
                --do rgb show
                Ext.Net.PostMessageToServer("Opacity_RGB", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do rg show
                Ext.Net.PostMessageToServer("Opacity_RG", "OnClick") UpdateCC()
            end
        elseif tattooHideCheckboxG.Checked == false then
            if tattooHideCheckboxB.Checked then
                --do rb show
                Ext.Net.PostMessageToServer("Opacity_RB", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do r show
                Ext.Net.PostMessageToServer("Opacity_R", "OnClick") UpdateCC()
            end
        end
    elseif tattooHideCheckboxR.Checked == false then
        if tattooHideCheckboxG.Checked then
            if tattooHideCheckboxB.Checked then
                --do gb show
                Ext.Net.PostMessageToServer("Opacity_GB", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do g show
                Ext.Net.PostMessageToServer("Opacity_G", "OnClick") UpdateCC()
            end
        elseif tattooHideCheckboxG.Checked == false then
            if tattooHideCheckboxB.Checked then
                --do b show
                Ext.Net.PostMessageToServer("Opacity_B", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do none show
                Ext.Net.PostMessageToServer("Opacity_None", "OnClick") UpdateCC()
            end
        end
    end   
end
tattooHideCheckboxB.OnChange = function() 
    if tattooHideCheckboxR.Checked then
        if tattooHideCheckboxG.Checked then
            if tattooHideCheckboxB.Checked then
                --do rgb show
                Ext.Net.PostMessageToServer("Opacity_RGB", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do rg show
                Ext.Net.PostMessageToServer("Opacity_RG", "OnClick") UpdateCC()
            end
        elseif tattooHideCheckboxG.Checked == false then
            if tattooHideCheckboxB.Checked then
                --do rb show
                Ext.Net.PostMessageToServer("Opacity_RB", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do r show
                Ext.Net.PostMessageToServer("Opacity_R", "OnClick") UpdateCC()
            end
        end
    elseif tattooHideCheckboxR.Checked == false then
        if tattooHideCheckboxG.Checked then
            if tattooHideCheckboxB.Checked then
                --do gb show
                Ext.Net.PostMessageToServer("Opacity_GB", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do g show
                Ext.Net.PostMessageToServer("Opacity_G", "OnClick") UpdateCC()
            end
        elseif tattooHideCheckboxG.Checked == false then
            if tattooHideCheckboxB.Checked then
                --do b show
                Ext.Net.PostMessageToServer("Opacity_B", "OnClick") UpdateCC()
            elseif tattooHideCheckboxB.Checked == false then
                -- do none show
                Ext.Net.PostMessageToServer("Opacity_None", "OnClick") UpdateCC()
            end
        end
    end
end


FacetattooHideCheckboxR.OnChange = function() 
    if FacetattooHideCheckboxR.Checked then
        if FacetattooHideCheckboxG.Checked then
            if FacetattooHideCheckboxB.Checked then
                --do rgb show
                Ext.Net.PostMessageToServer("FaceOpacity_RGB", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do rg show
                Ext.Net.PostMessageToServer("FaceOpacity_RG", "OnClick") UpdateCC()
            end
        elseif FacetattooHideCheckboxG.Checked == false then
            if FacetattooHideCheckboxB.Checked then
                --do rb show
                Ext.Net.PostMessageToServer("FaceOpacity_RB", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do r show
                Ext.Net.PostMessageToServer("FaceOpacity_R", "OnClick") UpdateCC()
            end
        end
    elseif FacetattooHideCheckboxR.Checked == false then
        if FacetattooHideCheckboxG.Checked then
            if FacetattooHideCheckboxB.Checked then
                --do gb show
                Ext.Net.PostMessageToServer("FaceOpacity_GB", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do g show
                Ext.Net.PostMessageToServer("FaceOpacity_G", "OnClick") UpdateCC()
            end
        elseif FacetattooHideCheckboxG.Checked == false then
            if FacetattooHideCheckboxB.Checked then
                --do b show
                Ext.Net.PostMessageToServer("FaceOpacity_B", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do none show
                Ext.Net.PostMessageToServer("FaceOpacity_None", "OnClick") UpdateCC()
            end
        end
    end
end
FacetattooHideCheckboxG.OnChange = function() 
    if FacetattooHideCheckboxR.Checked then
        if FacetattooHideCheckboxG.Checked then
            if FacetattooHideCheckboxB.Checked then
                --do rgb show
                Ext.Net.PostMessageToServer("FaceOpacity_RGB", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do rg show
                Ext.Net.PostMessageToServer("FaceOpacity_RG", "OnClick") UpdateCC()
            end
        elseif FacetattooHideCheckboxG.Checked == false then
            if FacetattooHideCheckboxB.Checked then
                --do rb show
                Ext.Net.PostMessageToServer("FaceOpacity_RB", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do r show
                Ext.Net.PostMessageToServer("FaceOpacity_R", "OnClick") UpdateCC()
            end
        end
    elseif FacetattooHideCheckboxR.Checked == false then
        if FacetattooHideCheckboxG.Checked then
            if FacetattooHideCheckboxB.Checked then
                --do gb show
                Ext.Net.PostMessageToServer("FaceOpacity_GB", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do g show
                Ext.Net.PostMessageToServer("FaceOpacity_G", "OnClick") UpdateCC()
            end
        elseif FacetattooHideCheckboxG.Checked == false then
            if FacetattooHideCheckboxB.Checked then
                --do b show
                Ext.Net.PostMessageToServer("FaceOpacity_B", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do none show
                Ext.Net.PostMessageToServer("FaceOpacity_None", "OnClick") UpdateCC()
            end
        end
    end   
end
FacetattooHideCheckboxB.OnChange = function() 
    if FacetattooHideCheckboxR.Checked then
        if FacetattooHideCheckboxG.Checked then
            if FacetattooHideCheckboxB.Checked then
                --do rgb show
                Ext.Net.PostMessageToServer("FaceOpacity_RGB", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do rg show
                Ext.Net.PostMessageToServer("FaceOpacity_RG", "OnClick") UpdateCC()
            end
        elseif FacetattooHideCheckboxG.Checked == false then
            if FacetattooHideCheckboxB.Checked then
                --do rb show
                Ext.Net.PostMessageToServer("FaceOpacity_RB", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do r show
                Ext.Net.PostMessageToServer("FaceOpacity_R", "OnClick") UpdateCC()
            end
        end
    elseif FacetattooHideCheckboxR.Checked == false then
        if FacetattooHideCheckboxG.Checked then
            if FacetattooHideCheckboxB.Checked then
                --do gb show
                Ext.Net.PostMessageToServer("FaceOpacity_GB", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do g show
                Ext.Net.PostMessageToServer("FaceOpacity_G", "OnClick") UpdateCC()
            end
        elseif FacetattooHideCheckboxG.Checked == false then
            if FacetattooHideCheckboxB.Checked then
                --do b show
                Ext.Net.PostMessageToServer("FaceOpacity_B", "OnClick") UpdateCC()
            elseif FacetattooHideCheckboxB.Checked == false then
                -- do none show
                Ext.Net.PostMessageToServer("FaceOpacity_None", "OnClick") UpdateCC()
            end
        end
    end
end
makeupHideCheckbox.OnChange = function()  Ext.Net.PostMessageToServer("MakeupOpacity_Show", "OnClick") UpdateCC() end
HalfIllithidCheckbox.OnChange = function()  Ext.Net.PostMessageToServer("Half_Illithid_Toggle", "OnClick") UpdateCC() end

function UpdateCC()
    --if Ext.UI.GetRoot():Child(1):Child(1):Child(21):Child(1) then
        Ext.UI.GetRoot():Child(1):Child(1):Child(21):Child(1).StartCharacterCreation:Execute()
    --end
end