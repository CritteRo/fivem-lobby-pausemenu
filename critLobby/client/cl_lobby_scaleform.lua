menuFocus = 0

function showBusySpinnerNoScaleform(_text)
    BeginTextCommandBusyspinnerOn("STRING")
    AddTextComponentSubstringPlayerName(_text)
    EndTextCommandBusyspinnerOn(1)
end

function generateLobbyScaleform(_header, _buttons, _players, _details, _rowDetails)
    --[[  SET HEADER TITLE  ]]--
    BeginScaleformMovieMethodOnFrontendHeader("SHIFT_CORONA_DESC")
    ScaleformMovieMethodAddParamBool(true); --shifts the column headers a bit down.
    ScaleformMovieMethodAddParamBool(_header.showHeaderStrip); --This disables the colored strip above column headers.
    EndScaleformMovieMethod();
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_HEADER_TITLE")
    ScaleformMovieMethodAddParamTextureNameString(_header.title);       -- // Set the title
    ScaleformMovieMethodAddParamBool(false);        -- // purpose unknown, is always 0 in decompiled scripts.
    ScaleformMovieMethodAddParamTextureNameString(_header.subtitle);    --// set the subtitle.
    ScaleformMovieMethodAddParamBool(false);          --// setting this to true distorts the header... for some reason. On normal MP_PAUSE menu, it makes the title a bit smaller.
    EndScaleformMovieMethod();
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SHOW_HEADING_DETAILS") --disables right side player mockshot and cash / bank
    ScaleformMovieMethodAddParamBool(_header.showPlayerCard); --toggle
    EndScaleformMovieMethod()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SHOW_MENU") --disables the column headers
    ScaleformMovieMethodAddParamBool(true); --toggle
    EndScaleformMovieMethod()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    ScaleformMovieMethodAddParamInt(0); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.menuHeaderText); --column text
    ScaleformMovieMethodAddParamInt(1); --// Column width. 1 = default / 100%
    ScaleformMovieMethodAddParamBool(false); --forces UPPER TEXT for the column text.
    EndScaleformMovieMethodReturnValue()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    ScaleformMovieMethodAddParamInt(0); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.menuHeaderAlert); --alert text.
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// alert color. Same IDs as player status or menu colors.
    EndScaleformMovieMethodReturnValue()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    ScaleformMovieMethodAddParamInt(1); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.playerHeaderAlert); --alert text.
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// alert color. Same IDs as player status or menu colors.
    EndScaleformMovieMethodReturnValue()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    ScaleformMovieMethodAddParamInt(2); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.detailsHeaderAlert); --alert text.
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// alert color. Same IDs as player status or menu colors.
    EndScaleformMovieMethodReturnValue()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    ScaleformMovieMethodAddParamInt(0); --// column
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// colorID
    EndScaleformMovieMethodReturnValue()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    ScaleformMovieMethodAddParamInt(1); --// column
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// colorID
    EndScaleformMovieMethodReturnValue()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    ScaleformMovieMethodAddParamInt(2); --// column
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// colorID
    EndScaleformMovieMethodReturnValue()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    ScaleformMovieMethodAddParamInt(2); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.detailsHeaderText)
    ScaleformMovieMethodAddParamInt(1); --// Column width. 1 = default / 100%
    ScaleformMovieMethodAddParamBool(false); --forceUpper...don't really know what it does. Setting it to true will hide? the column text
    EndScaleformMovieMethodReturnValue()
    --Citizen.Wait(100)

    BeginScaleformMovieMethodOnFrontendHeader("SET_ALL_HIGHLIGHTS") --Changes the column header block color
    ScaleformMovieMethodAddParamInt(1); --// toggle
    ScaleformMovieMethodAddParamInt(_header.headerColor); --// colorID
    EndScaleformMovieMethodReturnValue()
    --Citizen.Wait(100)


        --[[ :: For some reason, when changing the text of this column, the next scaleform function will be ignored. :: ]]--
    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    ScaleformMovieMethodAddParamInt(1); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.playerHeaderText);
    ScaleformMovieMethodAddParamInt(1); --// Column width. 1 = default / 100%
    ScaleformMovieMethodAddParamBool(false); --forceUpper...don't really know what it does. Setting it to true will hide? the column text
    EndScaleformMovieMethodReturnValue()

    --[[  SET BUTTONS ]]--
    for i,k in pairs(_buttons) do
        if i>0 then
            BeginScaleformMovieMethodOnFrontend("SET_DATA_SLOT");
            ScaleformMovieMethodAddParamInt(0); --// column
            ScaleformMovieMethodAddParamInt(i-1); --// index
            ScaleformMovieMethodAddParamInt(0); --// menu ID 0
            ScaleformMovieMethodAddParamInt(i); --// unique ID 0
            ScaleformMovieMethodAddParamInt(1); --// type 0
            ScaleformMovieMethodAddParamInt(0); --// initialIndex 0
            ScaleformMovieMethodAddParamBool(true); --// isSelectable true
            ScaleformMovieMethodAddParamTextureNameString(k.text); -- left side text
            ScaleformMovieMethodAddParamTextureNameString(k.RockStarLogo); --Setting this as a number string will show the Rockstar logo on the button.
            ScaleformMovieMethodAddParamInt(k.symbol); --0 = shows raw rightText. 1 = Star symbol, 2 = skull, 3 = race flag, 4 = shield with cross(TDM?), 5 = multiple skulls, 6 - blank, 7 = castle, 9 = parachute, 10 = car with explosion.
            ScaleformMovieMethodAddParamTextureNameString(k.rightText);
            ScaleformMovieMethodAddParamInt(0);
            ScaleformMovieMethodAddParamBool(true);
            EndScaleformMovieMethod();
        end
    end

    --Citizen.Wait(100)
    BeginScaleformMovieMethodOnFrontend("DISPLAY_DATA_SLOT"); --displays the data slots provided above
    ScaleformMovieMethodAddParamInt(0); --column
    EndScaleformMovieMethod();


    --[[  DETAILS STUFF  ]]--

    BeginScaleformMovieMethodOnFrontend("SET_COLUMN_TITLE");
    ScaleformMovieMethodAddParamInt(1); --// some sort of type. Using 1 lets you create Title card.
    ScaleformMovieMethodAddParamTextureNameString(""); --when "type is 2", this is a column header.
    ScaleformMovieMethodAddParamTextureNameString(_details.detailsTitle); --when "type is 2", this is a left side text. If it's 1, then it's the title
    ScaleformMovieMethodAddParamTextureNameString(""); --when "type is 2", this is right text.
    ScaleformMovieMethodAddParamTextureNameString(_details.textureDirectory); --TextureDirectory for column img
    ScaleformMovieMethodAddParamTextureNameString(_details.textureName);  --TextureName for column img
    ScaleformMovieMethodAddParamInt(1); --// idk, unused?
    EndScaleformMovieMethod();

    --[[BeginScaleformMovieMethodOnFrontend("ADD_TXD_REF_RESPONSE"); --not working btw
    ScaleformMovieMethodAddParamTextureNameString(--[['spcityraces'_details.textureDirectory); --when "type is 2", this is a left side text. If it's 1, then it's the title
    ScaleformMovieMethodAddParamTextureNameString(--[['airport'_details.textureName); --when "type is 2", this is right text.
    ScaleformMovieMethodAddParamInt(0);
    EndScaleformMovieMethod();]]

    --[[ :: This is the big reclange that you can find on Pause Menu at Notifications or Jobs, basically a big text box with R* background :: ]]--
    --[[BeginScaleformMovieMethodOnFrontend("SHOW_WARNING_MESSAGE");
    ScaleformMovieMethodAddParamInt(1);
    ScaleformMovieMethodAddParamInt(1);
    ScaleformMovieMethodAddParamInt(2);
    ScaleformMovieMethodAddParamTextureNameString('test');
    ScaleformMovieMethodAddParamTextureNameString('test2');
    ScaleformMovieMethodAddParamInt(0);
    ScaleformMovieMethodAddParamTextureNameString('spcityraces'); --when "type is 2", this is a left side text. If it's 1, then it's the title
    ScaleformMovieMethodAddParamTextureNameString('airport'); --when "type is 2", this is right text.
    ScaleformMovieMethodAddParamInt(0);
    ScaleformMovieMethodAddParamTextureNameString('test2');
    ScaleformMovieMethodAddParamInt(0);
    EndScaleformMovieMethod();]]

    if _details.showWarning then
        BeginScaleformMovieMethodOnFrontend("SET_COLUMN_TITLE");
        ScaleformMovieMethodAddParamInt(2); --// some sort of type. Using 1 lets you create Title card. type 2 = warning/alert/error tile below the column.
        ScaleformMovieMethodAddParamTextureNameString(_details.warningTitle); --when "type is 2", this is a column header.
        ScaleformMovieMethodAddParamTextureNameString(_details.warningText); --when "type is 2", this is a left side text. If it's 1, then it's the title
        ScaleformMovieMethodAddParamTextureNameString(_details.warningRightText); --when "type is 2", this is right text.
        EndScaleformMovieMethod();
    end

    --[[  SET DETAILS ROWS ]]--
    for i,k in pairs(_rowDetails) do
        if i > 0 then
            BeginScaleformMovieMethodOnFrontend("SET_DATA_SLOT");
            ScaleformMovieMethodAddParamInt(1); --// column
            ScaleformMovieMethodAddParamInt(i-1); --// index
            ScaleformMovieMethodAddParamInt(0); --// menu ID 0
            ScaleformMovieMethodAddParamInt(i); --// unique ID 0
            ScaleformMovieMethodAddParamInt(1); --// type 0
            ScaleformMovieMethodAddParamInt(0); --// initialIndex 0
            ScaleformMovieMethodAddParamBool(false); --// isSelectable true
            ScaleformMovieMethodAddParamTextureNameString(k.text);
            ScaleformMovieMethodAddParamTextureNameString(k.rightText); --Right Text
            --///// UNSURE HOW THIS WORKS, BUT IF YOU UNCOMMENT THIS, IT'LL ADD AN ICON TO THE ROW.
            --///// MAKING THE STRING "20" AND THE BOOL TRUE SEEMS TO DO SOMETHING WITH A ROCKSTAR LOGO INSTEAD.
            --CritteR's note: I don't think the rockstar stuff works here.
            --ScaleformMovieMethodAddParamInt(0);
            --ScaleformMovieMethodAddParamTextureNameString("20");
            --ScaleformMovieMethodAddParamInt(0);
            --ScaleformMovieMethodAddParamBool(true); --// SOMETHING WITH ROCKSTAR/STAR LOGO SWITCHING.
            EndScaleformMovieMethod();
        end
    end

    --Citizen.Wait(100)
    BeginScaleformMovieMethodOnFrontend("DISPLAY_DATA_SLOT");
    ScaleformMovieMethodAddParamInt(1);
    EndScaleformMovieMethod();

    --[[  PLAYERS  ]]--
    for i,k in pairs(_players) do
        if i > 0 then
            BeginScaleformMovieMethodOnFrontend("SET_DATA_SLOT");                   --// call scaleform function
            ScaleformMovieMethodAddParamInt(3);                      --// frontend menu column
            ScaleformMovieMethodAddParamInt(i-1);                      --// row index
            ScaleformMovieMethodAddParamInt(0);                     -- // menu ID
            ScaleformMovieMethodAddParamInt(i);                     -- // unique ID
            ScaleformMovieMethodAddParamInt(k.online);                     -- // type (2 = AS_ONLINE_IN_SESSION)
            ScaleformMovieMethodAddParamInt(k.rank);         -- // rank value / (initialIndex 1337)
            ScaleformMovieMethodAddParamBool(false);                -- // isSelectable
            ScaleformMovieMethodAddParamTextureNameString(k.name);    --  // playerName
            ScaleformMovieMethodAddParamInt(k.rowColor);     --  // rowColor
            ScaleformMovieMethodAddParamBool(k.online);               --  // reduceColors (if true: removes color from left bar & reduces color opacity on row itself.)
            ScaleformMovieMethodAddParamInt(0);                    --  // unused
            ScaleformMovieMethodAddParamInt(k.icon);         --  // right player icon.
            ScaleformMovieMethodAddParamInt(0);                    --  // unused
            ScaleformMovieMethodAddParamTextureNameString(--[[$"..+{pr.CrewTag}"]]k.crew);--  // crew label text. It's either broken, or I don't know how to translate Vespura's input.
            ScaleformMovieMethodAddParamBool(false);               --  // should be a thing to toggle blinking of (kick) icon, but doesn't seem to work.
            ScaleformMovieMethodAddParamTextureNameString(k.status);          -- // badge/status tag text
            ScaleformMovieMethodAddParamInt(k.statusColor);   -- // badge/status tag background color
            EndScaleformMovieMethod();
        end
    end
    

    --Citizen.Wait(100)
    BeginScaleformMovieMethodOnFrontend("DISPLAY_DATA_SLOT");
    ScaleformMovieMethodAddParamInt(3);
    EndScaleformMovieMethod();

    --Citizen.Wait(100)

    --[[  SET FIRST FOCUS  ]]--
    BeginScaleformMovieMethodOnFrontend("SET_COLUMN_FOCUS");
    ScaleformMovieMethodAddParamInt(0); --// column index // _loc7_
    ScaleformMovieMethodAddParamInt(1);-- // highlightIndex // _loc6_
    ScaleformMovieMethodAddParamInt(1); --// scriptSetUniqID // _loc4_
    ScaleformMovieMethodAddParamInt(0); --// scriptSetMenuState // _loc5_
    EndScaleformMovieMethod()
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
