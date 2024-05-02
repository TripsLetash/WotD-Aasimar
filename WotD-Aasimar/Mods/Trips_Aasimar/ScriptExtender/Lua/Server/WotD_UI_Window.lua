Ext.Osiris.RegisterListener("LevelGameplayStarted", 2, "after", function(_, _)  
    local party = Osi.DB_PartyMembers:Get(nil)
    for i = #party, 1, -1 do
        local character = party[i][1]
        SaveInit(character)
    end
end)

local raceTable={
	["ff2b6894-b03e-4bc6-a3b4-ce16ce405e7e"]=true,
	["dd21fb84-2d6a-4d7d-a418-ca96991d3920"]=true,
	["4738a422-5abd-41a7-a3f8-a35250a73209"]=true,
	["f40da0bb-58e0-4b53-8ec5-805bc1533c8c"]=true,
	["449f93dd-817f-4870-be6d-fbdb8f0dfb1d"]=true,
	["309b9cc5-0156-4f64-b857-8cf83fa2160b"]=true
}

Ext.Osiris.RegisterListener("ChangeAppearanceCompleted", 1, "after", function(character) 
    local race = Ext.Entity.Get(character).Race.Race
	if raceTable[race] then
        Ext.Net.BroadcastMessage("ChangeAppearanceCompleted", "OnEnd")
    end
end)
Ext.Osiris.RegisterListener("TemplateUseFinished", 4, "after", function(uuid, itemroot, item, _)
    local race = Ext.Entity.Get(uuid).Race.Race
	if raceTable[race] then
        if (itemroot == "UNI_MagicMirror_72ae7a39-d0ce-4cb6-8d74-ebdf7cdccf91") then
		    Utils.Wait(3000, function() Ext.Net.BroadcastMessage("ChangeAppearanceStarted", "OnEnd") end)
        end
    end
end)
Ext.Osiris.RegisterListener("ChangeAppearanceCancelled", 1, "after", function(character) 
    local race = Ext.Entity.Get(character).Race.Race
	if raceTable[race] then
        Ext.Net.BroadcastMessage("ChangeAppearanceCompleted", "OnEnd")
    end
end)
Ext.Osiris.RegisterListener("DialogEnded", 2, "after", function(dialog, instanceID)
    if dialog == "GLO_MagicMirror_f9af5a3b-fb57-b69d-7526-9abdaf50db78" then
        --do something
    end
end)

function SaveInit(character)
    if not PersistentVars[character] then
        PersistentVars[character] = {}
    end
    if not PersistentVars[character].Shine then
        PersistentVars[character].Shine = {}
    end
    if not PersistentVars[character].VirtualBody then
        PersistentVars[character].VirtualBody = {}
    end
    if not PersistentVars[character].MakeupOpacity then
        PersistentVars[character].MakeupOpacity = {}
    end
    if not PersistentVars[character].HalfIllithid then
        PersistentVars[character].HalfIllithid = {}
    end
end

-- Klementines functions
PersistentVars = {}
 
function RevertOverride(character, overrideType)
    Osi.RemoveCustomMaterialOverride(character,
        Overrides[overrideType][PersistentVars[character][overrideType]])
    PersistentVars[character][overrideType] = nil
end

function ApplyOverride(character, overrideType, override)
    if PersistentVars[character][overrideType] then
        RevertOverride(character, overrideType)
    end
    Osi.AddCustomMaterialOverride(character, Overrides[overrideType][override])
    PersistentVars[character][overrideType] = override
end

function ToggleOverride(character, overrideType, toggleableOverride)
    if PersistentVars[character][overrideType][toggleableOverride] then
        Osi.RemoveCustomMaterialOverride(character, Overrides[overrideType][toggleableOverride])
        PersistentVars[character][overrideType][toggleableOverride] = nil
    else
        Osi.AddCustomMaterialOverride(character, Overrides[overrideType][toggleableOverride])
        PersistentVars[character][overrideType][toggleableOverride] = true
    end
end

