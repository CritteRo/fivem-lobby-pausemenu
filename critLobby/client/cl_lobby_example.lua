--[[ I will add an example menu here, when the API is complete ]]--

TriggerEvent('lobbymenu:CreateMenu', 'critMenu.ExampleMenu', "Test Lobby Menu", "Subtitles are supported too.", "MENU", "PLAYERS", "INFORMATION")
TriggerEvent('lobbymenu:SetHeaderDetails', 'critMenu.ExampleMenu', true, true, 2, 6)
TriggerEvent('lobbymenu:SetDetailsTitle', 'critMenu.ExampleMenu', "Details Title", 'sproffroad', 'spr_offroad_3')

TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', 1, {}, "Button 1", "", false, 0, "lobby.AddPlayerToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', 1, {}, "Button 2", "", false, 0, "lobby.AddDetailsToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', 1, {}, "Button 3", "", false, 0, "lobby.AddWarningToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', 1, {id = 0, text = "Button Used"}, "Close Menu", "", false, 0, "lobbymenu:CloseMenu")

TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "CritteR", '', "ADMIN", 65, 1, true, 12, 6)
TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "NTT", '', "", 65, 2, true, 12, 6)
TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "Taurete", '', "", 65, 3, true, 12, 6)
TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "TheLegend27", '', "", 65, 4, true, 12, 6)

TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 1", "~y~2 minutes~s~")
TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 2", "~y~Vigero~s~")
TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 3", "Dirt")
TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 4", "~b~5000+~s~")
TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row 5", "~b~3000+~s~")

TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 0, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")

AddEventHandler("lobby.AddPlayerToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 1, "Title", "This is a text box. You can add as much text as you want here and no one will care.\n\n~y~It's great for info and stuff...~s~", "Footer text.")
    TriggerEvent('lobbymenu:ReloadMenu')
end)

AddEventHandler("lobby.AddDetailsToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 2, "Title", "You can even set it to the second column, if that's what you want.", "Footer text.")
    TriggerEvent('lobbymenu:ReloadMenu')
end)

AddEventHandler("lobby.AddWarningToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:SetTextBoxToColumn', 'critMenu.ExampleMenu', 3, "Title", "Need more text? Sure, just active on both columns.", "Footer text.")
    TriggerEvent('lobbymenu:ReloadMenu')
end)

RegisterCommand('showfr', function()
    TriggerEvent('lobbymenu:OpenMenu', 'critMenu.ExampleMenu', true)
end)