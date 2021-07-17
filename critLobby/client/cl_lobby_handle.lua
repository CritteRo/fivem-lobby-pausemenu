--[[ :: Framework API should be here :: ]]--

menuList = {
    ["critlobby:defaultmenu"] = {
        ['header'] = {
            title = "Default Lobby Menu.",
            subtitle = "Menu functionality test.",
            showPlayerCard = true,
            showHeaderStrip = true,
            headerColor = 2,
            stripColor = 8,
            menuHeaderText = "MENU",
            menuHeaderAlert = "",
            playerHeaderText = "PLAYERS",
            playerHeaderAlert = "",
            detailsHeaderText = "DETAILS",
            detailsHeaderAlert = "",
        },
        ['details'] = {
            detailsTitle = "Details title",
            showWarning = false,
            warningTitle = "Warning",
            warningText = "Warning Text",
            warningRightText = "Right",
        },
        ['buttons'] = {
            [0] = {text = "Button 1", RockStarLogo = "1", rightText = "3", symbol = 0, buttonParams = 0, event = "lobbymenu:RunDefaultLobbyMenuEvent"},
        },
        ['players'] = {
            [0] = {name = "CritteR", crew = "ADM", status = "ADMIN", icon = 65, rank = 60, online = false, rowColor = 11, statusColor = 8},
        },
        ['rowDetails'] = {
            [0] = {text = "Button 1", rightText = "3"},
        },
    }
}

openedMenu = 0

AddEventHandler('lobbymenu:CreateMenu', function(_id, _title, _subtitle, _menuHeaderText, _playerHeaderText, _detailsHeaderText)
    menuList[_id] = {
        ['header'] = {title = _title, subtitle = _subtitle, showPlayerCard = true, showHeaderStrip = true, headerColor = 2, colorStrip = 8, menuHeaderText = _menuHeaderText, menuHeaderAlert = "", playerHeaderText = _playerHeaderText, playerHeaderAlert = "", detailsHeaderText = _detailsHeaderText, detailsHeaderAlert = ""},
        ['details'] = {detailsTitle = "", showWarning = false, warningTitle = "", warningText = "", warningRightText = "", textureDirectory = '', textureName = ''},
        ['buttons'] = {
            [0] = {text = "internal_button_dont_render", RockStarLogo = "", rightText = "", symbol = 0, buttonParams = 0, event = "lobbymenu:RunDefaultLobbyMenuEvent"},
        },
        ['players'] = {
            [0] = {name = "internal_player_dont_render", crew = "", status = "", icon = 65, rank = 1, online = false, rowColor = 11, statusColor = 8},
        },
        ['rowDetails'] = {
            [0] = {text = "internal_details_dont_render", rightText = ""},
        }
    }
end)

