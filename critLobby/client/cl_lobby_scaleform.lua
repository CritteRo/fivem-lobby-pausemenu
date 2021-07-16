menuButtons = {
    [0] = {text = "Button 1", RockStarLogo = "1", rightText = "3"},
    [1] = {text = "Button 2", RockStarLogo = "2", rightText = "1"},
    [2] = {text = "Button 3", RockStarLogo = "3", rightText = "2"},
    [3] = {text = "Button 4", RockStarLogo = "4", rightText = ""},
    [4] = {text = "Button 6", RockStarLogo = "5", rightText = "20"},
    [5] = {text = "Button 7", RockStarLogo = "", rightText = ""},
    [6] = {text = "Button 8", RockStarLogo = "", rightText = ""},
    [7] = {text = "Button 9", RockStarLogo = "", rightText = ""},
    [8] = {text = "Button 10", RockStarLogo = "", rightText = ""},
    [9] = {text = "Button 11", RockStarLogo = "", rightText = ""},
    [10] = {text = "Button 12", RockStarLogo = "", rightText = ""},
    [11] = {text = "Button 13", RockStarLogo = "", rightText = ""},
}

menuPlayers = {
    [0] = {name = "CritteR", crew = "ADMIN", icon = 65, bool = false, rank = 60, online = false},
    [1] = {name = "CritteRo", crew = "MOD", icon = 65, bool = false, rank = 3, online = false},
    [2] = {name = "NTT", crew = "", icon = 65, bool = false, rank = 500, online = false},
    [3] = {name = "Snaily <3", crew = "SEMPAI", icon = 65, bool = false, rank = 69, online = false},
    [4] = {name = "Griefer Jesus", crew = "", icon = 64, bool = true, rank = 10, online = false},
    [5] = {name = "Singleplayer Andy", crew = "", icon = 54, bool = true, rank = 10, online = false},
}

header = {title = "Test Lobby Title", subtitle = "This is too cool!"}

menuFocus = 0

function showBusySpinnerNoScaleform(_text)
    BeginTextCommandBusyspinnerOn("STRING")
    AddTextComponentSubstringPlayerName(_text)
    EndTextCommandBusyspinnerOn(1)
end

