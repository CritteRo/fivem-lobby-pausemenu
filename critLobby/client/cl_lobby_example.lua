--[[COMMENTED OUT, AS SOME FOLKS USE THIS OUT-OF-THE-BOX, AND I DON'T WANT TO POLLUTE THEIR SERVER :P

TriggerEvent('lobbymenu:CreateMenu', 'critMenu.ExampleMenu', "Test Lobby Menu", "Subtitles are supported too.", "MENU", "PLAYERS", "INFORMATION")
TriggerEvent('lobbymenu:SetHeaderDetails', 'critMenu.ExampleMenu', true, true, 2, 6, 0)
TriggerEvent('lobbymenu:SetDetailsTitle', 'critMenu.ExampleMenu', "Details Title", 'sproffroad', 'spr_offroad_3')

TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {text = "Showing button 1"}, "Button 1", "", false, 0, "lobby.AddPlayerToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', "_IsNotSelectable", "Non-Button", "", false, 0, "lobby.AddDetailsToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {text = "Showing button 3"}, "Button 3", "", false, 0, "lobby.AddWarningToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {id = 0, text = "Button Used"}, "Close Menu", "", false, 0, "lobbymenu:CloseMenu")

--TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "CritteR", '', "ADMIN", 65, 1, true, 12, 6)
--TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "NTT", '', "", 65, 2, true, 12, 6)
--TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "Taurete", '', "", 65, 3, true, 12, 6)
--TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "TheLegend27", '', "", 65, 4, true, 12, 6)

TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 1", "~y~2 minutes~s~")
TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 2", "~y~Vigero~s~")
TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 3", "Dirt")
TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 4", "~b~5000+~s~")
TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 5", "~b~3000+~s~")

TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 0, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")

AddEventHandler("lobby.AddPlayerToMenu", function(_buttonParams)
    setMenuColumnFocus(3)
    --TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 1, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")
    TriggerEvent('lobbymenu:ResetPlayerList', 'critMenu.ExampleMenu')
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "CritteR", '', math.random(1,100), 65, 1, true, 12, 6, 'lobby.UsePlayerEvent', {player = "CritteR"}, false)
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "NTT", '', math.random(1,100), 65, 2, true, 12, 6, 'lobby.UsePlayerEvent', {player = "NTT"})

    TriggerEvent('lobbymenu:SetTooltipMessage', 'critMenu.ExampleMenu', "Tooltip message")
    TriggerEvent('lobbymenu:UpdateMenu', 'critMenu.ExampleMenu')
end)

AddEventHandler("lobby.AddDetailsToMenu", function(_buttonParams)
    --TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 2, "Title", "You can even set it to the second column, if that's what you want.", "Footer text.")
    TriggerEvent('lobbymenu:ResetDetailsRowList', 'critMenu.ExampleMenu')
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Updated Row 1", "~y~2 minutes~s~")
    TriggerEvent('lobbymenu:SetTooltipMessage', 'critMenu.ExampleMenu', "")

    TriggerEvent('lobbymenu:UpdateMenu', 'critMenu.ExampleMenu')
end)

AddEventHandler("lobby.AddWarningToMenu", function(_buttonParams)
    --TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 3, "Title", "Need more text? Sure, just active on both columns.", "Footer text.")
    TriggerEvent('lobbymenu:ReloadMenu', 'critMenu.ExampleMenu')
end)

AddEventHandler("lobby.UsePlayerEvent", function(_buttonParams)
    --TriggerEvent('lobbymenu:CloseMenu')
    SetTooltipOnly('You selected player: '.._buttonParams.player, false, false)
    print('You selected player: '.._buttonParams.player)
end)

RegisterCommand('showfr', function()
    TriggerEvent('lobbymenu:OpenMenu', 'critMenu.ExampleMenu', true)
end)

--]]