-- index done, opacity done,
Overrides = {
    VirtualBody = {
        Femme_NC = "1bb0b14c-f6e2-4b21-bdae-9675d20354ce",
        Masc_NC = "01617cf2-7102-4e4e-be57-8cf51446207f",
        FemmeStrong_NC = "f7d685b1-de78-4102-a55f-783cd3a022d8",
        MascStrong_NC = "7b738132-65dc-420a-8d23-f9091ba27103"
    },
    MakeupIndex = {
        "c9245d9f-0b91-4b1f-ac08-eca3c7924a7d",
        "cee284e1-7e9e-4ecb-b05c-cda88b4c01f9",
        "6ba592e2-12ef-49f8-8450-827d4fd55baa",
        "ef94c221-cb78-44eb-8523-4926f9b26c91",
        "0332b30c-1011-41bd-9a1f-127cf45be51b",
        "6d0d9fb3-0216-4c92-b791-759dd7ec6592",
        "b27939ea-dd65-4119-982d-3bc693bd16de",
        "4e583cdf-f455-4696-98de-e79d56d9c5a3",
        "e556513f-c5d4-47ee-acd7-49697fbd849f",
        "52e5bbc7-2ed2-424d-b124-cffee9018d6e",
        "5adf80f3-c71f-4b29-b5ef-6693e17643f1",
        "e5b7d8df-a595-4e90-906a-7c3372e976f7",
        "29bd13d1-7f42-47c5-b1e1-15c974303cae",
        "b07e67ae-62ac-454c-b14f-fafedc28e6fc",
        "a379f793-74b8-4654-8b90-6329a3b17d63",
        "cd108686-0c56-4e6b-b382-d540983eb993",
        "ce4e52c1-0f15-4e7a-8610-14ddfb028f7b",
        "fcf3ceb3-d718-4f9e-81f5-6a01fe38a34d",
        "13785b8a-113a-4cf9-9a74-5ce3c55ae000",
        "d1b03213-b57d-4355-91df-6ca54a1134b2",
        "0f2bc587-299e-46f8-8994-3d0fe75cfefa",
        "36e5c41f-fb41-4001-a528-113668c70a39",
        "e35ba7fb-47c9-496f-ac9d-765f7a2afc7f",
        "af155360-3768-4212-9eac-ff6f0a7065bc",
        "db667beb-5513-44fe-88bf-8ceb8c7987f0",
        "5647988a-8870-42f6-894b-e0567e1cb885",
        "cc531b91-532e-42a7-901f-4019755fd747",
        "d4f0a63e-5f41-4d4a-85fb-3872ef647d45",
        "62d67d93-ed0d-4b3b-8d7b-5a159b8706cc",
        "fe67da0e-16d9-406e-992f-ff8bbcf74e9d",
        "e4d93112-5a45-49a4-9cab-5bac181271a3",
        "6f49314c-51f8-467e-b04c-6e3a01976056",
        "36652d22-4ea4-450a-b8b1-17af3c1354d5",
        "0e48648e-7c79-4a5b-855e-75b894505c52",
        "5726e4e1-3b90-455c-b0ca-14028908ad02",
        "137b619c-5e25-427d-a61a-639ca76be5d1",
        "92face18-62f4-4b92-bcb4-09ea1427c39e",
        "1cdd5ea2-a245-4f0b-b27c-bdf650794891",
        "ee179971-87a4-4047-ab63-b6bec1d6127c",
        "7200f71d-25db-4597-a402-87743c183b85",
        "0d8c0b62-e5a7-4aa0-be83-d73c34a04fca",
        "fb244283-9916-438d-bba2-88f1d69c5e3e",
        "4ae0c3c2-3735-4eda-a431-f9f79dba1977",
        "590db467-132e-433a-b259-e4cbbff2fc0c",
        "fefdf78d-b3a0-445f-bdc7-4ef8226a103a",
        "cb93ab0f-7695-4cc0-bb6a-10393fdfd930",
        "9c4e8d32-456b-4690-b8a0-021b1003e483",
        "a765246f-ac65-4c01-983f-c3a1d3d14654",
        "4f78481b-4b00-4b77-9bc1-00968e573bbe"
    },
    HeadIndex = {
        "577a35bc-0b1e-4e53-a55f-62a00cd4171c",
        "b32181f8-3c8c-441c-a6db-c54ade88f9e6",
        "15e83d34-ed3b-4979-8cbe-5aa4d4e30a92",
        "1297c544-792a-4f82-9420-675f4c856012",
        "013e8e7a-863a-4f95-82a6-a387edc4a690",
        "013e8e7a-863a-4f95-82a6-a387edc4a690",
        "cb40fb32-a291-4aef-8559-8bd103e4420c",
        "82138a47-21a4-4fd1-b494-541ed8fc49bb",
        "f4c29886-b544-4b53-817c-37b3cbc59b3f",
        "9d4db8d6-fc3c-45cd-929a-f15a923367d3",
        "8c835b73-6df3-4174-9aa5-76afd8a4e5cb",
        "02857405-9c92-413b-8892-18935201d373",
        "7288e07b-b239-4b34-bb63-ca012837c6f8",
        "6203cacc-6f7b-490c-81f4-dd12744c2ac5",
        "f16462d5-0934-4d4a-a094-8f6d81eaaff6",
        "f896ba05-d5b0-4764-9429-46f76bf4a46d"
        
    },
    Index = {
        "1b3b2029-90e4-479d-ab8a-9bb7f2bffe59",
        "e555113e-abc3-49af-ad5c-1ad812e4eecd",
        "82cfafb7-5c3f-41ac-a054-556c4aaf65d4",
        "2452601b-276f-4423-9a2c-2d3eb4ceb847",
        "a6fdf619-701b-4506-9cdd-b518ca81b25a",
        "f83f5862-fc41-4ccf-a839-35d31748e465",
        "78e7c742-1c50-4072-b0bb-fdb6c1dc90d2",
        "29a07942-c2fb-4d93-9372-cd9b194b8303",
        "1d17c79e-b1e3-49a1-bc51-0a6ec487ff63",
        "bef1ea37-72a6-491b-9e3a-a5b7a719b2fa",
        "c4d875b1-026a-4433-871f-ae5c86ef873f",
        "3a3942c4-ae18-43ab-90be-d0e5d7664823",
        "db66e80e-af5d-468b-a02b-d8e9a0ca6b14",
        "62e32c58-c2b4-40ec-ae9b-7dd803355d71",
        "a69252cb-c506-4d98-b411-94ba7fafc4ba",
        "5cf25e51-9834-4884-9863-adb93e37df49",
        "2ad15f6c-508b-44cb-90fb-bca3dadbb831",
        "549f62d4-9164-4b65-8f7a-f02645e3b0e1",
        "33be33fb-9e6d-49eb-a41b-d6fee5ba0cd2",
        "2c6b5bcd-62ac-43d9-aaef-02d60bd7a92e"
    },

    -- Opacity overrides simply toggle which channels are visible
    Opacity = {
        RGB = "1e98e12f-f891-41da-8d38-4ee160027273",
        None = "c5343a7d-ede7-4d83-89fc-1c05ed60e299",
        R = "d064fbcc-d8a6-4423-a390-a410238d474d",
        G = "46449f3a-a2c4-4564-90bb-5e5b05f07536",
        B = "2d042993-ed90-409c-bfcd-995ae81283c4",
        RG = "23ac9f61-c88d-476a-84f1-6e5259ab402a",
        RB = "81e77144-3f77-4748-b69b-76c316c2285d",
        GB = "0ad3cf7e-0554-42bf-9d23-34e9e50bf7b0"
    },
    FaceOpacity = {
        RGB = "da7d5940-6d59-450e-b90e-df59c27807ab",
        None = "b7004796-8dc1-4fa3-8685-06c857128a51",
        R = "77faf9b7-0b2d-4420-882c-2dba7f23e83d",
        G = "3ce2e513-d423-4395-8c6e-6ff5ed52e48b",
        B = "4e77ea1c-546f-4cc9-a59e-901899c701da",
        RG = "2d1f4c20-f000-4e4c-9b88-26d6ba12ae8a",
        RB = "438610ae-3aed-4860-87b9-2af869dcc8c4",
        GB = "93e734d6-9a60-4336-bada-2927cf793f6b"
    },
    MakeupOpacity = {
        Show = "caa7fb87-bd30-4963-8100-9d4d08ba621e"
    },
    Shine = {
        Metalness = "fa039029-dc42-4728-a83a-ec8f7f8eccc7"
    },
    HalfIllithid = {
        Toggle = "398ca8ae-c3c0-47f5-8e45-d9402e198389"
    },
    AtlasTexFaceMakeup = {
        "391b4b63-fc52-44fd-970c-7179c657e702",
        "c841817f-bc1e-472f-bca6-1c6cb00a3dac",
        "6966c7f1-da17-4eae-8dfa-908e3fbdd403"
    },
    AtlasTexBody = {
        "928ce26a-32c4-4bfe-9f28-9e7aead711df",
        "85e0ec46-b406-4e09-bbcf-e290732c4df9",
        "0c4920d5-c6f1-425b-88e5-02463032ad33"
    },
    AtlasTexFace = {
        "37144814-f24b-4889-b7b0-755475106117",
        "fb5f062e-a44d-4100-b6c2-54f545a59b95",
        "a592161e-2871-48d1-aee6-613f72bf922d"
    },
    Color1 = {
        Black = "7dad51fa-7fa9-4643-89b1-e8a99483780f",
        Red = "d8eae03b-b178-4fef-9233-bec3408e133b",
        Orange = "b99f6ae7-6748-4116-9ee9-9f26405bba33",
        Yellow = "0777a520-dcdb-4d93-8e97-e8bed033aaad",
        Green = "bdb45c3f-849c-46b5-a2d1-ee4cc065c494",
        Blue = "21a6c5e4-f899-4725-9ab6-da2c08b89ae4",
        Purple = "71438003-ab19-4b3e-8a0e-2c68f1d3357e",
        Pink = "10c2b166-12b5-4d24-a40a-e9517c5a9ba6",
        Brown = "5b48a389-a898-4667-975d-f31768c119de",
        White = "b8e1fbfa-41e2-4e34-8833-ab71bc4796ea",
        Fallen = "7939a870-ed66-43c1-8d61-cf87dbc2bc5c",
        Lightblue = "efa65cfd-f6e5-464d-9fcc-4b27de4a7932",
        Peeyellow = "cfffe2ca-9207-457e-ba76-dfac3e43cbeb",
        Gold = "9147081d-b2ed-4200-b491-b1b9d7aaaa6c",
        Lightpink = "1f277bee-237a-4d3c-b5fb-24b2edb8494e",
        Darkpink = "3dfda952-dd5d-4947-8086-19b9130d08dd",
        Lightsilver = "732792df-410f-4215-b782-93c05a13819b",
        Darksilver = "1a9b3a24-b28f-4657-ae7e-d70d22b0e844",
        Lightpurple = "cfc918f2-452c-406f-901b-bc481b2c8c85",
        Olive = "aa192068-a905-44c0-9fe5-d9a0da2262fa"
    },
    Color2 = {
        Black = "4eb3a089-751a-4faa-b745-8daaef755b0c",
        Red = "b8cd9d84-7f6b-4727-8347-3356d890ad44",
        Orange = "fa684084-b48a-461e-ad4f-8f092b63b2a6",
        Yellow = "0599d99c-9630-4c2a-9dd5-a576c633c606",
        Green = "3d3699dc-bde9-49f8-9bef-4a39b18e0fe0",
        Blue = "714b9835-fb9f-4c6e-8153-d79e75f72cce",
        Purple = "c8ae3816-fb07-4b45-ac08-e0b5e0adc536",
        Pink = "5632d3af-9a93-4898-b30b-c42c6b0b1bb1",
        Brown = "6566d1c0-ab83-4a0f-bdd5-ec23ea3906c1",
        White = "72432c45-3d49-4fb0-96e7-c4a321c2d17e",
        Fallen = "4efe3b0e-c3cc-4353-81a1-28fa2142e63d",
        Lightblue = "56ffe52d-bc2b-4d00-b466-5d4d4a278108",
        Peeyellow = "81bec813-b6f9-4184-ab7c-28f5d49193d8",
        Gold = "6cfe89c5-2d7c-43cd-9321-4fc8998e995b",
        Lightpink = "f88b824a-a234-41b5-9ca6-604647107d47",
        Darkpink = "97681950-6e29-4e69-ab59-4edf788d49d2",
        Lightsilver = "f1ec9367-7c0d-4101-b431-79116b47a4cc",
        Darksilver = "d2b8e123-e173-4c64-baaa-3d2fedd84992",
        Lightpurple = "73207013-e596-4985-a803-35cd51c817d5",
        Olive = "a4723c3d-05a6-4541-99cc-7a6d575653c3"
    },
    Color3 = {
        Black = "b5eb5a7b-d5e6-4e7a-8a38-28b62a3ab47e",
        Red = "5de5965b-0f88-42e4-bd04-fb0c0bf140ed",
        Orange = "6cfd5889-f356-40cd-9b8e-3db3248d5f01",
        Yellow = "1a579406-2704-4d11-9ccf-8f4e1e2fb9a1",
        Green = "230144bb-b4bd-43d7-8a85-18e77bf268b7",
        Blue = "8e5ceed3-a30a-41cf-933c-f355422e4648",
        Purple = "cb59f907-b891-4e52-9ed3-ef1eca422f34",
        Pink = "88798b50-0bdc-44b5-a0e2-152b59c080be",
        Brown = "169c1684-31cd-42d8-96b1-1182733fe289",
        White = "ca84ad6f-c88b-49ec-9d84-22fbfe461c52",
        Fallen = "7000c3be-0f4f-4f93-bb4c-65a11d5a6217",
        Lightblue = "9c9d457c-f75f-457a-bf7c-f07d39c0926e",
        Peeyellow = "085fcb57-771a-4d9a-b821-d2b7433b5458",
        Gold = "1dc5f3f3-dff2-47c3-9565-ae69cfcc812e",
        Lightpink = "b4dec947-a3c1-4b2b-95e2-f8c90c720f2b",
        Darkpink = "dabb6cf4-2176-4d79-8849-4b0e531ae016",
        Lightsilver = "31866117-7739-4ba9-9178-70746688f8a0",
        Darksilver = "3622c834-5e88-4a14-8c3c-aa87b10b77c3",
        Lightpurple = "76a10e12-2495-4d05-97ab-463c3ee1c778",
        Olive = "50d3d1b3-4cfd-49f7-9391-5109f250b13b"
    },
    FaceColor1 = {
        Black = "70d89fd1-3a2f-43b9-824b-827707143951",
        Red = "70a6665c-482d-4c68-9479-8cba6f820246",
        Orange = "a835c8d9-c679-4650-bfa0-76b3518d2e43",
        Yellow = "8bef6c28-838e-4701-a05e-a87499c20e75",
        Green = "d5d0b1b8-6de2-42d1-847f-995aefaf3a37",
        Blue = "5bb5e006-6acf-48ea-8d00-abddf7bde259",
        Purple = "39e98355-78c7-4820-91b9-b68903f98ab4",
        Pink = "58029d35-76a6-43a0-a042-84a53fb80f24",
        Brown = "76414d80-5232-47e3-8363-1cd0a96d9391",
        White = "cb2da16e-d9c8-4a83-ab87-5eb6ad397d58",
        Fallen = "f517aa2d-5b5e-4f08-ab5a-e4162bccae9e",
        Lightblue = "9f539158-b645-4c6d-a735-55a6ee2a1696",
        Peeyellow = "6acfe003-acef-45e0-bac3-4db6d1dffe70",
        Gold = "f8b453e4-6bfd-4fc3-8b82-1ed8d2ae3c40",
        Lightpink = "2a0fd20d-de11-4c54-8f41-19e5012f82bc",
        Darkpink = "229a57e9-6494-4f13-af20-b15b0ae33210",
        Lightsilver = "4580a4bd-8b15-4802-8422-dcae6225125a",
        Darksilver = "70a9bbe7-f545-4edf-8978-385068b0db8d",
        Lightpurple = "5f93721e-7013-4672-a47a-8c2062f42cbf",
        Olive = "fb0d8eb8-6f9d-4789-886f-e6c7fb27cfd9"
    },
    FaceColor2 = {
        Black = "484e3989-94d4-4a1f-9fe7-ef3a771f76b2",
        Red = "57b51506-19c6-4f74-a554-7151e6df3672",
        Orange = "e95d1747-2e00-4951-b883-bb1216c29e8c",
        Yellow = "af5f7a34-e9d9-4194-8f28-b0fa6cbc588a",
        Green = "2ded7eed-3f1a-4d6f-acec-ae432694a9c9",
        Blue = "7f2cbf57-3305-42cf-9dab-d1fbfc20e977",
        Purple = "a1285041-aba6-4107-8868-01a70cc69a6c",
        Pink = "c20edca6-3a95-4ded-9782-8a3ec61cf419",
        Brown = "a0f94dde-ebf0-4c22-82fd-55c35d9054b6",
        White = "ec6be3e9-76c6-4e83-a0d2-d0a9b9d63fd3",
        Fallen = "fc89214c-4ba4-4f3e-bc5e-663e7c843f42",
        Lightblue = "ccaa62c6-8608-437c-bc2a-5019b239e477",
        Peeyellow = "b36e4d2e-d058-4559-b23f-09e90d24e21d",
        Gold = "1d83c5d9-02f7-4d88-bc34-a51b013944f4",
        Lightpink = "7260e51c-145f-4030-9ae6-d6858b313af5",
        Darkpink = "c28798b2-90fc-4def-9a02-f864db486c3f",
        Lightsilver = "c68941a1-1dd9-4f4e-a743-36660e54e1b5",
        Darksilver = "0adb8edd-340e-4a34-a316-6e198f5b20ad",
        Lightpurple = "ee6ea5e6-7ea0-4ab3-932f-04eac9c991cf",
        Olive = "6e1c492a-3646-470f-8664-79e9427e57b9"
    },
    FaceColor3 = {
        Black = "5046e724-d887-4108-894c-6734faec7b27",
        Red = "6c77948b-9cca-418a-a98f-3e184712dd5a",
        Orange = "071053a3-d532-40f8-9245-e3e31359e990",
        Yellow = "f510a377-8b8c-4b19-bfec-724e9f415c84",
        Green = "a1f4f7f6-1fc9-4290-a667-1448bfebd013",
        Blue = "5fbd19dc-b355-445b-b29c-c0d893983fc1",
        Purple = "e9355d51-9b95-4e57-a528-76c8c1aa6848",
        Pink = "3c939010-5cf3-4b03-9fc7-edb791db7eda",
        Brown = "17912c31-5181-45a1-bfa5-933b3235703d",
        White = "68ab987b-2903-4936-a569-36cf88373288",
        Fallen = "46bda95d-230c-439b-a3d6-adb13bdece7d",
        Lightblue = "59bda1da-2056-4373-a63a-8a554907094c",
        Peeyellow = "0a9e6771-d390-4cab-8863-6935d3f114be",
        Gold = "8f55feda-135e-476c-a73f-44d9203f6622",
        Lightpink = "4ef7ce6b-e023-4890-ae5f-a6f597ef5672",
        Darkpink = "8578c15d-bfcb-4944-b2fa-2bdad9475e8c",
        Lightsilver = "42bdb4ab-a02b-4dcc-bf36-c0bc3d404686",
        Darksilver = "64a6dd98-aa15-419d-a669-c188872de33a",
        Lightpurple = "1c5251dc-813c-44d3-9806-5264d020fa06",
        Olive = "7cc326e1-ca93-412a-a45a-2bdc7720bbfc"
    }
}
function PeerToUserID(u)
    -- all this for userid+1 usually smh
    return (u & 0xffff0000) | 0x0001