function generateLobbyScaleform(_header, _buttons, _players, _details)
    --[[  SET HEADER TITLE  ]]--
    BeginScaleformMovieMethodOnFrontendHeader("SHIFT_CORONA_DESC")
    PushScaleformMovieFunctionParameterBool(true); --shifts the column headers a bit down.
    PushScaleformMovieFunctionParameterBool(true); --This disables the colored strip above column headers.
    PopScaleformMovieFunction();
    Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_HEADER_TITLE")
    PushScaleformMovieFunctionParameterString(_header.title);       -- // Set the title
    PushScaleformMovieFunctionParameterBool(false);        -- // purpose unknown, is always 0 in decompiled scripts.
    PushScaleformMovieFunctionParameterString(_header.subtitle);    --// set the subtitle.
    PushScaleformMovieFunctionParameterBool(false);          --// setting this to true distorts the header... for some reason. On normal MP_PAUSE menu, it makes the title a bit smaller.
    PopScaleformMovieFunctionVoid();
    Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SHOW_HEADING_DETAILS") --disables right side player mockshot and cash / bank
    PushScaleformMovieFunctionParameterBool(true); --toggle
    PopScaleformMovieFunction()
    Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SHOW_MENU") --disables the column headers
    PushScaleformMovieFunctionParameterBool(true); --toggle
    PopScaleformMovieFunction()
    Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    PushScaleformMovieFunctionParameterInt(0); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString('menu'); --column text
    PushScaleformMovieFunctionParameterInt(1); --// Column width. 1 = default / 100%
    PushScaleformMovieFunctionParameterBool(true); --forces UPPER TEXT for the column text.
    PopScaleformMovieFunction()
    Citizen.Wait(150)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    PushScaleformMovieFunctionParameterInt(0); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString("Alerts? Hell yeah!"); --alert text.
    PushScaleformMovieFunctionParameterInt(7); --// alert color. Same IDs as player status or menu colors.
    PopScaleformMovieFunction()
    Citizen.Wait(150)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    PushScaleformMovieFunctionParameterInt(1); --// column
    PushScaleformMovieFunctionParameterInt(0); --// colorID
    PopScaleformMovieFunction()
    Citizen.Wait(150)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    PushScaleformMovieFunctionParameterInt(2); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString("Server Rules maybe?")
    PushScaleformMovieFunctionParameterInt(1); --// Column width. 1 = default / 100%
    PushScaleformMovieFunctionParameterBool(false); --forceUpper...don't really know what it does. Setting it to true will hide? the column text
    PopScaleformMovieFunction()
    Citizen.Wait(150)

    BeginScaleformMovieMethodOnFrontendHeader("SET_ALL_HIGHLIGHTS") --Changes the column header block color
    PushScaleformMovieFunctionParameterInt(1); --// column
    PushScaleformMovieFunctionParameterInt(2); --// colorID
    PopScaleformMovieFunction()
    Citizen.Wait(150)


        --[[ :: For some reason, when changing the text of this column, the next scaleform function will be ignored. :: ]]--
    --[[BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    PushScaleformMovieFunctionParameterInt(1); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString("Online Players?");
    PushScaleformMovieFunctionParameterInt(1); --// Column width. 1 = default / 100%
    PushScaleformMovieFunctionParameterBool(false); --forceUpper...don't really know what it does. Setting it to true will hide? the column text
    Citizen.Wait(350)]]

    --[[  SET BUTTONS ]]--
    for i,k in pairs(_buttons) do
        PushScaleformMovieFunctionN("SET_DATA_SLOT");
        PushScaleformMovieFunctionParameterInt(0); --// column
        PushScaleformMovieFunctionParameterInt(i); --// index
        PushScaleformMovieFunctionParameterInt(0); --// menu ID 0
        PushScaleformMovieFunctionParameterInt(i); --// unique ID 0
        PushScaleformMovieFunctionParameterInt(1); --// type 0
        PushScaleformMovieFunctionParameterInt(0); --// initialIndex 0
        PushScaleformMovieFunctionParameterBool(true); --// isSelectable true
        PushScaleformMovieFunctionParameterString(k.text); -- left side text
        PushScaleformMovieFunctionParameterString(k.RockStarLogo); --Setting this as a number string will show the Rockstar logo on the button.
        PushScaleformMovieFunctionParameterInt(3); --0 = shows raw rightText. 1 = Star symbol, 2 = skull, 3 = race flag, 4 = shield with cross(TDM?), 5 = multiple skulls, 6 - blank, 7 = castle, 9 = parachute, 10 = car with explosion.
        PushScaleformMovieFunctionParameterString(k.rightText);
        PushScaleformMovieFunctionParameterInt(0);
        PushScaleformMovieFunctionParameterBool(true);
        PopScaleformMovieFunctionVoid();
    end

    Citizen.Wait(100)
    PushScaleformMovieFunctionN("DISPLAY_DATA_SLOT"); --displays the data slots provided above
    PushScaleformMovieFunctionParameterInt(0); --column
    PopScaleformMovieFunctionVoid();


    --[[  DETAILS STUFF  ]]--

    PushScaleformMovieFunctionN("SET_COLUMN_TITLE");
    PushScaleformMovieFunctionParameterInt(1); --// some sort of type. Using 1 lets you create Title card.
    PushScaleformMovieFunctionParameterString("test!"); --when "type is 2", this is a column header.
    PushScaleformMovieFunctionParameterString("Some sort of title here."); --when "type is 2", this is a left side text. If it's 1, then it's the title
    PushScaleformMovieFunctionParameterString("~r~tests~!"); --when "type is 2", this is right text.
    PopScaleformMovieFunctionVoid();

    PushScaleformMovieFunctionN("SET_COLUMN_TITLE");
    PushScaleformMovieFunctionParameterInt(2); --// some sort of type. Using 1 lets you create Title card. type 2 = warning/alert/error tile below the column.
    PushScaleformMovieFunctionParameterString("WARNING!"); --when "type is 2", this is a column header.
    PushScaleformMovieFunctionParameterString("Scaleforms are too hot!"); --when "type is 2", this is a left side text. If it's 1, then it's the title
    PushScaleformMovieFunctionParameterString("~r~ABORT~s~!"); --when "type is 2", this is right text.
    PopScaleformMovieFunctionVoid();

    PushScaleformMovieFunctionN("SET_DATA_SLOT");
    PushScaleformMovieFunctionParameterInt(1); --// column
    PushScaleformMovieFunctionParameterInt(0); --// index
    PushScaleformMovieFunctionParameterInt(0); --// menu ID 0
    PushScaleformMovieFunctionParameterInt(0); --// unique ID 0
    PushScaleformMovieFunctionParameterInt(1); --// type 0
    PushScaleformMovieFunctionParameterInt(0); --// initialIndex 0
    PushScaleformMovieFunctionParameterBool(false); --// isSelectable true
    PushScaleformMovieFunctionParameterString("This is the description part. Anything that I");
    PushScaleformMovieFunctionParameterString(""); --Right Text
    --///// UNSURE HOW THIS WORKS, BUT IF YOU UNCOMMENT THIS, IT'LL ADD AN ICON TO THE ROW.
    --///// MAKING THE STRING "20" AND THE BOOL TRUE SEEMS TO DO SOMETHING WITH A ROCKSTAR LOGO INSTEAD.
    --CritteR's note: I don't think the rockstar stuff works here.
    PushScaleformMovieFunctionParameterInt(0);
    PushScaleformMovieFunctionParameterString("20");
    PushScaleformMovieFunctionParameterInt(0);
    PushScaleformMovieFunctionParameterBool(true); --// SOMETHING WITH ROCKSTAR/STAR LOGO SWITCHING.
    PopScaleformMovieFunctionVoid();

    PushScaleformMovieFunctionN("SET_DATA_SLOT");
    PushScaleformMovieFunctionParameterInt(1); --// column
    PushScaleformMovieFunctionParameterInt(1); --// index
    PushScaleformMovieFunctionParameterInt(0); --// menu ID 0
    PushScaleformMovieFunctionParameterInt(0); --// unique ID 0
    PushScaleformMovieFunctionParameterInt(10); --// type 0
    PushScaleformMovieFunctionParameterInt(0); --// initialIndex 0
    PushScaleformMovieFunctionParameterBool(false); --// isSelectable true
    PushScaleformMovieFunctionParameterString("Add here should be shown to the user.");
    PushScaleformMovieFunctionParameterString(""); --Right Text
    --///// UNSURE HOW THIS WORKS, BUT IF YOU UNCOMMENT THIS, IT'LL ADD AN ICON TO THE ROW.
    --///// MAKING THE STRING "20" AND THE BOOL TRUE SEEMS TO DO SOMETHING WITH A ROCKSTAR LOGO INSTEAD.
    PushScaleformMovieFunctionParameterInt(0);
    PushScaleformMovieFunctionParameterString("0");
    PushScaleformMovieFunctionParameterInt(0);
    PushScaleformMovieFunctionParameterBool(true); --// SOMETHING WITH ROCKSTAR/STAR LOGO SWITCHING.
    PopScaleformMovieFunctionVoid();

    Citizen.Wait(100)
    PushScaleformMovieFunctionN("DISPLAY_DATA_SLOT");
    PushScaleformMovieFunctionParameterInt(1);
    PopScaleformMovieFunctionVoid();

    --[[  PLAYERS  ]]--
    for i,k in pairs(_players) do
        PushScaleformMovieFunctionN("SET_DATA_SLOT");                   --// call scaleform function
        PushScaleformMovieFunctionParameterInt(3);                      --// frontend menu column
        PushScaleformMovieFunctionParameterInt(i);                      --// row index
        PushScaleformMovieFunctionParameterInt(0);                     -- // menu ID
        PushScaleformMovieFunctionParameterInt(0);                     -- // unique ID
        PushScaleformMovieFunctionParameterInt(k.online);                     -- // type (2 = AS_ONLINE_IN_SESSION)
        PushScaleformMovieFunctionParameterInt(k.rank);         -- // rank value / (initialIndex 1337)
        PushScaleformMovieFunctionParameterBool(k.online);                -- // isSelectable
        PushScaleformMovieFunctionParameterString(k.name);    --  // playerName
        PushScaleformMovieFunctionParameterInt(11);     --  // rowColor
        PushScaleformMovieFunctionParameterBool(k.bool);               --  // reduceColors (if true: removes color from left bar & reduces color opacity on row itself.)
        PushScaleformMovieFunctionParameterInt(0);                    --  // unused
        PushScaleformMovieFunctionParameterInt(k.icon);         --  // right player icon.
        PushScaleformMovieFunctionParameterInt(0);                    --  // unused
        PushScaleformMovieFunctionParameterString(--[[$"..+{pr.CrewTag}"]]""..k.crew);--  // crew label text. It's either broken, or I don't know how to translate Vespura's input.
        PushScaleformMovieFunctionParameterBool(false);               --  // should be a thing to toggle blinking of (kick) icon, but doesn't seem to work.
        PushScaleformMovieFunctionParameterString(k.crew);          -- // badge/status tag text
        PushScaleformMovieFunctionParameterInt(18);   -- // badge/status tag background color
        PopScaleformMovieFunctionVoid();
    end
    

    Citizen.Wait(100)
    PushScaleformMovieFunctionN("DISPLAY_DATA_SLOT");
    PushScaleformMovieFunctionParameterInt(3);
    PopScaleformMovieFunctionVoid();

    Citizen.Wait(100)

    --[[  SET FIRST FOCUS  ]]--
    PushScaleformMovieFunctionN("SET_COLUMN_FOCUS");
    PushScaleformMovieFunctionParameterInt(menuFocus); --// column index // _loc7_
    PushScaleformMovieFunctionParameterInt(1);-- // highlightIndex // _loc6_
    PushScaleformMovieFunctionParameterInt(1); --// scriptSetUniqID // _loc4_
    PushScaleformMovieFunctionParameterInt(0); --// scriptSetMenuState // _loc5_
    PopScaleformMovieFunctionVoid()
    Citizen.Wait(100)

    --[[local PlayerPedPreview = ClonePed(PlayerPedId(), GetEntityHeading(PlayerPedId()), false, false)
    SetEntityVisible(PlayerPedPreview, false, false)

    Wait(200)
    GivePedToPauseMenu(PlayerPedPreview, 2)
    SetPauseMenuPedLighting(true)
    SetPauseMenuPedSleepState(true)]]
end



RegisterCommand('showfr', function()
    TriggerScreenblurFadeIn(1000) --screen blur
    ActivateFrontendMenu("FE_MENU_VERSION_CORONA", false, -1)
    Citizen.Wait(100)
    generateLobbyScaleform(header, menuButtons, menuPlayers, 0)
    SetFrontendRadioActive(true)
end)

RegisterCommand('hidefr', function()
    SetFrontendActive(false)
    TriggerScreenblurFadeOut(1000)--screen blur
    PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET")
    BusyspinnerOff()
end)

RegisterCommand('pressfr', function()
    local last, current = GetPauseMenuSelection()
    showBusySpinnerNoScaleform("You just used "..menuButtons[current].text..".")
    PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET")
end)

RegisterKeyMapping('hidefr', 'Close Frontend Menu', 'keyboard', 'BACK')
RegisterKeyMapping('pressfr', 'Use Frontend Menu Item', 'keyboard', 'RETURN')


--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local last, current = GetPauseMenuSelection()
        print(last.." / "..current)
    end
end)]]
