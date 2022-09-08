TriggerEvent('esx:getSharedObject', function(obj) 
    ESX = obj
end)

RegisterServerEvent('SimpleDispatch:callDispatch')
AddEventHandler('SimpleDispatch:callDispatch', function(message)
    local xPlayerSender = ESX.GetPlayerFromId(source)

    for k, playerID in pairs(GetPlayers()) do
        local xPlayerTarget = ESX.GetPlayerFromId(playerID)
        local targetJob = xPlayerTarget.getJob().name

        if targetJob == 'police' then
            TriggerClientEvent('SimpleDispatch:showDispatch', xPlayerTarget.source, xPlayerSender.name, xPlayerSender.source, message)
    end
end
end)