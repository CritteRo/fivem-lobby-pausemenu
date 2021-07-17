--[[ :: Framework API should be here :: ]]--

menu = {
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
            buttonHeaderText = "PLAYERS",
            buttonHeaderAlert = "",
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
            [0] = {text = "Button 1", RockStarLogo = "1", rightText = "3", symbol = 0, event = "lobbymenu:RunDefaultLobbyMenuEvent"},
        },
        ['players'] = {
            [0] = {name = "CritteR", crew = "ADM", status = "ADMIN", icon = 65, rank = 60, online = false, rowColor = 11, statusColor = 8},
        },
        ['rowDetails'] = {
            [0] = {text = "Button 1", rightText = "3"},
        },
    }
}

AddEventHandler('lobbymenu:CreateMenu', function(_id, _title, _subtitle, _menuHeaderText, _buttonHeaderText, _detailsHeaderText)
end)

AddEventHandler('lobbymenu:SetHeaderDetails', function(_id, _showPlayerCard, _showHeaderStrip, _headerColor, _stripColor)
end)

AddEventHandler('lobbymenu:SetHeaderAlert', function(_id, _column, _alertMessage)
end)

AddEventHandler('lobbymenu:SetWarningMessage', function(_id, _showWarning, _warningTitle, _warningText, _warningRightText)
end)

AddEventHandler('lobbymenu:SetDetailsTitle', function(_id, _detailsTitle)
end)

AddEventHandler('lobbymenu:AddMenuButton', function(_id, _text, _rightText, _showRockStarSymbol, _rightSymbol, _buttonEvent)
end)

AddEventHandler('lobbymenu:AddPlayer', function(_id, _name, _crew, _status, _icon, _rank, _isOnline, _rowColor, _statusColor)
end)

AddEventHandler('lobbymenu:AddDetailsRow', function(_id, _text, _rightText)
end)

