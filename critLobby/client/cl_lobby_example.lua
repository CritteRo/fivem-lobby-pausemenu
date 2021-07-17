--[[ I will add an example menu here, when the API is complete ]]--

TriggerEvent('lobbymenu:CreateMenu', 'critMenu.ExampleMenu', "Timetrials: Vigero 1", "Finish the race as soon as possible.\nCompete with other players on the leaderboards.", "MENU", "TOP 10", "INFORMATION")
TriggerEvent('lobbymenu:SetHeaderDetails', 'critMenu.ExampleMenu', false, true, 2, 6)
TriggerEvent('lobbymenu:SetDetailsTitle', 'critMenu.ExampleMenu', "Vigero 1")

TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {}, "Add Player", "", false, 0, "lobby.AddPlayerToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {}, "Add Details Row", "", false, 0, "lobby.AddDetailsToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {}, "Add Warning", "", false, 0, "lobby.AddWarningToMenu")
TriggerEvent('lobbymenu:AddButton', 'critMenu.ExampleMenu', {id = 0, text = "Button Used"}, "Close Menu", "", false, 0, "lobbymenu:CloseMenu")


AddEventHandler("lobby.AddPlayerToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "CritteR", '', "ADMIN", 65, 1, true, 12, 6)
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "NTT", '', "", 65, 2, true, 12, 6)
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "Taurete", '', "", 65, 3, true, 12, 6)
    TriggerEvent('lobbymenu:AddPlayer', 'critMenu.ExampleMenu', "TheLegend27", '', "", 65, 4, true, 12, 6)
end)

AddEventHandler("lobby.AddDetailsToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Average time:", "~y~2 minutes~s~")
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Car:", "~y~Vigero~s~")
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Road Type:", "Dirt")
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "XP:", "~b~5000+~s~")
    TriggerEvent('lobbymenu:AddDetailsRow', 'critMenu.ExampleMenu', "Cash:", "~b~3000+~s~")
end)

AddEventHandler("lobby.AddWarningToMenu", function(_buttonParams)
    TriggerEvent('lobbymenu:SetWarningMessage', 'critMenu.ExampleMenu', true, "WARNING", "This is a warning", "")
end)

RegisterCommand('showfr', function()
    TriggerEvent('lobbymenu:OpenMenu', 'critMenu.ExampleMenu', false, true)
end)