AddEventHandler('lobbymenu:SetHeaderDetails', function(_id, _showPlayerCard, _showHeaderStrip, _headerColor, _stripColor)
    if menuList[_id] ~= nil then
        menuList[_id]['header'].showPlayerCard = _showPlayerCard
        menuList[_id]['header'].showHeaderStrip = _showHeaderStrip
        menuList[_id]['header'].headerColor = _headerColor
        menuList[_id]['header'].stripColor = _stripColor
    else
        print('-=[[ :: WARNING :: YOU TRIED TO SET THE DETAILS TAB OF A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:SetHeaderAlert', function(_id, _column, _alertMessage)
    if menuList[_id] ~= nil then
        if _column == 0 then
            menuList[_id]['header'].menuHeaderAlert = _alertMessage
        elseif _column == 1 then
            menuList[_id]['header'].playerHeaderAlert = _alertMessage
        elseif _column == 2 then
            menuList[_id]['header'].detailsHeaderAlert = _alertMessage
        else
            print('-=[[ :: WARNING :: INVALID COLUMN ID IN `SetHeaderAlert` :: ]]=-')
        end
    else
        print('-=[[ :: WARNING :: YOU TRIED TO SET HEADER ALERTS FOR A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:SetWarningMessage', function(_id, _showWarning, _warningTitle, _warningText, _warningRightText)
    if menuList[_id] ~= nil then
        menuList[_id]['details'].showWarning = _showWarning
        menuList[_id]['details'].warningTitle = _warningTitle
        menuList[_id]['details'].warningText = _warningText
        menuList[_id]['details'].warningRightText = _warningRightText
    else
        print('-=[[ :: WARNING :: YOU TRIED TO SET A WARNING MESSAGE FOR A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:SetDetailsTitle', function(_id, _detailsTitle, _textureDirectory, _textureName)
    if menuList[_id] ~= nil then
        menuList[_id]['details'].detailsTitle = _detailsTitle
        menuList[_id]['details'].textureDirectory = _textureDirectory
        menuList[_id]['details'].textureName = _textureName
    else
        print('-=[[ :: WARNING :: YOU TRIED TO SET A DETAILS TITLE FOR A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:AddButton', function(_id, _buttonParams, _text, _rightText, _showRockStarSymbol, _rightSymbol, _buttonEvent)
    if menuList[_id] ~= nil then
        local rplus = ""
        if _showRockStarSymbol == true then
            rplus = "1"
        end
        local row = #menuList[_id]['buttons']+1
        menuList[_id]['buttons'][row] = {text = _text, RockStarLogo = rplus, rightText = _rightText, symbol = _rightSymbol, buttonParams = _buttonParams, event = _buttonEvent}
        print(row)
    else
        print('-=[[ :: WARNING :: YOU TRIED TO ADD A BUTTON FOR A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:AddPlayer', function(_id, _name, _crew, _status, _icon, _rank, _isOnline, _rowColor, _statusColor)
    if menuList[_id] ~= nil then
        local row = #menuList[_id]['players']+1
        menuList[_id]['players'][row] = {name = _name, crew = _crew, status = _status, icon = _icon, rank = _rank, online = _isOnline, rowColor = _rowColor, statusColor = _statusColor}
    else
        print('-=[[ :: WARNING :: YOU TRIED TO ADD A PLAYER FOR A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:ResetPlayerList', function(_id)
    if menuList[_id] ~= nil then
        menuList[_id]['players'] = {
            [0] = {name = "internal_player_dont_render", crew = "", status = "", icon = 65, rank = 1, online = false, rowColor = 11, statusColor = 8},
        }
    else
        print('-=[[ :: WARNING :: YOU TRIED TO RESET THE PLAYER LIST FOR A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:AddDetailsRow', function(_id, _text, _rightText)
    if menuList[_id] ~= nil then
        menuList[_id]['rowDetails'][#menuList[_id]['rowDetails']+1] = {text = _text, rightText = _rightText}
    else
        print('-=[[ :: WARNING :: YOU TRIED TO ADD A DETAILS ROW FOR A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:ResetDetailsRowList', function(_id)
    if menuList[_id] ~= nil then
        menuList[_id]['rowDetails'] = {
            [0] = {text = "internal_details_dont_render", rightText = ""},
        }
    else
        print('-=[[ :: WARNING :: YOU TRIED TO RESET THE DETAILS ROW LIST FOR A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:OpenMenu', function(_id, _blurredBackground)
    if menuList[_id] ~= nil then
        if _blurredBackground ~= nil and _blurredBackground == true then
            TriggerScreenblurFadeIn(1000) --screen blur
        end
        ActivateFrontendMenu("FE_MENU_VERSION_CORONA", false, -1)
        Citizen.Wait(100)
        generateLobbyScaleform(menuList[_id]['header'], menuList[_id]['buttons'], menuList[_id]['players'], menuList[_id]['details'], menuList[_id]['rowDetails'])
        openedMenu = _id
    else
        print('-=[[ :: WARNING :: YOU TRIED TO OPEN A NON-EXISTENT MENU ID :: ]]=-')
    end
end)

AddEventHandler('lobbymenu:CloseMenu', function()
    if GetCurrentFrontendMenuVersion() == GetHashKey("FE_MENU_VERSION_CORONA") then
        SetFrontendActive(false)
        TriggerScreenblurFadeOut(1000)--screen blur
        PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET")
    end
end)

RegisterCommand('lobbymenu:closemenu:cmd', function()
    if GetCurrentFrontendMenuVersion() == GetHashKey("FE_MENU_VERSION_CORONA") then
        SetFrontendActive(false)
        TriggerScreenblurFadeOut(1000)--screen blur
        PlaySoundFrontend(-1, "QUIT", "HUD_FRONTEND_DEFAULT_SOUNDSET")
        BusyspinnerOff()
    end
end)

RegisterCommand('lobbymenu:usebutton:cmd', function()
    if GetCurrentFrontendMenuVersion() == GetHashKey("FE_MENU_VERSION_CORONA") then
        local last, current = GetPauseMenuSelection()
        --showBusySpinnerNoScaleform("You just used "..menuButtons[current].text..".")
        PlaySoundFrontend(-1, "SELECT", "HUD_FRONTEND_DEFAULT_SOUNDSET")
        if menuList[openedMenu]['buttons'][current] ~= nil then
            TriggerEvent(menuList[openedMenu]['buttons'][current].event, menuList[openedMenu]['buttons'][current].buttonParams)
        end
    end
end)

RegisterKeyMapping('lobbymenu:closemenu:cmd', 'Close Frontend Menu', 'keyboard', 'BACK')
RegisterKeyMapping('lobbymenu:usebutton:cmd', 'Use Frontend Menu Item', 'keyboard', 'RETURN')