end

Ext.Events.NetMessage:Subscribe(function(e) 
    local sender = Osi.GetCurrentCharacter(PeerToUserID(e.UserID))
    local E = Ext.Entity.Get(sender).CharacterCreationStats
    SaveInit(sender)
    --Tattoo Buttons
    if (e.Channel == "tattooBody_Index1") then ApplyOverride(sender,"Index", 1) end
    if (e.Channel == "tattooBody_Index2") then ApplyOverride(sender,"Index", 2) end 
    if (e.Channel == "tattooBody_Index3") then ApplyOverride(sender,"Index", 3) end 
    if (e.Channel == "tattooBody_Index4") then ApplyOverride(sender,"Index", 4) end 
    if (e.Channel == "tattooBody_Index5") then ApplyOverride(sender,"Index", 5) end 
    if (e.Channel == "tattooBody_Index6") then ApplyOverride(sender,"Index", 6) end 
    if (e.Channel == "tattooBody_Index7") then ApplyOverride(sender,"Index", 7) end 
    if (e.Channel == "tattooBody_Index8") then ApplyOverride(sender,"Index", 8) end 
    if (e.Channel == "tattooBody_Index9") then ApplyOverride(sender,"Index", 9) end 
    if (e.Channel == "tattooBody_Index10") then ApplyOverride(sender,"Index", 10) end 
    if (e.Channel == "tattooBody_Index11") then ApplyOverride(sender,"Index", 11) end 
    if (e.Channel == "tattooBody_Index12") then ApplyOverride(sender,"Index", 12) end 
    if (e.Channel == "tattooBody_Index13") then ApplyOverride(sender,"Index", 13) end 
    if (e.Channel == "tattooBody_Index14") then ApplyOverride(sender,"Index", 14) end 
    if (e.Channel == "tattooBody_Index15") then ApplyOverride(sender,"Index", 15) end 
    if (e.Channel == "tattooBody_Index16") then ApplyOverride(sender,"Index", 16) end
    if (e.Channel == "tattooBody_Index17") then ApplyOverride(sender,"Index", 17) end 
    if (e.Channel == "tattooBody_Index18") then ApplyOverride(sender,"Index", 18) end 
    if (e.Channel == "tattooBody_Index19") then ApplyOverride(sender,"Index", 19) end 
    if (e.Channel == "tattooBody_Index20") then ApplyOverride(sender,"Index", 20) end
    if (e.Channel == "tattooMetallic") then ToggleOverride(sender, "Shine", "Metalness") end
    if (e.Channel == "tattooColorFaceButton1Red") then ApplyOverride(sender, "FaceColor1", "Blue") end
    if (e.Channel == "tattooColorFaceButton1Green") then ApplyOverride(sender, "FaceColor2", "Blue") end
    if (e.Channel == "tattooColorFaceButton1Blue") then ApplyOverride(sender, "FaceColor3", "Blue") end
    if (e.Channel == "tattooColorFaceButton2Red") then ApplyOverride(sender, "FaceColor1", "Yellow") end
    if (e.Channel == "tattooColorFaceButton2Green") then ApplyOverride(sender, "FaceColor2", "Yellow") end
    if (e.Channel == "tattooColorFaceButton2Blue") then ApplyOverride(sender, "FaceColor3", "Yellow") end
    if (e.Channel == "tattooColorFaceButton3Red") then ApplyOverride(sender, "FaceColor1", "Green") end
    if (e.Channel == "tattooColorFaceButton3Green") then ApplyOverride(sender, "FaceColor2", "Green") end
    if (e.Channel == "tattooColorFaceButton3Blue") then ApplyOverride(sender, "FaceColor3", "Green") end
    if (e.Channel == "tattooColorFaceButton4Red") then ApplyOverride(sender, "FaceColor1", "Red") end
    if (e.Channel == "tattooColorFaceButton4Green") then ApplyOverride(sender, "FaceColor2", "Red") end
    if (e.Channel == "tattooColorFaceButton4Blue") then ApplyOverride(sender, "FaceColor3", "Red") end
    if (e.Channel == "tattooColorFaceButton5Red") then ApplyOverride(sender, "FaceColor1", "Pink") end
    if (e.Channel == "tattooColorFaceButton5Green") then ApplyOverride(sender, "FaceColor2", "Pink") end
    if (e.Channel == "tattooColorFaceButton5Blue") then ApplyOverride(sender, "FaceColor3", "Pink") end
    if (e.Channel == "tattooColorFaceButton6Red") then ApplyOverride(sender, "FaceColor1", "Purple") end
    if (e.Channel == "tattooColorFaceButton6Green") then ApplyOverride(sender, "FaceColor2", "Purple") end
    if (e.Channel == "tattooColorFaceButton6Blue") then ApplyOverride(sender, "FaceColor3", "Purple") end
    if (e.Channel == "tattooColorFaceButton7Red") then ApplyOverride(sender, "FaceColor1", "White") end
    if (e.Channel == "tattooColorFaceButton7Green") then ApplyOverride(sender, "FaceColor2", "White") end
    if (e.Channel == "tattooColorFaceButton7Blue") then ApplyOverride(sender, "FaceColor3", "White") end
    if (e.Channel == "tattooColorFaceButton8Red") then ApplyOverride(sender, "FaceColor1", "Black") end
    if (e.Channel == "tattooColorFaceButton8Green") then ApplyOverride(sender, "FaceColor2", "Black") end
    if (e.Channel == "tattooColorFaceButton8Blue") then ApplyOverride(sender, "FaceColor3", "Black") end
    if (e.Channel == "tattooColorFaceButton9Red") then ApplyOverride(sender, "FaceColor1", "Brown") end
    if (e.Channel == "tattooColorFaceButton9Green") then ApplyOverride(sender, "FaceColor2", "Brown") end
    if (e.Channel == "tattooColorFaceButton9Blue") then ApplyOverride(sender, "FaceColor3", "Brown") end
    if (e.Channel == "tattooColorFaceButton10Red") then ApplyOverride(sender, "FaceColor1", "Orange") end
    if (e.Channel == "tattooColorFaceButton10Green") then ApplyOverride(sender, "FaceColor2", "Orange") end
    if (e.Channel == "tattooColorFaceButton10Blue") then ApplyOverride(sender, "FaceColor3", "Orange") end
    if (e.Channel == "tattooColorFaceButton11Red") then ApplyOverride(sender, "FaceColor1", "Fallen") end
    if (e.Channel == "tattooColorFaceButton11Green") then ApplyOverride(sender, "FaceColor2", "Fallen") end
    if (e.Channel == "tattooColorFaceButton11Blue") then ApplyOverride(sender, "FaceColor3", "Fallen") end
    if (e.Channel == "tattooColorFaceButton12Red") then ApplyOverride(sender, "FaceColor1", "Lightblue") end
    if (e.Channel == "tattooColorFaceButton12Green") then ApplyOverride(sender, "FaceColor2", "Lightblue") end
    if (e.Channel == "tattooColorFaceButton12Blue") then ApplyOverride(sender, "FaceColor3", "Lightblue") end
    if (e.Channel == "tattooColorFaceButton13Red") then ApplyOverride(sender, "FaceColor1", "Peeyellow") end
    if (e.Channel == "tattooColorFaceButton13Green") then ApplyOverride(sender, "FaceColor2", "Peeyellow") end
    if (e.Channel == "tattooColorFaceButton13Blue") then ApplyOverride(sender, "FaceColor3", "Peeyellow") end
    if (e.Channel == "tattooColorFaceButton14Red") then ApplyOverride(sender, "FaceColor1", "Gold") end
    if (e.Channel == "tattooColorFaceButton14Green") then ApplyOverride(sender, "FaceColor2", "Gold") end
    if (e.Channel == "tattooColorFaceButton14Blue") then ApplyOverride(sender, "FaceColor3", "Gold") end
    if (e.Channel == "tattooColorFaceButton15Red") then ApplyOverride(sender, "FaceColor1", "Lightpink") end
    if (e.Channel == "tattooColorFaceButton15Green") then ApplyOverride(sender, "FaceColor2", "Lightpink") end
    if (e.Channel == "tattooColorFaceButton15Blue") then ApplyOverride(sender, "FaceColor3", "Lightpink") end
    if (e.Channel == "tattooColorFaceButton16Red") then ApplyOverride(sender, "FaceColor1", "Darkpink") end
    if (e.Channel == "tattooColorFaceButton16Green") then ApplyOverride(sender, "FaceColor2", "Darkpink") end
    if (e.Channel == "tattooColorFaceButton16Blue") then ApplyOverride(sender, "FaceColor3", "Darkpink") end
    if (e.Channel == "tattooColorFaceButton17Red") then ApplyOverride(sender, "FaceColor1", "Lightsilver") end
    if (e.Channel == "tattooColorFaceButton17Green") then ApplyOverride(sender, "FaceColor2", "Lightsilver") end
    if (e.Channel == "tattooColorFaceButton17Blue") then ApplyOverride(sender, "FaceColor3", "Lightsilver") end
    if (e.Channel == "tattooColorFaceButton18Red") then ApplyOverride(sender, "FaceColor1", "Darksilver") end
    if (e.Channel == "tattooColorFaceButton18Green") then ApplyOverride(sender, "FaceColor2", "Darksilver") end
    if (e.Channel == "tattooColorFaceButton18Blue") then ApplyOverride(sender, "FaceColor3", "Darksilver") end
    if (e.Channel == "tattooColorFaceButton19Red") then ApplyOverride(sender, "FaceColor1", "Lightpurple") end
    if (e.Channel == "tattooColorFaceButton19Green") then ApplyOverride(sender, "FaceColor2", "Lightpurple") end
    if (e.Channel == "tattooColorFaceButton19Blue") then ApplyOverride(sender, "FaceColor3", "Lightpurple") end
    if (e.Channel == "tattooColorFaceButton20Red") then ApplyOverride(sender, "FaceColor1", "Olive") end
    if (e.Channel == "tattooColorFaceButton20Green") then ApplyOverride(sender, "FaceColor2", "Olive") end
    if (e.Channel == "tattooColorFaceButton20Blue") then ApplyOverride(sender, "FaceColor3", "Olive") end
    if (e.Channel == "tattooColorButton1Red") then ApplyOverride(sender, "Color1", "Blue") end
    if (e.Channel == "tattooColorButton1Green") then ApplyOverride(sender, "Color2", "Blue") end
    if (e.Channel == "tattooColorButton1Blue") then ApplyOverride(sender, "Color3", "Blue") end
    if (e.Channel == "tattooColorButton2Red") then ApplyOverride(sender, "Color1", "Yellow") end
    if (e.Channel == "tattooColorButton2Green") then ApplyOverride(sender, "Color2", "Yellow") end
    if (e.Channel == "tattooColorButton2Blue") then ApplyOverride(sender, "Color3", "Yellow") end
    if (e.Channel == "tattooColorButton3Red") then ApplyOverride(sender, "Color1", "Green") end
    if (e.Channel == "tattooColorButton3Green") then ApplyOverride(sender, "Color2", "Green") end
    if (e.Channel == "tattooColorButton3Blue") then ApplyOverride(sender, "Color3", "Green") end
    if (e.Channel == "tattooColorButton4Red") then ApplyOverride(sender, "Color1", "Red") end
    if (e.Channel == "tattooColorButton4Green") then ApplyOverride(sender, "Color2", "Red") end
    if (e.Channel == "tattooColorButton4Blue") then ApplyOverride(sender, "Color3", "Red") end
    if (e.Channel == "tattooColorButton5Red") then ApplyOverride(sender, "Color1", "Pink") end
    if (e.Channel == "tattooColorButton5Green") then ApplyOverride(sender, "Color2", "Pink") end
    if (e.Channel == "tattooColorButton5Blue") then ApplyOverride(sender, "Color3", "Pink") end
    if (e.Channel == "tattooColorButton6Red") then ApplyOverride(sender, "Color1", "Purple") end
    if (e.Channel == "tattooColorButton6Green") then ApplyOverride(sender, "Color2", "Purple") end
    if (e.Channel == "tattooColorButton6Blue") then ApplyOverride(sender, "Color3", "Purple") end
    if (e.Channel == "tattooColorButton7Red") then ApplyOverride(sender, "Color1", "White") end
    if (e.Channel == "tattooColorButton7Green") then ApplyOverride(sender, "Color2", "White") end
    if (e.Channel == "tattooColorButton7Blue") then ApplyOverride(sender, "Color3", "White") end
    if (e.Channel == "tattooColorButton8Red") then ApplyOverride(sender, "Color1", "Black") end
    if (e.Channel == "tattooColorButton8Green") then ApplyOverride(sender, "Color2", "Black") end
    if (e.Channel == "tattooColorButton8Blue") then ApplyOverride(sender, "Color3", "Black") end
    if (e.Channel == "tattooColorButton9Red") then ApplyOverride(sender, "Color1", "Brown") end
    if (e.Channel == "tattooColorButton9Green") then ApplyOverride(sender, "Color2", "Brown") end
    if (e.Channel == "tattooColorButton9Blue") then ApplyOverride(sender, "Color3", "Brown") end
    if (e.Channel == "tattooColorButton10Red") then ApplyOverride(sender, "Color1", "Orange") end
    if (e.Channel == "tattooColorButton10Green") then ApplyOverride(sender, "Color2", "Orange") end
    if (e.Channel == "tattooColorButton10Blue") then ApplyOverride(sender, "Color3", "Orange") end
    if (e.Channel == "tattooColorButton11Red") then ApplyOverride(sender, "Color1", "Fallen") end
    if (e.Channel == "tattooColorButton11Green") then ApplyOverride(sender, "Color2", "Fallen") end
    if (e.Channel == "tattooColorButton11Blue") then ApplyOverride(sender, "Color3", "Fallen") end
    if (e.Channel == "tattooColorButton12Red") then ApplyOverride(sender, "Color1", "Lightblue") end
    if (e.Channel == "tattooColorButton12Green") then ApplyOverride(sender, "Color2", "Lightblue") end
    if (e.Channel == "tattooColorButton12Blue") then ApplyOverride(sender, "Color3", "Lightblue") end
    if (e.Channel == "tattooColorButton13Red") then ApplyOverride(sender, "Color1", "Peeyellow") end
    if (e.Channel == "tattooColorButton13Green") then ApplyOverride(sender, "Color2", "Peeyellow") end
    if (e.Channel == "tattooColorButton13Blue") then ApplyOverride(sender, "Color3", "Peeyellow") end
    if (e.Channel == "tattooColorButton14Red") then ApplyOverride(sender, "Color1", "Gold") end
    if (e.Channel == "tattooColorButton14Green") then ApplyOverride(sender, "Color2", "Gold") end
    if (e.Channel == "tattooColorButton14Blue") then ApplyOverride(sender, "Color3", "Gold") end
    if (e.Channel == "tattooColorButton15Red") then ApplyOverride(sender, "Color1", "Lightpink") end
    if (e.Channel == "tattooColorButton15Green") then ApplyOverride(sender, "Color2", "Lightpink") end
    if (e.Channel == "tattooColorButton15Blue") then ApplyOverride(sender, "Color3", "Lightpink") end
    if (e.Channel == "tattooColorButton16Red") then ApplyOverride(sender, "Color1", "Darkpink") end
    if (e.Channel == "tattooColorButton16Green") then ApplyOverride(sender, "Color2", "Darkpink") end
    if (e.Channel == "tattooColorButton16Blue") then ApplyOverride(sender, "Color3", "Darkpink") end
    if (e.Channel == "tattooColorButton17Red") then ApplyOverride(sender, "Color1", "Lightsilver") end
    if (e.Channel == "tattooColorButton17Green") then ApplyOverride(sender, "Color2", "Lightsilver") end
    if (e.Channel == "tattooColorButton17Blue") then ApplyOverride(sender, "Color3", "Lightsilver") end
    if (e.Channel == "tattooColorButton18Red") then ApplyOverride(sender, "Color1", "Darksilver") end
    if (e.Channel == "tattooColorButton18Green") then ApplyOverride(sender, "Color2", "Darksilver") end
    if (e.Channel == "tattooColorButton18Blue") then ApplyOverride(sender, "Color3", "Darksilver") end
    if (e.Channel == "tattooColorButton19Red") then ApplyOverride(sender, "Color1", "Lightpurple") end
    if (e.Channel == "tattooColorButton19Green") then ApplyOverride(sender, "Color2", "Lightpurple") end
    if (e.Channel == "tattooColorButton19Blue") then ApplyOverride(sender, "Color3", "Lightpurple") end
    if (e.Channel == "tattooColorButton20Red") then ApplyOverride(sender, "Color1", "Olive") end
    if (e.Channel == "tattooColorButton20Green") then ApplyOverride(sender, "Color2", "Olive") end
    if (e.Channel == "tattooColorButton20Blue") then ApplyOverride(sender, "Color3", "Olive") end
    if (e.Channel == "Opacity_RGB") then ApplyOverride(sender, "Opacity", "RGB") end
    if (e.Channel == "Opacity_RG") then ApplyOverride(sender, "Opacity", "RG") end
    if (e.Channel == "Opacity_RB") then ApplyOverride(sender, "Opacity", "RB") end
    if (e.Channel == "Opacity_R") then ApplyOverride(sender, "Opacity", "R") end
    if (e.Channel == "Opacity_GB") then ApplyOverride(sender, "Opacity", "GB") end
    if (e.Channel == "Opacity_G") then ApplyOverride(sender, "Opacity", "G") end
    if (e.Channel == "Opacity_B") then ApplyOverride(sender, "Opacity", "B") end
    if (e.Channel == "Opacity_None") then ApplyOverride(sender, "Opacity", "None") end
    if (e.Channel == "FaceOpacity_RGB") then ApplyOverride(sender, "FaceOpacity", "RGB") end
    if (e.Channel == "FaceOpacity_RG") then ApplyOverride(sender, "FaceOpacity", "RG") end
    if (e.Channel == "FaceOpacity_RB") then ApplyOverride(sender, "FaceOpacity", "RB") end
    if (e.Channel == "FaceOpacity_R") then ApplyOverride(sender, "FaceOpacity", "R") end
    if (e.Channel == "FaceOpacity_GB") then ApplyOverride(sender, "FaceOpacity", "GB") end
    if (e.Channel == "FaceOpacity_G") then ApplyOverride(sender, "FaceOpacity", "G") end
    if (e.Channel == "FaceOpacity_B") then ApplyOverride(sender, "FaceOpacity", "B") end
    if (e.Channel == "FaceOpacity_None") then ApplyOverride(sender, "FaceOpacity", "None") end
    
    if (e.Channel == "MakeupOpacity_Show") then ToggleOverride(sender, "MakeupOpacity", "Show") end

    if (e.Channel == "tattooBodyAtlas1") then ApplyOverride(sender, "AtlasTexBody", 1) end
    if (e.Channel == "tattooBodyAtlas2") then ApplyOverride(sender, "AtlasTexBody", 2) end
    if (e.Channel == "tattooBodyAtlas3") then ApplyOverride(sender, "AtlasTexBody", 3) end
    if (e.Channel == "tattooFaceAtlas1") then ApplyOverride(sender, "AtlasTexFace", 1) end
    if (e.Channel == "tattooFaceAtlas2") then ApplyOverride(sender, "AtlasTexFace", 2) end
    if (e.Channel == "tattooFaceAtlas3") then ApplyOverride(sender, "AtlasTexFace", 3) end
    if (e.Channel == "makeupFaceAtlas1") then ApplyOverride(sender, "AtlasTexFaceMakeup", 1) end
    if (e.Channel == "makeupFaceAtlas2") then ApplyOverride(sender, "AtlasTexFaceMakeup", 2) end
    if (e.Channel == "makeupFaceAtlas3") then ApplyOverride(sender, "AtlasTexFaceMakeup", 3) end
    if E then
        if (e.Channel == "bodyTexVTNoCrackles") then 
            if E.BodyType == 0 and E.BodyShape == 0 then 
                ToggleOverride(sender, "VirtualBody", "Masc_NC")
            elseif E.BodyType == 0 and E.BodyShape == 1 then
                ToggleOverride(sender, "VirtualBody", "MascStrong_NC")
            elseif E.BodyType == 1 and E.BodyShape == 0 then
                ToggleOverride(sender, "VirtualBody", "Femme_NC")
            elseif E.BodyType == 1 and E.BodyShape == 1 then
                ToggleOverride(sender, "VirtualBody", "FemmeStrong_NC")
            end
        end
    end
    if (e.Channel == "tattooFace_Index1") then ApplyOverride(sender, "HeadIndex", 1) end
    if (e.Channel == "tattooFace_Index2") then ApplyOverride(sender, "HeadIndex", 2) end
    if (e.Channel == "tattooFace_Index3") then ApplyOverride(sender, "HeadIndex", 3) end
    if (e.Channel == "tattooFace_Index4") then ApplyOverride(sender, "HeadIndex", 4) end
    if (e.Channel == "tattooFace_Index5") then ApplyOverride(sender, "HeadIndex", 5) end
    if (e.Channel == "tattooFace_Index6") then ApplyOverride(sender, "HeadIndex", 6) end
    if (e.Channel == "tattooFace_Index7") then ApplyOverride(sender, "HeadIndex", 7) end
    if (e.Channel == "tattooFace_Index8") then ApplyOverride(sender, "HeadIndex", 8) end
    if (e.Channel == "tattooFace_Index9") then ApplyOverride(sender, "HeadIndex", 9) end
    if (e.Channel == "tattooFace_Index10") then ApplyOverride(sender, "HeadIndex", 10) end
    if (e.Channel == "tattooFace_Index11") then ApplyOverride(sender, "HeadIndex", 11) end
    if (e.Channel == "tattooFace_Index12") then ApplyOverride(sender, "HeadIndex", 12) end
    if (e.Channel == "tattooFace_Index13") then ApplyOverride(sender, "HeadIndex", 13) end
    if (e.Channel == "tattooFace_Index14") then ApplyOverride(sender, "HeadIndex", 14) end
    if (e.Channel == "tattooFace_Index15") then ApplyOverride(sender, "HeadIndex", 15) end
    if (e.Channel == "tattooFace_Index16") then ApplyOverride(sender, "HeadIndex", 16) end
    if (e.Channel == "makeupFace_Index1") then ApplyOverride(sender, "MakeupIndex", 1) end
    if (e.Channel == "makeupFace_Index2") then ApplyOverride(sender, "MakeupIndex", 2) end
    if (e.Channel == "makeupFace_Index3") then ApplyOverride(sender, "MakeupIndex", 3) end
    if (e.Channel == "makeupFace_Index4") then ApplyOverride(sender, "MakeupIndex", 4) end
    if (e.Channel == "makeupFace_Index5") then ApplyOverride(sender, "MakeupIndex", 5) end
    if (e.Channel == "makeupFace_Index6") then ApplyOverride(sender, "MakeupIndex", 6) end
    if (e.Channel == "makeupFace_Index7") then ApplyOverride(sender, "MakeupIndex", 7) end
    if (e.Channel == "makeupFace_Index8") then ApplyOverride(sender, "MakeupIndex", 8) end
    if (e.Channel == "makeupFace_Index9") then ApplyOverride(sender, "MakeupIndex", 9) end
    if (e.Channel == "makeupFace_Index10") then ApplyOverride(sender, "MakeupIndex", 10) end
    if (e.Channel == "makeupFace_Index11") then ApplyOverride(sender, "MakeupIndex", 11) end
    if (e.Channel == "makeupFace_Index12") then ApplyOverride(sender, "MakeupIndex", 12) end
    if (e.Channel == "makeupFace_Index13") then ApplyOverride(sender, "MakeupIndex", 13) end
    if (e.Channel == "makeupFace_Index14") then ApplyOverride(sender, "MakeupIndex", 14) end
    if (e.Channel == "makeupFace_Index15") then ApplyOverride(sender, "MakeupIndex", 15) end    
    if (e.Channel == "makeupFace_Index16") then ApplyOverride(sender, "MakeupIndex", 16) end
    if (e.Channel == "makeupFace_Index17") then ApplyOverride(sender, "MakeupIndex", 17) end
    if (e.Channel == "makeupFace_Index18") then ApplyOverride(sender, "MakeupIndex", 18) end
    if (e.Channel == "makeupFace_Index19") then ApplyOverride(sender, "MakeupIndex", 19) end
    if (e.Channel == "makeupFace_Index20") then ApplyOverride(sender, "MakeupIndex", 20) end
    if (e.Channel == "makeupFace_Index21") then ApplyOverride(sender, "MakeupIndex", 21) end
    if (e.Channel == "makeupFace_Index22") then ApplyOverride(sender, "MakeupIndex", 22) end
    if (e.Channel == "makeupFace_Index23") then ApplyOverride(sender, "MakeupIndex", 23) end
    if (e.Channel == "makeupFace_Index24") then ApplyOverride(sender, "MakeupIndex", 24) end
    if (e.Channel == "makeupFace_Index25") then ApplyOverride(sender, "MakeupIndex", 25) end
    if (e.Channel == "makeupFace_Index26") then ApplyOverride(sender, "MakeupIndex", 26) end
    if (e.Channel == "makeupFace_Index27") then ApplyOverride(sender, "MakeupIndex", 27) end
    if (e.Channel == "makeupFace_Index28") then ApplyOverride(sender, "MakeupIndex", 28) end
    if (e.Channel == "makeupFace_Index29") then ApplyOverride(sender, "MakeupIndex", 29) end
    if (e.Channel == "makeupFace_Index30") then ApplyOverride(sender, "MakeupIndex", 30) end
    if (e.Channel == "makeupFace_Index31") then ApplyOverride(sender, "MakeupIndex", 31) end
    if (e.Channel == "makeupFace_Index32") then ApplyOverride(sender, "MakeupIndex", 32) end
    if (e.Channel == "makeupFace_Index33") then ApplyOverride(sender, "MakeupIndex", 33) end
    if (e.Channel == "makeupFace_Index34") then ApplyOverride(sender, "MakeupIndex", 34) end
    if (e.Channel == "makeupFace_Index35") then ApplyOverride(sender, "MakeupIndex", 35) end
    if (e.Channel == "makeupFace_Index36") then ApplyOverride(sender, "MakeupIndex", 36) end
    if (e.Channel == "makeupFace_Index37") then ApplyOverride(sender, "MakeupIndex", 37) end
    if (e.Channel == "makeupFace_Index38") then ApplyOverride(sender, "MakeupIndex", 38) end    
    if (e.Channel == "makeupFace_Index39") then ApplyOverride(sender, "MakeupIndex", 39) end
    if (e.Channel == "makeupFace_Index40") then ApplyOverride(sender, "MakeupIndex", 40) end
    if (e.Channel == "makeupFace_Index41") then ApplyOverride(sender, "MakeupIndex", 41) end
    if (e.Channel == "makeupFace_Index42") then ApplyOverride(sender, "MakeupIndex", 42) end
    if (e.Channel == "makeupFace_Index43") then ApplyOverride(sender, "MakeupIndex", 43) end
    if (e.Channel == "makeupFace_Index44") then ApplyOverride(sender, "MakeupIndex", 44) end
    if (e.Channel == "makeupFace_Index45") then ApplyOverride(sender, "MakeupIndex", 45) end
    if (e.Channel == "makeupFace_Index46") then ApplyOverride(sender, "MakeupIndex", 46) end
    if (e.Channel == "Half_Illithid_Toggle") then ToggleOverride(sender, "HalfIllithid", "Toggle") end
end)