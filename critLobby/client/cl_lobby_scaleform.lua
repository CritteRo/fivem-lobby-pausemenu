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
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_HEADER_TITLE")
    ScaleformMovieMethodAddParamTextureNameString(_header.title);       -- // Set the title
    ScaleformMovieMethodAddParamBool(false);        -- // purpose unknown, is always 0 in decompiled scripts.
    ScaleformMovieMethodAddParamTextureNameString(_header.subtitle);    --// set the subtitle.
    ScaleformMovieMethodAddParamBool(false);          --// setting this to true distorts the header... for some reason. On normal MP_PAUSE menu, it makes the title a bit smaller.
    EndScaleformMovieMethod();
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SHOW_HEADING_DETAILS") --disables right side player mockshot and cash / bank
    ScaleformMovieMethodAddParamBool(_header.showPlayerCard); --toggle
    EndScaleformMovieMethod()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SHOW_MENU") --disables the column headers
    ScaleformMovieMethodAddParamBool(true); --toggle
    EndScaleformMovieMethod()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    ScaleformMovieMethodAddParamInt(0); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.menuHeaderText); --column text
    ScaleformMovieMethodAddParamInt(1); --// Column width. 1 = default / 100%
    ScaleformMovieMethodAddParamBool(false); --forces UPPER TEXT for the column text.
    EndScaleformMovieMethodReturnValue()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    ScaleformMovieMethodAddParamInt(0); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.menuHeaderAlert); --alert text.
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// alert color. Same IDs as player status or menu colors.
    EndScaleformMovieMethodReturnValue()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    ScaleformMovieMethodAddParamInt(1); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.playerHeaderAlert); --alert text.
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// alert color. Same IDs as player status or menu colors.
    EndScaleformMovieMethodReturnValue()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_ALERT")  --Changes the column header text
    ScaleformMovieMethodAddParamInt(2); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.detailsHeaderAlert); --alert text.
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// alert color. Same IDs as player status or menu colors.
    EndScaleformMovieMethodReturnValue()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    ScaleformMovieMethodAddParamInt(0); --// column
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// colorID
    EndScaleformMovieMethodReturnValue()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    ScaleformMovieMethodAddParamInt(1); --// column
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// colorID
    EndScaleformMovieMethodReturnValue()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_ITEM_COLOUR")  --Changes the column header colored strip
    ScaleformMovieMethodAddParamInt(2); --// column
    ScaleformMovieMethodAddParamInt(_header.stripColor); --// colorID
    EndScaleformMovieMethodReturnValue()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
    ScaleformMovieMethodAddParamInt(2); --// columnID. Starts at 0
    ScaleformMovieMethodAddParamTextureNameString(_header.detailsHeaderText)
    ScaleformMovieMethodAddParamInt(1); --// Column width. 1 = default / 100%
    ScaleformMovieMethodAddParamBool(false); --forceUpper...don't really know what it does. Setting it to true will hide? the column text
    EndScaleformMovieMethodReturnValue()
    Citizen.Wait(10)

    BeginScaleformMovieMethodOnFrontendHeader("SET_ALL_HIGHLIGHTS") --Changes the column header block color
    ScaleformMovieMethodAddParamInt(1); --// toggle
    ScaleformMovieMethodAddParamInt(_header.headerColor); --// colorID
    EndScaleformMovieMethodReturnValue()
    Citizen.Wait(10)


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
            ScaleformMovieMethodAddParamBool(k.isSelectable); --// isSelectable true
            ScaleformMovieMethodAddParamTextureNameString(k.text); -- left side text
            ScaleformMovieMethodAddParamTextureNameString(k.RockStarLogo); --Setting this as a number string will show the Rockstar logo on the button.
            ScaleformMovieMethodAddParamInt(k.symbol); --0 = shows raw rightText. 1 = Star symbol, 2 = skull, 3 = race flag, 4 = shield with cross(TDM?), 5 = multiple skulls, 6 - blank, 7 = castle, 9 = parachute, 10 = car with explosion.
            ScaleformMovieMethodAddParamTextureNameString(k.rightText);
            ScaleformMovieMethodAddParamInt(1); --unused?
            ScaleformMovieMethodAddParamInt(1); --unused?
            ScaleformMovieMethodAddParamInt(0); --This makes the first button (only the first) flicker
            if _buttons[i+1] ~= nil then
                ScaleformMovieMethodAddParamInt(0); --This adds the bar above the button. Does not work for first button.
            else
                ScaleformMovieMethodAddParamInt(1); --This adds the bar above the button. Does not work for first button.
            end
            ScaleformMovieMethodAddParamInt(0); --unused?
            ScaleformMovieMethodAddParamInt(0); --"Green Checkmark" icon
            EndScaleformMovieMethod();
        end

        --[[ SET TOOLTIP ]]--
        BeginScaleformMovieMethodN("SET_DESCRIPTION")
        PushScaleformMovieFunctionParameterInt(0) --This is a type. 0 is tooltip bellow buttons. 3 is a loading thing on the player column.
        PushScaleformMovieFunctionParameterString(_details.tooltipText)
        PushScaleformMovieMethodParameterInt(0) --toggle, Info icon flashing
        PushScaleformMovieMethodParameterInt(0) --togle, text flashing.
        EndScaleformMovieMethod()
    end

    Citizen.Wait(10)
    BeginScaleformMovieMethodOnFrontend("DISPLAY_DATA_SLOT"); --displays the data slots provided above
    ScaleformMovieMethodAddParamInt(0); --column
    EndScaleformMovieMethod();

    --[[ :: This is the big rectangle that you can find on Pause Menu at Notifications or Jobs, basically a big text box with R* background :: ]]--
    if _details.showTextBoxToColumn ~= 0 and _details.showTextBoxToColumn < 4 then
        BeginScaleformMovieMethodOnFrontend("SHOW_WARNING_MESSAGE");
        ScaleformMovieMethodAddParamInt(1); --showToggle
        if _details.showTextBoxToColumn < 3 then
            ScaleformMovieMethodAddParamInt(_details.showTextBoxToColumn); --column from where to start.
            ScaleformMovieMethodAddParamInt(1); --columns to cover.
        elseif _details.showTextBoxToColumn == 3 then
            ScaleformMovieMethodAddParamInt(1); --column from where to start.
            ScaleformMovieMethodAddParamInt(2); --columns to cover.
        end
        ScaleformMovieMethodAddParamTextureNameString(_details.warningText); --body String.
        ScaleformMovieMethodAddParamTextureNameString(_details.warningTitle); --title String.
        ScaleformMovieMethodAddParamInt(0); --background height?
        ScaleformMovieMethodAddParamTextureNameString(''); --textureDictionary
        ScaleformMovieMethodAddParamTextureNameString(''); --textureName
        ScaleformMovieMethodAddParamInt(0); --image Alignment. (Probably justify. 0 = left)
        ScaleformMovieMethodAddParamTextureNameString(_details.warningRightText); --footer String.
        ScaleformMovieMethodAddParamInt(0); --request background texture.
        EndScaleformMovieMethod()
        Citizen.Wait(10)

        if _details.showTextBoxToColumn == 3 then
            BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
            ScaleformMovieMethodAddParamInt(1); --// columnID. Starts at 0
            ScaleformMovieMethodAddParamTextureNameString(_header.detailsHeaderText)
            ScaleformMovieMethodAddParamInt(2); --// Column width. 1 = default / 100%
            ScaleformMovieMethodAddParamBool(false); --forceUpper...don't really know what it does. Setting it to true will hide? the column text
            EndScaleformMovieMethodReturnValue()
            Citizen.Wait(10)
        end
    end

    if _details.showTextBoxToColumn == 0 or _details.showTextBoxToColumn == 1 then
        --[[  DETAILS STUFF  ]]--
        BeginScaleformMovieMethodOnFrontend("SET_COLUMN_TITLE");
        ScaleformMovieMethodAddParamInt(1); --// some sort of type. Using 1 lets you create Title card.
        ScaleformMovieMethodAddParamTextureNameString(""); --when "type is 2", this is a column header.
        ScaleformMovieMethodAddParamTextureNameString(_details.detailsTitle); --when "type is 2", this is a left side text. If it's 1, then it's the title
        ScaleformMovieMethodAddParamTextureNameString(""); --when "type is 2", this is right text.
        ScaleformMovieMethodAddParamTextureNameString(_details.textureDirectory); --TextureDirectory for column img
        ScaleformMovieMethodAddParamTextureNameString(_details.textureName);  --TextureName for column img
        ScaleformMovieMethodAddParamInt(1); --// idk, unused?
        ScaleformMovieMethodAddParamInt(2) --setting this to 1, makes the img squashed.
        ScaleformMovieMethodAddParamTextureNameString(_details.rpValue) --RP value
        ScaleformMovieMethodAddParamTextureNameString(_details.cashValue) --Cash value
        ScaleformMovieMethodAddParamTextureNameString(_details.apValue) --Ap value
        EndScaleformMovieMethod();

        BeginScaleformMovieMethodOnFrontend("ADD_TXD_REF_RESPONSE"); --not working btw
        ScaleformMovieMethodAddParamTextureNameString(_details.textureDirectory); --when "type is 2", this is a left side text. If it's 1, then it's the title
        ScaleformMovieMethodAddParamTextureNameString(_details.textureName); --when "type is 2", this is right text.
        ScaleformMovieMethodAddParamInt(0);
        EndScaleformMovieMethod();

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

        Citizen.Wait(10)
        BeginScaleformMovieMethodOnFrontend("DISPLAY_DATA_SLOT");
        ScaleformMovieMethodAddParamInt(1);
        EndScaleformMovieMethod();
    end

    if _details.showTextBoxToColumn == 0 or _details.showTextBoxToColumn == 2 then
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
                ScaleformMovieMethodAddParamBool(not k.showColorOnLeftBar);               --  // reduceColors (if "false" then shows the color of the row on the left side, else removes color from left bar)
                ScaleformMovieMethodAddParamInt(0);                    --  // unused
                ScaleformMovieMethodAddParamInt(k.icon);         --  // right player icon.
                ScaleformMovieMethodAddParamInt(0);                    --  // unused
                if k.crew ~= "" then
                    ScaleformMovieMethodAddParamTextureNameString("..+"..k.crew);--  // crew label text. It's either broken, or I don't know how to translate Vespura's input.
                else
                    ScaleformMovieMethodAddParamTextureNameString("");--  // crew label text. It's either broken, or I don't know how to translate Vespura's input.
                end
                ScaleformMovieMethodAddParamBool(false);               --  // should be a thing to toggle blinking of (kick) icon, but doesn't seem to work.
                ScaleformMovieMethodAddParamTextureNameString(k.status);          -- // badge/status tag text
                ScaleformMovieMethodAddParamInt(k.statusColor);   -- // badge/status tag background color
                EndScaleformMovieMethod();
            end
        end

        Citizen.Wait(10)
        BeginScaleformMovieMethodOnFrontend("DISPLAY_DATA_SLOT");
        ScaleformMovieMethodAddParamInt(3);
        EndScaleformMovieMethod();
    end

    Citizen.Wait(10)

    --[[  SET FIRST FOCUS  ]]--
    BeginScaleformMovieMethodOnFrontend("SET_COLUMN_FOCUS");
    ScaleformMovieMethodAddParamInt(menuFocus); --// column index // _loc7_
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

