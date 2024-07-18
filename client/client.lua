RegisterNetEvent('ShowText')
AddEventHandler('ShowText', function(source, tab)
    local TextEnabled = true
    local CurrentPlayer = GetPlayerFromServerId(source)
    local Text = (tab.name ~= nil and tab.name.. ': ') .. tab.text

    if tab.success ~= nil then
        if tab.success then
            Text = Text .. ' (Successful)'
            else
                Text = Text .. ' (Unsuccessful)'
            end
    end

    if Config.DisplayOnChat then 
        local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(CurrentPlayer)))
        local OtherCoords = GetEntityCoords(GetPlayerPed(-1))
        local Distance = GetDistanceBetweenCoords(x, y, z, OtherCoords, true)

        if Distance < Config..Distance then
            -- local ActionColor, BackgroundColor, ActionText = nil, nil, ''
            -- local ActionColor, ActionText = nil, ''
            if Config.Commands[tab.type] == nil then
                tab.type = "default"
            end
            print(Config.Commands[tab.type])
            ActionColor = Config.Commands[tab.type].TextColor
            ActionText = Config.Commands[tab.type].Text
            BackgroundColor = Config.Commands[tab.type].BackgroundColor
            
        --     if tab.type == "me" then
        --         ActionColor = Config.TextColor_Me
        --         -- BackgroundColor = Config.TextBackground_Me
        --         ActionText = "Action"
        --     elseif tab.type == "do" then
        --         ActionColor = Config.TextColor_Do
        --         -- BackgroundColor = Config.TextBackground_Do
        --         ActionText = "Happening"
        --     elseif tab.type == "try" then
        --     ActionColor = Config.TextColor_Try
        --     -- BackgroundColor = Config.TextBackground_Try
        --     ActionText = "Trying"
        end
--ficamos aqui
        local ChatBackground = "rgba("..BackgroundColor.r..", "..BackgroundColor.g..", "..BackgroundColor.b..", 50)"
        TriggerEvent('chat:addMessage', {
            color = { ActionColor.r, ActionColor.g, ActionColor.b },
            multiline = true,
            template = '<div style="padding: 0.4vw; margin: 0.5vw; width: 400px; position: relative; right: 24px; background-color: '..ChatBackground..'; border-radius: 5px;"><i style="position: relative; left: 50px;" class="fab fa-artstation"> [{0}]<i><div>{1}</div></i></div>',
            args = { ActionText,  Text}
        })

    end


    Citizen.CreateThread(function()
        while TextEnabled do
            local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(CurrentPlayer)))
            local OtherCoords = GetEntityCoords(GetPlayerPed(-1))
            local distance = GetDistanceBetweenCoords(x, y, z, OtherCoords, true)

            if distance < Config.Distance then
                DrawText3D(x, y, z+1.1, Text, Config.Commands[tab.type])
            end
            Wait(0)
        end
    end)
    Citizen.CreateThread(function()
        Wait(Config.Duration * 1000)
        TextEnabled = false
    end)
    Citizen.CreateThread(function()
        TriggerEvent('chat:addSuggestion', '/odme', 'Make an action',{{name="Text", help="The action you wish"}})
        TriggerEvent('chat:addSuggestion', '/oddo', 'Make a happening',{{name="Text", help="The happening you wish"}})
        TriggerEvent('chat:addSuggestion', '/odtry', 'Make a try action for chance',{{name="Text", help="The try you wish"}})
    end)
    function DrawText3D(x,y,z, text, Action)
        local onScreen,_x,_y = World3dToScreen2d(x,y,z)
        local px,py,pz = table.unpack(GetGameplayCamCoord())
        local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
     
        local scale = ((1/dist)*2)*(1/GetGameplayCamFov())*120
    
        local ActionColor = nil
        local BackgroundColor = nil
            
        if Config.Commands[tab.type] == nil then
            tab.type = "default"
        end
        ActionColor = Config.Commands[tab.type].TextColor
        BackgroundColor = Config.Commands[tab.type].BackgroundColor
    
        if onScreen then
            SetTextColour(ActionColor.r, ActionColor.g, ActionColor.b, ActionColor.a)
            SetTextScale(0.0*scale, 0.4*scale)
            SetTextFont(Config.Font)
            SetTextProportional(1)
            SetTextCentre(true)
            if Config.DropShadow then
                SetTextDropshadow(10, 100, 100, 100, 255)
            end
    
            BeginTextCommandWidth("STRING")
            AddTextComponentString(text)
            local height = GetTextScaleHeight(0.45*scale, Config.Font)
            local width = EndTextCommandGetWidth(Config.Font)
    
            SetTextEntry("STRING")
            AddTextComponentString(text)
            EndTextCommandDisplayText(_x, _y)
    
            if Config.Background then
                DrawRect(_x, _y+scale/73, width, height, BackgroundColor.r, BackgroundColor.g, BackgroundColor.b , BackgroundColor.a)
            end
        end
    end
end)


