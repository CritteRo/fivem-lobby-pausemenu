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

function generateLobbyScaleform(_header, _buttons, _players, _details, _rowDetails)
    --[[  SET HEADER TITLE  ]]--
    BeginScaleformMovieMethodOnFrontendHeader("SHIFT_CORONA_DESC")
    PushScaleformMovieFunctionParameterBool(true); --shifts the column headers a bit down.
    PushScaleformMovieFunctionParameterBool(_header.showHeaderStrip); --This disables the colored strip above column headers.
    PopScaleformMovieFunction();
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_HEADER_TITLE")
    PushScaleformMovieFunctionParameterString(_header.title);       -- // Set the title
    PushScaleformMovieFunctionParameterBool(false);        -- // purpose unknown, is always 0 in decompiled scripts.
    PushScaleformMovieFunctionParameterString(_header.subtitle);    --// set the subtitle.
    PushScaleformMovieFunctionParameterBool(false);          --// setting this to true distorts the header... for some reason. On normal MP_PAUSE menu, it makes the title a bit smaller.
    PopScaleformMovieFunctionVoid();
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SHOW_HEADING_DETAILS") --disables right side player mockshot and cash / bank
    PushScaleformMovieFunctionParameterBool(_header.showPlayerCard); --toggle
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SHOW_MENU") --disables the column headers
    PushScaleformMovieFunctionParameterBool(true); --toggle
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    PushScaleformMovieFunctionParameterInt(0); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString(_header.menuHeaderText); --column text
    PushScaleformMovieFunctionParameterInt(1); --// Column width. 1 = default / 100%
    PushScaleformMovieFunctionParameterBool(false); --forces UPPER TEXT for the column text.
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    PushScaleformMovieFunctionParameterInt(0); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString(_header.menuHeaderAlert); --alert text.
    PushScaleformMovieFunctionParameterInt(_header.stripColor); --// alert color. Same IDs as player status or menu colors.
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    PushScaleformMovieFunctionParameterInt(1); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString(_header.playerHeaderAlert); --alert text.
    PushScaleformMovieFunctionParameterInt(_header.stripColor); --// alert color. Same IDs as player status or menu colors.
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    PushScaleformMovieFunctionParameterInt(2); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString(_header.detailsHeaderAlert); --alert text.
    PushScaleformMovieFunctionParameterInt(_header.stripColor); --// alert color. Same IDs as player status or menu colors.
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    PushScaleformMovieFunctionParameterInt(0); --// column
    PushScaleformMovieFunctionParameterInt(_header.stripColor); --// colorID
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    PushScaleformMovieFunctionParameterInt(1); --// column
    PushScaleformMovieFunctionParameterInt(_header.stripColor); --// colorID
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    PushScaleformMovieFunctionParameterInt(2); --// column
    PushScaleformMovieFunctionParameterInt(_header.stripColor); --// colorID
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    PushScaleformMovieFunctionParameterInt(2); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString(_header.detailsHeaderText)
    PushScaleformMovieFunctionParameterInt(1); --// Column width. 1 = default / 100%
    PushScaleformMovieFunctionParameterBool(false); --forceUpper...don't really know what it does. Setting it to true will hide? the column text
    PopScaleformMovieFunction()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_ALL_HIGHLIGHTS") --Changes the column header block color
    PushScaleformMovieFunctionParameterInt(1); --// toggle
    PushScaleformMovieFunctionParameterInt(_header.headerColor); --// colorID
    PopScaleformMovieFunction()
    --Citizen.Wait(100)


        --[[ :: For some reason, when changing the text of this column, the next scaleform function will be ignored. :: ]]--
    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    PushScaleformMovieFunctionParameterInt(1); --// columnID. Starts at 0
    PushScaleformMovieFunctionParameterString(_header.playerHeaderText);
    PushScaleformMovieFunctionParameterInt(1); --// Column width. 1 = default / 100%
    PushScaleformMovieFunctionParameterBool(false); --forceUpper...don't really know what it does. Setting it to true will hide? the column text
    Citizen.Wait(350)

    --[[ :: This function does nothing, because headers are showing by default. But it will get ignored because of the header change above. :: ]]--
    BeginScaleformMovieMethodOnFrontendHeader("SHOW_MENU") --disables the column headers
    PushScaleformMovieFunctionParameterBool(true); --toggle
    PopScaleformMovieFunction()

    --[[  SET BUTTONS ]]--
    for i,k in pairs(_buttons) do
        if i>0 then
            PushScaleformMovieFunctionN("SET_DATA_SLOT");
            PushScaleformMovieFunctionParameterInt(0); --// column
            PushScaleformMovieFunctionParameterInt(i-1); --// index
            PushScaleformMovieFunctionParameterInt(0); --// menu ID 0
            PushScaleformMovieFunctionParameterInt(i); --// unique ID 0
            PushScaleformMovieFunctionParameterInt(1); --// type 0
            PushScaleformMovieFunctionParameterInt(0); --// initialIndex 0
            PushScaleformMovieFunctionParameterBool(true); --// isSelectable true
            PushScaleformMovieFunctionParameterString(k.text); -- left side text
            PushScaleformMovieFunctionParameterString(k.RockStarLogo); --Setting this as a number string will show the Rockstar logo on the button.
            PushScaleformMovieFunctionParameterInt(k.symbol); --0 = shows raw rightText. 1 = Star symbol, 2 = skull, 3 = race flag, 4 = shield with cross(TDM?), 5 = multiple skulls, 6 - blank, 7 = castle, 9 = parachute, 10 = car with explosion.
            PushScaleformMovieFunctionParameterString(k.rightText);
            PushScaleformMovieFunctionParameterInt(0);
            PushScaleformMovieFunctionParameterBool(true);
            PopScaleformMovieFunctionVoid();
        end
    end

    --Citizen.Wait(100)
    PushScaleformMovieFunctionN("DISPLAY_DATA_SLOT"); --displays the data slots provided above
    PushScaleformMovieFunctionParameterInt(0); --column
    PopScaleformMovieFunctionVoid();


    --[[  DETAILS STUFF  ]]--

    PushScaleformMovieFunctionN("SET_COLUMN_TITLE");
    PushScaleformMovieFunctionParameterInt(1); --// some sort of type. Using 1 lets you create Title card.
    PushScaleformMovieFunctionParameterString(""); --when "type is 2", this is a column header.
    PushScaleformMovieFunctionParameterString(_details.detailsTitle); --when "type is 2", this is a left side text. If it's 1, then it's the title
    PushScaleformMovieFunctionParameterString(""); --when "type is 2", this is right text.
    PopScaleformMovieFunctionVoid();

    if _details.showWarning then
        PushScaleformMovieFunctionN("SET_COLUMN_TITLE");
        PushScaleformMovieFunctionParameterInt(2); --// some sort of type. Using 1 lets you create Title card. type 2 = warning/alert/error tile below the column.
        PushScaleformMovieFunctionParameterString(_details.warningTitle); --when "type is 2", this is a column header.
        PushScaleformMovieFunctionParameterString(_details.warningText); --when "type is 2", this is a left side text. If it's 1, then it's the title
        PushScaleformMovieFunctionParameterString(_details.warningRightText); --when "type is 2", this is right text.
        PopScaleformMovieFunctionVoid();
    end

    --[[  SET DETAILS ROWS ]]--
    for i,k in pairs(_rowDetails) do
        if i > 0 then
            PushScaleformMovieFunctionN("SET_DATA_SLOT");
            PushScaleformMovieFunctionParameterInt(1); --// column
            PushScaleformMovieFunctionParameterInt(i-1); --// index
            PushScaleformMovieFunctionParameterInt(0); --// menu ID 0
            PushScaleformMovieFunctionParameterInt(i); --// unique ID 0
            PushScaleformMovieFunctionParameterInt(1); --// type 0
            PushScaleformMovieFunctionParameterInt(0); --// initialIndex 0
            PushScaleformMovieFunctionParameterBool(false); --// isSelectable true
            PushScaleformMovieFunctionParameterString(k.text);
            PushScaleformMovieFunctionParameterString(k.rightText); --Right Text
            --///// UNSURE HOW THIS WORKS, BUT IF YOU UNCOMMENT THIS, IT'LL ADD AN ICON TO THE ROW.
            --///// MAKING THE STRING "20" AND THE BOOL TRUE SEEMS TO DO SOMETHING WITH A ROCKSTAR LOGO INSTEAD.
            --CritteR's note: I don't think the rockstar stuff works here.
            --PushScaleformMovieFunctionParameterInt(0);
            --PushScaleformMovieFunctionParameterString("20");
            --PushScaleformMovieFunctionParameterInt(0);
            --PushScaleformMovieFunctionParameterBool(true); --// SOMETHING WITH ROCKSTAR/STAR LOGO SWITCHING.
            PopScaleformMovieFunctionVoid();
        end
    end

    --Citizen.Wait(100)
    PushScaleformMovieFunctionN("DISPLAY_DATA_SLOT");
    PushScaleformMovieFunctionParameterInt(1);
    PopScaleformMovieFunctionVoid();

    --[[  PLAYERS  ]]--
    for i,k in pairs(_players) do
        if i > 0 then
            PushScaleformMovieFunctionN("SET_DATA_SLOT");                   --// call scaleform function
            PushScaleformMovieFunctionParameterInt(3);                      --// frontend menu column
            PushScaleformMovieFunctionParameterInt(i-1);                      --// row index
            PushScaleformMovieFunctionParameterInt(0);                     -- // menu ID
            PushScaleformMovieFunctionParameterInt(i);                     -- // unique ID
            PushScaleformMovieFunctionParameterInt(k.online);                     -- // type (2 = AS_ONLINE_IN_SESSION)
            PushScaleformMovieFunctionParameterInt(k.rank);         -- // rank value / (initialIndex 1337)
            PushScaleformMovieFunctionParameterBool(false);                -- // isSelectable
            PushScaleformMovieFunctionParameterString(k.name);    --  // playerName
            PushScaleformMovieFunctionParameterInt(k.rowColor);     --  // rowColor
            PushScaleformMovieFunctionParameterBool(k.online);               --  // reduceColors (if true: removes color from left bar & reduces color opacity on row itself.)
            PushScaleformMovieFunctionParameterInt(0);                    --  // unused
            PushScaleformMovieFunctionParameterInt(k.icon);         --  // right player icon.
            PushScaleformMovieFunctionParameterInt(0);                    --  // unused
            PushScaleformMovieFunctionParameterString(--[[$"..+{pr.CrewTag}"]]k.crew);--  // crew label text. It's either broken, or I don't know how to translate Vespura's input.
            PushScaleformMovieFunctionParameterBool(false);               --  // should be a thing to toggle blinking of (kick) icon, but doesn't seem to work.
            PushScaleformMovieFunctionParameterString(k.status);          -- // badge/status tag text
            PushScaleformMovieFunctionParameterInt(k.statusColor);   -- // badge/status tag background color
            PopScaleformMovieFunctionVoid();
        end
    end
    

    --Citizen.Wait(100)
    PushScaleformMovieFunctionN("DISPLAY_DATA_SLOT");
    PushScaleformMovieFunctionParameterInt(3);
    PopScaleformMovieFunctionVoid();

    --Citizen.Wait(100)

    --[[  SET FIRST FOCUS  ]]--
    PushScaleformMovieFunctionN("SET_COLUMN_FOCUS");
    PushScaleformMovieFunctionParameterInt(0); --// column index // _loc7_
    PushScaleformMovieFunctionParameterInt(1);-- // highlightIndex // _loc6_
    PushScaleformMovieFunctionParameterInt(1); --// scriptSetUniqID // _loc4_
    PushScaleformMovieFunctionParameterInt(0); --// scriptSetMenuState // _loc5_
    PopScaleformMovieFunctionVoid()
    --Citizen.Wait(100)

    --[[local PlayerPedPreview = ClonePed(PlayerPedId(), GetEntityHeading(PlayerPedId()), false, false)
    SetEntityVisible(PlayerPedPreview, false, false)

    Wait(200)
    GivePedToPauseMenu(PlayerPedPreview, 2)
    SetPauseMenuPedLighting(true)
    SetPauseMenuPedSleepState(true)]]
end



--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local last, current = GetPauseMenuSelection()
        print(last.." / "..current)
    end
end)]]
