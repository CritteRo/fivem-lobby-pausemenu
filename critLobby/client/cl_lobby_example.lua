--[[ I will add an example menu here, when the API is complete ]]--

TriggerEvent('lobbymenu:CreateMenu', 'critMenu.ExampleMenu', "Example Menu", "Creating a lobby menu to showcase it's visuals and functionality.", "MENU", "CREATORS", "DETAILS")
TriggerEvent('lobbymenu:SetHeaderDetails', 'critMenu.ExampleMenu', false, true, 2, 6)
TriggerEvent('lobbymenu:SetDetailsTitle', 'critMenu.ExampleMenu', "Menu Stats")

TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {}, "Add Player", "", false, 0, "lobby.AddPlayerToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {}, "Add Details Row", "", false, 0, "lobby.AddDetailsToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {}, "Add Warning", "", false, 0, "lobby.AddWarningToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {id = 0, text = "Button Used"}, "Close Menu", "", false, 0, "lobbymenu:CloseMenu")


AddEventHandler("lobby.AddPlayerToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "CritteR", 'TEST', "DEV", 65, 100, true, 12, 6)
end)

AddEventHandler("lobby.AddDetailsToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Details Row", "")
end)

AddEventHandler("lobby.AddWarningToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:SetWarningMessage', 'critMenu.ExampleMenu', true, "WARNING", "This is a warning", "")
end)

RegisterCommand('showfr', function()
    TriggerEvent('lobbymenu:OpenMenu', 'critMenu.ExampleMenu', true)
end)