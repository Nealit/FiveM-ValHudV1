local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent('setinfo', function()
    local src = source
    local xplayer = QBCore.Functions.GetPlayer(src)

    if xplayer then
        local characterName = xplayer.PlayerData.charinfo.firstname .. " " .. xplayer.PlayerData.charinfo.lastname
        local money = xplayer.PlayerData.money["cash"]
        local playerCount = #GetPlayers()
        local playerJob = xplayer.PlayerData.job.name

        TriggerClientEvent("takeinfo", src, characterName, money, playerCount, playerJob)

        local playerHunger = xplayer.PlayerData.metadata['hunger']
        local playerThirsty = xplayer.PlayerData.metadata['thirst']

        TriggerClientEvent("updatemeta", src, playerHunger, playerThirsty)
    end
end)