function setMenuColumnFocus(focus)
    if focus == 0 or focus == 3 then
        menuFocus = focus

        BeginScaleformMovieMethodOnFrontend("SET_COLUMN_FOCUS");
        ScaleformMovieMethodAddParamInt(menuFocus); --// column index // _loc7_
        ScaleformMovieMethodAddParamInt(1);-- // highlightIndex // _loc6_
        ScaleformMovieMethodAddParamInt(1); --// scriptSetUniqID // _loc4_
        ScaleformMovieMethodAddParamInt(0); --// scriptSetMenuState // _loc5_
        EndScaleformMovieMethod()
    end
    --TriggerEvent('lobbymenu:ReloadMenu')
end

function updateButtonScaleform(_buttons)
    BeginScaleformMovieMethodOnFrontend("SET_DATA_SLOT_EMPTY")
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()
    --Citizen.Wait(200) --random but mandatory wait, otherwise update will not run
    for i,k in pairs(_buttons) do
        if i>0 then
            BeginScaleformMovieMethodOnFrontend("SET_DATA_SLOT");
            ScaleformMovieMethodAddParamInt(0); --// column
            ScaleformMovieMethodAddParamInt(i-1); --// index
            ScaleformMovieMethodAddParamInt(0); --// menu ID 0
            ScaleformMovieMethodAddParamInt(i); --// unique ID 0
            ScaleformMovieMethodAddParamInt(1); --// type 0
            ScaleformMovieMethodAddParamInt(0); --// initialIndex 0
            ScaleformMovieMethodAddParamBool(k.isSelectable); --// isSelectable true
            ScaleformMovieMethodAddParamTextureNameString(k.text); -- left side text
            ScaleformMovieMethodAddParamTextureNameString(k.RockStarLogo); --Setting this as a number string will show the Rockstar logo on the button.
            ScaleformMovieMethodAddParamInt(k.symbol); --0 = shows raw rightText. 1 = Star symbol, 2 = skull, 3 = race flag, 4 = shield with cross(TDM?), 5 = multiple skulls, 6 - blank, 7 = castle, 9 = parachute, 10 = car with explosion.
            ScaleformMovieMethodAddParamTextureNameString(k.rightText);
            ScaleformMovieMethodAddParamInt(1); --unused?
            ScaleformMovieMethodAddParamInt(1); --unused?
            ScaleformMovieMethodAddParamInt(0); --This makes the first button (only the first) flicker
            if _buttons[i+1] ~= nil then
                ScaleformMovieMethodAddParamInt(0); --This adds the bar above the button. Does not work for first button.
            else
                ScaleformMovieMethodAddParamInt(1); --This adds the bar above the button. Does not work for first button.
            end
            ScaleformMovieMethodAddParamInt(0); --unused?
            ScaleformMovieMethodAddParamInt(0); --"Green Checkmark" icon
            EndScaleformMovieMethod();
        end
    end
    Citizen.Wait(10)
    BeginScaleformMovieMethodOnFrontend("DISPLAY_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()
end

function updatePlayersScaleform(_players, _details)
    if _details.showTextBoxToColumn == 0 or _details.showTextBoxToColumn == 2 then
        --[[  PLAYERS  ]]--
        BeginScaleformMovieMethodOnFrontend("SET_DATA_SLOT_EMPTY")
        ScaleformMovieMethodAddParamInt(3)
        EndScaleformMovieMethod()
        --Citizen.Wait(200) --random but mandatory wait, otherwise update will not run
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
                ScaleformMovieMethodAddParamBool(not k.showColorOnLeftBar);               --  // reduceColors (if "false" then shows the color of the row on the left side, else removes color from left bar)
                ScaleformMovieMethodAddParamInt(0);                    --  // unused
                ScaleformMovieMethodAddParamInt(k.icon);         --  // right player icon.
                ScaleformMovieMethodAddParamInt(0);                    --  // unused
                if k.crew ~= "" then
                    ScaleformMovieMethodAddParamTextureNameString("..+"..k.crew);--  // crew label text. It's either broken, or I don't know how to translate Vespura's input.
                else
                    ScaleformMovieMethodAddParamTextureNameString("");--  // crew label text. It's either broken, or I don't know how to translate Vespura's input.
                end
                ScaleformMovieMethodAddParamBool(false);               --  // should be a thing to toggle blinking of (kick) icon, but doesn't seem to work.
                ScaleformMovieMethodAddParamTextureNameString(k.status);          -- // badge/status tag text
                ScaleformMovieMethodAddParamInt(k.statusColor);   -- // badge/status tag background color
                EndScaleformMovieMethod();
            end
        end
    end
    BeginScaleformMovieMethodN("SET_DESCRIPTION")
    PushScaleformMovieFunctionParameterInt(0) --This is a type. 0 is tooltip bellow buttons. 3 is a loading thing on the player column.
    PushScaleformMovieFunctionParameterString(_details.tooltipText)
    PushScaleformMovieMethodParameterInt(0) --toggle, Info icon flashing
    PushScaleformMovieMethodParameterInt(0) --togle, text flashing.
    EndScaleformMovieMethod()

    Citizen.Wait(10)
    BeginScaleformMovieMethodOnFrontend("DISPLAY_DATA_SLOT");
    ScaleformMovieMethodAddParamInt(3)
    EndScaleformMovieMethod()
end

function updateDetailsScaleform(_details,_rowDetails)
    if _details.showTextBoxToColumn == 0 or _details.showTextBoxToColumn == 1 then
        --[[  SET DETAILS ROWS ]]--
        BeginScaleformMovieMethodOnFrontend("SET_DATA_SLOT_EMPTY")
        ScaleformMovieMethodAddParamInt(1)
        EndScaleformMovieMethod()
        --Citizen.Wait(200) --random but mandatory wait, otherwise update will not run
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
    end
    BeginScaleformMovieMethodN("SET_DESCRIPTION")
    PushScaleformMovieFunctionParameterInt(0) --This is a type. 0 is tooltip bellow buttons. 3 is a loading thing on the player column.
    PushScaleformMovieFunctionParameterString(_details.tooltipText)
    PushScaleformMovieMethodParameterInt(0) --toggle, Info icon flashing
    PushScaleformMovieMethodParameterInt(0) --togle, text flashing.
    EndScaleformMovieMethod()

    Citizen.Wait(10)
    BeginScaleformMovieMethodOnFrontend("DISPLAY_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(1)
    EndScaleformMovieMethod()
end

function updateTextboxScaleform(_header, _details)
    if _details.showTextBoxToColumn ~= 0 and _details.showTextBoxToColumn < 4 then
        BeginScaleformMovieMethodOnFrontend("SHOW_WARNING_MESSAGE");
        ScaleformMovieMethodAddParamInt(1); --showToggle
        if _details.showTextBoxToColumn < 3 then
            ScaleformMovieMethodAddParamInt(_details.showTextBoxToColumn); --column from where to start.
            ScaleformMovieMethodAddParamInt(1); --columns to cover.
        elseif _details.showTextBoxToColumn == 3 then
            ScaleformMovieMethodAddParamInt(1); --column from where to start.
            ScaleformMovieMethodAddParamInt(2); --columns to cover.
        end
        ScaleformMovieMethodAddParamTextureNameString(_details.warningText); --body String.
        ScaleformMovieMethodAddParamTextureNameString(_details.warningTitle); --title String.
        ScaleformMovieMethodAddParamInt(0); --background height?
        ScaleformMovieMethodAddParamTextureNameString(''); --textureDictionary
        ScaleformMovieMethodAddParamTextureNameString(''); --textureName
        ScaleformMovieMethodAddParamInt(0); --image Alignment. (Probably justify. 0 = left)
        ScaleformMovieMethodAddParamTextureNameString(_details.warningRightText); --footer String.
        ScaleformMovieMethodAddParamInt(0); --request background texture.
        EndScaleformMovieMethod()
        Citizen.Wait(10)

        if _details.showTextBoxToColumn == 3 then
            BeginScaleformMovieMethodOnFrontendHeader("SET_MENU_HEADER_TEXT_BY_INDEX") --Changes the column header text
            ScaleformMovieMethodAddParamInt(1); --// columnID. Starts at 0
            ScaleformMovieMethodAddParamTextureNameString(_header.detailsHeaderText)
            ScaleformMovieMethodAddParamInt(2); --// Column width. 1 = default / 100%
            ScaleformMovieMethodAddParamBool(false); --forceUpper...don't really know what it does. Setting it to true will hide? the column text
            EndScaleformMovieMethodReturnValue()
            Citizen.Wait(10)
        end
    end
    BeginScaleformMovieMethodN("SET_DESCRIPTION")
    PushScaleformMovieFunctionParameterInt(0) --This is a type. 0 is tooltip bellow buttons. 3 is a loading thing on the player column.
    PushScaleformMovieFunctionParameterString(_details.tooltipText)
    PushScaleformMovieMethodParameterInt(0) --toggle, Info icon flashing
    PushScaleformMovieMethodParameterInt(0) --togle, text flashing.
    EndScaleformMovieMethod()
end

function SetTooltipOnly(tooltip, flashIcon, flashText)
    BeginScaleformMovieMethodN("SET_DESCRIPTION")
    PushScaleformMovieFunctionParameterInt(0) --This is a type. 0 is tooltip bellow buttons. 3 is a loading thing on the player column.
    PushScaleformMovieFunctionParameterString(tooltip)
    PushScaleformMovieMethodParameterInt(0) --toggle, Info icon flashing
    PushScaleformMovieMethodParameterInt(0) --togle, text flashing.
    EndScaleformMovieMethod()
end



--[[Citizen.CreateThread(function()
    while true do
        Citizen.Wait(1000)
        local last, current = GetPauseMenuSelection()
        print(last.." / "..current)
    end
end)]]
