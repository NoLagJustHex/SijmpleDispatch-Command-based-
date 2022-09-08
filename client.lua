ESX = nil
Citizen.CreateThread(function()
 while ESX == nil do
  TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
  Citizen.Wait(0)
 end
end)

local ESX = nil


-- /dispatch
RegisterCommand('dispatch', function(source, args, rawCommand)

    local message = ''


    for i=1, #args, 1 do
        message = message .. ' ' .. args[i]
    end


    TriggerServerEvent('SimpleDispatch:callDispatch', message)
    TriggerEvent('SimpleDispatch:showSent')
end)

RegisterNetEvent('SimpleDispatch:showDispatch')
AddEventHandler('SimpleDispatch:showDispatch', function(playername, playerid, message)

    local playerpos = GetEntityCoords(PlayerPedId())

    ShowPictureNotification('CHAR_CALL911', '~y~' .. playername .. ' ~w~needs help! \nReason:~r~ ' .. message .. '', 'Dispatch', '')
    local blip = AddBlipForCoord(playerpos.x, playerpos.y, playerpos.z)
    SetBlipSprite(blip, 161)
    SetBlipDisplay(blip, 4)
    SetBlipScale(blip, 1.5)
    SetBlipColour(blip, 1)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString('Dispatch')
    EndTextCommandSetBlipName(blip)
    Wait(180000) -- 3 Minutes
    RemoveBlip(blip)

end)

RegisterNetEvent('SimpleDispatch:showSent')
AddEventHandler('SimpleDispatch:showSent', function(playername, playerid, message)

    ShowPictureNotification('CHAR_CALL911', 'Your dispatch was sent! ~y~A unit~w~ will arrive as fast as possible.', 'Dispatch', '')

end)


function ShowPictureNotification(icon, msg, title, subtitle)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(msg)
    SetNotificationMessage(icon, icon, true, 1, title, subtitle)
    DrawNotification(false, true)
end

